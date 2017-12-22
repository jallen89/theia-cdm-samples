#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>                                                               

#include <netdb.h>
#include <netinet/in.h>

#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>

#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>

int main(int argc, char *argv[]) {
  int sockfd;
	int port[3] = {5001,5002,5003};
	int n;
  struct sockaddr_in serv_addr;
  struct hostent *server;
  char buffer[256];
	int fp_w[3] = {0,0,0};
	int i;

	fp_w[0] = open("/home/yang/omniplay/magProv_tests/socket/w1.txt", O_RDWR);
	fp_w[1] = open("/home/yang/omniplay/magProv_tests/socket/w2.txt", O_RDWR);
	fp_w[2] = open("/home/yang/omniplay/magProv_tests/socket/w3.txt", O_RDWR);

  server = gethostbyname("127.0.0.1");

  if (server == NULL) {
    fprintf(stderr,"ERROR, no such host\n");
    exit(0);
  }

	for (i=0;i<3;i++) {
		bzero((char *) &serv_addr, sizeof(serv_addr));
		serv_addr.sin_family = AF_INET;
		bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
		serv_addr.sin_port = htons(port[i]);

		/* Create a socket point */
		sockfd = socket(AF_INET, SOCK_STREAM, 0);

		if (sockfd < 0) {
			perror("ERROR opening socket");
			exit(1);
		}

		/* Now connect to the server */
		if (connect(sockfd, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0) {
			perror("ERROR connecting");
			break;
		}

		/* Now read server response */
		bzero(buffer,256);
		n = recv(sockfd, buffer, 255, 0);
		printf("received text: %s\n", buffer);

		if (n < 0) {
			perror("ERROR reading from socket");
			break;
		}

		write(fp_w[i], buffer, n);
		close(fp_w[i]);
		close(sockfd);
	}
	
  return 0;
}
