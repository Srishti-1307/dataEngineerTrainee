class student:
    def __init__(self):
        self.name = 'name'
        self.age = 100

    def __str__(self):
        return f" {self.name}, {self.age}"

    
obj = student()
obj.name = 'Srishti'
print(obj.age)
obj.age = 20
print(obj)
obj.gender = 'F'                               # attributes can be declared outside the class too.  
print(obj.gender)