class Job:
    def __init__(self, post, salary):
        self.post = post
        self.salary = salary
    
    def display(self):
        print(f"{self.post} offers {self.salary} LPA")


class Account:
    def __init__(self, amt):
        self.amt = amt

    def print(self):
        print(f"You cannot keep {self.amt} in your account")


class Employee(Job, Account):
    def __init__(self, name, post, salary, amt):
        self.name = name
        Job.__init__(self, post, salary)
        Account.__init__(self, amt)

    def emp(self):
        print(f'Hello {self.name}, {self.post}')



# creating objects
obj1 = Employee('Srishti', 'Aeronautics', 50000, 2000)
obj1.display()
obj1.print()
obj1.emp()
