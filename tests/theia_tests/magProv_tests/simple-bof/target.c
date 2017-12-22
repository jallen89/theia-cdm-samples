#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <common.h>

void jump_to_here() {
  read_flag();
}

void start() {
  char buffer[50];
	FILE *fp;
	fp = fopen("./exp-vagrant.bin","rw");
	fgets(buffer, 512, fp);
}

int main(int argc, char** argv) {
  /* no warning */
  (void)jump_to_here;
  start();
  return 0;
}
