'''
Create a base class Vehicle, with common attributes like plate_no, fuel_type.
Inherit Truck and Van from Vehicle.
Override the is_overloaded() method for each type.
'''


class Vehicle:
    tank = 100
    def __init__(self, plate_no, fuel_type, fuel):
        self.fuel = fuel
        self.plate_no = plate_no
        self.fuel_type = fuel_type

    def is_overloaded(self):
        if self.fuel > self.tank:
            print('Capacity full!!')
        else:
            print('Thanks for visting')




class Truck(Vehicle):
    wt = 500

    def __init__(self, plate_no, fuel_type,fuel, weight):
        super().__init__(plate_no, fuel_type, fuel)
        self.weight = weight

    
    def is_overloaded(self):
        if self.weight > self.wt:
            print('Truck is overloaded!!')
        else:
            print('Thanks for visting')


obj = Truck(201, 'Ethanol', 500, 700)
obj.is_overloaded()