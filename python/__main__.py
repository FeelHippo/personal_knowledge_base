from typing import List

def reverse_string(string: str) -> str:
    reversed_string = ''
    for char in string:
        reversed_string = char + reversed_string
    return reversed_string

print(reverse_string('example to demonstrate reversing of string'))

def is_palindrome(string: str) -> bool:
    return string == reverse_string(string)

print(is_palindrome('abba'))

def fizz(n: int) -> str:
    if n%3 == 0:
        return 'Fizz'
    return ''
def buzz(n: int) -> str:
    if n%5 == 0:
        return 'Buzz'
    return ''

def fizz_buzz(n: int) -> str:
    return fizz(n) + buzz(n)

print(fizz_buzz(3))
print(fizz_buzz(5))
print(fizz_buzz(15))

def bubble_sort(numbers: List[int]) -> List[int]:
    for i, _ in enumerate(numbers):
        for j, _ in enumerate(numbers):
            if j < len(numbers) - 1:
                if numbers[j] > numbers[j+1]:
                    temp = numbers[j]
                    numbers[j] = numbers[j+1]
                    numbers[j+1] = temp
    return numbers

print(bubble_sort([7,5,21,65,78,53,23,6,2,1]))

def reverse_array(numbers: List[int]) -> List[int]:
    reversed_array = []
    for num in numbers:
        reversed_array.insert(0, num)
    return reversed_array

print(reverse_array([0, 1, 2, 3, 4]))

def fibonacci(num_items: int, fibonacci_list = [], index = 0) -> List[int]:
    if num_items == 0: return fibonacci_list
    elif index == 0: fibonacci_list.append(0)
    elif index == 1: fibonacci_list.append(1)
    else: fibonacci_list.append(fibonacci_list[-2] + fibonacci_list[-1])
    return fibonacci(num_items-1, fibonacci_list, index+1)

print(fibonacci(18))

def word_counts(sentences: list[str]) -> dict[str, int]:
    """Returns a dictionary with words from the input sentences as keys and their frequency as values"""
    count: dict[str, int] = {}
    for sentence in sentences:
        words = sentence.split(' ')
        for word in words:
            count[word] = count.get(word) + 1 if word in count else 1
    return count

print(word_counts(['hello world', 'my name is world', 'we are the world']))