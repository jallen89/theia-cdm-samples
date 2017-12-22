#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

int main()
{
  
  int fd_in, fd_out;
  char *map_in;
  char *map_out;
  int i;

  fd_in = open("./sample_in.txt", O_RDWR, (mode_t)0600);
  if (fd_in == -1) {
    perror("Error opening file for writing");
    exit(EXIT_FAILURE);
  }
  
  fd_out = open("./sample_out.txt", O_CREAT | O_RDWR | O_TRUNC, (mode_t)0660);
  if (fd_out == -1) {
    perror("Error opening file for writing");
    exit(EXIT_FAILURE);
  }
  
	if(lseek(fd_out, 13, SEEK_SET) < 0)
	{
		close(fd_out);
		perror("Error calling lseek() to 'stretch' the file");
		exit(EXIT_FAILURE);
	}
	//Yang: tricky here!!! you can not put '\0' instead of "". const char* has address, but a single char does not!!
	if(write(fd_out, "", 1) < 0)
	{
		close(fd_out);
		perror("Error writing to the file");
		exit(EXIT_FAILURE);
	}
	
  
  map_in = mmap(NULL, 16, PROT_READ | PROT_WRITE, MAP_SHARED, fd_in, 0/*sysconf(_SC_PAGE_SIZE)*/);
  if (map_in == MAP_FAILED) {
    close(fd_in);
    perror("Error mmapping the file");
    exit(EXIT_FAILURE);
  }
 
  map_out = mmap(NULL, 16, PROT_READ | PROT_WRITE, MAP_SHARED, fd_out, 0/*sysconf(_SC_PAGE_SIZE)*/);
  if (map_out == MAP_FAILED) {
    close(fd_out);
    perror("Error mmapping the file");
    exit(EXIT_FAILURE);
  }
   
  i = 0;
  while (*(map_in+i) != '\0') {
    *(map_out+i) = *(map_in+i);
    i++;
  }

//  printf("in_ptr: %p, sample_in.txt: %s\n", map_in, map_in);
//  printf("out_ptr: %p, sample_out.txt: %s\n", map_out, map_out);
  
	munmap(map_in,16);
	munmap(map_out,16);

	close(fd_in);
	close(fd_out);

  return 0;
}
