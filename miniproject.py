# Question: Parse and clean a CSV-like string input 

strInput= input('enter a string: ')
specialChar=["@","-","_","%","!","<",">","(",")","*","&","^","+","=","#","$"]

for i in strInput:
    if i not in specialChar:
        print(i, end='')