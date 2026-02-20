[
	() => console.log('Create a new Date object: new Date()', new Date()),
	() => console.log('Create a date + a timestamp: new Date(milliseconds)', new Date(1732040011889)),
	() => console.log('Create a date from a string: new Date(datestring)', new Date('1985-03-17')),
	() => console.log('Create a date from components: new Date(yyyy, m[0-11], d, h, m, s, ms)', new Date(1985, 2, 17, 1, 32, 57, 99)),
	() => {
		const now = new Date()
		console.log('Access date components: getFullYear(), getMonth(), getDate(), getHours()/getMinutes()/getSeconds()/getMilliseconds(), getDay()', 
			now.getFullYear(),
			now.getMonth(),
			now.getDate(),
			now.getHours(),
			now.getMinutes(),
			now.getSeconds(),
			now.getMilliseconds(),
			now.getDay()
		)
	},
	() => {
		const now = new Date()
		console.log('Access UTC+0 date components: getUTCFullYear(), getUTCMonth(), getUTCDate(), getUTCHours()/getUTCMinutes()/getUTCSeconds()/getUTCMilliseconds(), getUTCDay()', 
			now.getUTCFullYear(),
			now.getUTCMonth(),
			now.getUTCDate(),
			now.getUTCHours(),
			now.getUTCSeconds(),
			now.getUTCMilliseconds(),
			now.getUTCDay()
		)
	},
	() => console.log('These two do not have a UTC variant: getTime() (returns the timestamp in ms from 1/1/70) and getTimezoneOffset() (difference between UTC and local time zone in minutes)', new Date().getTime(), ' and ', new Date().getTimezoneOffset()),
	() => console.log('Setting date components: e.g. setFullYear(), setMonth() and so on...', new Date(new Date().setFullYear(1990))),
	() => console.log('Autocorrection: ', new Date(2020, 0, 32)),
	() => {
		console.log('Dates can be subtracted:')
		let start = new Date()
		for (let i = 0; i < 100000; i++) {
			let costlyTask = i * i * i
		}
		let end = new Date()
		console.log(`The loop took ${end - start} ms`)
	},
	() => console.log('Get a simple timestamp: Date.now() ', Date.now()),
	() => console.log('Read date from string and return timestamp from 1/1/70: Date.parse(str) ', Date.parse('2019-12-31T23:59:59.999+01:00'), ' or... ', new Date(Date.parse('2019-12-31T23:59:59.999+01:00'))),
	() => console.log('According to the specification, the typeof operator returns the string "', typeof new Date(), ' for null, ordinary, standard exotic and non-standard exotic objects, but we can check the type of an object by using the toString method: ', Object.prototype.toString.call(new Date()))
].forEach(f => f())

const commands = [
	"console.log('Create a new Date object: new Date()', new Date())",
	"console.log('Create a date + a timestamp: new Date(milliseconds)', new Date(0 + Math.random() * (Number.MAX_SAFE_INTEGER - 0)))",
	"console.log('Create a date from a string: new Date(datestring)', new Date('1985-03-17'))"
]

function logs() {
	commands.length && (commands.shift() | logs())
}
logs()
