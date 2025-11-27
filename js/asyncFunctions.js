/*-- Async Functions --*/
// https://flaviocopes.com/javascript-promises/

// in its basic form, an async function looks like this
// note, "new Promise" is being replaced by async/await, see below
// also, note how "Promise" is not a function, it is an Object
const bodyParser = async (req) => {
    return new Promise((resolve, reject) => {
        let body = '';
        req.on('data', data => body += data);
        req.on('end', () => resolve(body));
        req.on('error', reject);
    });
};

// if we invoke this function like a regular function, we get a pended Promise:
console.log(bodyParser({ body: {} }));

// there are two ways to resolve a promise
// old way, less common now
bodyParser({ body: {} }).then(value => console.log(value))

// current and preferred way
const asyncAwaitFunction = async () => Promise.resolve('ALWAYS USE ASYNC/AWAIT');
await asyncAwaitFunction();

// resolve multiple promises:
// suppose we have 3 promises

const first = Promise.resolve(1)
const second = Promise.resolve(2)
const third = Promise.resolve(3)

// Promise.all() waits for all promises to resolve, then moves on to .then()
Promise.all([first, second, third]).then(values => console.log(values))

// in case you want to map over an array of values/objects, and perform an async operation each time:
// https://flaviocopes.com/javascript-async-await-array-map/

// REACT EXAMPLE
// ./src/containers/HomeContainer.js is a container that exposes the following method, which is fired when we click on a "search" button

export class ClassifiedAds extends Component {  			// define the component
	constructor(props) {									// call the constructor
		...
	}

	...

	searchAds = async values => {							// define an async method. value is an object { name: String, price: Number, type: Bool }
		let response = await this.props.searchAds(values)	// await for the result of the async operation
		if (response.success) {								// evaluate the result of the async operation once completed
			console.log('Great!')
		}
	}

	render() {
		return (
			<Home 
				searchAds = { this.searchAds } 				// pass the method "searchAds" to the presentational component
			/>
		)
	}
}

// when we click on the button, and we invoke "this.searchAds", Redux will redirect to the corresponding action
// ./src/store/actions/index.js
export const searchAds = ({ name, price, type }) => { 												// an action is a function (see redux-thunk), the arguments are destructured, see line 43 above
	return async dispatch => {																		// return an async function called dispatch
		try {
			let API_URI = `https://myAmazingApi.net/v2/stuff?q=${name}&price=${price}&type=${type}`	// string literal, define the API query
			let stuffFromApi = await axios.get(API_URI)												// actual call to the API, which is async and might take some time to resolve, so we "await"
			if (stuffFromApi.status === 200) return stuffFromApi.data								// once promise is resolved, move on here
		} catch(error) {
			console.log(error)
		}
	}
}



// full repo https://github.com/FeelHippo/FinalFront













