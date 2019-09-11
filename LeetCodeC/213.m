//
//  213.m
//  LeetCode
//
//  Created by qws on 2019/5/14.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
bool isPowerOfTwo(int n){
    if (n <= 0) {
        return false;
    } else if (n == 1) {
        return true;
    } else {
        if ( n % 2 == 1) {
            return false;
        } else {
            while (n > 2 && n % 2 == 0) {
                n = n >> 1;
            }
            if (n == 2) {
                return true;
            } else {
                return false;
            }
        }
    }
}
