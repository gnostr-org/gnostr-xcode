//
//  main.m
//  ToolX
//
//  Created by git on 4/25/23.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

void report() {

    printf("ToolX");

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // NSLog(@"argv[]=%s", *argv);
        // printf("argc=%d", argc);
    printf("argc=%d", argc);
    printf("argv[argc]=%s", argv[argc]);
    report();
    }
    return 0;
}
