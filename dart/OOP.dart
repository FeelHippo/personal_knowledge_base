import 'dart:io';

// There are 4 basic principles that make a language Object Oriented.
// These are:
//   - Encapsulation,
//   - Data Abstraction,
//   - Polymorphism,
//   - Inheritance.

// ENCAPSULATION + INHERITANCE + POLYMORPHISM + ABSTRACTION

// Encapsulation is the mechanism of hiding of data implementation by restricting access to public methods.
// Instance variables are kept private and accessor methods are made public to achieve this.

// Inheritance expresses “is-a” and/or “has-a” relationship between two objects.
// Using Inheritance, in derived classes, we can reuse the code of existing super classes.
// the concept of “is-a” is based on class inheritance (using extends) or interface implementation (using implements).

// Polymorphism means one name many forms. It is further of two types — static and dynamic.
// Static polymorphism is achieved using method overloading and dynamic polymorphism using method overriding.
// It is closely related to inheritance.

// Abstract means a concept or an Idea which is not associated with any particular instance.
// Using abstract class/Interface we express the intent of the class rather than the actual implementation.
abstract class PersonInterface {
  void formatPersonalData();
  void promptUserData();
}

// a mixin is a way to reuse code in multiple classes without using inheritance.
mixin Console {
  void log(String message) {
    print(message);
  }
}


// The “implements” keyword is used for implementing interfaces in Dart. 
// An interface defines a contract that classes can adhere to by implementing its methods
class Person with Console implements PersonInterface {
  Person({
    required String fullName,
    required int age,
  }) {
    this._fullName = fullName;
    this._age = age;
  }

  // Unlike Java, Dart doesn’t have the keywords public, protected, and private.
  // If an identifier starts with an underscore _, it’s private to its library.
  // identifiers that start with an underscore _ are visible only inside the **library**
  late String _fullName;
  late int _age;

  String get storedFullName => this._fullName;
  int get storedAge => this._age;

  @override
  void formatPersonalData() {
    log('$_fullName: $_age');
  }

  @override
  void promptUserData() {
    stdout.writeln('Type the full name');
    final String? fullNameStdin = stdin.readLineSync();
    stdout.writeln('Type the age as integer');
    final String? ageStdin = stdin.readLineSync();
    this._fullName = fullNameStdin ?? '';
    this._age = int.parse(ageStdin ?? '0');
  }
}

// the “extends” keyword is used to create a class that inherits properties and behaviors 
// from another class, referred to as the superclass
class Italian extends Person {
  Italian({required super.fullName, required super.age});

  @override
  void formatPersonalData() {
    this.promptUserData();
    log('Mamma mia, Ciao! ${this.storedFullName}: ${this.storedAge}');
  }
}

void main() {
  Italian(fullName: 'Filippo Miorin', age: 40)
    ..formatPersonalData();
}

// https://medium.com/@cancerian0684/what-are-four-basic-principles-of-object-oriented-programming-645af8b43727
