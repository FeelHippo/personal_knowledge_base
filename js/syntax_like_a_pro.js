/* SYNTAX like a pro */

// CONDITIONALS
// use if/if else/else if you need to execute code depending on a condition:

const bug = 'Ringo'
if (['John', 'George'].includes(bug)) {
	console.log('guitar')
} else if (bug === 'Paul') {
	console.log('bass')
} else if (bug === 'Ringo') {
	console.log('drums')
}

// use a ternary operator if you have to chose between two values, depending on the truthiness of the condition
// (condition) ? <this in case the condition is true> : <this if false>
const numberOfString = 13
const instrument = numberOfString === 6 ? 'guitar' : 'other instrument'
console.log(instrument)

// STRING LITERAL
// this should be the one and only way to manipulate strings:
// note the use of backticks ``, '' and "" will NOT work
// within the backticks, any expression within the ${} symbol will be evaluated to string
const band = 'The Beatles'
const numberOfMembers = 4
const didPaulDie = true

const bandDescription = `${band.toUpperCase()} included ${didPaulDie ? numberOfMembers - 1 : numberOfMembers} original members`
console.log('bandDescription')

// STRING TO NUMBER
const numberStringified = '5.5'
console.log(parseInt(numberStringified)) 	// converts to an Integer
console.log(parseFloat(numberStringified))	// converts to a Float
console.log(Number(numberStringified))		// most commonly used
console.log(+numberStringified)				// party trick that works incredibly well and will make all the programmers in the room think you're good at it

// OPTIONAL CHAINING
// another party trick to avoid redundant checks, VERY useful when combined with async calls to API's
const Filippo = {}

const Alberto = {
	age: 36,
	isYoung: false,
	attributes: {
		height: 195,
		hairColor: 'blonde',
	}
}

// without optional chaining, the below code will throw an error and stop execution of all processes
console.log(Filippo.attributes.footSize) 

// WITH optional chaining, if a property does not exist, the expression will return 'undefined', which is a common falsy value
console.log(Alberto?.attributes?.footSize) // this translates to "does Alberto exist? OK, let's move on. Does it have a property attributes? OK, let's move on. Does it have a property footSize? NO, then return undefined"

// https://javascript.info/optional-chaining










