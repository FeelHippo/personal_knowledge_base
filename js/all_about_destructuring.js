export {};

// basic destructuring, single prop

const user = {
	id: 123,
	name: 'Filippo',
	age: 39,
	education: {
		degree: 'Bachelors'
	}
}
const { name } = user // 'Filippo'

// extract prop, assign name

const { name: modifiedName } = user // 'Filippo'

// nested objects

const { education: { degree } } = user // 'Bachelors'

// default value, returns undefined if prop is missing

const { education: { degree } = {} } = user // undefined if prop does not exist

// same thing for deeper nested objects

const { education: { school: { name } = {} } = {} } = user // default value for school and default value for education

// OR

const { education: { school: { name } } = { school: {} } } = user // expand education default value, same effect as above

// define default values

const { education: { school: { name = 'my School' } = {} } = {} } = user

// OR

const { education: { school: { name } } = { school: { name: 'my School' } } } = user


