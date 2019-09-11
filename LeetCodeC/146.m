//
//  146.m
//  LeetCode
//
//  Created by qws on 2019/6/4.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    int key;
    int value;
} DataModel;

typedef struct HashNode {
    DataModel data;
    struct HashNode* up;
    struct HashNode* down;
    struct HashNode* left;
    struct HashNode* right;
} HashNode;

typedef struct LRUCache{
    int capacity;//缓存容量
    int count;//当前拥有节点数量
    int size; //nodes 数组长度 2的幂
    float factor; //哈希表 装填因子 取0.75
    HashNode** nodes;
    struct HashNode* head; //头 最少使用 删除
    struct HashNode* rear; //尾 最近使用 保留
    int (*hashCode)(int key, int arrCount);
    bool (*equal)(int key,HashNode *node2);
} LRUCache;

int hashCode(int key, int arrCount) {
    return key & (arrCount - 1);
}

bool equal(int key, HashNode *node2) {
    return key == node2->data.key;
}

int getNumBy2Exponent(int value) {
    int res = 1;
    while (res < value) {
        res *= 2;
    }
    return res;
}

HashNode* creatNode(int key,int value) {
    DataModel data = {key,value};
    HashNode* node = calloc(1, sizeof(HashNode));
    node->data = data;
    node->up = NULL;
    node->down = NULL;
    node->left = NULL;
    node->right = NULL;
    return node;
}

LRUCache* lRUCacheCreate(int capacity) {
    if(capacity < 1) {
        return NULL;
    }
    LRUCache* cache = malloc(sizeof(LRUCache));
    cache->nodes = (HashNode**)calloc(2 * capacity,sizeof(HashNode*));
    cache->head = NULL;
    cache->rear = NULL;
    cache->capacity = capacity;
    cache->count = 0;
    cache->factor = 0.75;
    cache->size = 2 * capacity;
        // getNumBy2Exponent((int)ceil(((float)capacity) / cache->factor)); //容量/装填因子（扩大），再向上取最接近2的幂值
    cache->equal = equal;
    cache->hashCode = hashCode;
    return cache;
}

//添加到最后
void addNodeAtLast(HashNode *node,LRUCache* obj){
    if (!obj || !node) {
        return;
    }
    if (!obj->rear) {
        obj->head = node;
        obj->rear = node;
    } else {
        //node 左边的指针线
        node->left = obj->rear;
        obj->rear->right = node;
        //node 右边的指针线
        node->right = NULL;
        //移动rear指针
        obj->rear = node;
    }
}

//分离一个node
HashNode* splitNode(LRUCache* obj,HashNode *target) {
    if (!obj || !obj->head || !target) {
        return NULL;
    }
    if (obj->head == obj->rear) {
        //只有一个 直接return;
        obj->head = NULL;
        obj->rear = NULL;
        return target;
    } else {
        if (target == obj->head) { //target是头指针
            HashNode *right = target->right;
            //右边的左指针置空
            right->left = NULL;
            //移动头指针到下一个
            obj->head = right;
            //目标右指针置空
            target->right = NULL;//旧的head右指针断掉
            //保险起见，左指针也置空
            target->left = NULL;
            return target;
        } else if (target == obj->rear) {
            //target是尾指针则不用分离直接返回
            obj->rear = target->left;
            target->left = NULL;
            target->right = NULL;
            return target;
        } else {
            //target是中间的指针
            HashNode *left = target->left;
            HashNode *right = target->right;
            left->right = right;
            right->left = left;
            target->left = NULL;
            target->right = NULL;
            return target;
        }
    }
}

//分离一个上下链表中的node,只处理指针
HashNode* splitUpDownNode(LRUCache* obj,HashNode *target) {
    if (!obj || !target) {
        return NULL;
    }
    
    int idx = (*obj->hashCode)(target->data.key,obj->size);

    if (target->up == NULL && target->down == NULL) {//只有一个
        obj->nodes[idx] = NULL;
    } else if (target->up == NULL) {//第一个
        target->down->up = NULL;
        obj->nodes[idx] = target->down;
        target->down = NULL;
    } else if (target->down == NULL) { //最后一个
        target->up->down = NULL;
        target->up = NULL;
    } else {//中间的
        HashNode* up = target->up;
        HashNode* down = target->down;
        up->down = down;
        down->up = up;
        target->up = NULL;
        target->down = NULL;
    }
    return target;
}

