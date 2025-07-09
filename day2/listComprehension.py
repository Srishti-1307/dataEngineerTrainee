#list comprehension: is a way to create new lists based on existing iterables

comprehendList= [i for i in range(1,11)]
print([i for i in range(1,11)])



fruits = ["apple", "banana", "cherry", "kiwi", "anaar"]
#creating a newList that will contain those fruits that starts with a 
newList= [x for x in fruits if x.startswith('a')]
print(newList)



num=[1,2,3,4,5,6]
evenOddList= ['Even' if x%2==0 else 'odd' for x in num]
print(evenOddList)


#
l=[1,4,9,16,25,36,49,64,81]
evenSquare= [x for x in l if (lambda x:x%2==0)(x)]
oddSquare= [x for x in l if (lambda x:x%2!=0)(x)]
print(evenSquare)
print(oddSquare)





#map function                                  map(fun, iterable)
s=['1', '2', '3', '4']
result= map(int, s)
print(list(result))