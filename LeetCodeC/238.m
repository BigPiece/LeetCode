//
//  238.m
//  LeetCode
//
//  Created by qws on 2019/5/31.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* productExceptSelf(int* nums, int numsSize, int* returnSize){
    int j = numsSize - 1;
    int left = 0;
    int right = 0;
    int* res = calloc(numsSize,sizeof(int));
    int* lRes = calloc(numsSize,sizeof(int));
    int* rRes = calloc(numsSize,sizeof(int));
    for (int i = 0; i < numsSize; i++) {
        if (i == 0) {
            left = 1;
        } else {
            left *= nums[i-1];
        }
        if (j == numsSize -1) {
            right = 1;
        } else {
            right *= nums[j+1];
        }
        lRes[i] = left;
        rRes[j] = right;
        j--;
    }
    
    for (int i = 0; i < numsSize; i++) {
        res[i] = lRes[i] * rRes[i];
    }
    return res;
}

int main238() {
    @autoreleasepool {
        int nums[] = {1,2,3,4};
        int size;
        int* res =productExceptSelf(nums,4,&size);
        for (int i = 0; i < 4; i++) {
            printf("%d",res[i]);
        }
    }
    return 0;
}
