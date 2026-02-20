/// reverse a string
// Declare a string.
// calculate the length of that string.
// Loop through the characters of the string.
// Add the characters in reverse order in the new string.

function reverseString(example) {
    let reversedString = '';
    const stringLength = example.length;
    for (i = 0; i < stringLength; i++) {
        reversedString = example.charAt(i) + reversedString;
    }
    return reversedString;
}

console.log(reverseString('example to demonstrate reversing of string'))

/// determine if a string is a palindrome
// reversing the original string first and then checking if the reversed string is equal to the original string

function isPalindrome(original) {
    return original === reverseString(original);
}

console.log(isPalindrome('abba'))

/// FizzBuzz
const fizzBuzzToN = n => {
    return new Array(n).fill(1).map((v,k) => helper(k+1))
}
  
const helper = k => {
    switch(true) {
        case !(k%3) && !(k%5):
            return 'FizzBuzz';
        case !(k%3):
            return 'Fizz';
        case !(k%5):
            return 'Buzz';
        default:
            return k;
    }
}

// ...or https://gist.github.com/jaysonrowe/1592432?permalink_comment_id=3692693#gistcomment-3692693
const fizzBuzzHelper = n => (!(n % 3) && !(n % 5) && 'FizzBuzz') || (!(n % 3) && 'Fizz') || (!(n % 5) && 'Buzz') || n
console.log(
    [...Array(100)]
    .map(
        (element, index) => fizzBuzzHelper(index + 1)
    ),
)

// isolate even values only and remove duplicates
// Solution 1: Set
let data = [
    { id: 1, value: 4 },
    { id: 2, value: 3 },
    { id: 3, value: 4 },
    { id: 4, value: 5 },
    { id: 5, value: 6 }
  ]
  
  console.log(new Set(data.map(({ value }) => !(value % 2) && data.find(i => i.value === value))))
  
  // Solution 2: Recursively
  function filterUnique(result) {
    const curr = data.shift()
    if (!curr) return result
    if (curr.value % 2 === 0 && !result.find(({ value }) => curr.value === value))
      result.push(curr)
    return filterUnique(result)
  }
  
  console.log(filterUnique([]))

/// bubble sort algorithm
// Declare an array.
// Nest two loops to compare the numbers in the array.
// The array will be sorted in ascending order by replacing the elements if found in any other order

const arrToSort = [1, 2, 7, 6, 4, 9, 12];
function bubble(arr) {
    for (i = 0; i < arr.length; i++) {
        for (k = 0; k < arr.length; k++) {
            if (arr[k] > arr[k + 1]) {
                var temp = arr[k]
                arr[k] = arr[k + 1]
                arr[k + 1] = temp
            }
        }
    }
    return arr
}

console.log(bubble(arrToSort))

/// reverse an array
const arrToReverse = [1, 2, 7, 6, 4, 9, 12];
function reverseArray(arr) {
    let reversedArray = []
    for(i = arr.length; i > 0; i--) {
        reversedArray.push(arr[i - 1])
    }
    return reversedArray
}

console.log(reverseArray(arrToReverse))

/// swap two numbers without using a third variable
// Declare two variables and initialize them with values.
// Make b the sum of both numbers.
// Then subtract the sum (b) from a, so a is now swapped.
// Lastly, subtract a from the sum (b), so b is also swapped

let a = 10
let b = 20

b = a + b
a = b - a
b = b - a 

console.log(a, b)

// Fibonacci series
const fibonacci = (num, arr = [], index = 0) => {
	if (!num) return arr.join(' ')
	else if (index < 1) arr.push(0) 
	else if (index <= 2) arr.push(1) 
	else arr.push(arr[arr.length -1] + arr[arr.length - 2])
	num--
	index++
	return fibonacci(num, arr, index)
}

console.log(fibonacci(18))