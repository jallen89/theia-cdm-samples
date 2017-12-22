#include <sys/types.h>                                                           
#include <sys/stat.h>                                                            
#include <fcntl.h>                                                               
#include "stdio.h" 
#include <string.h>

int main() {

	int fp_in,fp_out;
	int bytes_read = 0, bytes_write = 0;
	char buf_in[10];
	int buf_int;
	int in_index = 4;

	int array[5] = {10,20,30,40,50};

	fp_in = open("/home/yang/omniplay/magProv_tests/index/in.txt", O_RDWR);
	fp_out = open("/home/yang/omniplay/magProv_tests/index/out.txt", O_RDWR);

//	bytes_read = read(fp_in, buf_in, 1);
//	int index = atoi(buf_in);
	bytes_read = read(fp_in, &buf_int, sizeof(int));
	printf("index:%d\n", buf_int);

//switches
//	strncpy(buf_w1,buf_r2,10);
//	strncpy(buf_w2,buf_r3,10);
//	strncpy(buf_w3,buf_r1,10);

	bytes_write = write(fp_out, &array[buf_int], sizeof(int));

	close(fp_in);
	close(fp_out);

	return 0;
}
