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