int lRUCacheGet(LRUCache* obj, int key) {

    if (!obj || obj->capacity == 0 || obj->count == 0) {
        return -1;
    }
    int index = (*obj->hashCode)(key, obj->size);
    
    if (obj->nodes[index] != NULL) {//有
        HashNode *top = obj->nodes[index];
        while (top) {
            if (top->data.key == key) {//找到了
                //1.现在左右链中分离
                splitNode(obj, top);
                //2.插入到左右链中最后
                addNodeAtLast(top, obj);
                
                return top->data.value;
            }
            top = top->down;
        }
        return -1;
    } else {//没key
        return -1;
    }
}

void lRUCachePut(LRUCache* obj, int key, int value) {
    int index = (*obj->hashCode)(key, obj->size);
    
    if (obj->nodes[index] != NULL) {//冲突
        HashNode *first = obj->nodes[index];
        HashNode *last = NULL;
        while (first) {
            if ((*obj->equal)(key,first)) {//有相同的key
                first->data.value = value; //赋值
                if (first != obj->rear) {//如果不是最后一个
                    first = splitNode(obj, first); //分离
                    addNodeAtLast(first, obj); //插入最后
                }
                // qLogNodes(obj);
                return;
            }
            if (!first->down) {
                last = first;
            }
            first = first->down;
        }
        
        //没有相同的key
        if (obj->count == obj->capacity) {//满了
            //1.先把左右链表第一个node在左右和上下链表中 分离出来
            HashNode *split = splitUpDownNode(obj, splitNode(obj, obj->head));
            //2.刷新数据
            split->data.key = key;
            split->data.value = value;
            //3.添加到左右尾部
            addNodeAtLast(split, obj);
            //4.添加到last下面
            last->down = split;
            split->up = last;
        } else { //缓存未满,创建一个
            HashNode *node = creatNode(key, value);
            //左右最后
            addNodeAtLast(node, obj);
            //上下最后
            last->down = node;
            node->up = last;
           
            (obj->count)++;
        }
        
    } else {//没冲突
        if (obj->count == obj->capacity) {//满了
            //1.先把左右链表第一个node在左右和上下链表中 分离出来
            HashNode *first = splitUpDownNode(obj, splitNode(obj, obj->head));
            //2.刷新数据
            first->data.key = key;
            first->data.value = value;
            //3.添加到左右尾部
            addNodeAtLast(first, obj);
            //4.添加到数组中新的位置
            obj->nodes[index] = first;
        } else { //没满
            //创建一个新的node
            HashNode* node = creatNode(key, value);
            //添加到链表中
            obj->nodes[index] = node;
            addNodeAtLast(node, obj);
            //数量增加
            (obj->count)++;
        }
    }
    // qLogNodes(obj);
}

void lRUCacheFree(LRUCache* obj) {
    if (obj->rear == obj->head) {
        free(obj->rear);
    } else {
        HashNode *first = obj->head;
        HashNode *next = first->right;
        while (first) {
            first->up = NULL;
            first->down = NULL;
            first->left = NULL;
            first->right = NULL;
            free(first);
            first = next;
            if (next) {
                next = next->right;
            }
        }
    }
    obj->head = NULL;
    obj->rear = NULL;
    memset(obj->nodes, 0, obj->size);
    free(obj->nodes);
    free(obj);
}
/**
 * Your LRUCache struct will be instantiated and called as such:
 * LRUCache* obj = lRUCacheCreate(capacity);
 * int param_1 = lRUCacheGet(obj, key);
 
 * lRUCachePut(obj, key, value);
 
 * lRUCacheFree(obj);
*/
