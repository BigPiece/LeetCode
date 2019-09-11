//
//  43.m
//  LeetCode
//
//  Created by qws on 2019/5/23.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
char cWithc(char c1,char c2,int *jw,bool add) {
    int i1 = c1 - 48;
    int i2 = c2 - 48;
    
    int ret = add ? (i1+i2) : (i1 * i2);
    ret += *jw;
    
    *jw = ret / 10;
    
    return (char)(ret % 10 + 48);
}

char cMulc(char c1,char c2,int *jw) {
    return cWithc(c1, c2, jw, false);
}

char cAddc(char c1,char c2,int *jw) {
    return cWithc(c1, c2, jw, true);
}

void cMuls(char c,char *s,int sLen,int zeroCount,char **res){ //s正序
    int jw = 0;
    int idx = sLen-1;
    int resCount = 0;
    
    //先添加几个尾数0
    while (zeroCount > 0) {
        (*res)[resCount] = '0';
        resCount++;
        zeroCount--;
    }
    
    //逐位乘，尾数逆序存入结果，进位值保存
    while (idx >= 0) {
        char c2 = s[idx];
        char last = cMulc(c, c2, &jw);
        (*res)[resCount] = last; //此时为逆序
        resCount++;
        idx--;
    }
    
    //最高位的进位变为char加进去，此时依旧逆序
    if (jw != 0) {
        (*res)[resCount] = (char)(jw + 48);
        resCount++;
    }
    
    //标记结束
    (*res)[resCount] = '\0';
}

//s1存结果，长度够，逆序
void sAdds(char **s1,char *s2){
    int jw = 0;
    int l1 = (int)strlen(*s1);
    int l2 = (int)strlen(s2);
    int max = l1 > l2 ? l1 : l2;
    char c1,c2;
    for (int i = 0 ; i < max; i++) {
        if (i >= l1) {
            c1 = '0';
        } else {
            c1 = (*s1)[i];
        }
        if (i >= l2) {
            c2 = '0';
        } else {
            c2 = s2[i];
        }
        
        char last = cAddc(c1, c2, &jw);
        (*s1)[i] = last;
    }
    if (jw != 0) {
        (*s1)[max] = jw + 48;
        max++;
    }
    (*s1)[max] = '\0';
}

char * multiply(char * num1, char * num2){
    int l1 = (int)strlen(num1);
    int l2 = (int)strlen(num2);
    
    char *res = malloc(sizeof(char) * (l1+l2)+1);
    char *s2  = malloc(sizeof(char) * (l1+l2)+1);
    
    for (int k = l2 - 1; k >=0 ; k--) {
        char c2 = num2[k];
        cMuls(c2, num1, l1, (l2 - k - 1), &s2);
        sAdds(&res, s2);
    }
    
    //改为正序
    int i = 0;
    int j = (int)strlen(res) - 1;
    while (i < j ) {
        char t = res[i];
        res[i] = res[j];
        res[j] = t;
        i++;j--;
    }
    
    free(s2);
    return res;
}


void printS(char *s) {
    printf("---------------\nret = ");
    int idx = 0;
    while (s[idx] != '\0') {
        printf("%c",s[idx]);
        idx++;
    }
    printf("\n---------------\n");
}

int main43() {
    @autoreleasepool {
        int cnt1 = 4;
        int cnt2 = 3;
        char *n1 = malloc(sizeof(char) * cnt1+1);
        for (int i = 0; i < cnt1; i++) {
            n1[i]= arc4random() % 8 + 1 + 48;
        }
        n1[cnt1] = '\0';
        char *n2 = malloc(sizeof(char) * cnt2+1);
        for (int i = 0; i < cnt2; i++) {
            n2[i] = arc4random() % 8 + 1 + 48;
        }
        n2[cnt2] = '\0';
        NSLog(@"n1 = %s n2 = %s",n1,n2);
        
        char *res = multiply(n1, n2);
        printS(res);
        free(res);
        free(n1);
        free(n2);
    }
    return 0;
}


