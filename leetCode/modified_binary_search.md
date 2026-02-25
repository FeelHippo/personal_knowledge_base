// Search a target in an ordered list, by dividing the list into half
// then recursively each slice in half

// This approach is quite useful to solve the problems whenever we are given a sorted Array 
// or Linked List or Matrix, and we are asked to find a certain element.

// - pointers: left == 0, right == list.length - 1
// - find pointer to middle: mid = (start + end) ~/ 2
// - if (nums[mid] == target) => return nums[mid]
// - else if (target < nums[mid]) => right = mid - 1 (narrow window)
// - else left = mid + 1

// Time Complexity: O(log N) where N is the total elements in the given array.
// Space Complexity: O(1)