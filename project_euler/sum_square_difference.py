sum = 0
sum_of_squares = 0
for x in range(1, 101):
    sum += x
    sum_of_squares += x * x

square_of_sum = sum * sum

print(square_of_sum - sum_of_squares)