# decorators modify or extend the behavior of functions, without changing their actual code.

# A decorator is a function that takes another function as an argument and returns a new function with enhanced functionality.



def simpleDecorator(func):
    # decorator

    def wrapper(a,b):
        # Inside the decorator, a nested function called wrapper is defined. This wrapper function contains the logic that will "decorate" the original function

        print("Before function")
        print(a+b)

        func()                              # calls original function
        print("After function")
    
    return wrapper



@simpleDecorator
def actual_func():
    # this is the function to be decorated.
    print("Hello, good morning!")


actual_func(5,4)






