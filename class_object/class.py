class car:
    color = 'red'

Toyota = car()
print(Toyota.color)




class book:
    genre = 'fictional'
    def __init__(self, price):
        self.price = price

hp = book(600)
print(hp.price)   




'''
class book: Defines a class 'book'
genre: A class attribute shared by all instances of the class.
__init__ method (Constructor): Initializes 'price' attribute when a new object is created. The first argument of                                this method must always be self,
'''


# self refers to the current object instance. self is not a keyword; you can instead use any other word like-'this'/'srish'


class student:
    std = 'X'
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def fun(self):
        print(f"{self.name} is {self.age} years old")


s1 = student('Srishti', 20)
s1.fun()






# Every object created from a class will have its own self.
class checkid:
    def __init__(srish):
        print(f"{id(srish)}")

obj = checkid()
print(id(obj))

obj2 = checkid()
print(id(obj2))





# Modifying the State of an Object
class Counter:
    count = 0
    # def __init__(self):
    #     pass

    def increment(self):
        self.count += 1

    def decrement(self):
        self.count -=1

    def get_count(self):
        print(self.count)        


counter = Counter()
counter.increment()
counter.increment()
counter.increment()
counter.decrement()
counter.get_count()

print(Counter.count)
print(counter.count)