#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <stdio.h>

int main()
{
  int file=0;
  if((file=open("testfile.txt",O_RDONLY)) < -1)
    return 1;

  char buffer[20];
  buffer[19] = '\0';
  if(read(file,buffer,19) != 19)  return 1;
  printf("1: %s\n",buffer);

  if(lseek(file,10,SEEK_SET) < 0) return 1;

  if(read(file,buffer,19) != 19)  return 1;
  printf("2: %s\n",buffer);

  return 0;
}
