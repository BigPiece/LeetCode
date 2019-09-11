//
//  148.m
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

struct ListNode* mergeSort(struct ListNode* one,struct ListNode* two){
    if (one == NULL) {
        return two;
    }
    if (two == NULL) {
        return one;
    }
    if (one->val < two->val) {
        one->next = mergeSort(one->next, two);
        return one;
    } else {
        two->next = mergeSort(two->next, one);
        return two;
    }
}

struct ListNode* sortList(struct ListNode* head){
    if (!head || !head->next) {
        return head;
    }
    struct ListNode* fast = head;
    struct ListNode* slow = head;
    struct ListNode* brek = head;
    while (fast && fast->next) {
        fast = fast->next->next;
        brek = slow;
        slow = slow->next;
    }
    brek->next = NULL;
    //slow 为中点
    return mergeSort(head, slow);
}






