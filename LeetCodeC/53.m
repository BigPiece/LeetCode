//
//  53.m
//  LeetCode
//
//  Created by qws on 2019/5/8.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int maxSubArray(int* nums, int numsSize){
    if (numsSize == 0 ) {
        return 0;
    }
    int sum = 0;
    int res = nums[0];
    for (int i = 0 ;i < numsSize; i++) {
        sum = sum > 0 ? sum + nums[i] : nums[i];
        if (res < sum) {
            res = sum;
        }
    }
    
    return sum;
}

int main53(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
