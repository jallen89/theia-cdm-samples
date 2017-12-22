/* Copyright © 2016 BAE Systems. All rights reserved.
 * This material has not been reviewed for ITAR content.
 * Supported by DARPA (I2O)
 */

#include <stdio.h>
#include <string.h>

void Hello(char* buf)
{
	memcpy(buf, "hello", 5);
}

void World(char* buf)
{
	memcpy(&buf[5], " world\n", 7);
}

void main(int argc, char** argv)
{
	char buf[20];
	Hello(buf);
	World(buf);
	printf("%s", buf);
}



