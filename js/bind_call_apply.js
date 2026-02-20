/* Used to assign an OBJECT to the "this" keyword of a function */

// given an OBJECT:
const videogame = {
	name: 'Minecraft',
	release: '2011-11-18',
}

// and a FUNCTION:
const message = function(iHavePlayedIt = true, howMuchILikeIt = 10) {
	return `${this.name} was developed in ${this.release}. I ${iHavePlayedIt ? 'have' : 'havent'} played it and I like it this much: ${howMuchILikeIt}`
}

// we want to execute function "message" using the properties from the object "videogame"
// this is necessary because the generic function "message" relies on the keyword "this", which is not defined

// option #1: BIND wraps the function around the object, but does NOT execute it

const bound = message.bind(videogame) 	// create the binding
console.log(bound(false, 5))			// execute the function with the object assigned to it

// option #2: CALL assigns an object to a function, and executes the function

console.log(message.call(videogame, true, 8)) // _function_.call(_object_, argument1, argument2)

// option #3: APPLY is the same as .call(), but receives an array of arguments, hence .call() is preferred when working with arrays

console.log(message.apply(videogame, [false, 1]))  // _function_.apply(_object_, [argument1, argument2])

// TIPS
// - bind is not automatically executed, while call and apply are called immediately
// - easy way to distinguish between call and apply:
//		- *A*pply ==> arguments in an *A*rray
//		- *C*all  ==> arguments separated by *C*omma

/*-- REACT USAGE --*/
// not used anymore, even though still predominant in old code
// https://github.com/react-toolbox/react-toolbox/issues/652
