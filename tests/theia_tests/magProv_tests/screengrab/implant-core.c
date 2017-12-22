#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/types.h>

pid_t proc_find(const char* name) 
{
	DIR* dir;
	struct dirent* ent;
	char* endptr;
	char buf[512];

	if (!(dir = opendir("/proc"))) {
		perror("can't open /proc");
		return -1;
	}

	while((ent = readdir(dir)) != NULL) {
		/* if endptr is not a null character, the directory is not
		 * entirely numeric, so ignore it */
		long lpid = strtol(ent->d_name, &endptr, 10);
		if (*endptr != '\0') {
			continue;
		}

		/* try to open the cmdline file */
		snprintf(buf, sizeof(buf), "/proc/%ld/cmdline", lpid);
		FILE* fp = fopen(buf, "r");

		if (fp) {
			if (fgets(buf, sizeof(buf), fp) != NULL) {
				/* check the first token in the file, the program name */
				char* first = strtok(buf, " ");
				if (!strcmp(first, name)) {
					fclose(fp);
					closedir(dir);
					return (pid_t)lpid;
				}
			}
			fclose(fp);
		}

	}

	closedir(dir);
	return -1;
}

int main(int argc, char* argv[]) 
{
//	if (argc == 1) {
//		printf("usage: %s name1 name2 ...\n", argv[0]);
//		return 1;
//	}
//
//	int i;
//	for(i = 1; i < argc; ++i) {
//		pid_t pid = proc_find(argv[i]);
//		if (pid == -1) {
//			printf("%s: not found\n", argv[i]);
//		} else {
//			printf("%s: %d\n", argv[i], pid);
//		}
//	}



	pid_t pid_b = proc_find("evince");
	if (pid_b == -1) {
//		printf("%s: not found\n", argv[i]);
	} else {
		pid_t pid = fork();
		if(pid == 0) {
			execl("./screengrab", "./screengrab", "/home/yang/omniplay/magProv_tests/screengrab/screen.png", NULL);
		}
	}

	return 0;
}

