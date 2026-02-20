/* ARRAY METHODS */

// Array.map()
// always prefer this over Array.forEach()
// applies a method/function to each member of the array and RETURNS A VALUE

const numbers = [1,2,3,4]
const numbersPlusItsIndex = numbers.map((number, index) => number + index)
console.log(numbersPlusItsIndex)

// Array.forEach()
// executes a method/function for every element of the array, DOES NOT return any value
const letters = ['a', 'b', 'c', 'd']
letters.forEach((letter, index) => console.log(`Letter: ${letter}, Alphabet position: ${index + 1}`))

// Array.filter()
// validates each element against the same condition, if true the element is kept, if false not kept
const moreNumbers = [1, 2, 3, 4, 5, 6, 7, 8]
const evenNumbers = moreNumbers.filter(number => number % 2 == 0)
console.log(evenNumbers)

// Array.some()
// returns 'true' if any member of the array satisfies the condition
const instruments = ['piano', 'guitar', 'bass']
const weHaveBass = instruments.some(instrument => instrument === 'bass')
console.log(weHaveBass)

// Array.every()
// returns true if all elements satisfy the condition
const randomNumbers = [...Array(5)].map(() => Math.random() * (100 - 0))
console.log(randomNumbers.every(number => typeof number === 'number')) 

// Array.reduce()
// USE THIS TO return the sum of the elements within the array
const numericValues = [1, 2, 3, 4, 5, 6]
const numericReduce = numericValues.reduce((accumulator, currentArrayElement) => accumulator + currentArrayElement, 0) // the final zero is the starting point, can be omitted but is good practice
console.log(numericReduce)

const stringValues = ['Hello', 'World', 'How', 'Are', 'You?']
const stringReduce = stringValues.reduce((accumulator, currentArrayElement) => `${accumulator} ${currentArrayElement}`)
console.log(stringReduce)


// JOIN ARRAYS
const firstThree = ['a', 'b', 'c']
const secondThree = ['d', 'e', 'f']

// option 1: Array.concat()
const result = firstThree.concat(secondThree)
console.log(result)

// option 2: spread operator
const response = [...firstThree, ...secondThree]
console.log(response)

// SEE IF ELEMENT IS PRESENT IN AN ARRAY
const countries = ['Italy', 'Spain', 'Germany']

// option 1: Array.indexOf(). this method returns the index of the element we are looking for, or a 0 value otherwise
console.log(countries.indexOf('Spain') > 0)

// option 2: Array.includes()
console.log(countries.includes('Lithuania'))

// Array.sort()
const randomWordsArray = ['PooPoo', 'PeePee', 'Caca', 'Filippo', 'Orlando']
const sortedArray = randomWordsArray.sort()
console.log(sortedArray)

// PARTY TRICK .sort() takes a callback for more complex comparisons
const items = ['réservé', 'premier', 'communiqué', 'café', 'adieu', 'éclair']
console.log(items.sort((a, b) => a.localeCompare(b)))

// Further Reading
// https://eloquentjavascript.net/05_higher_order.html












