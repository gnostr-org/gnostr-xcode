//
//  execv_bridge.c
//  AppWithTool
//
//  Created by git on 5/18/23.
//

#include "execv_bridge.h"

void execv_bridge_report(const char *path, char *const argv[]){

    int argvlen = 0;
/// printf("execv_bridge:\n");
    printf("argv[%d]:%s\n", argvlen, argv[argvlen]); argvlen++;

    while(argv[argvlen] != NULL){

        printf("argv[argvlen++] = %s\n", argv[argvlen++]);

    }
}

int execv_bridge(const char *path, char *const argv[]){

    execv_bridge_report((const char *)argv, (char *const *)argv);

    int argvlen = 0;

    while(argv[argvlen] != NULL){

        printf("argv[argvlen++] = %s\n", argv[argvlen++]);

    }

    execv(path, argv);
    return 0;

}
