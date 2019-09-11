//
//  9.m
//  LeetCode
//
//  Created by qws on 2019/5/7.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

bool isPalindrome(int x){
    if (x < 0) {
        return false;
    }
    if (x < 10) {
        return true;
    }
    if (x % 10 == 0) {
        return false;
    }
    int old = x;
    int reverse = 0;
    while (x >= 1) {
        int last = x % 10;
        reverse = reverse * 10 + last;
        if (x == reverse ) {
            return true;
        }
        if (x/10 == reverse) {
            return true;
        }
        x /= 10;
        if (reverse > x ) {
            return false;
        }
    }
    
    return false;
}

int main9(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
