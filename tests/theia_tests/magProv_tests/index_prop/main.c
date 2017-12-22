#include <sys/types.h>                                                           
#include <sys/stat.h>                                                            
#include <fcntl.h>                                                               
#include "stdio.h" 
#include <string.h>

int main() {

	int fp_r, fp_w;
	char buf;
	char target_buf;
	char foo_array[] = {'a', 'b', 'c', 'd', 'e', 'f'};
	int bytes_read = 0, bytes_write = 0;

	fp_r = open("/home/yang/tests/index_prop/input.txt", O_RDWR);
	fp_w = open("/home/yang/tests/index_prop/output.txt", O_RDWR|O_CREAT, 0664);

	bytes_read = read(fp_r, &buf, 1);
//	printf("read is (%d), array: %d\n", atoi(buf), foo_array[atoi(buf)]);	
	
//	target_buf = foo_array[atoi(buf)];
	target_buf = foo_array[buf-'0'];
	bytes_write = write(fp_w, &target_buf, 1);	
//	printf("bytes_write: %d\n", bytes_write);
	close(fp_r);
	close(fp_w);

	return 0;
}
