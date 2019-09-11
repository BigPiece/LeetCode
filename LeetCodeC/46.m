//
//  46.m
//  LeetCode
//
//  Created by qws on 2019/5/24.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

void mSwap(int* nums, int a, int b){
    int temp = nums[a];
    nums[a] = nums[b];
    nums[b] = temp;
}

void permution(int *nums,int numsSize, int *returnSize, int** returnColumnSizes,int** res ,int current) {
    if (current == numsSize-1) {
        *returnSize = *returnSize + 1;
        *returnColumnSizes = (int*)realloc(*returnColumnSizes, *returnSize);
        (*returnColumnSizes)[*returnSize-1] = numsSize;
        
        res = (int**)realloc(res, *returnSize );
        res[*returnSize-1] = malloc(sizeof(int) * numsSize);
        for (int i = 0; i < numsSize; i++) {
            res[*returnSize-1][i] = nums[i];
        }
        
    } else {
        for (int i = current; i < numsSize; i++) {
            mSwap(nums,current, i);
            permution(nums, numsSize, returnSize, returnColumnSizes,res,current+1);
            mSwap(nums,i, current);
        }
    }
}

/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
int** permute(int* nums, int numsSize, int* returnSize, int** returnColumnSizes){
    int **res = malloc(sizeof(int *) * 1);
    *returnColumnSizes = malloc(sizeof(int) * 1);
    permution(nums, numsSize, returnSize, returnColumnSizes, res, 0);
    return res;
}

int main46() {
    @autoreleasepool {
        int nums[3] = {1,2,3};
        int size = 0;
        int* column;
        int** res = permute(nums, 3, &size, &column);
        
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
