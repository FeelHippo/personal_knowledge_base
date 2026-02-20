// https://medium.com/@timpark0807/leetcode-is-easy-sliding-window-c44c11cc33e1
// we use two pointers (left and right) to create a “window”
// The problem will ask us to return the maximum or minimum subrange that satisfies a given condition

// The Sliding Window boils down to 3 key steps.

// - Expand our window
// - Meet the condition and process the window
// - Contract our window

// SLIDING WINDOW PSEUDOCODE #1

// int slidingWindow(List<int> nums) {
//     # Iterate over elements in our input
//         # Expand the window
//         # Meet the condition to stop expansion
//             # Process the current window   
//             # Contract the window
// }

// What is the condition where we will STOP expanding the window?
// Well, it’s always defined by our problem

// EXAMPLE
// MAX CONSECUTIVE ONES II 
// Given a binary array,
// Find the largest window that has at most one 0 in it.
// Input: [1,0,1,1,0] => | 1, 0, 1, 1 | => | 1, 1, 1, 1 |
// Output: 4

// we need to expand our window until we have seen two 0’s
// CONDITION TO STOP EXPANSION
// count_of_zeroes == 2

// SLIDING WINDOW PSEUDOCODE #2

```dart
int slidingWindow(List<int> nums) {
    int left = 0; 
    int right = 0;
    int count_of_zeroes = 0;
    // Iterate over elements in our input
    while (right < nums.length) {
        // Expand the window

        // Meet the condition to stop expansion
        while (count_of_zeroes == 2) {
            // Process the current window   
            // Contract the window

        }

        right += 1;
    }
}
```

// Before we can expand the window, 
// we need to check if the number at the ‘right’ index is a 0

// SLIDING WINDOW PSEUDOCODE #3

```dart
int slidingWindow(List<int> nums) {
    int left = 0; 
    int right = 0;
    int count_of_zeroes = 0;
    // Iterate over elements in our input
    while (right < nums.length) {
        // Expand the window
        if (nums[right] == 0) {
            count_of_zeroes += 1;
        }

        // Meet the condition to stop expansion
        while (count_of_zeroes == 2) {
            // Process the current window
            // Contract the window
        }

        right += 1;
    }
}
```

// let’s process the current sub array to check if it’s our maximum length we’ve seen so far

// SLIDING WINDOW PSEUDOCODE #4

```dart
int slidingWindow(List<int> nums) {
    int left = 0; 
    int right = 0;
    int count_of_zeroes = 0;
    int max_window_length = 0;
    // Iterate over elements in our input
    while (right < nums.length) {
        // Expand the window
        if (nums[right] == 0) {
            count_of_zeroes += 1;
        }

        // Meet the condition to stop expansion
        while (count_of_zeroes == 2) {
            // Process the current window
            final current_window_length = right - left;
            if (current_window_length > max_window_length) {
                max_window_length = current_window_length;
            }
            // Contract the window

        }

        right += 1;
    }
    return max_window_length;
}
```

// Let’s contract our window by incrementing left in order to get a window with less than two 0's

// SLIDING WINDOW PSEUDOCODE #5

```dart
int slidingWindow(List<int> nums) {
    int left = 0; 
    int right = 0;
    int count_of_zeroes = 0;
    int max_window_length = 0;
    // Iterate over elements in our input
    while (right < nums.length) {
        // Expand the window
        if (nums[right] == 0) {
            count_of_zeroes += 1;
        }

        // Meet the condition to stop expansion
        while (count_of_zeroes == 2) {
            // Process the current window
            final current_window_length = right - left;
            if (current_window_length > max_window_length) {
                max_window_length = current_window_length;
            }
            // Contract the window
            if (nums[left] == 0) {
                count_of_zeroes -= 1;
            }
            left += 1;
        }

        right += 1;
    }
    return max_window_length;
}
```

// As a final step, we need to handle an edge case where the maximum sub array is actually the end of the array
// [1, 0, 0, 1, 1, 1, 1, 1]
//        l                 r
// the while loop doesn't process the current window above because count_of_zeroes never has a chance to equal 2.
// once we exit the while loop, "left" is still pointing to the last encountered "0"
// that sub array might be the optimal solution

// SLIDING WINDOW PSEUDOCODE #6

