# https://projecteuler.net/problem=1
# https://math.stackexchange.com/a/9305

def main():
    i = 1
    sum = 0
    while(i < 1000):
        if i%3==0 or i%5==0:
            sum += i
        i += 1    
    return sum

print(main())