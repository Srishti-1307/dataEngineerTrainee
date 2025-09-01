from abc import ABC, abstractmethod


class Animal(ABC):
    @property
    @abstractmethod
    def species(self):
        pass


class Dog(Animal):
    def __init__(self, specie):
        self.specie = specie

    @property
    def species(self, new_specie):
        return self.specie
    
    @species.setter
    def species(self, new_specie):
        self.specie = new_specie
        return self.specie
    

    

d1 = Dog('canine')
print(d1.specie)
d1.species = 'Poodle'
print(d1.specie)
