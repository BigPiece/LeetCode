//
//  235.m
//  LeetCode
//
//  Created by qws on 2019/5/14.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

  struct TreeNode {
      int val;
      struct TreeNode *left;
      struct TreeNode *right;
  };
struct TreeNode* lowestCommonAncestor(struct TreeNode* root, struct TreeNode* p, struct TreeNode* q) {
    if(root != NULL) {
        if (p->val > root->val && q->val < root->val) {
            return root;
        }
        else if (p->val < root->val && q->val > root->val) {
            return root;
        }
        else if (root->val == p->val || root->val == q->val) {
            return root;
        } else {
            if (p->val > root->val) { //右
                return lowestCommonAncestor(root->right, p, q);
            } else { //左子树
                return lowestCommonAncestor(root->left, p, q);
            }
        }
    }
    return NULL;
}
