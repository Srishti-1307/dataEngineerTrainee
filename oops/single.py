class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def display(self):
        print(f'{self.name} is {self.age} years old')


class Dept(Student):

    def __init__(self, name, age, dept):
        super().__init__(name, age)
        self.dept = dept

    def print(self):
        print(f'{self.name} works in {self.dept}')



s1 = Student('Alice', 14)
s1.display()

s2 = Dept('Bob', 15, 'chemistry')
s2.display()
s2.print()