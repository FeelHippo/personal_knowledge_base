import 'package:equatable/equatable.dart';

class Node extends Equatable {
  Node({
    required this.value,
    this.next,
  });

  final int value;
  late Node? next;

  @override
  List<Object?> get props => <Object?>[
        value,
        next,
      ];
}

void main() {
  final List<int> nums = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
  ];
  print(searchTargetInList(
    target: 5,
    nums: nums,
  ));

  // Implementation of Binary Search on a Singly
  // Linked List Using Dual Pointers
  // https://www.ijcsit.com/docs/Volume%205/vol5issue02/ijcsit20140502215.pdf
  // Initialize the head of the list
  Node? head = null;

  // Create new nodes and add them to the list
  nums.forEach((int value) {
    // generate Node object
    final newNode = Node(value: value);

    // link the nodes
    if (head == null) {
      // The list is empty, so the new node is the head of the list
      head = newNode;
    } else {
      // The list is not empty, traverse the list to find the last node
      Node temp = head!;
      while (temp.next != null) {
        temp = temp.next!;
      }
      // Now temp points to the last node, link the new node
      temp.next = newNode;
    }
  });
  print(searchTargetInLinkedList(target: 5, startNode: head, endNode: null));
}

bool searchTargetInList({required int target, required List<int> nums}) {
  if (nums.length == 0) return false;
  final int left = 0;
  final int right = nums.length - 1;
  final int mid = (left + right) ~/ 2;
  if (nums[mid] == target)
    return true;
  else if (target < nums[mid])
    return searchTargetInList(target: target, nums: nums.sublist(0, mid));
  else
    return searchTargetInList(
        target: target, nums: nums.sublist(mid + 1, right));
}

bool searchTargetInLinkedList({
  required int target,
  required Node? startNode,
  required Node? endNode,
}) {
  if (startNode == null) return false;
  Node? slowPointer = startNode;
  Node? fastPointer = startNode.next;
  while (fastPointer != endNode) {
    fastPointer = fastPointer?.next;
    if (fastPointer != endNode) {
      slowPointer = slowPointer?.next;
      fastPointer = fastPointer?.next;
    }
  }
  final Node? midPointer = slowPointer;
  if (midPointer?.value == target)
    return true;
  else if (target < midPointer!.value)
    return searchTargetInLinkedList(
      target: target,
      startNode: startNode.next,
      endNode: midPointer,
    );
  else
    return searchTargetInLinkedList(
      target: target,
      startNode: midPointer.next,
      endNode: endNode,
    );
}
