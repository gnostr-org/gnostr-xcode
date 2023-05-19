//
//  main.m
//  ToolX
//
//  Created by git on 4/25/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#include "execv_bridge.h"
#include "async.h"

void report() {

    printf("ToolX\n");

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
// report();
// int execv_bridge(const char *path, char *const argv[]);
    //execv_bridge(argv[0],(char *const *)argv);
    execv_bridge(&argc,(char *const *)argv);

// logargv(&argc, (char *const *)argv);

    }
    return 0;
}
