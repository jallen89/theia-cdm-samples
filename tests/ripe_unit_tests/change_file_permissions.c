/* Copyright © 2016 BAE Systems. All rights reserved.
 * This material has not been reviewed for ITAR content.
 * Supported by DARPA (I2O)
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>

/* Change file permissions of "README" to toggle execute permissions */

void toggleExecute(const char* filepath)
{

	struct stat st;
	int ret = stat(filepath, &st);
	if (ret != 0) {
		exit(1);
	}
	if ((st.st_mode & S_IXOTH) == S_IXOTH) {
		chmod(filepath, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH);
	} else {
		chmod(filepath, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IRWXO);
	}

}

void main()
{

	toggleExecute("README");
	toggleExecute("README");

}

