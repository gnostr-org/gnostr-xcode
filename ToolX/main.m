//
//  main.m
//  ToolX
//
//  Created by git on 4/25/23.
//

// REF: https://developer.apple.com/documentation/xcode/embedding-a-helper-tool-in-a-sandboxed-app


#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#include "execv_bridge.h"
#include "execl_bridge.h"

#include "async.h"

void main_report(const char *path, char *const argv[]){

    int argvlen = 0;
/// printf("execv_bridge:\n");
    printf("argv[%d]:%s\n", argvlen, argv[argvlen]); argvlen++;

    while(argv[argvlen] != NULL){

        printf("argv[argvlen++] = %s\n", argv[argvlen++]);

    }
}

int main(int argc, char *argv[]) {

@autoreleasepool {

    main_report((const char *)argv, (char *const *)argv);

/// int logargv(int *count, char *argv[]);
/// logargv(&argc, (char **)argv);

/// int execv_bridge(const char *path, char *const argv[]);

/// argv[0]:/.../...AppWithTool/Build/Products/Debug/ToolX
    execv_bridge((const char *)argv, (char *const *)argv);

/// int execcl_bridge(int argc, char* argv[]);
    // execcl_bridge(argc, (char **)argv);

    }

    return 0;

}
