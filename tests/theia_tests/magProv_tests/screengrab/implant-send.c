#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/types.h>
#include <fcntl.h>                                                               
#include <netdb.h>
#include <netinet/in.h>
#include <sys/socket.h>

int main(int argc, char* argv[]) 
{
	int fp1, fp2, fp3;

	char buf_r1[10];
	char buf_r2[10];
	char buf_r3[10];

	int bytes_read = 0;
	int bytes_write = 0;

  int sockfd;
  struct hostent *server;
  struct sockaddr_in serv_addr;
	int port = 5001;
	int n = 0;

  server = gethostbyname("127.0.0.1");
	
  if (server == NULL) {
    fprintf(stderr,"ERROR, no such host\n");
    exit(0);
  }

	fp1 = open("/home/yang/omniplay/magProv_tests/screengrab/captured-screen-1.txt", O_RDWR);
	fp2 = open("/home/yang/omniplay/magProv_tests/screengrab/captured-screen-2.txt", O_RDWR);
	fp3 = open("/home/yang/omniplay/magProv_tests/screengrab/captured-screen-3.txt", O_RDWR);

	bytes_read = read(fp1, buf_r1, 100);
	bytes_read = read(fp2, buf_r2, 100);
	bytes_read = read(fp3, buf_r3, 100);


	bzero((char *) &serv_addr, sizeof(serv_addr));
	serv_addr.sin_family = AF_INET;
	bcopy((char *)server->h_addr, (char *)&serv_addr.sin_addr.s_addr, server->h_length);
	serv_addr.sin_port = htons(port);

	/* Create a socket point */
	sockfd = socket(AF_INET, SOCK_STREAM, 0);

	if (sockfd < 0) {
		perror("ERROR opening socket");
		exit(1);
	}

	/* Now connect to the server */
	if (connect(sockfd, (struct sockaddr*)&serv_addr, sizeof(serv_addr)) < 0) {
		perror("ERROR connecting");
		exit(1);
	}

	/* Now read server response */
	n = send(sockfd, buf_r2, 50, 0);

	if (n < 0) {
		perror("ERROR reading from socket");
		exit(1);
	}

	close(fp1);
	close(fp2);
	close(fp3);
	close(sockfd);

	return 0;
}

