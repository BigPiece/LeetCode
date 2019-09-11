//
//  217.m
//  LeetCode
//
//  Created by qws on 2019/5/13.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct HashNode{
    int key;
    struct HashNode* next;
} HashNode;
HashNode* createNode(int key){
    HashNode* node = calloc(1,sizeof(HashNode));
    node->key = key;
    node->next = NULL;
    return node;
}

bool equal(int key, HashNode* node){
    return node->key == key;
}
int hashCode(int size, int key) {
    return abs(key) % size;
}
typedef struct {
    HashNode** list;
    int size;
    bool (*equal)(int key, HashNode* node);
    int (*hashCode)(int size,int key);
} HashList;


void relealseNode(HashNode* node){
    node->next = NULL;
    free(node);
}
void relealseList(HashList* list) {
    for(int i = 0; i < list->size ; i++) {
        HashNode* node = list->list[i];
        if(node) {
            while(node) {
                HashNode* temp = node;
                node = node->next;
                relealseNode(temp);
            }
            list->list[i] = NULL;
        }
    }
    list->equal = NULL;
    list->hashCode = NULL;
    free(list);
}

bool containsDuplicate(int* nums, int numsSize){
    HashList* hl = calloc(1,sizeof(HashList));
    hl->size = numsSize;
    hl->list = calloc(numsSize,sizeof(HashNode*));
    hl->equal = equal;
    hl->hashCode = hashCode;
    
    for(int i = 0; i < numsSize; i++){
        HashNode* node = createNode(nums[i]);
        int idx = (*hl->hashCode)(hl->size,nums[i]);
        if(hl->list[idx] == NULL) {
            hl->list[idx] = node;
        } else {
            HashNode* hash_t = hl->list[idx];
            while(hash_t){
                if(hash_t->key == nums[i]) {
                    relealseList(hl);
                    return true;
                } else {
                    if(!hash_t->next) {
                        hash_t->next = node;
                        break;
                    } else {
                        hash_t = hash_t->next;
                    }
                }
            }
        }
    }
    
    relealseList(hl);
    return false;
}

int main217(int argc, const char * argv[]) {
    @autoreleasepool {
        int nums[6] = {0,4,5,1,3,6};
        BOOL res = containsDuplicate(nums, 6);
        NSLog(@"res = %d",res);
    }
    return 0;
}





