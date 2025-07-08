#Python has a set of built-in methods that you can use on strings.

print('srishti'.capitalize())                 #first letter of the string
print('hello world'.title())                         #first letter of each word  of string
print("SrisHTi".casefold())                    #Converts string into lower case
print("srISHti".upper())
print("SRISHTI".lower())
print('Srishti Pare'.swapcase())            #Swaps! lower case becomes upper case and vice versa
print('     gfgh jhg  kiyhkyku   ukyhk      '.strip())     #removes space from begining and end 
print('hello world how are you'.split())            #returns a list; takes whitespace as default for sep
print('hello world'.replace('world', 'people'))   



txt='my api key is MX349U677R001E2XZ7'
print(txt.encode())


print('abcder45'.isalpha())
print('abcder45'.isalnum())
print('abcder45'.isdigit())
print('aBCDer45'.islower())
print('     '.isspace())

print('**'.join(('apple','mango','banana')))