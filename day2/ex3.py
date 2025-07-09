'''
 Build a function clean_data(data_list) that:
-- Removes empty strings.	
-- Trims whitespace.
-- Converts numeric strings to integers.

'''



def clean_data(data_list):
    for i in data_list:
        #removing empty string
        if i=="":
            data_list.remove(i)

        else:
            #trimming  
            indexOfI= data_list.index(i)  
            i= i.strip()
            data_list.pop(indexOfI)
            data_list.insert(indexOfI,i)
    
            #numeric strings to integers
            if i.isdigit():
                indexOfNumericString= data_list.index(i)
                i=int(i)
                data_list.pop(indexOfNumericString)
                data_list.insert(indexOfNumericString,i)


    return data_list
        

inputList= ['srishti  ', '', 'Srishti.13', '1234', '  helloWorld', '']
result= clean_data(inputList)
print(result)        

   