/* Copyright © 2016 BAE Systems. All rights reserved.
 * This material has not been reviewed for ITAR content.
 * Supported by DARPA (I2O)
 */

#include <stdlib.h>

int Func(int foo)
{
	int local_static_var1;
	int local_static_var2 = 3;
	local_static_var1 = foo;
	return local_static_var2;
}

void main(int argc, char** argv)
{
	int a = 5;
	int b = Func(a);
}
