//
//  main.m
//  AppWithTool
//
//  Created by git on 4/25/23.
//

//REF: https://developer.apple.com/forums/thread/106590

//main.h
#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include "execv_bridge.h"
#include "logargv.h"
#include "logargc.h"

//int execv(const char *path, char *const argv[]);
//int execve(const char *path, char *const argv[], char *const envp[]);
//int execvp(const char *file, char *const argv[]);
//int execvpe(const char *file, char *const argv[], char *const envp[]);

void runScript(NSString* scriptName);
//main.h end
//#import main.h

int execve(const char *path, char *const argv[], char *const envp[]){ return 0; }
int execvp(const char *file, char *const argv[]){ return 0; }
int execvpe(const char *file, char *const argv[], char *const envp[]){ return 0; }

void runScript(NSString* scriptName)
{
    NSTask *task;
    task = [[NSTask alloc] init];
    [task setLaunchPath: @"/bin/sh"];

    NSArray *arguments;
    //NSString* newpath = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] privateFrameworksPath], scriptName];
    NSString* newpath = [NSString stringWithFormat:@"%@/%@",[[NSBundle mainBundle] sharedSupportPath], scriptName];
    NSLog(@"shell script path: %@",newpath);
    arguments = [NSArray arrayWithObjects:newpath, nil];
    [task setArguments: arguments];

    NSPipe *pipe;
    pipe = [NSPipe pipe];
    [task setStandardOutput: pipe];

    NSFileHandle *file;
    file = [pipe fileHandleForReading];

    [task launch];

    NSData *data;
    data = [file readDataToEndOfFile];

    NSString *string;
    string = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
    NSLog (@"script returned:\n%@", string);
}

int main(int argc, char const *argv[]) {
    @autoreleasepool {
        //execv("/usr/local/bin/nostril",".")/*(char *const *)argv)*/;
        logargc(&argc);
        logargv(&argc,(char *const *)argv);
        //execv("ls","-l")/*(char *const *)argv)*/;
    }
    return NSApplicationMain(argc, argv);
}
