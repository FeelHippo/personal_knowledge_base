class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  // https://leetcode.com/problems/two-sum
  List<int> twoSum(List<int> nums, int target) {
    // left pointer
    for (var left = 0; left < nums.length; left++) {
      // right pointer will traverse in the opposite direction
      // left and right cannot cross, because by the time right == left + 1
      // all elements have been compared
      for (var right = nums.length - 1; right > left; right--) {
        if (nums[left] + nums[right] == target) {
          return [left, right];
        }
      }
    }
    return [];
  }

  // https://leetcode.com/problems/add-two-numbers
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode? resultHead = null;
    bool carry = false;
    // lists might be of different length
    while (l1 != null || l2 != null) {
      // sum of val's. Default to 0 if node == null
      int sum = (l1?.val ?? 0) + (l2?.val ?? 0);
      // increment sum if carry == true
      if (carry) sum++;
      // prepare carry for next iteration
      carry = sum >= 10;
      final ListNode nextSum = ListNode(carry ? sum - 10 : sum);
      // first iteration
      if (resultHead == null) {
        resultHead = nextSum;
        // subsequent iteration
      } else {
        ListNode? temp = resultHead;
        // traverse entire head to find last node
        while (temp?.next != null) {
          temp = temp?.next;
        }
        // add new node to last node
        temp?.next = nextSum;
      }
      // continue iteration
      l1 = l1?.next;
      l2 = l2?.next;
    }
    // edge case where carry == true once all elements were traversed
    if (carry) {
      ListNode? temp = resultHead;
      while (temp?.next != null) {
        temp = temp?.next;
      }
      temp?.next = ListNode(1);
    }
    return resultHead;
  }

  // https://leetcode.com/problems/longest-substring-without-repeating-characters
  int lengthOfLongestSubstring(String s) {
    if (s.length == 1) return 1;
    List<String> chars = s.split('');
    final int leftToRight = traverseAndCount(chars);
    final int rightToLeft = traverseAndCount(chars.reversed.toList());
    return leftToRight > rightToLeft ? leftToRight : rightToLeft;
  }

  int traverseAndCount(List<String> chars) {
    int left = 0;
    int right = 0;
    int max_window_length = 0;
    // Iterate over elements in our input
    while (right < chars.length) {
      // Expand the window
      // we need to expand our window until there is a duplicate character in the sublist
      if (chars.sublist(left, right).contains(chars[right])) {
        int counter = left;
        while (counter < right) {
          // Process the current window
          final current_window_length = right - counter;
          if (current_window_length > max_window_length) {
            max_window_length = current_window_length;
          }
          // Contract the window
          counter += 1;
        }
        left = counter;
      }
      right += 1;
    }
    // edge cases
    if (left == 0 && right == chars.length) return chars.length;
    // take it from here, missing edge cases
    return max_window_length;
  }
}
