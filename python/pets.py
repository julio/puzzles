class Dog:
    """ A simple dog class """

    def __init__(self, name):
        self._name = name
        
    def speak(self):
        return "Woof!"

def pet(pet="dog"):
    """ The factory method """

    pets = dict(dog=Dog("Hope"))
    return pets[pet]

print(pet("dog").speak)
