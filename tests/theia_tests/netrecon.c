// netrecon.c

#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <netinet/in.h>
#include <arpa/inet.h>


int main(int argc, char *argv)
{
    char buf[1024] = {0};
    struct ifconf ifc = {0};
    struct ifreq *ifr = NULL;
    int sck = 0;
    int nInterfaces = 0;
    int i = 0;
    char writebuf[128] = {0};
    FILE *outfile = 0;

    // Check for input

    // Get a socket handle
    sck = socket(AF_INET, SOCK_DGRAM, 0);
    if(sck < 0)
    {
        perror("socket");
        return 1;
    }

    // Query available interfaces
    ifc.ifc_len = sizeof(buf);
    ifc.ifc_buf = buf;
    if(ioctl(sck, SIOCGIFCONF, &ifc) < 0)
    {
        perror("ioctl(SIOCGIFCONF)");
        return 1;
    }

    // Open the output file
    outfile = fopen("/tmp/netrecon.log", "w");
    if (outfile == NULL)
    {
        perror("fopen failed to open /tmp/netrecon.log\n");
        return 1;
    }

    // Iterate through the list of interfaces
    ifr = ifc.ifc_req;
    nInterfaces = ifc.ifc_len / sizeof(struct ifreq);
    for(i = 0; i < nInterfaces; i++)
    {
        struct ifreq *item = &ifr[i];

        // Show the device name and IP address
        memset(writebuf, 0, sizeof(writebuf));
        snprintf(
            writebuf,
            sizeof(writebuf),
            "%s: IP %s",
            item->ifr_name, inet_ntoa(((struct sockaddr_in *)&item->ifr_addr)->sin_addr));

        // Get the MAC address
        if(ioctl(sck, SIOCGIFHWADDR, item) < 0)
        {
            perror("ioctl(SIOCGIFHWADDR)");
            fclose(outfile);
            return 1;
        }

        // Get the broadcast address
        if(ioctl(sck, SIOCGIFBRDADDR, item) >= 0)
        {
            snprintf(
                &writebuf[strlen(writebuf)],
                sizeof(writebuf)-strlen(writebuf),
                ", BROADCAST %s",
                inet_ntoa(((struct sockaddr_in *)&item->ifr_broadaddr)->sin_addr));
        }

        writebuf[strlen(writebuf)] = '\n';
        fwrite(writebuf, 1, sizeof(writebuf), outfile);
    }

    fclose(outfile);
    return 0;
}

