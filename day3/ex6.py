#  Try reading a non-existent file and catch the error gracefully.

try:
    with open('hjfjhg.txt', 'r') as f:
        content = f.read()
except FileNotFoundError:
    print("File not Found!")