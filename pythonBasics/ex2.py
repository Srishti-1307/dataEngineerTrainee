#Create a function to extract domains from a list of emails

email= input('enter your email address: ')


for i in email:
    if i=='@':
        c=email.index(i)
        break

print(email[c:])


