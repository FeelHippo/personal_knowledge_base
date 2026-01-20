import 'dart:collection';
main() {
  // What is a Map?
  // A Map is an associative container, mapping keys to values.
  // Keys are unique, and can point to one and only one value.
  // A key cannot be null, but a value can be null.

  // Map Literals
  var literal = {'1': 'John Smith', '2': 'Alice Jones'};
  print('Map Literals ${literal.runtimeType}');
  // map literals must maintain insertion order.
  // This means that "literal" is an instance of LinkedHashMap

  // Factory constructors
  var factory = new Map();
  print('Factory constructors ${factory.runtimeType}');
  // The Map class is abstract, which means the factory constructor actually creates an instance of a subclass of Map.
  // So what is the actual type of "factory? It creates an empty [LinkedHashMap]

  // LinkedHashMap (or, InsertionOrderedMap)
  // A LinkedHashMap iterates through keys and values in the same order they were inserted.
  var ordered = new LinkedHashMap();
  ordered['1'] = 'First';
  ordered['2'] = 'Second';

  for (var key in ordered.keys) {
    print('LinkedHashMap $key');
  }

  // SplayTreeMap
  var splay = new SplayTreeMap();
  // a self-balancing binary search tree with the additional property that recently accessed elements are quick to access again.
  // It performs basic operations such as insertion, look-up and removal in O(log(n)) amortized time.
  // A SplayTreeMap requires that all keys are of the same type.
  // A splay tree is a good choice for data that is stored and accessed frequently, like caches.
  // The reason is that they use tree rotations to bring up an element to the root for better frequent accesses.
  // The performance comes from the self-optimization of the tree. That is, frequently accessed elements are moved nearer to the top.
  // If however, the tree is equally often accessed all around, then there's little point of using a splay tree map.
  print('SplayTreeMap ${splay.runtimeType}');

}