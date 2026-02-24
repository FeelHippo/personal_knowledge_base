void main() {
  print(subset([1, 2, 3]));
}

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
