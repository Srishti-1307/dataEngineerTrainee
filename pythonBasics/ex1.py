#  Parse a string like "name:John, age:30, role:engineer" into a dictionary.


# str1= "name:john, age:30, role:engineer"

# str2= str1.split()
# print(str2)

# str3=[]
# for i in str2:
#     str3.append(i.split(':'))

# print(str3)

# strdict={}
# for i in str3:
#     key=i[0]
#     value=i[1]
#     strdict[key]=value

# print(strdict)



str1= "name:john, age:30, role:engineer"
strlist_commaSep= str1.split(',')

strlist_colonSep= []
for i in strlist_commaSep:
    strlist_colonSep.append(i.split(':'))

str_dict={}
for i in strlist_colonSep:
    key=i[0]
    value=i[1]
    str_dict[key]=value

print(str_dict)










#Convert list of such strings into a list of dictionaries.
listOfStrings= ["name:John, age:30, role:engineer", "name:Alice, age:32, role:system-engineer", "name:Bob, age:35, role:designer"]

listOfListOfString=[]
for i in listOfStrings:
    listOfListOfString.append(i.split(','))

print(listOfListOfString)

for i in listOfListOfString:
    temp=[]
    listDict={}
    li=[]
    for _ in i:
        temp.append(_.split(':'))
        for j in temp:
            key=j[0]
            value=j[1]
            listDict[key]=value
        
        li.append(listDict)
print(li)




