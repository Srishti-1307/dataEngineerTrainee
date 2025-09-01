# public: data members & member functions are accessible from anywhere since they are present in the list returned by dir(obj1).

class publicClass:

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def displayAge(self):
        print(f"{self.name} is {self.age} years old")


obj1 = publicClass('srishti', 20)
print(dir(obj1))



# protected: accessible within the class where it is declared and its subclass. 
