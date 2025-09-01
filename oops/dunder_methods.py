# __eq__
class Student:
    def __init__(self, name, roll_no):
        self.name = name
        self.roll_no = roll_no

    def __eq__(self, other):
        if self.name == other.name and self.roll_no == other.roll_no:
            return "Both Students are same"
        
        elif self.name == other.name and self.roll_no != other.roll_no:
            return "No... Actually  Both are different "
        
        else:
            return "Both are different"
        

s1 = Student('Srishti', 101)
s2 = Student('Srishti', 102)
print(s1==s2)





# __len__
class Fruits:
    def __init__(self, items):
        self.items = items

    def __len__(self):
        return len(self.items)
    
fruit_list = ['apple', 'banana', 'cheeku', 'Dragon-fruits']
f1 = Fruits(fruit_list)
print(len(f1))
