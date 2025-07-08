d= {'name':'Srishti',
    'age':22,
    'city':'indore',
    'designation':'DE',
    (1,2,3):[4,5,6],
    'name': 'ram'}                     #name will be considered only once

#dict is mutable
#keys can be any datatypes except which are mutuable like dict, list and sets
#values can be any!

print(d.keys())        #list
print(d.values())      #list
print(d.items())       #list of tuples 

print(d['name'])
print(d.get('name'))
print(d.get('gfgsfh'))

d['name'] = 'sakshi'        #allowed
print(d)


d.update({'color':'pink'})
print(d)

p_pop=d.pop('age')
print(d)
print(p_pop)             #returns popped value 

p_popItem= d.popitem()                 #Removes and returns the last inserted key-value pair as a tuple.
# print(p_popItem)

dCopy= d.copy()
d.clear()

print(d)

l1=['empId', 'empName', 'empAge', 'empSalary']
new_dict= dict.fromkeys(l1, [101, 102, 103, 103])
print(new_dict)
