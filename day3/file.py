# OPEN   open(name, mode)


# read
# if file does not exist; an error is raised

with open('day3/notes.txt', 'r') as file1:           # read-only
    content1 = file1.readline()
    print(content1)
    print(file1.readline())

# with open() as method automatically handles closing the file once the block of code is exited, even if an error occurs. 



# Handling Exceptions When Closing a File
try:
    fileT= open('day3/notes.txt','r')
    contentT= fileT.read()
    print(contentT)
finally:
    fileT.close()



# reading line by line using for loop
with open('day3/notes.txt', 'r') as f:
    for i in f:
        print(i)




file2= open('day3/notes.txt','rb')                # read-only in binary mode
content2 = file2.read()
print(content2)
file2.close()




# write  
# If the file exists, its content is erased. If it doesn't exist, a new file is created.


file3= open('day3/creatednotes.txt', 'w')             # creatednotes.txt is already existing file
file3.write('hello world')
file3.close()


with open('day3/creatednotes2.txt', 'w') as file4:        # creatednotes2.txt does not exist 
    file4.write('hello people! how you doin?')
     


# Writing to a File in Append Mode 
# at the end of the file without erasing its existing content.
file5= open('day3/creatednotes.txt', 'a') 
file5.write('\nABCDefg1234')
file5.close()



#exclusive - creation mode
with open('day3/exclusivelyCreatedFile.txt', 'x') as file6:
    file6.write('Hey from Srishti')





#Deletion
import os
# os.remove('day3/exclusivelyCreatedFile.txt')

# -------------------------OR--------------------------------

if os.path.exists('day3/exclusivelyCreatedFile.txt'):
    os.remove('day3/exclusivelyCreatedFile.txt')
else:
    print('File does not exist!')


# To delete an entire folder, use ------>  os.rmdir('folder name') 
# PS: Note- You can only remove empty folders.