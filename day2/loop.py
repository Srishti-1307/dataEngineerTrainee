#Frequency count
l=['a', 'b', 'a', 'd', 'f', 'f', 'd', 'a']
checklist= []

for i in l:
    if i not in checklist:
        count=0
        for j in l:
            if i==j:
                count+=1
        print(i, count)
        checklist.append(i)
    


#most frequent element?
mostFreq= l[0]
freqCount= 1
for i in l:
    count=0
    for j in l:
        if i==j:
            count+=1
    if count>freqCount:
        freqCount=count
        mostFreq= i

print(mostFreq,"--->" ,freqCount)



    
#highest element
l1= [12,13,44,3,54,17,49,54]

largest= l1[0]
for i in l1:
    if i>=largest:
        largest=i
print(largest)



#smallest element
smallest=l1[0]
for j in l1:
    if j <= smallest:
        smallest=j
print(smallest)


#second highest
max1=max2= 0
for n in l1:
    if n>max1:
        max2=max1
        max1=n
    elif n>max2 and n!=max1:
        max2=n
print(max2)





#find sum of digit 
num=123 
#expected output= 1+2+3= 6
nStr= str(num)
l123=[]
print(nStr)
for k in nStr:
    l123.append(k)
print(l123)