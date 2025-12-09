# Functional programming
from math import sqrt


# first-class-citizen function
def make_adder(addend):
    def f(x):
        return addend + x
    return f # returns a function, as if it were any other kind of value

def output_calculation(f): # accepts a function as argument
    f(make_adder(1)(1))
output_calculation(print)

# pass a variable number of arguments to a function
def dynamic_sum(*argv):
    sum = 0
    for arg in argv:
        sum += arg
    return sum
print(dynamic_sum(1,2,3,4,5,6,7,8,9))

# pass a variable length argument list
def dynamic_data(**kwargs):
    for key, value in kwargs.items():
        print("%s: %s" % (key, value))

dynamic_data(name = 'Filippo', age = 40, funky = True)

# Lambda functions:
# A lambda function is a small anonymous function
# lambda arguments : expression

# = ( args ) : ( expression )
x = lambda a : a + 10
print(x(5))

# Heron's formula
area = lambda a, b, c : 0.25 * sqrt( (a + b + c) * (-a + b + c) * (a - b + c) * (a + b - c) )
print(area(12, 10, 8))