//
//  16.m
//  LeetCode
//
//  Created by qws on 2019/5/21.
//  Copyright © 2019 qws. All rights reserved.
//

#import <Foundation/Foundation.h>

int myComp(const void* a,const void *b) {
    return *(int*)a - *(int*)b;
}

int threeSumClosest(int* nums, int numsSize, int target){
    int sum = 0;
    if(numsSize < 3) {
        return sum;
    } else if (numsSize == 3) {
        return sum = nums[0] + nums[1] + nums[2];
    } else {
        qsort(nums,numsSize,sizeof(int),myComp);
        for (int i = 0; i < numsSize; i++) {
            NSLog(@"i=%d v= %d",i,nums[i]);
        }
        int minAbs = 2147483647;
        int j,k;
        for(int i = 0; i < numsSize-2; i++) {
            j = i + 1;
            k = numsSize-1;
            while(j < k) {
                int dis = abs(nums[i] + nums[j] + nums[k] - target);
                if (dis == 0) {
                    sum = nums[i] + nums[j] + nums[k];
                    return sum;
                } else {
                    if (j == k-1) {
                        dis = abs(nums[i] + nums[j] + nums[k] - target);
                        if (dis < minAbs) {
                            minAbs = dis;
                            sum = nums[i] + nums[j] + nums[k];
                        }
                        break;
                    }
                    int rNext = abs(nums[i] + nums[j] + nums[k-1] - target);
                    int lNext = abs(nums[i] + nums[j+1] + nums[k] - target);
                    int flag = 0;
                    if(lNext < rNext) {
                        flag = -1;
                    } else {
                        flag = 1;
                    }
                    //找到下一步的最小值
                    if (flag == -1) { //l min
                        j++;
                        if(lNext < minAbs) {
                            minAbs = lNext;
                            sum = nums[i] + nums[j] + nums[k];
                        }
                    }else if(flag == 1) {//r min
                        k--;
                        if(rNext < minAbs) {
                            minAbs = rNext;
                            sum = nums[i] + nums[j] + nums[k];
                        }
                    }
                }
            }//while
        }//for
        return sum;
    }//else
}

int main16() {
    @autoreleasepool {
        int test[] = {13,2,0,-14,-20,19,8,-5,-13,-3,20,15,20,5,13,14,-17,-7,12,-6,0,20,-19,-1,-15,-2,8,-2,-9,13,0,-3,-18,-9,-9,-19,17,-14,-19,-4,-16,2,0,9,5,-7,-4,20,18,9,0,12,-1,10,-17,-11,16,-13,-14,-3,0,2,-18,2,8,20,-15,3,-13,-12,-2,-19,11,11,-10,1,1,-10,-2,12,0,17,-19,-7,8,-19,-17,5,-5,-10,8,0,-12,4,19,2,0,12,14,-9,15,7,0,-16,-5,16,-12,0,2,-16,14,18,12,13,5,0,5,6};
        int count = sizeof(test)/sizeof(int);
        NSLog(@"count=%d",count);
        int ret = threeSumClosest(test,count,-59);
        NSLog(@"%d",ret);
    }
    return 0;
}
