void main() {
  // Functions as First Class Citizens
  // A programming language is said to have First-class functions when functions in that language are treated like any other variable.
  // For example, in such a language, a function can be passed as an argument to other functions, 
  // can be returned by another function and can be assigned as a value to a variable.
  // Higher-Order Functions (HOFs) in Dart are functions that can take other functions as parameters or return functions as results, 
  // enabling functional programming patterns
  final result = noisy(bubbleOrderAscending)(<int>[3, 2, 1]);
  print(result);
}

List<int> bubbleOrderAscending(List<int> array) {
  for (var i = 0; i < array.length - 1; i++) {
    for (var k = 0; k < array.length - 1; k++) {
      if (array[k] > array[k + 1]) {
        var temp = array[k];
        array[k] = array[k + 1];
        array[k + 1] = temp;
      }
    }
  }
  return array;
}

int Function(List<int>) noisy(List<int> Function(List<int>) f) {
  int action(List<int> args) {
    List<int> result = f(args);
    return result.first;
  }

  return action;
}
