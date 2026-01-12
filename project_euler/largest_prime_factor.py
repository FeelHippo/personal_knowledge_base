def main():
    print(largestPrimeFactor(600851475143))

def largestPrimeFactor(limit: int) -> int:
    largestPrime = limit

    # remove all factors of 2, since 2 is the only even prime
	# this reduces the limit to its highest possible odd factor
	# e.g. if limit is 100 => 50 => 25
    while limit % 2 == 0:
        # as far as we know, 2 is the largest prime factor so far...
        largestPrime = 2
        limit = int(limit / 2)

    # check for odd factors starting from 3, since 2 is removed above 
    # process continues for all odd numbers up to √n
    i = 3
    while i * i < limit:
        # i will always be a prime number: i * i
        # while i is a factor, keep dividing limit by it
        while limit % i == 0:
            largestPrime = i
            limit = int(limit / i)
        i += 2  

    # if limit is still greater than 2, it is a prime number
    if limit > 2:
        largestPrime = limit

    return largestPrime

main()