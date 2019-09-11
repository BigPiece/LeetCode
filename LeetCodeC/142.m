//
//  142.m
//  LeetCode
//
//  Created by qws on 2019/5/30.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

  struct ListNode {
      int val;
      struct ListNode *next;
  };

struct ListNode *detectCycle(struct ListNode *head) {
    if (!head || !head->next) {
        return NULL;
    }
    struct ListNode* fast = head;
    struct ListNode* slow = head;
    while (fast) {
        if (!fast->next) {
            return NULL;
        }
        fast = fast->next->next;
        if (!fast) {
            return NULL;
        }
        slow = slow->next;
        if (fast == slow) {
            break;
        }
    }
    
    slow = head;
    while (fast == slow) {
        fast = fast->next;
        slow = slow->next;
    }
    return fast;
}
