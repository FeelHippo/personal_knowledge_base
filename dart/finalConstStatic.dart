// https://news.dartlang.org/2012/06/const-static-final-oh-my.html


void main() {
  // "final" means single-assignment: a final variable or field *must* have an initializer.
  // the value of VARIABLE "readyOrNot" once assigned, cannot be changed
  final bool readyOrNot;
  assert(Car.turnOnEngine(), Car.malfunction);

  readyOrNot = true;
  try {
    // Once assigned a value, a final variable's value cannot be changed. final modifies *variables*.
    readyOrNot = false; // Error: Final variable 'readyOrNot' might already be assigned at this point.
  } catch(e) {
    print(e.toString());
  }

  // "const" has a meaning that's a bit more complex and subtle in Dart.
  // const modifies *values*. You can use it when creating collections, like const [1, 2, 3],
  // and when constructing objects (instead of new) like const point = Point(2, 3).
  // Here, const means that the object's entire deep state can be determined entirely at compile time
  // and that the object will be frozen and completely immutable.
  const List<int> list = [1, 2, 3];
  const carInstance = Car();

  list = [...list, 4]; //  Error: Can't assign to the const variable 'list'
}

// "static" means a member is available on the class itself instead of on instances of the class.
// That's all it means, and it isn't used for anything else. static modifies *members*.
// https://medium.com/@yetesfadev/mastering-static-in-flutter-and-dart-3bd21a60fa48
class Car {
  const Car();

  static int numberOfWheels = 4;

  static bool turnOnEngine() {
    print('Brooom!');
    return true;
  }

  static String malfunction = "Engine failure.";
}