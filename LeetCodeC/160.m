//
//  160.m
//  LeetCode
//
//  Created by qws on 2019/5/10.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>
  struct ListNode {
      int val;
      struct ListNode *next;
  };
struct ListNode *getIntersectionNode(struct ListNode *headA, struct ListNode *headB) {
    if (!headA || !headB) {
        return NULL;
    }
    
    struct ListNode *startA = headA;
    struct ListNode *startB = headB;
    struct ListNode *res = NULL;
    bool find = false;
    
    while (headA) {
        headA = headA->next;
        headB = headB->next;
        if (!headB) {
            headB = startA;
        }
    }
    headA = startB;
    while (headA) {
        if (headA == headB) {
            if (!find) {
                res = headA;
            }
            find = true;
        } else {
            find = false;
            res = NULL;
        }
        headA = headA->next;
        headB = headB->next;
        if (!headB) {
            headB = startA;
        }
    }
    
    return res;
}

int main160(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
