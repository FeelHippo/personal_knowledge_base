fun main() {
    val numbers = MutableList<Int>(999) { it + 1 };
    val memo = mutableListOf<Int>();
    val allMultiples = multiplesOfThreeOrFive(numbers, memo);
    var result = 0;
    for (number in allMultiples) {
        result += number;
    }
    print(result);
}

fun multiplesOfThreeOrFive(numbers: MutableList<Int>, memo: MutableList<Int>): List<Int> {
    if (numbers.isEmpty()) return memo;
    val lastElement = numbers.removeLast();
    if (!memo.contains(lastElement) && (lastElement % 3 == 0 || lastElement % 5 == 0)) {
        memo.add(lastElement);
    }
    return multiplesOfThreeOrFive(numbers, memo);
}