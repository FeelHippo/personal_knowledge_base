/// https://dart.dev/language/constructors

// Default Constructor
// used when a constructor is not declared
class Something {
    Something() {
        print('Default to the rescue!');
    }
}

// Generative Constructor
// used to instantiate a class
// Constant Constructors
// used to produce an immutable object
class Person {
    const Person({ required this.name, required this.age});

    final String name;
    final int age;

    String get introduction => 'Yo Soy ${this.name}, ${this.age}';
}

// Named Constructor
// used to implement multiple constructors for a class
class Car {
    Car({ required this.brand, required this.isElectric });

    late String brand;
    bool isElectric;

    String get details => '${this.brand} is ${this?.isElectric ? null : 'not'} electric';

    Car.ice({ required String brand }) : isElectric = false {
        this.brand = brand;
    }
    Car.ev({ required String brand }) : isElectric = true {
        this.brand = brand;
    }
}

// Redirecting Constructors
// they have an empty body. 
// the constructor uses 'this' instead of the class name after a colon (:)
class LatLng {
  double lat, lng;

  String get capital => 'Meridian is located at $lat $lng';

  // The main constructor for this class.
  LatLng(this.lat, this.lng);

  // Delegates to the main constructor.
  LatLng.equator(double lng) : this(0, lng);
  
}

// Factory Constructors
// used to either
// return an existing instance from a cache instead of creating a new one, or a new instance of a subtype
// or
// perform non-trivial work prior to constructing an instance

class Logger {
    final String name;
    bool mute = false;

    // _cache is library-private, thanks to the _ in front of its name.
    static final Map<String, Logger> _cache = <String, Logger>{};

    // Factory constructors can't access this
    factory Logger({ required String name}) {
        return _cache.putIfAbsent(name, () => Logger._internal(name));
    }

    factory Logger.fromJson({ required Map<String, Object> json}) {
        return Logger(name: json['name'].toString());
    }

    Logger._internal(this.name);

    void log() {
        if (!mute) print('${this.name} ${_cache}');
    }
}

class Internal {
    String name;
    Internal.internal(this.name);
    String get thisName => this.name;
}

void main() {
    Something(); // Default to the rescue!
    final filippo = Person(name: "Filippo", age: 40);
    print(filippo.introduction); // Yo Soy Filippo, 40
    final toyota = Car.ice(brand: "Toyota");
    print(toyota.details); // Toyota is not electric
    final byd = Car.ev(brand: "BYD");  // BYD is null electric
    print(byd.details);
    final nullIsland = LatLng.equator(0); // Meridian is located at 0.0 0.0
    print(nullIsland.capital);
    final logger = Logger(name: 'UI')..log(); // UI {UI: Instance of 'Logger'}
    final loggerJson = Logger.fromJson(json: {'name': 'UX'})..log(); // UX {UI: Instance of 'Logger', UX: Instance of 'Logger'}
    final internal = Internal.internal('Filippo');
    print(internal.thisName); // Filippo
}