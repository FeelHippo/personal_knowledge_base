/// First Exercise
const MAX_LENGTH = 100000;
const MAX_M = 1000000;
const MIN_M = -1000000;

// const A = [...Array(MAX_LENGTH)].map(() => Math.floor(Math.random() * (MAX_M - MIN_M) + MIN_M));
const A = [2, 3, -1, 1, 3];

function number_of_moves(A: number[]): number {
  // make sure A is valid and contains items
  if (!A) throw Error();
  // make sure all items are numbers
  if (A.some((item: number) => !(typeof item === 'number'))) throw Error();

  // game is over when the pawn exceeds the length of A
  const limit = A.length - 1;
  // first item counts as move
  let current_number_of_moves = 1;
  // cursor
  let current_position = 0;

  // facilitate indexing in case of duplicate items
  const indexed_list: { K: number, M: number }[] = A.map((M: number, K: number) => ({ K, M }));

  while(
    current_position < limit // current position is within A
    && current_number_of_moves < limit // if the number of moves is higher it means we are in an endless loop
  ) {
    // move the cursor
    current_number_of_moves++;
    const next_item = indexed_list.find(({ K }) => K === A[current_position] + current_position);
    // if there is no next element, the pawn will never jump out of the array
    if (!next_item) break;

    const { K, M } = next_item!;

    // short circuit
    if (K + M > limit) {
      // this means that the next move would exceed the limit
      return current_number_of_moves++;
    }

    current_position = K;
  }

  return -1;

}

console.log(number_of_moves(A));

// Second Exercise
// Given binary string representation of a positive integer find how many operations would it take to convert that number to 0.
// The operation can either be dividing the number by 2 if the number is even or subtracting 1 if the number is odd

const BINARY_STRINGS = [
  '11000101',
  '11101101',
  '10000100',
  '10100011',
  '00111001',
];

function number_of_moves_recursive(binary_representation: string, result: number = 0): number {
  // parse string into int
  const parsed_int: number = parseInt(binary_representation, 2);
  // short circuit to complete
  if (!parsed_int) return result;
  result++;
  // if even, divide by two
  if (parsed_int % 2 === 0) {
    const half: number = parsed_int / 2;
    const binary_representation = (half >>> 0).toString(2);
    return number_of_moves_recursive(binary_representation, result);
  } else {
    // if odd, subtract 1 and repeat
    const binary_representation = (parsed_int - 1 >>> 0).toString(2);
    return number_of_moves_recursive(binary_representation, result);
  }
}


console.log(
  BINARY_STRINGS.map(
    (binary_representation) => number_of_moves_recursive(binary_representation)
  ),
);
