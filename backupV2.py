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


def copyH():
    pass

def copyG(mode, gPath, weekEndingFolder):
    if mode.upper() == "WEEK":
        # Prepare weekending folder to copy to
        os.chdir(gPath)
        
        if not path.exists(f"{gPath}/{weekEndingFolder}"):
            os.makedirs(weekEndingFolder)
        
        os.chdir(weekEndingFolder)

        # Copying the files
        if path.exists(f"{os.getcwd()}/PROG"):
            shutil.copy2(f"{cPath}/{weekEndingFolder}/PROG", os.getcwd())
        
        elif path.exists(f"{os.getcwd()}/WEB"):
            shutil.copy2(f"{cPath}/{weekEndingFolder}/PROG", os.getcwd())
        
        shutil.copy2(f"{cPath}/{weekEndingFolder}/WLTemplate.docx", os.getcwd())
        shutil.copy2(f"{cPath}/{weekEndingFolder}/ALE", os.getcwd())


if errored:
    print("Dependencies not met")
    print("Needed: os, datetime, shutil")
    print("Try: pip install os datetime shutil")
    print("ENTER")
    exit()

else:
    '''
    ==========================
    Important Variables
    ==========================

    date: date object; used to access other date functions

    daynum: the number corresponding to the day in days list

    days: list containing weekdays Monday - Friday

    weekEndingDate: the date in which the week ends, made so it continues to the next month if necessary

    weekendingFolder: the final name of the week ending folder; ex. we03_15_21

    weekType: week type, either WEB or PROG

    user: the current user according to their folder in C:/Users - DEPRECATED

    pathToDirectory: string containing where the file structure will be placed
    '''

    date = datetime.datetime.today()
    daynum = date.weekday()
    days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    deltaDate = date + datetime.timedelta(days=(len(days) - daynum - 1))
    weekEndingDate = datetime.datetime.strftime(
        deltaDate, "%m,%d,%Y").split(",")
    weekendingFolder = f"we{weekEndingDate[0]}_{str(weekEndingDate[1])}_{weekEndingDate[2]}"
    weekType = input("Is it a PROG week or a WEB week?: ")
    user = getpass.getuser()
    cPath = ""
    hPath = ""
    gPath = ""
    zPath = ""

    # Sets paths and asks if the user wants to create a config file at C:/Users/NAMEOFUSER/; NAMEOFUSER is the current user; see user variable
    if not path.exists(f"C:/Users/{user}/backupV2.txt"):
        cPath = input("Input path to year folder in C DRIVE: ")
        hPath = input("Input path to year folder in H DRIVE: ")
        gPath = input("Input path to year folder in G DRIVE: ")
        zPath = input("Input path to year folder in Z DRIVE: ")

        cPath += "\n"
        hPath += "\n"
        gPath += "\n"

        choice = bool(input('Do you want this script to remember your path? "True" or "False": '))
        if choice:
            rememberFileWrite = open(f"C:/Users/{user}/backupV2.txt", "w")
            rememberFileWrite.writelines([cPath, hPath, gPath, zPath])
            rememberFileWrite.close()

    # Reads the path to make the folders in from makeDirConf.txt in C:/Users/NAMEOFUSER/; NAMEOFUSER is the current user; see user variable
    elif path.exists(f"C:/Users/{user}/backupV2.txt"):
        rememberFileRead = open(f"C:/Users/{user}/backupV2.txt", "r")
        lines = rememberFileRead.readlines()
        rememberFileRead.close()
        if lines != ("" or "\n"):
            cPath = lines[0].strip()
            hPath = lines[1].strip()
            gPath = lines[2].strip()
            zPath = lines[3].strip()
            print(f'paths are {cPath}, {hPath}, {zPath}')
        print("path imported from backupV2.txt")
    
    copyG("week", gPath, weekendingFolder)

