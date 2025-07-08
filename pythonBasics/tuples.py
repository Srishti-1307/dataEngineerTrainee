t= (1,2,3,5,5,6)
# tuples are immutable

#tuples also support indexing
print(t[-1])

#tuples are immutable
# t[0]= 12
print(t)

#therefore it doesn't even support append, insert, remove, delete, clear, pop methods
#it only  supports following 2 methods

print(t.count(5))
print(t.index(5))



''' methods common to all datatype
len
min
max
sum
sorted
'''

print(len(t))
print(min(t))
print(max(t))
print(sum(t))
print(sorted(t))