// to run ts-node scripts
// ts-node -O '{"module": "commonjs"}' file_name.ts

// https://projecteuler.net/problem=5
// expected == 232,792,560

// evenly divisible == n%2==0 == "without remainder"
// const divisors: number[] = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11];
let counter = 20;
let result = undefined;
while(!result) {
    for (var i = 20; i > 0; i--) {
        if (counter++ % i) break;
        else if (i == 1) result = counter;
    }
}
console.log(counter); // 232792560