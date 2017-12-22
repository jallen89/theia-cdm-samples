#include <stdio.h>
#include <stdlib.h>

#include <netdb.h>
#include <netinet/in.h>

#include <string.h>

void doprocessing (int sock) {
	int n;
  char buffer[256] = "i am from 1";

  n = write(sock,buffer,strlen(buffer));

  if (n < 0) {
    perror("ERROR writing to socket");
    exit(1);
  }
}

int main( int argc, char *argv[] ) {
  int sockfd, newsockfd, portno, clilen;
  char buffer[256];
  struct sockaddr_in serv_addr, cli_addr, foo;
  int len = sizeof(struct sockaddr);
  int n, pid;
  int ret = 0;

  /* First call to socket() function */
  sockfd = socket(AF_INET, SOCK_STREAM, 0);

  if (sockfd < 0) {
    perror("ERROR opening socket");
    exit(1);
  }

  /* Initialize socket structure */
  bzero((char *) &serv_addr, sizeof(serv_addr));
  portno = 5001;

  serv_addr.sin_family = AF_INET;
  serv_addr.sin_addr.s_addr = INADDR_ANY;
  serv_addr.sin_port = htons(portno);

  /* Now bind the host address using bind() call.*/
  if (bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr)) < 0) {
    perror("ERROR on binding");
    exit(1);
  }

  /* Now start listening for the clients, here
   * process will go in sleep mode and will wait
   * for the incoming connection
   */

  listen(sockfd,5);
  clilen = sizeof(cli_addr);

  while (1) {
    newsockfd = accept(sockfd, (struct sockaddr *) &cli_addr, &clilen);

    ret = getsockname(newsockfd, (struct sockaddr *) &foo, &len);
    printf("return: %d\n",ret);
    fprintf(stderr, "bound on %d\n", ntohs(cli_addr.sin_port));

    if (newsockfd < 0) {
      perror("ERROR on accept");
      exit(1);
    }

    /* Create child process */
    pid = fork();

    if (pid < 0) {
      perror("ERROR on fork");
      exit(1);
    }

    if (pid == 0) {
      /* This is the client process */
      close(sockfd);
      doprocessing(newsockfd);
      exit(0);
    }
    else {
      close(newsockfd);
    }

  } /* end of while */
}
