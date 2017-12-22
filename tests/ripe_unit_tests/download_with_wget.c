/* Copyright © 2016 BAE Systems. All rights reserved.
 * This material has not been reviewed for ITAR content.
 * Supported by DARPA (I2O)
 */

#include <stdio.h>

int main(int argc, char** argv) {
    char *cmd = "wget http://www.google.com/index.html";
    system(cmd);

    return 0;
}
