//
//  26.m
//  LeetCode
//
//  Created by qws on 2019/5/8.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int removeDuplicates(int* nums, int numsSize){
    if (numsSize == 0) {
        return 0;
    }
    int i = 0;
    for (int j = 1; j < numsSize; j++) {
        if (nums[i] != nums[j]) {
            i++;
            nums[i] = nums[j];
        }
    }
    
    return i + 1;
}

int main26(int argc, const char * argv[]) {
    @autoreleasepool {
    
    }
    return 0;
}
