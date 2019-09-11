//
//  23.m
//  LeetCode
//
//  Created by qws on 2019/6/4.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>


  struct ListNode {
      int val;
      struct ListNode *next;
  };

struct ListNode* mergeTwoListRecursive(struct ListNode* one, struct ListNode* two) {
    if(!one && !two) {
        return NULL;
    } else if (one && !two) {
        return one;
    } else if (!one && two) {
        return two;
    }
    if (one->val < two->val) {
        one->next = mergeTwoListRecursive(one->next,two);
        return one;
    } else {
        two->next = mergeTwoListRecursive(two->next,one);
        return two;
    }
}

struct ListNode* mergeTwoList3(struct ListNode* one, struct ListNode* two) {
    if(!one && !two) {
        return NULL;
    } else if (one && !two) {
        return one;
    } else if (!one && two) {
        return two;
    }
    struct ListNode* head = NULL;
    struct ListNode* cur = NULL;
    while(one && two) {
        struct ListNode* next;
        if (one->val < two->val){
            next = one;
        } else {
            next = two;
        }
        if(!head) {
            head = next;
        }
        if(!cur) {
            cur = next;
        } else {
            cur->next = next;
            cur = cur->next;
        }
        if(next == one) {
            one = one->next;
        } else {
            two = two->next;
        }
    }
    if(one) {
        cur->next = one;
    }
    if(two) {
        cur->next = two;
    }
    return  head;
}


struct ListNode* mergeKLists(struct ListNode** lists, int listsSize){
    
    if(listsSize == 0) {
        return NULL;
    }
    if(listsSize == 1) {
        return lists[0];
    }
    struct ListNode* res = lists[0];
    for (int i = 1 ; i < listsSize; i++) {
        res = mergeTwoList3(res,lists[i]);
    }
    return res;
}

int main23() {
    @autoreleasepool {
        struct ListNode** lists = malloc(sizeof(struct ListNode*) * 3);
        for (int n = 0; n < 3; n++) {
            struct ListNode* one;
            struct ListNode* cur;
            for (int i = 0 ; i < 3; i++) {
                struct ListNode* a = malloc(sizeof(struct ListNode));
                a->val = i + n;
                a->next = NULL;
                if (one == NULL) {
                    one = a;
                }
                if (cur == NULL) {
                    cur = a;
                } else {
//                    NSLog(@"i=%d n=%d v=%d p=%p",i,n,a->val,a);
                    cur->next = a;
                    cur = cur->next;
                }
            }
            lists[n] = one;
            one = NULL;
            cur = NULL;
            
        }
        struct ListNode* res = mergeKLists(lists,3);
        
        while (res) {
            printf("%d\n",res->val);
            res = res->next;
        }
    }
    return 0;
}
