//
//  151.m
//  LeetCode
//
//  Created by qws on 2019/5/10.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    int arr[999];
    int minValue;
    int top;
    int count;
} MinStack;

/** initialize your data structure here. */

MinStack* minStackCreate() {
    MinStack *ms = malloc(sizeof(MinStack));
    ms->minValue = 0;
    ms->top = -1;
    ms->count = 0;
    return ms;
}

void minStackPush(MinStack* obj, int x ) {
    if (obj->top == 998 ) { //full
        return;
    }
    obj->top++;
    obj->arr[obj->top] = x;
    obj->count++;
    if (obj->count == 1) {
        obj->minValue = x;
    } else if (x < obj->minValue) {
        obj->minValue = x;
    }
}

void minStackPop(MinStack* obj) {
    if (obj->top == -1) {//enmpty
        return;
    }
    obj->top--;
    obj->count--;
    int idx = obj->top;
    if (idx == -1) {
        obj->minValue = 0;
    } else if (idx == 0) {
        obj->minValue = obj->arr[0];
    } else {
        obj->minValue = obj->arr[obj->top];
        while (idx >= 0 ) {
            if (obj->arr[idx] < obj->minValue) {
                obj->minValue = obj->arr[idx];
            }
            idx--;
        }
    }
}

int minStackTop(MinStack* obj) {
    if (obj->top == -1) {
        return 0;
    }
    return obj->arr[obj->top];
}

int minStackGetMin(MinStack* obj) {
    if (obj->top == -1) {
        return 0;
    }
    return obj->minValue;
}

void minStackFree(MinStack* obj) {
    free(obj);
}

/**
 * Your MinStack struct will be instantiated and called as such:
 * MinStack* obj = minStackCreate();
 * minStackPush(obj, x);
 
 * minStackPop(obj);
 
 * int param_3 = minStackTop(obj);
 
 * int param_4 = minStackGetMin(obj);
 
 * minStackFree(obj);
 */
int main151(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
