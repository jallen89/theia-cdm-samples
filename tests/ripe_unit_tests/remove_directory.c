/* Copyright © 2016 BAE Systems. All rights reserved.
 * This material has not been reviewed for ITAR content.
 * Supported by DARPA (I2O)
 */

#include <stdio.h>
#include <stdlib.h>

void main() {

  // created in make_directory.c
  if ( rmdir ("temporary") == -1 ) {
    perror ( "rmdir failed" );
  }

}
