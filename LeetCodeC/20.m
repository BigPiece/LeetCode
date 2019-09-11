//
//  20.m
//  LeetCode
//
//  Created by qws on 2019/5/8.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

bool isValid(char * s){
    if (s == NULL) {
        return false;
    }
    int len = (int)strlen(s);
    if (len == 0) {
        return true;
    }
    char stack[len];
    int top = -1;
    for (int i = 0 ; i < len; i++) {
        char c = s[i];
        if (i == 0) {
            top = 0;
            stack[top] = c;
            continue;
        } else {
            if ( top != -1 && (
                               (c == ')' && stack[top] == '(') ||
                               (c == '}' && stack[top] == '{') ||
                               (c == ']' && stack[top] == '['))) {
                //pop
                stack[top] = '\0';
                top--;
            } else {
                //push c
                top++;
                stack[top] = c;
            }
        }
    }
    
    return top == - 1;
}


int main20(int argc, const char * argv[]) {
    @autoreleasepool {
//        char *a = "aca";
//        char *b = "cba";
//        char **strs = malloc(sizeof(char) * 1000);
//        strs[0]=a;
//        strs[1]=b;
//        char *res = longestCommonPrefix(strs,2);
//        NSLog(@"%s",res);
//        free(strs);
    }
    return 0;
}
