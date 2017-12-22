/* Copyright © 2016 BAE Systems. All rights reserved.
 * This material has not been reviewed for ITAR content.
 * Supported by DARPA (I2O)
 */

#include <stdio.h>
#include <stdlib.h>

void main() {
    FILE *fp1, *fp2;
    char a;

    fp1 = fopen("README", "r");
    if (fp1 == NULL) {
        puts("cannot open this file");
        exit(1);
    }

    fp2 = fopen("temp.out", "w");
    if (fp2 == NULL) {
        puts("Not able to open this file");
        fclose(fp1);
        exit(1);
    }

    do {
        a = fgetc(fp1);
        fputc(a, fp2);
    } while (a != EOF);

    fcloseall();
}
