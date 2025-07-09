#match is similar to switch

day= "monday"

match day:
    case "monday":
        print('monday')
    case 3:
        print('wednesday')
    case 7:
        print('Sunday')
    case _:                                   #default case
        print('holiday')


month= 7

match month:
    case "1" | "3"| 5| 7| 8| 10| 12:
        print('has 31 days!')
    case 2| 4| 6| 9| 11:
        print("don't have 31 days")