'''
Lambda function: function without a name.
lambda x: expression
'''

name= 'sunflower'
# names= ['a', 'b', 'c', 'd', 'e']

y= lambda x:x.upper()
print(y(name))

#lambda with Condition Checking
z= lambda x: "positive" if x>0 else "negative" if x<0 else "equal to zero"
print(z(1))
print(z(-1))
print(z(0))


#lambda function to check if a number is even or odd
checkEven= lambda x:"even" if x%2==0 else "odd"
print(checkEven(100))


#lambda function with more than 1 arguments
exp= lambda x,y,z: x+2*y-z
print(exp(2,3,2))