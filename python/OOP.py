from abc import ABC, abstractmethod
# There are 4 basic principles that make a language Object Oriented.
# These are:
#   - Encapsulation,
#   - Data Abstraction,
#   - Polymorphism,
#   - Inheritance.

class _PrivateClass(ABC):
    # Encapsulation is the mechanism of hiding of data implementation by restricting access to public methods.
    # Instance variables are kept private and accessor methods are made public to achieve this.
    def __init__(self, age: int):
        self.__age = age

    def _private_method_get_age(self):
        return self.__age

    def _private_method_birthday(self):
        self.__age = self.__age + 1

    def public_method_change_age(self, age: int):
        self.__age = age

    def public_method_happy_birthday_to_you(self):
        print('Happy Birthday! Your age is: ', self.__age)

    @property
    @abstractmethod
    def public_method_to_be_inherited_via_polymosphism(self):
        pass

# Inheritance expresses “is-a” and/or “has-a” relationship between two objects.
# Using Inheritance, in derived classes, we can reuse the code of existing super classes.
# the concept of “is-a” is based on class inheritance (using extends) or interface implementation (using implements).
class InheritedClass(_PrivateClass):
    def __init__(self, name: str, age: int):
        super().__init__(age)
        self.__name = name
# Polymorphism means one name many forms. It is further of two types — static and dynamic.
# Static polymorphism is achieved using method overloading and dynamic polymorphism using method overriding.
# It is closely related to inheritance.
    # https://www.geeksforgeeks.org/python/abstract-classes-in-python/
    @property
    def public_method_to_be_inherited_via_polymosphism(self):
        print(self._private_method_get_age())
        return

inherited_class = InheritedClass('Filippo', 40)