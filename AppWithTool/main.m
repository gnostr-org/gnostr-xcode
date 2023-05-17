//
//  main.m
//  AppWithTool
//
//  Created by git on 4/25/23.
//

//REF: https://developer.apple.com/forums/thread/106590
#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

int execv(const char *path, char *const argv[]);
int execve(const char *path, char *const argv[], char *const envp[]);
int execvp(const char *file, char *const argv[]);
int execvpe(const char *file, char *const argv[], char *const envp[]);
void runScript(NSString* scriptName);
void logstuff(int *count);

int execv(const char *path, char *const argv[]){
    
    printf("execv:_____________________________\n");
    //printf("=========%s", path);
    printf("=========%c=======", *argv);
    //execv("/usr/local/bin/nostril", &argv[argc]);
    return 0; }
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

void logargc(int *count){
    
    printf("logargc argc = %d\n",*count);
}

int main(int argc, char const *argv[]) {
    @autoreleasepool {
        
        logargc(&argc);
        //printf("argc=%d", argc);
        //printf("argv[argc]=%s", argv[argc]);
        //NSLog(@"argc=%d", argc);
        //NSLog(@"argv[argc-1]=%s", argv[argc-1]);
        //NSLog(@"argv[argc-2]=%s", argv[argc-2]);
        //NSLog(@"argv[argc-3]=%s", argv[argc-3]);
        //NSLog(@"");
        //NSLog(@"");
        //NSLog(@"");
        // Setup code that might create autoreleased objects goes here.
        // runScript(@"Script.sh");
        // printf("=========%s", &argv[argc]);
        // execv("/usr/local/bin/nostril", "--sec");
        
        // int execv(const char *path, char *const argv[]){
        //const char myarg = **argv;
        //execv("/usr/local/bin/ls", myarg);
        //execv("/usr/local/bin/ls", &*argv);
        execv(&*argv[0], &*argv);

        // runScript(@"Script.sh");
        //runScript(@"template.sh");
        //runScript(@"Script.sh");


    }
    return NSApplicationMain(argc, argv);
}
