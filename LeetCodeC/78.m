//
//  78.m
//  LeetCode
//
//  Created by qws on 2019/5/29.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
int** subsets(int* nums, int numsSize, int* returnSize, int** returnColumnSizes){
    int size = 1 << numsSize;
    *returnColumnSizes = calloc(size,sizeof(int*));
    *returnSize = size;
    
    int** res = calloc(size,sizeof(int*) );
    
    for (int i = 0; i < ( 1 << numsSize);i++) {
        int count = 0;
        for (int j = 0; j < numsSize; j++) {
            if ((i & (1 << j)) != 0) {
                res[i] = realloc(res[i],sizeof(int) * (++count));
                res[i][count-1] = nums[j];
            }
        }
        (*returnColumnSizes)[i] = count;
    }
    return res;
}
int main78() {
    @autoreleasepool {
        int nums[3] = {1,2,3};
        int size = 0;
        int* column;
        int** res = subsets(nums, 3, &size, &column);
        
        for (int i = 0 ; i < size; i++) {
            int cSize = column[i];
            for (int j = 0; j < cSize; j++) {
                int x = res[i][j];
                printf("%d ",x);
            }
            printf("\n");
        }
        printf("\n");
    }
    return 0;
}
