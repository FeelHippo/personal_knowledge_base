// https://projecteuler.net/problem=7
// https://math.stackexchange.com/a/783400

// Prime[10 001] = 104 743

import fs from 'fs';
var data_primes = JSON.parse(fs.readFileSync('primes.json', 'utf-8')) as number[];

const isPrime = (n: number, primes: number[]): boolean => {
    // Find the biggest perfect square k2≤n
    let biggest: number = n;
    for (let i = n; i > 0; i--) {
        const k = Math.sqrt(i);
        if (Number.isInteger(k)) {
            biggest = k;
            break;
        }
    }
    // Write out all the primes less than or equal to k
    const primes_less_than_k = primes.filter(prime => prime <= biggest);
    // If n is divisible by any of the primes, n is not prime
    return !primes_less_than_k.some(prime => !(n%prime));
}

let all_primes = [2];
let current = 3;
while (all_primes.length != 10001) {
    if (isPrime(current, all_primes)) {
        if (!data_primes.includes(current)) {
            throw new Error()
        }
        all_primes = [...all_primes, current];
    }
    current += 2;
}

// test isPrime()
// data_primes.forEach(
//         (prime, _index, primes) =>
//             console.log(`${prime}: ${isPrime(prime, primes)}`)
//     );
console.log(all_primes[all_primes.length - 1]);