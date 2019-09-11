//
//  88.m
//  LeetCode
//
//  Created by qws on 2019/5/9.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

void merge(int* nums1, int nums1Size, int m, int* nums2, int nums2Size, int n){
    if (nums1 == NULL || nums2Size == 0) {
        return;
    }
    int i = nums1Size-1;
    int x = m-1;
    int y = n-1;
    while (i >= 0 && x>=0  && y >= 0) {
        if (nums1[x] <= nums2[y]) {
            nums1[i--] = nums2[y--];
        } else {
            nums1[i--] = nums1[x--];
        }
    }
    
    while (y >= 0) {
        nums1[i--] = nums2[y--];
    }
    
    int k = 0;
    while (k < nums1Size) {
        NSLog(@"%d",nums1[k++]);
    }
}



int main88(int argc, const char * argv[]) {
    @autoreleasepool {
        int a[6] = {1,2,3,0,0,0};
        int b[3] = {2,5,6};
        merge(a, 6, 3, b, 3, 3);
    }
    return 0;
}
