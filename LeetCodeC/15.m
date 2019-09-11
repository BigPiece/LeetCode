//
//  15.m
//  LeetCode
//
//  Created by qws on 2019/5/15.
//  Copyright © 2019 qws. All rights returnColumnSizeserved.
//

#import <Foundation/Foundation.h>

void quickSort(int *nums,int left, int right) {
    if (left < right) {
        int i = left;
        int j = right;
        int temp = nums[i];
        while(i < j) {
            while (i < j && nums[j] >= temp) { //右边找第一个小于temp的数
                j--;
            }
            if (i < j) {
                nums[i++] = nums[j];
            }
            while (i < j && nums[i] <= temp) { //左边找第一个大于temp的数
                i++;
            }
            if (i < j) {
                nums[j--] = nums[i];
            }
        }
        nums[i] = temp; //i==j;
        
        //recursive left
        quickSort(nums, left, i-1);
        //recursive right
        quickSort(nums, i+1, right);
    }
}

/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
int** threeSum(int* nums, int numsSize, int* returnSize, int** returnColumnSizes){
    *returnSize = 0;
    int **res =(int**)malloc(sizeof(int*) * (numsSize * (numsSize-1) * (numsSize-2))/6);
    if (numsSize < 3) {
        return res;
    }
    quickSort(nums, 0,numsSize-1); //快速排序
    
    for (int i = 0 ; i < numsSize-2; i++) {
        int fir = nums[i];
        if (i > 0 && fir == nums[i-1]) {
            continue;
        }
        if (fir > 0) {
            int* ret = (int*)malloc(sizeof(int)* (*returnSize));
            for(int i = 0; i < *returnSize; i++) {ret[i] = 3;}
            *returnColumnSizes = ret;
            return res;
        }
        if (fir == 0 && i < numsSize) {
            if (nums[i+2] == 0) {
                res[*returnSize] = (int*)malloc(sizeof(int) * 3);
                res[*returnSize][0] = 0;
                res[*returnSize][1] = 0;
                res[*returnSize][2] = 0;
                *returnSize = *returnSize + 1;
                int* ret = (int*)malloc(sizeof(int)* (*returnSize));
                for(int i = 0; i < *returnSize; i++) {ret[i] = 3;}
                *returnColumnSizes = ret;
                return res;
            } else {
                if (*returnSize == 0) {
                    return res;
                } else {
                    int* ret = (int*)malloc(sizeof(int)* (*returnSize));
                    for(int i = 0; i < *returnSize; i++) {ret[i] = 3;}
                    *returnColumnSizes = ret;
                    return res;
                }
            }
        }
        int k = numsSize-1;
        int j = i+1;
        while (j < k && nums[k] > 0) {
            int sec = nums[j];
            int thr = nums[k];
            if (sec + thr < -fir ) { //小了
                j++;
            } else if (sec + thr > -fir) {
                k--;
            } else { //相等
                res[*returnSize] = malloc(sizeof(int) * 3);
                res[*returnSize][0] = fir;
                res[*returnSize][1] = sec;
                res[*returnSize][2] = thr;
                *returnSize = *returnSize + 1;
                j++;
                k--;
            }
        }
    }
    
    int* ret = (int*)malloc(sizeof(int)* (*returnSize));
    for(int i = 0; i < *returnSize; i++) {
        ret[i] = 3;
    }
    *returnColumnSizes = ret;
    
    return res;
}



int main15(int argc, const char * argv[]) {
    @autoreleasepool {
        int nums[6] = {-1,0,1};
        int retrunSize = 0;
        int* returnColumnSizes;
        int** res = threeSum(nums, 6, &retrunSize, &returnColumnSizes);
        
        for(int i = 0; i < retrunSize; i++) {
            printf("\n");
            for (int j = 0; j < 3; j++) {
                printf("%d ",res[i][j]);
            }
        }
        printf("\n\n");
        free(res);
        free(returnColumnSizes);
    }
    return 0;
}

