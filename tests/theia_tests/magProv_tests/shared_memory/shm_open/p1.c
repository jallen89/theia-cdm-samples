#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <fcntl.h>


#define MAX_LEN 10000
struct region {        /* Defines "structure" of shared memory */
	int len;
	char buf[MAX_LEN];
};

int main() {

	struct region *rptr;
	int fd;

	fd = shm_open("/myregion1", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);
	if (fd == -1) {
		printf("shm_open fails.\n");
		exit(-1);
	}

	if (ftruncate(fd, sizeof(struct region)) == -1){
		printf("ftruncate fails.\n");
		exit(-1);
	}

	rptr = mmap(NULL, sizeof(struct region),
			PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
	if (rptr == MAP_FAILED) {
		printf("mmap fails.\n");
		exit(-1);
	}

	printf("rptr: %p\n", rptr);

	sprintf(rptr->buf, "hellogatech123");
	rptr->len = strlen(rptr->buf);

//	sleep(30);

	return 0;

}
