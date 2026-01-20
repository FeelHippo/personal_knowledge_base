void main() {
    const limit = 100;
    final int sumOfSquaresResult = sumOfSquares(limit);
    print(sumOfSquaresResult);
    final int squareOfSumResult = squareOfSum(limit);
    print(squareOfSumResult);
    final int result = squareOfSumResult - sumOfSquaresResult;
    print(result);
}

int reduceToSum(int limit, int Function(int index) generator) =>
    List<int>.generate(limit, generator)
    .reduce((value, element) => value + element);

int sumOfSquaresMapper(int index) => (index + 1) * (index + 1);
int sumOfSquares(int limit) => reduceToSum(limit, sumOfSquaresMapper);

int sumMapper(int index) => index + 1;
int sum(int limit) => reduceToSum(limit, sumMapper);
int squareOfSum(int limit) => sum(limit) * sum(limit);