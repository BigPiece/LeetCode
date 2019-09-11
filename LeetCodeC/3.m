//
//  main.m
//  LeetCode
//
//  Created by qws on 2019/5/6.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
//判断子串中是否有重复的
bool judgeDuplic(char *s, int start, int end) {
    for (int i = start; i < end; i++) {
        char c = s[i];
        for (int j = i + 1; j <= end ; j++) {
            char next = s[j];
            if (c == next) {
                return true;
            }
        }
    }
    return false;
}

int lengthOfLongestSubstring(char * s){
    if (s == NULL) {
        return 0;
    }
    int strL = (int)strlen(s);
    if (strL == 0) {
        return 0;
    }
    if (strL == 1) {
        return 1;
    }
    
    int max = 1;
    for (int i = 0 ; i < strL ; i++) {
        int j = i + max;
        while (j < strL && !judgeDuplic(s,i,j)) {
            j++;
            max++;
        }
    }
    return max;
}

int main3(int argc, const char * argv[]) {
    @autoreleasepool {
        char *s = "bbbbb";
        int l = lengthOfLongestSubstring(s);
        NSLog(@"l = %d",l);
    }
    return 0;
}

