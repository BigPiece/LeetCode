//
//  70.m
//  LeetCode
//
//  Created by qws on 2019/5/9.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

//int climbStairs(int n){
//    if (n <= 0) {
//        return 0;
//    } else if (n == 1) {
//        return 1;
//    } else if (n==2){
//        return 2;
//    }
//    return climbStairs(n-1) + climbStairs(n-2);
//
//}

int climbStairs(int n){
    if (n == 0) {
        return 0;
    }
    if (n == 1) {
        return 1;
    }
    if (n == 2) {
        return 2;
    }
    int pre1 = 2; //n==2;
    int pre2 = 1; //n==1;
    for (int i = 3; i <= n ; i++) {
        int temp = pre1;
        pre1 = pre1 + pre2;
        pre2 = temp;
    }
    return pre1;
}

int main70(int argc, const char * argv[]) {
    @autoreleasepool {
        int res = climbStairs(44);
        printf("res = %d",res);
    }
    return 0;
}
