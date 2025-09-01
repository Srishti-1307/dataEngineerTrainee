from abc import ABC, abstractmethod

class Shape(ABC):

    @abstractmethod
    def area(self):
        pass


class Circle(Shape):

    def area(self, r):
        return 3.14*r*r
    

class Rectangle(Shape):
    def area(l, b):
        return l*b



# s1 = Shape()            # you cannot create an object of an abstract class.

c1 = Circle()
print(c1.area(3))


print(Rectangle.area(2,3))