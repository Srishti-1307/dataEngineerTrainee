import json

# JSON string
emp = '{"id":"09", "name": "Nitin", "department":"Finance"}'
print(type(emp))

# Convert json string to dict
d = json.loads(emp)
print(type(d))




dic = {'id': '09', 'name': 'Nitin', 'department': 'Finance'}

# Convert dict to json string
empJson= json.dumps(dic, indent=4)
print(type(empJson))





# ----------------------------------------- Reading json -----------------------------------------
with open('day3/file.json', 'r') as f:
    content= json.load(f)
    print(content)



try:
    with open('day3/file2.json', 'r') as f:
        content= json.load(f)
        print(content)
except FileNotFoundError:
    print('FIle not found error')



# ----------------------------------- Writing to json ---------------------------------------------
myData= {'courses':['math', 'science', 'literature', 'geography']}
with open('day3/file.json', 'w')as fp:
    json.dump(myData, fp, indent=4)
print('data updated')




# ---------------------------------Appending to json -----------------------------------------------

# Directly using json.dump() with 'a' mode leads to an invalid JSON structure
# So instead of using 'a' mode I must follow: read, modify, write as below-


# creating data.json exclusively; using try-except for error handling
try:
    with open('day3/data.json','x') as fx:
        json.dump([{"name": "Alice", "age": 25, "city": "New York"}], fx, indent=4)
except FileExistsError:
    print('data.json already exist')


# I want to append below newData at the end of existingData
newData = {"name": "Charlie", "age": 40, "city": "Chicago"}

#
# read data.json
with open('day3/data.json', 'r') as fr:
    existingContent = json.load(fr)

# modifying (assuming it's a list of dictionaries)
if isinstance(existingContent, list):
    existingContent.append(newData)
else:
    print("warning! json wasn't a list")
    existingContent= [existingContent, newData]     # Append as a new list item

# isinstance() function in Python is a built-in function used to determine if an object is an instance of a specified class ----> isinstance(object, classinfo)



# write (overwrite existingContent)
with open('day3/data.json', 'w') as fw:
    json.dump(existingContent, fw, indent=4)

