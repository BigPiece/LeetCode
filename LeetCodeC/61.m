//
//  61.m
//  LeetCode
//
//  Created by qws on 2019/5/28.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>


  struct ListNode {
      int val;
      struct ListNode *next;
  };

struct ListNode* rotateRight(struct ListNode* head, int k){
    if(!head){
        return NULL;
    }
    if (k == 0 || !head->next) {
        return head;
    }
    struct ListNode* first = head;
    struct ListNode* secLast = NULL;
    int count = 0;
    while (head->next) {
        head = head->next;
        count++;
    }
    k = k % count;
    
    for (int i = 0; i < k; i++) {
        while (head->next->next) {
            head = head->next;
            count++;
        }
        secLast = head; //次last
        head = head->next; //last
        secLast->next = NULL;
        head->next = first;
        first = head;
    }
    return first;
}
