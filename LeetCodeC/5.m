//
//  5.m
//  LeetCode
//
//  Created by qws on 2019/5/6.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

bool judegeIsHuiwen(char *s, int start, int end) {
    int j = end;
    for (int i = start ; i <= end; i++) {
        if (i <= j) {
            if (s[i] == s[j]) {
                j--;
            } else {
                return false;
            }
        } else {
            break;
        }
    }
    return true;
}

char *ret;
char * longestPalindrome(char * s){
    if (s == NULL) {
        return 0;
    }
    
    int len = (int)strlen(s);
    if (len == 1) {
        return s;
    }
    
    int max = 0;
    int start = 0;
    int end = 0;
    for (int i = 0 ; i < len; i++) {
        for (int j = i + 1; j < len; j++) {
            bool isHuiwen = judegeIsHuiwen(s, i, j);
            if (isHuiwen) {
                int len = j - i + 1;
                if (len >= max) {
                    max = len;
                    start = i;
                    end = j;
                }
            }
        }
    }
    
    int count = end-start+1;
    ret = malloc(sizeof(char) * count);
    for (int i = 0; i < count; i++) {
        ret[i] = s[start++];
    }
    return ret;
}

char res[1000];
char * longestPalindrome2(char * s){
    if (s == NULL) {
        return "";
    }
    int n = (int)strlen(s);
    int max = 0;
    int start = 0;
    int end = 0;
    Boolean dp[n][n];
    memset(dp, 0, sizeof(bool));
    for (int i = 0; i < n; i++) {
        for (int j = i; j >= 0; j--) {
            if (s[i] == s[j] && (i-j<2 || dp[i-1][j+1])) {
                dp[i][j] = true;
            }
            if (dp[i][j] && (i-j+1) > max) {
                start = j;
                end = i;
                max = end - start + 1;
            }
        }
    }
    for (int i = 0; i < max; i++) {
        res[i] = s[start++];
    }
    return res;
}


int main5(int argc, const char * argv[]) {
    @autoreleasepool {
        char *ret = longestPalindrome2("babad");
        NSLog(@"%s",ret);
    }
    return 0;
}
