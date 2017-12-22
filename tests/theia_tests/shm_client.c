/*
 * shm-client - client program to demonstrate shared memory.
 */
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdio.h>

#define SHMSZ     27

int main()
{
  int shmid;
  key_t key;
  char *shm, *s;

  /*
   * We need to get the segment named
   * "5678", created by the server.
   */
  key = 5678;

  /*
   * Locate the segment.
   */
  if ((shmid = shmget(key, 17, 0666)) < 0) {
    perror("shmget");
		return -1;
  }

  /*
   * Now we attach the segment to our data space.
   */
  if ((shm = shmat(shmid, NULL, 0)) == (char *) -1) {
    perror("shmat");
		return -1;
  }

  /*
   * Now read what the server put in the memory.
   */
  for (s = shm; *s != '\0'; s++)
    putchar(*s);
  putchar('\n');

  /*
   * Finally, change the first character of the 
   * segment to '*', indicating we have read 
   * the segment.
   */
  *shm = '*';

	return 0;
}

