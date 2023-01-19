import os
import shutil
import datetime
import getpass
import os.path as path


mode = str.upper(input("Which mode do you want to use? All or Week?: "))
#source = input("Input source directory: ")
#destination = input("Input destination directory: ")

date = datetime.datetime.today()
daynum = date.weekday()
days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
deltaDate = date + datetime.timedelta(days=(len(days) - daynum - 1))
weekEndingDate = datetime.datetime.strftime(deltaDate, "%m,%d,%y").split(",")
weekendingFolder = f"we{weekEndingDate[0]}_{str(weekEndingDate[1])}_{weekEndingDate[2]}"

user = getpass.getuser()

# Sets source and asks if the user wants to create a config file at C:/Users/NAMEOFUSER/; NAMEOFUSER is the current user; see user variable
if not path.exists(f"C:/Users/{user}/backupV2Conf.txt"):
    source = input("Input source directory: ")
    destination = input("Input destination directory: ")
    choice = bool(
        input('Do you want this script to remember your paths? "True" or "False": '))
    if choice:
        rememberFileWrite = open(f"C:/Users/{user}/backupV2Conf.txt", "w")
        rememberFileWrite.write(source + "\n")
        rememberFileWrite.write(destination)
        rememberFileWrite.close()

# Reads the path to make the folders in from backupV2Conf.txt in C:/Users/NAMEOFUSER/; NAMEOFUSER is the current user; see user variable
elif path.exists(f"C:/Users/{user}/backupV2Conf.txt"):
    rememberFileRead = open(f"C:/Users/{user}/backupV2Conf.txt", "r")
    #contents = rememberFileRead.read()
    source = rememberFileRead.readline().split("\n")[0]
    destination = rememberFileRead.readline()
    rememberFileRead.close()
    print(f'source is {source}')
    print("path imported from backupV2Conf.txt")

print(weekendingFolder)
print(source)
print(destination)

match mode:
    case "all":
        pass

    case "week":
        pass
