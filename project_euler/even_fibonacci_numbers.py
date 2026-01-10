LIMIT = 4000000

def sumOfEvenNumbers(fibonacci_list: list[int] = [], index: int = 0, sum: int = 0) -> int:
    if index == 0: fibonacci_list.append(0)
    elif index == 1: fibonacci_list.append(1)
    else:
        next_fibonacci_number = fibonacci_list[-2] + fibonacci_list[-1]
        if next_fibonacci_number >= LIMIT:
            return sum
        fibonacci_list.append(next_fibonacci_number)
        if next_fibonacci_number%2==0:
            sum += next_fibonacci_number
    return sumOfEvenNumbers(fibonacci_list, index+1, sum)

print(sumOfEvenNumbers())