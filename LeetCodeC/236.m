//
//  236.m
//  LeetCode
//
//  Created by qws on 2019/5/30.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

 
  struct TreeNode {
      int val;
      struct TreeNode *left;
      struct TreeNode *right;
  };

struct TreeNode* lowestCommonAncestor2(struct TreeNode* root, struct TreeNode* p, struct TreeNode* q) {
    if (!root) {
        return NULL;
    }
    if (root == p || root == q) {
        return root;
    }
    
    struct TreeNode* left = lowestCommonAncestor(root->left,p,q);
    struct TreeNode* right = lowestCommonAncestor(root->right,p,q);
    
    if (left && right) {
        return root;
    } else if (left) {
        return left;
    } else if (right) {
        return right;
    }
    
    return NULL;
}
