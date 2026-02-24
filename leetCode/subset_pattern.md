// Determine all possible combinations
// Repetitions may or may not be allowed
// It includes the empty set and the set itself

// https://emre.me/coding-patterns/subsets/

// If the problem description involves dealing with Permutations and Combinations of a given set of elements or subsets, 
// you should think about Subsets pattern which is very useful to solve these kinds of problems

```dart
List<List<int>> subset(List<int> nums) {
  List<List<int>> subsets = [[]];
  for (final num in nums) {
    final int limit = subsets.length;
    for (var i = 0; i < limit; i++) {
      subsets.add([...subsets[i], num]);
    }
  }
  return subsets;
}
```