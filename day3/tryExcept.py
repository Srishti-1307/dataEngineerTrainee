'''
Some of the common Exception Errors are : 
IOError: if the file can't be opened
KeyboardInterrupt: when an unrequired key is pressed by the user
ValueError: when the built-in function receives a wrong argument
EOFError: if End-Of-File is hit without reading any data
ImportError: if it is unable to find the module
'''


try:
    x=3
    print(x/0)
except Exception as e:              #type of error that occurs
    print(e)



try:
    y='srishti'
    z=13
    print(y//z)
except Exception as e:
    print(e)



try:
    print('Srishti')
except Exception as e:
    print(e)
else:
    print('ok bye!')
# The code enters the else block only if the try clause does not raise an exception.



try:
    a=2
    b=3
    a/b
except ZeroDivisionError:
    print('Divided by zero')
else:
    print('did not entered except block')



try:
    a=2
    b=3
    a/b
except ZeroDivisionError:
    print('Divided by zero')
else:
    print('did not entered except block')
finally:
    print('Finally executed!')
# always executed after the try and except blocks.





'''
Common types of exceptions in Python:
KeyError
IndexError
NameError
AttributeError
ZeroDivisionError
ImportError
TypeError
ValueError
ArithmeticError
AssertionError
OverflowError
KeyboardInterrupt
SyntaxError
MemoryError
EOFError
Exception
FloatingPointError
IOError
LookupError
StopIteration
IndentationError
NotImplementedError
SystemExit
ModuleNotFoundError
'''