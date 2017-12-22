#include <sys/types.h>                                                           
#include <sys/stat.h>                                                            
#include <fcntl.h>                                                               
#include "stdio.h" 
#include <string.h>

int main() {

	int fp_r1, fp_r2, fp_r3;
	int fp_w1, fp_w2, fp_w3;

	char buf_r1[10];
	char buf_r2[10];
	char buf_r3[10];
	char buf_w1[10];
	char buf_w2[10];
	char buf_w3[10];

	int bytes_read = 0;
	int bytes_write = 0;

	int i = 0;

	fp_r1 = 0;
	fp_r2 = 0;
	fp_r3 = 0;
	fp_w1 = 0;
	fp_w2 = 0;
	fp_w3 = 0;

	fp_r1 = open("/home/yang/omniplay/magProv_tests/file_rw/r1.txt", O_RDWR);
	fp_r2 = open("/home/yang/omniplay/magProv_tests/file_rw/r2.txt", O_RDWR);
	fp_r3 = open("/home/yang/omniplay/magProv_tests/file_rw/r3.txt", O_RDWR);
	fp_w1 = open("/home/yang/omniplay/magProv_tests/file_rw/w1.txt", O_RDWR);
	fp_w2 = open("/home/yang/omniplay/magProv_tests/file_rw/w2.txt", O_RDWR);
	fp_w3 = open("/home/yang/omniplay/magProv_tests/file_rw/w3.txt", O_RDWR);

	bytes_read = read(fp_r1, buf_r1, 10);
	bytes_read = read(fp_r2, buf_r2, 10);
	bytes_read = read(fp_r3, buf_r3, 10);

//switches
//	strncpy(buf_w1,buf_r2,10);
//	strncpy(buf_w2,buf_r3,10);
//	strncpy(buf_w3,buf_r1,10);

	for (i=0;i<10;i++) {
		buf_w1[i] = buf_r1[i];
		buf_w2[i] = buf_r2[i];
		buf_w3[i] = buf_r3[i];
	}

	bytes_write = write(fp_w1, buf_w1, 10);
	bytes_write = write(fp_w2, buf_w2, 10);
	bytes_write = write(fp_w3, buf_w3, 10);

	return 0;
}
