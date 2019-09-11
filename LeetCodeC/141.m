//
//  141.m
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

bool hasCycle(struct ListNode *head) {
    if (!head || !head->next) {
        return false;
    }
    struct ListNode *fast = head->next->next;
    struct ListNode *slow = head->next;
    while (slow && fast) {
        slow = slow->next;
        if (fast->next && slow) {
            fast = fast->next->next;
        } else {
            return false;
        }
        if (fast == slow) {
            return true;
        }
    }
    return false;
}
int main141(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
