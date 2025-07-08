l= [13,7,2,0,0,3]
fruits= ['apple', 'banana', 'orange', 'grapes', 'pineapple']
print(l)

print(l[0])

#lists are mutuable
l[0]= 100
print(l)




#-----------------------LIST METHODS-----------------------------

l.append(22)           #appends at last
print(l)

l.insert(0,22)        #insert(index, value)
print(l)



l.pop()          #pops the last element
print(l)

l.remove(22)     #removes the first occurence of specified element
print(l)



c=l.count(0)
print(c)

i= l.index(0)         #returns index of first occurence of specified element
print(i)


l.sort()
print(l)

l.reverse()
print(l)




f1= fruits.copy()
print(f1)


print(fruits)
fruits.clear()
print(fruits)


# l.extend(f1)
print(l)



''' methods common to all datatype
len
min
max
sum
sorted
'''

print(len(l))
print(min(l))
print(max(l))
print(sum(l))
print(sorted(l))