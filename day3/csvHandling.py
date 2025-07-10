import csv



# ------------------------------------- READ ---------------------------------------------

with open('day3/test.csv', 'r') as f:
    content = csv.reader(f)              #  reads rows as lists of strings.
    # print(content)                           <_csv.reader object at 0x7f789385cf90>
    for i in content:
        print(i)


# Try csv.DictReader
with open('day3/test.csv', 'r') as fD:
    contentD = csv.DictReader(fD)            # reads rows as dictionaries, using the first row as keys
    for i in contentD:
        print(i)




# ------------------------------------- WRITE ------------------------------------------------

dataToInsert= [['prodId', 'prodName', 'qty', 'cost'], [101, 'Bornvita', 1, 350], [102, 'Dove conditioner', 3, 789], [103, 'hide & seek', 50, 1024]]
with open('day3/testWrite.csv', 'w') as fW:
    contentW = csv.writer(fW)
    contentW.writerows(dataToInsert)

# Try csv.DictWriter
dataToInsertAsDict= [
    {'Name': 'Alice', 'Age': 30, 'City': 'New York'},
    {'Name': 'Bob', 'Age': 24, 'City': 'London'},
    {'Name': 'Charlie', 'Age': 35, 'City': 'Paris'}
]
with open('day3/testWrite2.csv', 'w') as fWD:
    contentWD= csv.DictWriter(fWD, fieldnames=['Name', 'Age', 'City'])
    contentWD.writeheader()
    contentWD.writerows(dataToInsertAsDict)