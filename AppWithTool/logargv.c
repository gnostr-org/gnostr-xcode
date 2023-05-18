//
//  logargv.c
//  AppWithTool
//
//  Created by git on 5/18/23.
//

#include "logargv.h"

void logargv(int *count, char *argv[]){
//#if APPWITHTOOLS_TESTS
    printf("logargv:\n");
//#endif
    int argvlen = 0;
    int i = *count; // i--;
//#if APPWITHTOOLS_TESTS
    printf("i=%d\n",i);
///#endif
    while(argv[argvlen] != NULL){
        while(argv[*count-i] != NULL){
        // NOTE: argvlen++ increment postfix.
        //printf("argv[argc-i]=%s\n", argv[*count-i]);
//#if APPWITHTOOLS_TESTS
        printf("%s\n", argv[*count-i]);
        // printf("argv[argvlen++] = %s\n", argv[argvlen++]);
        // printf("argv[argvlen++] = %d\n", *argv[argvlen++]);
//#endif
        i--;
        }
    }

    argvlen = 0;
    // int i = *count;
    while(argv[argvlen] != NULL){
//#if APPWITHTOOLS_TESTS
        printf("\nCharacter: %d\n", *argv[argvlen]);
        // printf("Character: %c\n",*argv[argvlen]);
        printf("Signed octal: %o\n", *argv[argvlen]);
        // printf("String of characters: %c\n",*argv[argvlen]);
        printf("Unsigned hexadecimal integer: %x\n", *argv[argvlen]);
        printf("Unsigned HEXADECIMAL integer: %X\n", *argv[argvlen]);
        printf("Pointer address: %p\n", /***/argv[argvlen]);
        printf("Signed decimal integer d: %d\n", *argv[argvlen]);
        printf("Signed decimal integer i: %i\n\n", *argv[argvlen]);
//#endif
        argvlen++;
    }
}
