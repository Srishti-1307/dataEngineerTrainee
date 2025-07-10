'''
Read a log file (text).
Count total errors ("ERROR") and warnings ("WARNING").
Save the summary in JSON format.
'''


log = """Error handling is an easy topic.\n It can be a warning to learn it in early stage.\n Error  must be avoided during cuz they may cause large Error in code.\n This is last warning.\n Error and warning counts to be find.\n error"""

try:
    with open('day3/log.txt', 'x') as fx:
        fx.write(log)
except FileExistsError:
    print('log.txt already exists')


with open('day3/log.txt', 'r') as fr:
    content= fr.read()

jsonResult= {'countError' : 0,
'countWarning' : 0}

for i in content.split(' '):
    if i.lower() == 'error':
        jsonResult['countError'] += 1
    elif i.lower() == 'warning':
        jsonResult['countWarning'] += 1

import json    
with open('day3/result.json', 'w') as fw:
    json.dump(jsonResult, fw, indent=2)

print('Result saved in result.json')