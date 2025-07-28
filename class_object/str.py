class magic:
    def __init__(self, name, occupation):
        self.name = name
        self.occupation = occupation

    def chh(self):
        return f"{self.name} is a {self.occupation}"
    


# creating object
obj1 = magic('abc', 'artist')
print(obj1)


# Without __str__,  print(obj1), would produce something like <__main__.Dog object at 0x00000123>.