//
//  13.m
//  LeetCode
//
//  Created by qws on 2019/5/8.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int intFromRoman(char roman) {
    int r = 0;
    switch (roman) {
        case 'I':
            r = 1;
            break;
        case 'V':
            r = 5;
            break;
        case 'X':
            r = 10;
            break;
        case 'L':
            r = 50;
            break;
        case 'C':
            r = 100;
            break;
        case 'D':
            r = 500;
            break;
        case 'M':
            r = 1000;
            break;
        default:
            break;
    }
    return r;
}
int romanToInt(char * s){
    int length = (int)strlen(s);
    int res = 0;
    for (int i = 0; i < length; i++) {
        char current = s[i];
        if (i > 0) {
            char pre = s[i-1];
            int cInt = intFromRoman(current);
            if (pre == 'I') {
                if (current == 'V' || current == 'X') {
                    cInt -= 2;
                }
            } else if (pre == 'X') {
                if (current == 'L' || current == 'C') {
                    cInt -= 20;
                }
            } else if (pre == 'C') {
                if (current == 'D' || current == 'M') {
                    cInt -= 200;
                }
            }
            res += cInt;
        } else {
            res += intFromRoman(s[0]);
        }
    }
    return res;
}



int main13(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
