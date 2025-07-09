#Write a custom implementation of map() to transform a list of temperatures from Celsius to Fahrenheit.

temp= [32,35,28,41,17,27]                #temp in degree celsius
far= map(lambda x:x*9/5+32, temp)
print(list(far))
