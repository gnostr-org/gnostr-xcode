//
//  execv_bridge.c
//  AppWithTool
//
//  Created by git on 5/18/23.
//

#include "execv_bridge.h"

int execv_bridge(const char *path, char *const argv[]){

    int argvlen = 0;
/// printf("execv_bridge:\n");
    printf("path:%s\n", path);
    printf("argv[argvlen++] = %s\n", argv[argvlen]); argvlen++;

    while(argv[argvlen] != NULL){

        printf("argv[argvlen++] = %s\n", argv[argvlen++]);

    }

/// int execv(const char * __path, char * const * __argv) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
/// execv(*argv, (const char *)path);

    execv(path, argv);
    return 0;

}
