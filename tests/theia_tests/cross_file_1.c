#include <sys/types.h>                                                           
#include <sys/stat.h>                                                            
#include <fcntl.h>                                                               
#include "stdio.h" 
#include <string.h>

int main() {

	int fp_aa, fp_bb, fp_cc;
	int fp_dd, fp_ee, fp_ff;

	char buf_aa[10];
	char buf_bb[10];
	char buf_cc[10];
	char buf_dd[10];
	char buf_ee[10];
	char buf_ff[10];

	int bytes_read = 0;
	int bytes_write = 0;

	int i = 0;

	fp_aa = 0;
	fp_bb = 0;
	fp_cc = 0;

//dd,ee,ff files are cross process
	fp_dd = 0;
	fp_ee = 0;
	fp_ff = 0;

	fp_aa = open("aa.txt", O_RDWR);
	fp_bb = open("bb.txt", O_RDWR);
	fp_cc = open("cc.txt", O_RDWR);
	fp_dd = open("dd.txt", O_RDWR);
	fp_ee = open("ee.txt", O_RDWR);
	fp_ff = open("ff.txt", O_RDWR);

	bytes_read = read(fp_aa, buf_aa, 10);
	bytes_read = read(fp_bb, buf_bb, 10);
	bytes_read = read(fp_cc, buf_cc, 10);

	for (i=0;i<10;i++) {
		buf_dd[i] = buf_aa[i];
		buf_ee[i] = buf_bb[i];
		buf_ff[i] = buf_cc[i];
	}

	bytes_write = write(fp_dd, buf_dd, 10);
	bytes_write = write(fp_ee, buf_ee, 10);
	bytes_write = write(fp_ff, buf_ff, 10);

	return 0;
}
