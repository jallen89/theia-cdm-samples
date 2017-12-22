/* Copyright © 2016 BAE Systems. All rights reserved.
 * This material has not been reviewed for ITAR content.
 * Supported by DARPA (I2O)
 */

#include <stdlib.h>

void main(int argc, char** argv) {
	int a = 5;

	int* buf = malloc(sizeof(int));
	*buf = a;

	free(buf);
}
