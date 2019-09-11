//给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。
//
//请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。
//
//你可以假设 nums1 和 nums2 不会同时为空。
//
//示例 1:
//
//nums1 = [1, 3]
//nums2 = [2]
//
//则中位数是 2.0
//示例 2:
//
//nums1 = [1, 2]
//nums2 = [3, 4]
//
//则中位数是 (2 + 3)/2 = 2.5

#import <Foundation/Foundation.h>
double findMedianSortedArrays(int* nums1, int nums1Size, int* nums2, int nums2Size){
    if (nums1Size > nums2Size) {
        int *temp = nums1;
        nums1 = nums2;
        nums2 = temp;
        nums1Size = nums1Size + nums2Size;
        nums2Size = nums1Size - nums2Size;
        nums1Size = nums1Size - nums2Size;
    }
    
    int iMin = 0, iMax = nums1Size, halfLen = (nums1Size + nums2Size + 1)/2.;
    while (iMin <= iMax) {
        int i = (iMin + iMax)/2;
        int j = halfLen - i;
        if (i < iMax && nums2[j-1] > nums1[i]) {
            iMin = i + 1;
        }
        else if (i > iMin && nums1[i-1] > nums2[j]) {
            iMax = i - 1;
        }
        else {
            int maxLeft = 0;
            if (i == 0) {
                maxLeft = nums2[j-1];
            } else if (j == 0 ) {
                maxLeft = nums1[i-1];
            } else {
                maxLeft = MAX(nums1[i-1], nums2[j-1]);
            }
            if ((nums1Size + nums2Size) % 2 == 1) {
                return maxLeft;
            }
            int minRight = 0;
            if (i == nums1Size) {
                minRight = nums2[j];
            } else if (j == nums2Size) {
                minRight = nums1[i];
            } else {
                minRight = MIN(nums2[j], nums1[i]);
            }
            return (maxLeft + minRight) / 2.0;
        }
    }
    
    return 0.;
}

int main4(int argc, const char * argv[]) {
    @autoreleasepool {
        int nums1[] = {1,3};
        int nums2[] = {2};
        double result = findMedianSortedArrays(nums1, 2, nums2, 1);
        NSLog(@"4 = %f",result);
    }
    return 0;
}
