//
//  14.m
//  LeetCode
//
//  Created by qws on 2019/5/8.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>


char * longestCommonPrefix(char ** strs, int strsSize){
    if (strsSize == 0) {
        return "";
    }
    if (strsSize == 1) {
        return strs[0];
    }
    
    char *first = strs[0];
    int fl = (int)strlen(first);
    int preIdx = -1;
    for (int i = 0; i < fl; i++) {
        bool has = true;
        for (int j = 1 ; j < strsSize; j++) {
            char *str = strs[j];
            int sl = (int)strlen(str);
            if (sl < i + 1) {
                has = false;
            } else if (str[i] != first[i]){
                has = false;
            }
            if (!has) {
                break;
            }
        }
        if (has) {
            preIdx = i;
        } else {
            break;
        }
    }
    if (preIdx == -1) {
        return "";
    } else {
        
        for (int i = preIdx + 1; i <fl ; i++) {
            first[i] = '\0';
        }
        return strs[0];
    }
}

int main14(int argc, const char * argv[]) {
    @autoreleasepool {
        char *a = "aca";
        char *b = "cba";
        char **strs = malloc(sizeof(char) * 1000);
        strs[0]=a;
        strs[1]=b;
        char *res = longestCommonPrefix(strs,2);
        NSLog(@"%s",res);
        free(strs);
    }
    return 0;
}
