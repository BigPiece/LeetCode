//
//  121.m
//  LeetCode
//
//  Created by qws on 2019/5/9.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int maxProfit(int* prices, int pricesSize){
    if (pricesSize <= 1) {
        return 0;
    }
    int res = 0;
    int max = prices[0];
    int min = prices[0];
    for (int i = 0 ; i < pricesSize; i++) {
        if (prices[i] < min && i != pricesSize-1) {
            min = prices[i];
            max = prices[i];
        }
        if (prices[i] >= max) {
            max = prices[i];
            if (max - min > res) {
                res = max - min;
            }
        }
    }
    
    return res;
}

int main121(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
