//
//  59.m
//  LeetCode
//
//  Created by qws on 2019/5/28.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * Return an array of arrays of size *returnSize.
 * The sizes of the arrays are returned as *returnColumnSizes array.
 * Note: Both returned array and *columnSizes array must be malloced, assume caller calls free().
 */
int** generateMatrix(int n, int* returnSize, int** returnColumnSizes){
    //init
    int** res = (int **)calloc(n,sizeof(int*));
    int* colSizes = (int*)calloc(n,sizeof(int));
    for (int i = 0; i < n; i++) {
        res[i] = (int*)calloc(n,sizeof(int));
    }
    //begin
    int idx = 1;
    int count = n * n;
    int r=0;
    int b=0;
    int l=0;
    int t=0;
    while (idx <= count) {
        for (int i = l; i < n - r; i++) {
            res[t][i] = idx;
            idx++;
        }
        t++;
        
        for (int i = t; i < n - b; i++) {
            res[i][n-1-r] = idx;
            idx++;
        }
        r++;
        
        for (int i = n - 1 - r; i >= l; i--) {
            res[n-1-b][i] = idx;
            idx++;
        }
        b++;
        
        for (int i = n - 1 - b; i >= t; i--) {
            res[i][l] = idx;
            idx++;
        }
        l++;
    }
    //end
    for (int i = 0; i < n; i++) {
        colSizes[i] = n;
    }
    *returnSize = n;
    *returnColumnSizes = colSizes;

    return res;
}

int main59() {
    @autoreleasepool {
        int rSize;
        int* colSize;
        int** res = generateMatrix(4,&rSize,&colSize);
        printf("\n");
        for (int i = 0; i < rSize; i++) {
            int col = colSize[i];
            for (int j = 0 ; j < col; j++) {
                printf("%d ",res[i][j]);
            }
            printf("\n");
        }
        printf("\n");
    }
    return 0;
}
