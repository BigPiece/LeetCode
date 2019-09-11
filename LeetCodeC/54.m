//
//  54.m
//  LeetCode
//
//  Created by qws on 2019/5/27.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
enum direction {
    right = 1,
    down,
    left,
    up
};

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* spiralOrder(int** matrix, int matrixSize, int* matrixColSize, int* returnSize){
    if(matrixSize < 1 || matrixColSize[0] < 1) {
        *returnSize = 0;
        return NULL;
    }
    int* res = calloc(1,sizeof(int));
    int count = 0;
    int i=0,j=0;
    int circle = 0;
    int direction = right; //1 右 2 下 3 左 4 上
    
    while(count < matrixSize * matrixColSize[0]) {
        int col = matrixColSize[i];
        switch(direction) {
            case right:
                while(j < col - circle) {
                    count++;
                    res = realloc(res, count * sizeof(int));
                    res[count-1] = matrix[i][j];
                    j++;
                }
                //转换
                direction = down;
                j--;
                i++;
                break;
            case down:
                while(i < matrixSize - circle) {
                    count++;
                    res = realloc(res, count * sizeof(int));
                    res[count-1] = matrix[i][j];
                    i++;
                }
                //转换
                direction = left;
                i--;
                j--;
                break;
            case left:
                while(j >= circle) {
                    count++;
                    res = realloc(res, count * sizeof(int));
                    res[count-1] = matrix[i][j];
                    j--;
                }
                //转换
                direction = up;
                j++;
                i--;
                break;
            case up:
                while(i > circle) {
                    count++;
                    res = realloc(res, count * sizeof(int));
                    res[count-1] = matrix[i][j];
                    i--;
                }
                //转换
                direction = right;
                i++;
                j++;
                circle++;
                break;
            default:
                break;
        }
    }
    *returnSize = count;
    return res;
}



int main54(){
    @autoreleasepool {
        int** nums = (int **)malloc(sizeof(int *) * 3);
        for (int i = 0; i < 3; i++) {
            nums[i]= malloc(sizeof(int) * 4);
            for (int j = 0; j < 4; j++) {
                nums[i][j] = i * 10 + j;
            }
        }
//        int nums[3][3] = {
//            {1,2,3},
//            {4,5,6},
//            {7,8,9}
//        };
        int cols[3] = {4,4,4};
        int size;
        int *res = spiralOrder(nums,3,cols,&size);
        printf("\n");
        for (int i = 0; i < size; i++) {
            printf("%d ",res[i]);
        }
        printf("\n");
    }
    return 0;
}