```dart
int slidingWindow(List<int> nums) {
    int left = 0; 
    int right = 0;
    int count_of_zeroes = 0;
    int max_window_length = 0;
    // Iterate over elements in our input
    while (right < nums.length) {
        // Expand the window
        if (nums[right] == 0) {
            count_of_zeroes += 1;
        }

        // Meet the condition to stop expansion
        // count_of_zeroes == 2 because, the right limit is a zero, 
        // e.g. [0, 1, 0, 1, 0] => window == | 1, 1, 1 |
        //          l        r
        //                                            
        // and the constraint is that we can convert at most a zero into a "1"
        // left will be the "first available 1 after a 0"
        while (count_of_zeroes == 2) {
            // Process the current window
            // e.g., see example here above
            // right == 4
            // left == 1
            // current_window_length == 3
            final current_window_length = right - left;
            if (current_window_length > max_window_length) {
                max_window_length = current_window_length;
            }
            // Contract the window until left == 0. This will open a new window, where left is the 
            // first available "1", and right will be higher than left
            // the condition count_of_zeroes == 2 is false
            if (nums[left] == 0) {
                count_of_zeroes -= 1;
            }
            left += 1;
        }

        right += 1;
    }

    // this fixes the edge case above
    if (count_of_zeroes < 2) {
        // Process the current window
        final current_window_length = right - left;
        if (current_window_length > max_window_length) {
            max_window_length = current_window_length;
        }
    }

    return max_window_length;
}
```

// the thought process is always as follows:

// - Define condition to stop expanding our window => while (count_of_zeroes == 2)
// Expand our window until we meet that condition but before expanding the window, process the element at the ‘right’ index.
// If we meet our condition to stop expanding, process the current window.
// Contract our current window, but before contracting, process the element at the ‘left’ index.
// Process Edge Cases.

// In Leetcode’s Max Consecutive Ones series (I, II, III), 
// you literally just change the condition where we stop expanding the window.

// Max Consecutive Ones I 
// Given a binary array, find the maximum number of consecutive 1s in this array.
// => Stop Expanding when count_of_zeroes == 1
// Input: [1,0,1,1,0] => | 1, 1 | => Output: 2

```dart
int slidingWindow(List<int> nums) {
    int left = 0; 
    int right = 0;
    int count_of_zeroes = 0;
    int max_window_length = 0;
    // Iterate over elements in our input
    while (right < nums.length) {
        // Expand the window
        if (nums[right] == 0) {
            count_of_zeroes += 1;
        }

        // Meet the condition to stop expansion
        while (count_of_zeroes == 1) {
            // Process the current window
            final current_window_length = right - left;
            if (current_window_length > max_window_length) {
                max_window_length = current_window_length;
            }
            // Contract the window
            if (nums[left] == 0) {
                count_of_zeroes -= 1;
            }
            left += 1;
        }

        right += 1;
    }

    // this fixes the edge case above
    if (count_of_zeroes < 2) {
        // Process the current window
        final current_window_length = right - left;
        if (current_window_length > max_window_length) {
            max_window_length = current_window_length;
        }
    }

    return max_window_length;
}
```

// Max Consecutive Ones II
// Given a binary array, find the maximum number of consecutive 1s in this array if you can flip at most one 0.
// Stop Expanding when count_of_zeroes == 2
// SEE IMPLEMENTATION ABOVE

// Max Consecutive Ones III
// Given an array A of 0s and 1s, we may change up to K values from 0 to 1. Return the length of the longest (contiguous) sub array that contains only 1s.
// Stop Expanding when count_of_zeroes > K

```dart
int slidingWindow(List<int> nums, int k) {
    int left = 0; 
    int right = 0;
    int count_of_zeroes = 0;
    int max_window_length = 0;
    // Iterate over elements in our input
    while (right < nums.length) {
        // Expand the window
        if (nums[right] == 0) {
            count_of_zeroes += 1;
        }

        // Meet the condition to stop expansion
        while (count_of_zeroes > k) {
            // Process the current window
            final current_window_length = right - left;
            if (current_window_length > max_window_length) {
                max_window_length = current_window_length;
            }
            // Contract the window
            if (nums[left] == 0) {
                count_of_zeroes -= 1;
            }
            left += 1;
        }

        right += 1;
    }

    // this fixes the edge case above
    if (count_of_zeroes < k) {
        // Process the current window
        final current_window_length = right - left;
        if (current_window_length > max_window_length) {
            max_window_length = current_window_length;
        }
    }

    return max_window_length;
}
```