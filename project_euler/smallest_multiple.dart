// https://euler.beerbaronbill.com/en/latest/solutions/5.html
// expected_answer = 232792560

void main() {
  int counter = 20;
  int? result;
  while (result == null) {
    for (var i = 20; i > 0; i--) {
      if (counter++ % i != 0) break;
      else if (i == 1) result = counter;
    }
  }
  print(counter); // 232792560
}