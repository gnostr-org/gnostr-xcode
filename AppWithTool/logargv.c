//
//  logargv.c
//  AppWithTool
//
//  Created by git on 5/18/23.
//

#include "logargv.h"

int logargv(int *count, char *argv[]){

    int argvlen = 0;
    int i = *count;
    while(argv[argvlen] != NULL){
        while(argv[*count-i] != NULL){
        printf("i=%d\n",i);
        printf("%s\n", argv[i]);
        i--;
        }
    }
    return 0;
}
