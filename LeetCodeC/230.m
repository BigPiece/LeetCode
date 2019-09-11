//
//  230.m
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


void inTravelTree(struct TreeNode* tree ,int* idx, int* ret,int k) {
    if (tree == NULL) {
        return;
    }
    
    inTravelTree(tree->left,idx,ret,k);
    if (idx==k) {
        *ret = tree->val;
        return;
    }
    *idx++;
    inTravelTree(tree->right,idx,ret,k);
}

int kthSmallest(struct TreeNode* root, int k){
    if (!root) return 0;
    if (!root->left && !root->right) {
        return root->val;
    }
    //中序遍历二叉树
    int idx = 1;
    int ret = 0;
    
    inTravelTree(root,&idx,&ret,k);
    return ret;
}


