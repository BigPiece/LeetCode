//
//  38.m
//  LeetCode
//
//  Created by qws on 2019/6/21.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

char * countAndSay(int n){
    char *res = calloc(1,sizeof(char));
    res[0] = '1';
    for(int i = 1; i < n; i++) {
        int idx = 1;
        int size = 0;
        char temp = res[0];
        int count = 1;
        char *str = calloc(strlen(res),sizeof(char));
        memcpy(str,res,strlen(res));
        while(str[idx]) {
            char c = str[idx];
            if(c == temp) {
                count++;
            } else {
                res = realloc(res,size+2);
                res[size] = count + 48;
                res[size+1] = temp;
                size+=2;
                count = 1;
                temp = c;
            }
            idx++;
        }
        free(str);
        res = realloc(res,size+2);
        res[size] = count + 48;
        res[size+1] = temp;
        size+=2;
    }
    return res;
}

int main38() {
    @autoreleasepool {
        char * res = countAndSay(6);
        printf("res = %s\n",res);
    }
    return 0;
}
