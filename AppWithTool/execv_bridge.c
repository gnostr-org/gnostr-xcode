//
//  execv_bridge.c
//  AppWithTool
//
//  Created by git on 5/18/23.
//

#include "execv_bridge.h"
int test (void) {
#ifdef APPWITHTOOLS_TESTS
        NSLog(APPWITHTOOLS_TESTS);
#endif

//REF: https://stackoverflow.com/questions/4326684/how-to-create-a-process-on-mac-os-using-fork-and-exec
    pid_t processId;
    if ((processId = fork()) == 0) {
        char app[] = "/bin/echo";
        char command[] = "test:";
        char * const argv[] = { app, command, "success", NULL };
        if (execv_bridge(app, argv) < 0) {
            perror("execv error");
        }
    } else if (processId < 0) {
        perror("fork error");
    } else {
        return EXIT_SUCCESS;
    }
    return EXIT_FAILURE;
}
int execv_bridge(const char *path, char *const argv[]){
    
    printf("execv_bridge:\n");
    printf("path:%s\n", path);
    printf("*argv:%s\n", *argv);
    //execv(path, argv);
    return execv(path, argv);
    
}
