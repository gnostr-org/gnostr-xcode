//
//  execcl-bridge.c
//  AppWithTool
//
//  Created by git on 5/18/23.
//

#include "execcl_bridge.h"

#define BASH_EXEC "/usr/local/bin/bash"
#define LS_EXEC "/bin/ls"

#define BSIZE 50

int execcl_bridge(int argc, char* argv[]){

    if(argc <= 1) {
        //if we do not have path in our program arguments print help message and exit
        printf("Usage: ToolX PATH \n eg. ToolX /usr/local/bin\n");
        fflush(stdout);
        return 0;
    }

    //this is a temp buffer used that will be used to build the argument
    char buffer[BSIZE];

    /// get the buffer to be all NULLs
    bzero(buffer, BSIZE);

    /// build the argument "ls -l /path/to/list/folders" and store it in buffer
    sprintf(buffer, "%s -l %s", LS_EXEC, argv[1]);
    printf("buffer: %s\n", buffer);
    /// build the argument vector

    /// Message from debugger: Terminated due to signal 5
    /// execute the command
    if(execl(BASH_EXEC, BASH_EXEC, "-c", buffer, NULL) < 0){
        printf("execcl_bridge:Something terrible happended!");
        return 1;
    }

    /// Program ended with exit code: 0
    return 0;
}
