// https://projecteuler.net/problem=6
// Find the difference between: 
// the sum of the squares of the first one hundred natural numbers => 1 * 1 + 2 * 2 ... 100 * 100
// and 
// the square of the sum => (1 + 2 ... + 100) * (1 + 2 ... + 100)

const LIMIT = 100;

const reduce_sum_of = (mapper: (value: any, index: number, array: any[]) => number) =>
    [...Array(LIMIT)].map(mapper).reduce((acc, curr) => acc+curr, 0);

const sum_of_squares_mapper = (_: number, i: number) => (i + 1) * (i + 1);
const sum_of_squares = (): number => reduce_sum_of(sum_of_squares_mapper);

const sum_mapper = (_: number, i: number) => i+1;
const sum = (): number => reduce_sum_of(sum_mapper);
const square_of_sum = (): number => sum() * sum();

console.log(square_of_sum() - sum_of_squares());


