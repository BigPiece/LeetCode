//
//  33.m
//  LeetCode
//
//  Created by qws on 2019/5/23.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int binarySearch(int *nums,int target,int left,int right) {
    while (left <= right) {
        int mid = (left + right)/2;
        if (target == nums[mid]) {
            return mid;
        } else if (target < nums[mid]){
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }
    return -1;
}

int rotateSearch(int *nums,int target,int left,int right) {
    while (left <= right) {
        int mid = (left + right)/2;
        if (target == nums[mid]) {
            return mid;
        }
        if (target == nums[right]) {
            return right;
        }
        if (target == nums[left]) {
            return left;
        }
        
        if (nums[right] > nums[left]) { //没有旋转
            return binarySearch(nums,target,left,right);
        }
        
        if (target < nums[right]) {
            if (target > nums[mid]) {
                left = mid + 1; //不包含旋转点
            } else { //包含旋转点
                if (nums[mid] > nums[left]) { //mid在target 左边
                    left = mid + 1;
                } else { //mid 在 target 右边
                    right = mid - 1;
                }
            }
        } else {
            if (target < nums[mid]) { //不包含旋转点
                right = mid - 1;
            } else {//包含旋转
                if (nums[mid] > nums[left]) {
                    left = mid + 1;
                } else {
                    right = mid - 1;
                }
            }
        }
    }
    return -1;
}

int search(int* nums, int numsSize, int target){
    return rotateSearch(nums,target,0,numsSize-1);
}

int main33() {
    @autoreleasepool {
        int n[]  = {1,2,3,4,5};
        int n1[] = {0,1,2,3,4,5,6};
        int bRes = binarySearch(n1,6,0,6);

        int ret =search(n,5,2);
        
        NSLog(@"ret = %d bres = %d",ret,bRes);
        
    }
    return 0;
}
        
