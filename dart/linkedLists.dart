// A LinkedList is a linear data structure where each element is a separate object called a node.
// Each node contains two fields: one for data and one for the reference to the next node.
// The first node is called the head. If the LinkedList is empty, the head is a null reference.

class Node {
  Node({
    required this.value,
    this.next,
  });

  final int value;
  Node? next;

}

void main() {
  // Initialize the head of the list
  Node? head = null;

  // Create new nodes and add them to the list
  [2, 6, 7, 1, 5, 8, 3, 9, 4, 6, 7, 1, 5].forEach((int value) {
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
  
  Operations.printHead(head);

  // remove element '6' from the list
  Node? headWithoutElement = Operations.removeElements(head, 6);
  if (headWithoutElement != null) {
    print('Removed element, new list: ');
    Operations.printHead(headWithoutElement);
  }

  // sort the list
  Node bubbleSortedList = Operations.bubbleSort(head!, Operations.linkedListLength(head!));
  print('Result of sort operation: ');
  Operations.printHead(bubbleSortedList);

  // remove duplicates from the list
  Node? uniqueElements = Operations.deleteDuplicates(bubbleSortedList);
  if (uniqueElements != null) {
    print('Remove duplicate element, new unique list: ');
    Operations.printHead(uniqueElements);
  }
}

class Operations {
  // utilities
  static void printHead(Node? head) {
    // print the list
    Node? temp = head;
    String listString = '';
    if (temp != null) {
      while (temp != null) {
        listString += temp.value.toString() + ' ';
        temp = temp.next;
      }
      print('Generated linked list: $listString');
    }
  }
  static int linkedListLength(Node head) {
    int length = 0;
    Node temp = head;
    while (temp.next != null) {
      length++;
      temp = temp.next!;
    }
    return length;
  }
  // Given the head of a linked list and an integer val,
  // remove all the nodes of the linked list that has Node.val == val, and return the new head.
  static Node? removeElements(Node? head, int val) {
    if (head == null) {
        return null;
    }
    Node? newHead;
    // iterate over the provided linked list
    while (head?.next != null) {
        // when the current value is not equal to the one to discard
        if (head!.value != val) {
            final Node newNode = Node(value: head.value);
            // if the new head is null, initialize it
            if (newHead == null) {
                newHead = newNode;
            // otherwise, reach the end of the new linked list
            // which does not contain the value to discard
            // and add a new node at the end, with the current value
            } else {
                Node temp = newHead;
                while (temp.next != null) {
                    temp = temp.next!;
                }
                temp.next = newNode;
            }
        }
        head = head.next;
    }
    return newHead;
  }
  static Node bubbleSort(Node head, int length) {
    int iteration = 0;
    bool swapped = false;

    // iterate over the whole linked list
    // https://github.com/FeelHippo/JavascriptNinjaSkills/blob/9455d3f38bab21727cb10e0d87251b83f5c6959d/interviewQuestions.dart#L30
    while (iteration < length) {
      // the traversing node, starts from head every iteration
      // e.g. [6, 2, 4, 7] => 6
      Node traverseNode = head;
      // the current node, relates to iteration
      // e.g. [6, 2, 4, 7] => 6
      Node currentNode = head;

      // traverse the entire linked list 
      // https://github.com/FeelHippo/JavascriptNinjaSkills/blob/9455d3f38bab21727cb10e0d87251b83f5c6959d/interviewQuestions.dart#L31
      while (traverseNode.next != null) {
        // Temporary pointer to store traverseNode's next node
        // e.g. [6 (== traverseNode), 2 (== nextNode), 7]
        Node nextNode = traverseNode.next!;
        // if current value > next value => swap
        // https://github.com/FeelHippo/JavascriptNinjaSkills/blob/9455d3f38bab21727cb10e0d87251b83f5c6959d/interviewQuestions.dart#L32
        // e.g. if (6 > 2) => true
        if (traverseNode.value > nextNode.value) {
          // very fist iteration
          // e.g. 6 (== traverseNode) ==  head => true
          if (traverseNode == head) {
            // Performing swap operations and
            // updating the head of the linked list:

            // e.g. 6.next = 7
            traverseNode.next = nextNode.next;
            // e.g. 2.next = 6
            nextNode.next = traverseNode;
            // e.g. currentNode == 6
            currentNode = nextNode;
            // e.g. head == 2
            head = currentNode;

            // e.g. result is [2, 6, 4, 7]
          } else {
            // Performing swap operation
            // e.g. traverseNode == 6, nextNode == 4
            // [2, 6, 4, 7]

            // e.g. 6.next = 7
            // swap traverseNode(high value) with nextNode(low value)
            traverseNode.next = nextNode.next;
            // e.g. 4.next = 6
            nextNode.next = traverseNode;
            // prepare next iteration. currentNode was 6 from [2, 6, 4, 7]
            // at next iteration, current == 4 will be compared with next == 7
            // e.g. 6.next = 4
            currentNode.next = nextNode;
            // e.g. currentNode == 4
            currentNode = nextNode;
          }
          // traverse node now is unchanged. e.g. 7, because we traverse the original head
          // at the next iteration, 4.next == null, and the loop will continue
          continue;
        }
        // elements were in order, so skip to next traverse element
        currentNode = traverseNode;
        traverseNode = traverseNode.next!;
      }
      iteration++;
    }
    return head;
  }
  // Given the head of a sorted linked list, delete all duplicates such that each element appears only once. 
  // Return the linked list sorted as well.
  static Node? deleteDuplicates(Node? head) {
    if (head == null || head.next == null) return head;
    // result linked list
    Node? newHead;
    // stores currently highest value in list
    int? currentHeadVal;
    // 1. iterate over the original head
    while (head != null) {
        // skip this node if the value has already been added to the result
        if (head.value != currentHeadVal) {
            // create a new node to add to newHead
            final newNode = Node(value: head.value);
            // if head has not been initialized
            // newNode will be the new head
            if (newHead == null) {
                newHead = newNode;
            } else {
                // otherwise, add newNode to the end of newHead
                Node temp = newHead;
                while (temp.next != null) {
                    temp = temp.next!;
                }
                temp.next = newNode;
            }
            currentHeadVal = newNode.value;
        }
        // 2. continue iteration over the original head
        head = head.next;
    }
    return newHead;
  }
}
