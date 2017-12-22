/* Copyright © 2016 BAE Systems. All rights reserved.
 * This material has not been reviewed for ITAR content.
 * Supported by DARPA (I2O)
 */


#include <stdio.h>
#include <unistd.h>

int main(void)
{

    pid_t pID = fork();
   if (pID == 0)                // child
   {
      // Code only executed by child process
      printf("Child Process\n");
    }
    else if (pID < 0)            // failed to fork
    {
        printf("Failed to fork\n");
    }
    else                                   // parent
    {
      // Code only executed by parent process
      printf("Parent Process\n");
    }

    return(0);
}
