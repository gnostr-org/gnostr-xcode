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
#include "execcl_bridge.h"

#include "async.h"

void report() {

    printf("ToolX:report()\n");

}

int main(int argc, char *argv[]) {

    @autoreleasepool {
        report();
        /// int logargv(int *count, char *argv[]);
        /// logargv(&argc, (char **)argv);

/// int execv_bridge(const char *path, char *const argv[]);
        //execv_bridge((const char *)argv, (char *const *)argv);
/// int execcl_bridge(int argc, char* argv[]);
        execcl_bridge(argc, (char **)argv);


    }
    return 0;
}
