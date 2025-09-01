'''
super() cannot access variables; can only access methods
super() cannot be used outside the class; can only be used inside child class
parent cannot access child class
'''



# using super() to call parent's function
class Phone:
    def __init__(self, type):
        self.type = type

    def display(self):
        print('Hello, You are  in parent class')


class smartphone(Phone):
    def display(self):
        print('Hello, You are  in child class')
        super().display()                                    


obj = smartphone('android')
obj.display()





# using super() to call parent's constructor
class Phone:
    def __init__(self, brand, type, price):
        self.brand = brand
        self.type = type
        self.price = price
        print('parent class constructor')



class smartphone(Phone):
    def __init__(self, brand, type, price, ram, camera):
        print('child class constructor')
        super().__init__(brand, type, price)
        self.ram = ram
        self.camera = camera


obj = smartphone('Apple', 'android', 90000, 12, 150)
print(obj.brand)
print(obj.price)