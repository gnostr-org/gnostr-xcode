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
#include "async.h"

void report() {

    printf("ToolX:report()\n");

}

int main(int argc, char *argv[]) {
    @autoreleasepool {
    report();
// int execv_bridge(const char *path, char *const argv[]);
    //execv_bridge(argv[0],(char *const *)argv);

    execv_bridge((const char *)argv, (char *const *)argv);

        logargv(&argc, (char *const *)argv[0]);

    }
    return 0;
}
