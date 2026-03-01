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

  // https://leetcode.com/problems/palindrome-number
  bool isPalindrome(int x) {
    return x.toString() == reverse(x.toString().split(''));
  }

  String reverse(List<String> y) {
    String reversed = '';
    for (String char in y) {
      reversed = char + reversed;
    }
    return reversed;
  }

  // https://leetcode.com/problems/max-consecutive-ones
  int findMaxConsecutiveOnes(List<int> nums) {
    int left = 0;
    int right = 0;
    bool isRightZero = false;
    int maxConsecutiveOnes = 0;
    while (right < nums.length) {
      if (nums[right] == 0) {
        isRightZero = true;
      }
      while (isRightZero) {
        final int currentConsecutiveOnes = right - left;
        if (currentConsecutiveOnes > maxConsecutiveOnes)
          maxConsecutiveOnes = currentConsecutiveOnes;

        if (nums[left] == 0) isRightZero = false;
        left += 1;
      }
      right += 1;
    }
    // edge cases
    if (isRightZero == false) {
      final int currentConsecutiveOnes = right - left;
      if (currentConsecutiveOnes > maxConsecutiveOnes)
        maxConsecutiveOnes = currentConsecutiveOnes;
    }
    return maxConsecutiveOnes;
  }

  // https://leetcode.com/problems/subsets
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> subsets = [[]];
    for (int num in nums) {
      final int limit = subsets.length;
      for (int i = 0; i < limit; i++) {
        subsets.add([...subsets[i], num]);
      }
    }
    return subsets;
  }

  // https://algo.monster/liteproblems/704
  int search(List<int> nums, int target) {
    int index = -1;
    int left = 0;
    int right = nums.length - 1;
    // The key idea is to repeatedly divide the search space in half
    while (left <= right) {
      // find the middle point between left and right
      final int midPointer = (left + right) ~/ 2;
      // At each step, we look at the middle element and ask:
      // "Is our target in the left half or the right half?"
      // Instead of having three cases (found, go left, go right),
      // it uses a two-way decision:
      if (nums[midPointer] >= target) {
        // left side
        // This approach guarantees that if the target exists,
        // it will eventually be at position l when the loop terminates (when l equals r)
        index = midPointer;
        // we're essentially finding the leftmost position where nums[pos] >= target
        right = midPointer - 1;
      } else {
        // right side
        left = midPointer + 1;
      }
    }
    if (index != -1 && nums[index] == target) return index;
    return -1;
  }
}
