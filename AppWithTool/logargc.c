//
//  logargc.c
//  AppWithTool
//
//  Created by git on 5/18/23.
//

#include "logargc.h"

int logargc(int *count){
#if APPWITHTOOLS_TESTS
    printf("logargc:\n");
    printf("argc=%d\n",*count);
#endif
    return *count;
    
}
