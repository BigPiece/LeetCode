//
//  169.m
//  LeetCode
//
//  Created by qws on 2019/5/13.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int majorityElement(int* nums, int numsSize){
    if (numsSize == 0) {
        return 0;
    }
    int count = 0;
    int res = nums[0];
    for (int i = 0 ; i < numsSize; i++) {
        if (count == 0) {
            res = nums[i];
        } else if (res == nums[i]) {
            count++;
        } else {
            count--;
        }
    }
    return res;
}

int main169(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
