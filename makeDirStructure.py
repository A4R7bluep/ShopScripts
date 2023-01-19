'''
ROSS GIBSON
'''

errored = False

try:
    import os
except ImportError:
    print("Can't import os")
    errored = True

try:
    import os.path as path
except ImportError:
    print("Can't import os.path")
    errored = True

try:
    import datetime
except ImportError:
    print("Can't import datetime")
    errored = True

try:
    import getpass
except ImportError:
    print("Can't import getpass")
    errored = True

try:
    import shutil
except ImportError:
    print("Can't import shutil")
    errored = True

if errored:
    print("Dependancies not met")
    print("Needed: os, datetime, getpass, shutil")
    print("Try: pip install os datetime getpass shutil")

else:

    '''
    ==========================
    Important Variables
    ==========================

    date: date object; used to access other date functions

    daynum: the number corresponding to the day in days list

    fullDate: the date in month/day/year format; ex. 12/07/20

    datelist: the list containing the splited values of month, day, and year from fullDate

    days: list containing weekdays Monday - Friday

    weekendingFolder: the final name of the week ending folder; ex. we03_15_21

    user: the current user according to their folder in C:/Users

    pathToDirectory: string containing where the file structure will be placed
    '''

    date = datetime.datetime.today()
    daynum = date.weekday()
    fullDate = date.strftime("%D")
    datelist = fullDate.split("/")
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    weekendingFolder = f"we{datelist[0]}_{int(datelist[1]) + (len(days) - daynum - 1)}_{datelist[2]}"

    user = getpass.getuser()

    pathToDirectory = ""

    # Sets pathToDirectory and asks if the user wants to create a config file at C:/Users/NAMEOFUSER/; NAMEOFUSER is the current user; see user variable
    if not path.exists(f"C:/Users/{user}/makeDirConf.txt"):
        pathToDirectory = input("Input path to directory in which you want your structure made: ")
        choice = bool(input('Do you want this script to remember your path? "True" or "False": '))
        if choice:
            rememberFileWrite = open(f"C:/Users/{user}/makeDirConf.txt", "w")
            rememberFileWrite.write(pathToDirectory)
            rememberFileWrite.close()

    # Reads the path to make the folders in from makeDirConf.txt in C:/Users/NAMEOFUSER/; NAMEOFUSER is the current user; see user variable
    elif path.exists(f"C:/Users/{user}/makeDirConf.txt"):
        rememberFileRead = open(f"C:/Users/{user}/makeDirConf.txt", "r")
        inLine = rememberFileRead.readline()
        rememberFileRead.close()
        if inLine != ("" or "\n"):
            pathToDirectory = inLine
            print(f'pathToDirectory is {pathToDirectory}')
        print("path imported from makeDirConf.txt")

    # Makes the directory structure
    if path.exists("C:/Users/" + user + "/Downloads/WLTemplate.docx"):
        if pathToDirectory != "":
            os.chdir(pathToDirectory)
            os.makedirs(weekendingFolder)
            os.chdir(weekendingFolder)

            shutil.copy("C:/Users/" + user + "/Downloads/WLTemplate.docx", os.getcwd())

            os.makedirs("ALE")
            os.makedirs("PROG")
            os.chdir("PROG")

            for i in range(daynum, len(days)):
                os.makedirs(days[i])
            print("Made files")
    else:
        print(f"file: C:/Users/{user}/Downloads/WLTemplate.docs does not exist\n")

input("ENTER")
