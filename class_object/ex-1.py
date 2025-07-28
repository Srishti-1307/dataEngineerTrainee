# Define a Truck class with attributes: location, load_capacity, driver.

class Truck:
    wt = 1000

    def __init__(self, location, load_capacity, driver):
        self.location = location
        self.load_capacity = load_capacity
        self.driver = driver

    def func(self):
        print(f"{self.driver} runs a Truck of {self.load_capacity} kg in {self.location}")



    def is_overloaded(self, current_weight):
        if current_weight > self.load_capacity:
            print(f"Truck at {self.location} is overloaded!")
        else:
            print(f"Truck at {self.location} is not overloaded!")


# creating objects
t1 = Truck('Banglore', 900, 'Rohan')
t1.func()
print(t1.location)
print(t1.load_capacity)
t1.is_overloaded(1000)
print('------------------------------------------------------------------------')


t2 = Truck('Chennai', 850, 'Sohan')
t2.func()
print(t2.location)
print(t2.load_capacity)
t2.is_overloaded(750)
print('------------------------------------------------------------------------')



t3 = Truck('Mumbai', 1200, 'Neha')
t3.func()
print(t3.location)
print(t3.load_capacity)
t3.is_overloaded(1250)
print('-----------------------------------------------------------------------')