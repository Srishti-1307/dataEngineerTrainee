import multiple


class City(multiple.Employee):

    def __init__(self, name, post, salary, amt, city):
        self.city = city
        multiple.Employee.__init__(self, name, post, salary, amt)

    def func(self):
        print(f"{self.name} lives in {self.city}")


obj1 = City('Srishti', 'Artist', 30000, 1000, 'Indore')
obj1.func()
obj1.display()