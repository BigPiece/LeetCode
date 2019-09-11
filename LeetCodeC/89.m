//
//  89.m
//  LeetCode
//
//  Created by qws on 2019/5/29.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* grayCode(int n, int* returnSize){
    
    *returnSize = pow(2, n);
    int* res = calloc(*returnSize,sizeof(int));
    
    int idx = 0;
    for (int i = 0; i <= n; i++) {
        if (i == 0) {
            res[idx++] = 0;
        } else {
            int k = 1 << (i-1);
            for(int j = pow(2, i-1)-1; j >= 0; j--){
                int x = res[j];
                res[idx++] = k | x;
            }
        }
    }
    return res;
}

int main89() {
    @autoreleasepool {
        
    }
    return 0;
}

