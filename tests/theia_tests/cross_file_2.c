#include <sys/types.h>                                                           
#include <sys/stat.h>                                                            
#include <fcntl.h>                                                               
#include "stdio.h" 
#include <string.h>

int main() {

	int fp_dd, fp_ee, fp_ff;
	int fp_gg, fp_hh, fp_ii;

	char buf_dd[10];
	char buf_ee[10];
	char buf_ff[10];
	char buf_gg[10];
	char buf_hh[10];
	char buf_ii[10];

	int bytes_read = 0;
	int bytes_write = 0;

	int i = 0;

//dd,ee,ff files are cross process
	fp_dd = 0;
	fp_ee = 0;
	fp_ff = 0;

	fp_gg = 0;
	fp_hh = 0;
	fp_ii = 0;

	fp_dd = open("dd.txt", O_RDWR);
	fp_ee = open("ee.txt", O_RDWR);
	fp_ff = open("ff.txt", O_RDWR);
	fp_gg = open("gg.txt", O_RDWR);
	fp_hh = open("hh.txt", O_RDWR);
	fp_ii = open("ii.txt", O_RDWR);

	bytes_read = read(fp_dd, buf_dd, 10);
	bytes_read = read(fp_ee, buf_ee, 10);
	bytes_read = read(fp_ff, buf_ff, 10);

	for (i=0;i<10;i++) {
		buf_gg[i] = buf_dd[i];
		buf_hh[i] = buf_ee[i];
		buf_ii[i] = buf_ff[i];
	}

	bytes_write = write(fp_gg, buf_gg, 10);
	bytes_write = write(fp_hh, buf_hh, 10);
	bytes_write = write(fp_ii, buf_ii, 10);

	return 0;
}
