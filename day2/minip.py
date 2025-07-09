#Write a function to clean and transform tabular data

tab= {
    'empId': [101,102,103],
    'empName': ['SRishti', '   xyz', None],
    'city': ['losAngeles', None, 'California']
}


#below function removes whitespaces and replace null/None/empty values with 0
def cleanData(table):
    for values in tab.values():
        for i in values:
            if i == None or i == '' or i == 'null':
                indexOfI=values.index(i)
                i=0
                values.pop(indexOfI)
                values.insert(indexOfI,i)
            elif type(i)==str:
                indexOfI= values.index(i)
                i=i.strip()
                values.pop(indexOfI)
                values.insert(indexOfI,i)
    return table

res= cleanData(tab)
print(res)    
