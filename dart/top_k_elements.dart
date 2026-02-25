import 'package:collection/collection.dart';

void main() {
  final int k = 3;
  final List<int> nums = [3, 2, 1, 5, 6, 4];
  final heap = HeapPriorityQueue<int>((a, b) => b.compareTo(a));
  for (final num in nums) {
    heap.add(num);
  }
  final List<int> answer = <int>[];
  while (heap.length > nums.length - k) {
    answer.add(heap.removeFirst());
  }
  print(answer);
}
