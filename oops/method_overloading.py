class Shape:
    def area(self, r):
        return 3.14 * r * r
    
    def area(self, l, b):
        return l*b
    


obj = Shape()
obj.area(3)
obj.area(4,5)

# Python doesn't support method overloading



# below is a way to achieve method overloading
class Shape2:
    def area(self, a, b=0):                    # using default arguments
        if b == 0:
            return 3.14 * a * a
        else:
            return a * b
        
obj2 = Shape2()
print(obj2.area(3))
print(obj2.area(4,5))