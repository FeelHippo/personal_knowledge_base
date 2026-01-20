def main():
    counter = 21
    result = None
    while result is None:
        for i in reversed(range(1, 20)):
            if counter % i > 0:
                break
            elif i == 1:
                result = counter
        counter += 1
    print(result)

main()    