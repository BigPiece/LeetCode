//
//  136.m
//  LeetCode
//
//  Created by qws on 2019/5/10.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>



int singleNumber(int* nums, int numsSize){
    if (numsSize==0) {
        return 0;
    }
    if (numsSize == 1) {
        return nums[0];
    }
    int ret = 0;
    for (int i = 0; i < numsSize; i++) {
        int c = nums[i];
        ret = ret ^ c;
    }
    return ret;
}



int main136(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
