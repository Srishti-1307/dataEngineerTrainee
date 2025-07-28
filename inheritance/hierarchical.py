class Animal:
    def __init__(self, type):
        self.type = type

    def display(self):
        print(self.display) 



class Cat(Animal):
    def __init__(self, type, color):
        self.color = color

    super().__init__(type)     

    def sound(self):
        print(f"Cat {self.type}, color {self.color} says meow-meow!") 



class Dog(Animal):
    def __init__(self, type, name):
        self.name = name

    super().__init__(type)

    def sound(self):
        print(f"Doggy {self.type}, named {self.name} says woof-woof!")        




# creating object

obj_cat = Cat('mammal', 'golden')
obj_cat.display()
obj_cat.sound()                                                                                 

obj_dog = Dog('mammal', 'goldy')
obj_dog.display()
obj_dog.sound()  