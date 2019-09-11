//
//  7.m
//  LeetCode
//
//  Created by qws on 2019/5/7.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
int reverse(int x) {
    if(x == pow(2,31) * -1) return 0;
    
    int flag = x < 0 ? -1 : 1;
    x *= flag;
    
    
    int ret = 0;
    while(x > 0) {
        int last = x % 10;
        if(ret > (pow(2,31)-(flag == 1 ? 1 : 0))/10 ) {
            return 0;
        }
        
        if(ret == (int)(pow(2,31)-(flag == 1 ? 1 : 0))/10  && last > (int)(pow(2,31)-(flag == 1 ? 1 : 0))%10){
            return 0;
        }
        ret = ret * 10 + last;
        x /= 10;
    }
    
    return ret * flag;
    
}


int main7(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
