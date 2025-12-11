export {};
/// reverse a string
// Declare a string.
// calculate the length of that string.
// Loop through the characters of the string.
// Add the characters in reverse order in the new string.

const reverseString = (fullString: String): String => {
  let reversedString = '';
  for (let character of fullString) {
    reversedString = character + reversedString;
  }
  return reversedString;
}

console.log(reverseString('example to demonstrate reversing of string'))

/// determine if a string is a palindrome
// reversing the original string first and then checking if the reversed string is equal to the original string

const isPalindrome = (original: String) => original === reverseString(original);

console.log(isPalindrome('angelodidolegna'));

/// FizzBuzz
const fizzBuzzToN = (n: number): (false | void)[] => new Array(n).fill(1).map((v,k) => helper(k+1))

const helper = (k: number): false | void => (!(k%3) && !(k%5) && console.log('FizzBuzz'), !(k%3) && console.log('Fizz'), !(k%5) && console.log('Buzz'));

fizzBuzzToN(100);

// isolate even values only and remove duplicates
// Solution 1: Set

interface dataObject {
  id: number;
  value: number;
}

let data: dataObject[] = [
  { id: 1, value: 4 },
  { id: 2, value: 3 },
  { id: 3, value: 4 },
  { id: 4, value: 5 },
  { id: 5, value: 6 }
]

console.log(
  new Set(
    data.map(
      ({ value }) =>
        !(value % 2) && // value is even
        data.find(i => i.value === value) // for each value only return the first match from the list
    )
  )
)
  
// Solution 2: Recursively
const  filterUnique = (result: dataObject[] = []): dataObject[] => {
  const curr = data.shift();
  if (!curr) return result;
  if (!(curr.value % 2) && !result.find(({ value }) => curr.value === value))
    result.push(curr)
  return filterUnique(result)
}

console.log(filterUnique())

/// bubble sort algorithm
// Declare an array.
// Nest two loops to compare the numbers in the array.
// The array will be sorted in ascending order by replacing the elements if found in any other order

const arrToSort = [7,5,21,65,78,53,23,6,2,1];
const bubble = (arr: number[]) => {
    for (let i = 0; i < arr.length; i++) {
        for (let k = 0; k < arr.length; k++) {
            if (arr[k] > arr[k + 1]) {
                const temp = arr[k];
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
const reverseArray = (arr: number[]) => {
    let reversedArray: number[] = []
    for(let i = arr.length; i > 0; i--) {
        reversedArray.push(arr[i - 1])
    }
    return reversedArray
}

console.log(reverseArray(arrToReverse))

// Fibonacci series
const fibonacci = (num: number, arr: number[] = [], index = 0): String => {
	if (!num) return arr.join(' ')
	else if (index < 1) arr.push(0) 
	else if (index <= 2) arr.push(1) 
	else arr.push(arr[arr.length - 1] + arr[arr.length - 2])
	num--
	index++
	return fibonacci(num, arr, index)
}

console.log(fibonacci(18))

// def word_counts(sentences: list[str]) -> dict[str, int]:
// """Returns a dictionary with words from the input sentences as keys and their frequency as values"""

// input: ['hello world', 'my name is world']
// Record<string, number> => { 'hello': 1, 'world': 2... }

function wordCounts(sentences: string[]): Record<string, number> {
    let dictionary: Record<string, number> = {};
    for (var i = 0; i < sentences.length; i++) {
        const currentSentence = sentences[i];
        const currentWordList = currentSentence.split(' ');
        for (const word of currentWordList) {
            if (word in dictionary) {
                dictionary[word] = dictionary[word] + 1;
            } else {
                dictionary[word] = 1;
            }
        }
    }
    return dictionary;
}

console.log(wordCounts(['hello world', 'my name is world', 'we are the world']))

// Option #2
function wordCountsArgs(...sentences: string[]): Record<string, number> {
    let dictionary: Record<string, number> = {};
    for (const sentence of sentences) {
        for (const word of sentence.split(' ')) {
            dictionary[word] = !!dictionary[word] ? dictionary[word] + 1 : 1;
        }
    }
    return dictionary;
}

console.log(wordCountsArgs('hello world', 'my name is world', 'we are the world', 'all around the world'))
