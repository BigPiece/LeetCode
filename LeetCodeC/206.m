//
//  206.m
//  LeetCode
//
//  Created by qws on 2019/5/13.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>


 
  struct ListNode {
      int val;
      struct ListNode *next;
  };


struct ListNode* reverseList(struct ListNode* head){
    if (head == NULL) {
        return NULL;
    }
    if (head->next == NULL) {
        return head;
    }
    struct ListNode *temp = head;
    struct ListNode *pre = head;
    head = head->next;
    pre->next = NULL;
    
    while(head) {
        temp = head->next;
        if (temp) {
            head->next = pre;
            pre = head;
            head = temp;
        } else {
            head->next = pre;
            return head;
        }
    }
    return head;
}

int main206(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
