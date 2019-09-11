//
//  8.m
//  LeetCode
//
//  Created by qws on 2019/5/15.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
#define INT_MIN (-2147483648)
#define INT_MAX (2147483647)
int myAtoi(char * str){
    bool b = false;
    int flag = 0;
    int ret = 0;
    for (int i = 0 ; i < strlen(str); i++) {
        char c = str[i];
        if (c == '+' && !b && flag == 0) {
            flag = 1;
        }
        else if (c == '-' && !b && flag == 0) {
            flag = -1;
        }
        else if (c >= 48 && c <= 57) { //数字
            b = true;
            if (flag == -1 || flag == 1) {//有符号
                if (flag == -1 && c == 48) {//-00000
                    continue;
                } else {
                    ret = (c-48)*flag;
                    flag = 0;
                }
            } else {//无符号
                if (ret > 214748364 || (ret == 214748364 && (c - 48) > 7)) { //over max
                    return 2147483647;
                }
                if (ret < -214748364 || (ret == -214748364 && (c-48)>8)) { //over min
                    return -2147483648;
                }
                int f = ret < 0 ? -1 : 1;
                ret = ret * 10 + (c-48) * f;
            }
            
        }
        else if (c == ' ') {
            if (b) {
                return ret;
            } else {
                if (flag != 0) {
                    return ret;
                } else {
                    continue;
                }
            }
        }
        else { //字符
            return ret;
//            if (b) {
//                //stop
//                return ret;
//            } else { //pass
//                flag = 0;
//                continue;
//            }
        }
    }
    return ret;
}
