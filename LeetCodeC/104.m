//
//  104.m
//  LeetCode
//
//  Created by qws on 2019/5/9.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

int maxDepth(struct TreeNode* root){
    if (!root) {
        return 0;
    }
    int left = maxDepth(root->left);
    int right = maxDepth(root->right);
    
    return (left > right ? left : right) + 1;
}

int main104(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
