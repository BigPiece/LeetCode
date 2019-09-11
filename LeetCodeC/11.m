//
//  11.m
//  LeetCode
//
//  Created by qws on 2019/5/15.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int maxArea(int* height, int heightSize){
    int i = 0;
    int j = heightSize-1;
    int max = (j-i) * (height[i] < height[j] ? height[i] : height[j]);
    while (i < j) {
        int s = (j-i) * (height[i] < height[j] ? height[i] : height[j]);
        if (s > max) {
            max = s;
        }
        if (height[i] < height[j]) {
            i++;
        } else {
            j--;
        }
    }
    return max;
}


int main11(int argc, const char * argv[]) {
    @autoreleasepool {
    }
    return 0;
}
