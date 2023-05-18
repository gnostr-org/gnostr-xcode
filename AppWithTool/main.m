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

//int execv(const char *path, char *const argv[]);
//int execve(const char *path, char *const argv[], char *const envp[]);
//int execvp(const char *file, char *const argv[]);
//int execvpe(const char *file, char *const argv[], char *const envp[]);

void runScript(NSString* scriptName);
void logsargc(int *count);
void logargv(int *count, char *const argv[]);
//main.h end
int test (void);
//#import main.h
int execv_bridge(const char *path, char *const argv[]){
    
    printf("execv_bridge:\n");
    printf("path:%s\n", path);
    printf("*argv:%s\n", *argv);
    //execv(path, argv);
    return execv(path, argv);
    
}

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
//------------------------------------------------------

void logargc(int *count){ printf("argc=%d\n",*count); }
void logargv(int *count, char *const argv[]){
    
    int argvlen = 0;
    while(argv[argvlen] != NULL){
        // NOTE: argvlen++ increment postfix.
        printf("argv[argvlen++] = %d\n", *argv[argvlen++]);
    }
    
    argvlen = 0;
    while(argv[argvlen] != NULL){
        // NOTE: argvlen++ increment postfix.
        // printf("Character: %c\n",*argv[argvlen]);
        printf("\nCharacter: %d\n",*argv[argvlen]);
        // printf("Character: %c\n",*argv[argvlen]);
        printf("Signed octal: %o\n",*argv[argvlen]);
        // printf("String of characters: %c\n",*argv[argvlen]);
        printf("Unsigned hexadecimal integer: %x\n",*argv[argvlen]);
        printf("Unsigned HEXADECIMAL integer: %X\n",*argv[argvlen]);
        printf("Pointer address: %p\n",/***/argv[argvlen]);
        printf("Signed decimal integer d: %d\n",*argv[argvlen]);
        printf("Signed decimal integer i: %i\n\n",*argv[argvlen]);
        argvlen++;
    }
}

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

int main(int argc, char const *argv[]) {
    @autoreleasepool {
        //execv("/usr/local/bin/nostril",".")/*(char *const *)argv)*/;
        //logargc(&argc);
        //logargv(&argc,(char *const *)argv);
        //execv("ls","-l")/*(char *const *)argv)*/;
    }
    return NSApplicationMain(argc, argv);
}
