void main() {
  String reverseString(String example) {
    var reversedString = '';
    var splitString = example.split('');
    while (splitString.isNotEmpty) {
      reversedString = splitString.removeAt(0) + reversedString;
    }
    return reversedString;
  }
  print(reverseString('example to demonstrate reversing of string'));
  bool isPalindrome(String example) {
    return example == reverseString(example);
  }
  print(isPalindrome('abcdefedcba'));
  String fizzBuzz(int challenge) {
    if (((challenge % 3) + (challenge % 5)) == 0) {
      return 'FizzBuzz';
    } else if ((challenge % 3) == 0) {
      return 'Fizz';
    } else if ((challenge % 5) == 0) {
      return 'Buzz';
    }
    return challenge.toString();
  }
  print(fizzBuzz(15));
  print(fizzBuzz(9));
  print(fizzBuzz(10));
  print(fizzBuzz(11));
  List<int> bubbleOrderAscending(List<int> array) {
    for (var i = 0; i < array.length - 1; i++) {
        for (var k = 0; k < array.length - 1; k++) {
            if (array[k] > array[k + 1]) {
                var temp = array[k];
                array[k] = array[k + 1];
                array[k + 1] = temp;
            }
        }
    }
    return array;
  }
  print(bubbleOrderAscending([1, 2, 7, 6, 4, 9, 12]));
  List<int> bubbleOrderDescending(List<int> array) {
    for (var i = 0; i < array.length - 1; i++) {
        for (var k = 0; k < array.length - 1; k++) {
            if (array[k] < array[k + 1]) {
                var temp = array[k];
                array[k] = array[k + 1];
                array[k + 1] = temp;
            }
        }
    }
    return array;
  }
  print(bubbleOrderDescending([1, 2, 7, 6, 4, 9, 12]));
  // https://dart.dev/language/patterns#matching
  List<int> bubbleWithDartVariableAssignmentPattern(List<int> array) {
    for (var i = 0; i < array.length - 1; i++) {
      for (var k = 0; k < array.length - 1; k++) {
        var (a, b) = (array[k], array[k + 1]);
        if (a > b) {
          (b, a) = (a, b); // swap b > a now
          array[k] = a;
          array[k + 1] = b;
        }
      }
    }
    return array;
  }
  print(bubbleWithDartVariableAssignmentPattern([1, 2, 7, 6, 4, 9, 12, 3]));
  // Counting Sort Algorithm
  List<int> countSort(List<int> nums) {
    final int listLength = nums.length;
    int max = 0;

    // Find the maximum element of inputArray
    for (int i = 0; i < listLength; i++) {
        if (nums[i] > max) {
            max = nums[i];
        }
    }
    print('~~~ countSort find max element: $max');

    // Initialize a new countArray with 0s
    // the length is == max because each item represents a number from nums
    // e.g if max is 3, countArray == [0 (how many zeros), 0 (how many ones), 0 (how many twos), 0 (how many threes)]
    List<int> countArray = List<int>.filled(max + 1, 0); // [0, 0, 0, ...max + 1]
    print('~~~ countSort init countArray: $countArray');

    // Map each element of inputArray as an index of countArray
    for (int i = 0; i < listLength; i++) {
        final int valueFromNumsAtIndexI = nums[i];
        // this counts the occurrences of a number inside of nums
        // e.g.: nums[0] == 1
        // if there are 2 Ones in nums, countArray == [0, 2 (this items index is 1, there are two of them)]
        countArray[valueFromNumsAtIndexI]++;
    }
    print('~~~ countSort Map inputArray to indexes of countArray: $countArray');

    // Calculate prefix sum at every index of countArray
    for (int i = 1; i <= max; i++) {
        // sum the previous item to the current
        // e.g. [2, 2, 2, 0, 2, 0, 2, 2, 0, 2, 0, 0, 1] => [2, 4, 6, 6, 8, 8, 10, 12, 12, 14, 14, 14, 15]
        countArray[i] += countArray[i - 1];
    }
    print('~~~ countSort Map prefix sum at every index of countArray: $countArray');

    // Create outputArray from countArray
    List<int> outputArray = List<int>.generate(listLength, (int index) => 0);
    for (int i = listLength - 1; i >= 0; i--) {
        final int valueFromNumsAtIndexI = nums[i]; // e.g. nums[1] == 2
        final int valueFromcountArrayAtIndexNumsOfI = countArray[valueFromNumsAtIndexI]; // e.g. [2, 4, 6 (this one!)]
        outputArray[valueFromcountArrayAtIndexNumsOfI - 1] = valueFromNumsAtIndexI;  // e.g. outputArray[6 - 1] == 2 CORRECT!
        countArray[nums[i]]--; // one occurrence has already been counted in
    }

    return outputArray;
  }
  print(countSort([1, 2, 7, 0, 6, 4, 9, 12, 9, 4, 6, 7, 2, 1, 0]));
  List<int> reverseArray(List<int> array) {
    List<int> reversedArray = [];
    while (array.isNotEmpty) {
      reversedArray.add(array.removeAt(array.length - 1));
    }
    return reversedArray;
  }
  print(reverseArray([1, 2, 7, 6, 4, 9, 12]));
  
  // You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer.
  // The digits are ordered from most significant to least significant in left-to-right order.
  // The large integer does not contain any leading 0's.
  // [7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]
  // [9,9,9]
  List<int>? plusOne(List<int> digits) {
    final int length = digits.length;
    if (length == 0) {
      return null;
    }
    // carry by default, otherwise sum is complete
    bool isCarrying = true;

    for (var i = length - 1; i >= 0; i--) {
      if (!isCarrying) break;
      // if we are carrying, we need to add one to the least significant digit
      // e.g [8, 9] => yes we are carrying => 9 + 1 == 10 => [8 (carrying 1), 0]
      int value  = digits[i] + 1;
      isCarrying = value >= 10; // we could do with "value == 10" here but OK
      if (isCarrying) {
        value = value % 10;
      }
      digits[i] = value;
    }

    if (isCarrying) {
      digits.insert(0, 1);
    }

    return digits;
  }
  print(plusOne([7,2,8,5,0,9,1,2,9,5,3,6,6,7,3,2,8,4,3,7,9,5,7,7,4,7,4,9,4,7,0,1,1,1,7,4,0,0,6]));
  print(plusOne([9,9,9]));
  print(plusOne([]));

  String addBinary(String a, String b) {
    // add padding to shortest addend, to facilitate for loop
    if (a.length < b.length) {
        a = ('0' * (b.length - a.length)) + a;
    }
    if (b.length < a.length) {
        b = ('0' * (a.length - b.length)) + b;
    }
    bool isCarrying = false;
    String result = '';
    for (int i = a.length - 1; i >= 0; i--) {
        // both addends == 0
        if (a[i] == '0' && b[i] == '0') {
            // 0 + 0 (carry 1) => 1
            // 0 + 0 (no carry) => 0
            result = (isCarrying ? '1' : '0') + result;
            isCarrying = false;
        // either addend == 0, the other == 1
        } else if (a[i] != b[i]) {
            // 1 + 0 (carry 1) => 0 => carry 1
            // 1 + 0 (no carry) => 1 => no carry
            result = (isCarrying ? '0' : '1') + result;
        // both addends == 1
        } else {
            result = (isCarrying ? '1' : '0') + result;
            isCarrying = true;
        }
    }
    return isCarrying ? '1' + result : result;
  }
  print(addBinary('11', '1'));
  print(addBinary('101001110101', '101'));
  print(addBinary('101', '101001110101'));
  bool isUglyNumber(int n) {
    // ugly number must be positive
    if (n < 1) return false;
    // an ugly number is defined as a number whose only prime factors are 2, 3, or 5
    // 
    for (int primeFactor in [2, 3, 5]) {
        // keep dividing n by the prime factor until it is no longer divisible by that factor
        while (n % primeFactor == 0) {
            n = n ~/ primeFactor;
        }
        // If at the end of this process, n has been reduced to 1, 
        // then all of n's prime factors must have been among 2, 3, or 5, 
        // and thus n is an ugly number (return true)
    }
    return n == 1;
  }
  print(isUglyNumber(6));
  print(isUglyNumber(1));
  print(isUglyNumber(14));
  // You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, 
  // and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
  // Merge nums1 and nums2 into a single array sorted in non-decreasing order.
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    // short circuits
    if (nums2.isEmpty) {
        nums1 = nums1.sublist(m);
    }
    if (nums1.isEmpty) {
        nums1 = nums2;
    }
    // kind of a Bubble algo
    // by merging the arrays from right to left,
    // avoid additional space complexities and time-consuming operations 
    // like shifting elements
    // The pointers i, j, and k are initialized as follows:
    // i starts at m - 1 => current element from nums1
    // j at n - 1 => current element from nums2
    // and k at m + n - 1 => pointer to index were element will be inserted
    int k = (m + n) - 1;
    int i = m - 1;
    int j = n - 1;

    // j will be 0 when all elements have been merged into nums2
    while (j >= 0) {
        // Compare the elements at pointer i in nums1 and at pointer j in nums2.

        // If nums1[i] is greater, place nums1[i] in nums1[k],
        // and decrement both i and k
        if (i >= 0 && nums1[i] > nums2[j]) {
            nums1[k] = nums1[i];
            i--;
        } else {
        // If nums2[j] is greater or i is out of bounds
        // (which means all elements of nums1 have been placed),
        // place nums2[j] in nums1[k], and decrement both j and k
            nums1[k] = nums2[j];
            j--;
        }
        k--;
    }
  }
  List<int> nums1 = [1,2,3,0,0,0];
  List<int> nums2 = [2,5,6];
  merge(nums1, 3, nums2, 3);
  print(nums1);
}