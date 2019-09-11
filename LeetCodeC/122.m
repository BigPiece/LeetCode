//
//  122.m
//  LeetCode
//
//  Created by qws on 2019/5/9.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int maxProfit2(int* prices, int pricesSize){
    if (pricesSize <= 1) {
        return 0;
    }
    int sum = 0;
    int min = prices[0];
    int max = prices[0];
    int last = prices[0];
    for (int i = 1 ; i < pricesSize; i++) {
        int v = prices[i];
        if (v < last) {
            if (last == max) {
                //最高点
                sum += max - min;
            }
            min = v;
        } else {
            max = v;
            if (i == pricesSize-1) {
                sum += max - min;
            }
        }
        last = v;
    }
    return sum;
}
int main122(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
