// Javascript acrobacy that very rarely comes in handy, but should be explored:

const recursiveFunction = (num, arr = []) => {		// define a function, in this case "num" is the number passed in as an argument when we call the function, and "arr" is a default argument defined and initialized here
	if (!num) return arr  							// first off, we see if "num" is positive ('0' is falsy). if > 0 we continue, if == 0 we return the array
	arr.push(num) 									// add the current number to the end of the array
	num--											// decrease the value of "num" by 1
	return recursiveFunction(num, arr)				// the magic trick: re-call the function itself, with the updated value of "num", and the updated value of "arr"
}

console.log(recursiveFunction(10))


// Example 1: Fibonacci series

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

// Example 2: json list

const myApiResponse = [
	{
		name: 'Pepe',
		job: 'Saint',
	},
	{
		name: 'Filippo',
		job: 'Typewriter',
	}
]

const formatUsers = myApiResponse => {
	if (!myApiResponse.length) return 'no more users!'
	console.log(`Username: ${myApiResponse[0].name}, Job: ${myApiResponse[0].job}`) 
	myApiResponse.shift() 
	return formatUsers(myApiResponse)
}

console.log(formatUsers(myApiResponse)) 



















