//
//  215.m
//  LeetCode
//
//  Created by qws on 2019/5/30.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int compare(int* a,int* b) {
    return *b - *a;
}

int findKthLargest(int* nums, int numsSize, int k){
    qsort(nums,numsSize,sizeof(int),compare);
    return nums[k-1];
}

