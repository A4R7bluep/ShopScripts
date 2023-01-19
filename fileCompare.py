from xml.etree.ElementInclude import include


main = open(input("Input path to main file: "), "r")
compare = open(input("Input file to compare to main: "), "r")

singleCommentList = ["//", "#"]
openMultilineCommentList = ["/*", "<!--"]
closeMultilineCommentList = ["*/", "-->"]

def removeTabs(line):
    for char in line:
        if line.startswith("\t"):
            b = line[1:]
            line = b
    return line

def removeComments(line):
    openHitIndexes = []
    closeHitIndexes = []
    singleHitIndexes = []
    shortest = []
    currentIndex = 0
    for item in openMultilineCommentList:
        currentIndex = line.find(item)
        if currentIndex != -1:
            openHitIndexes.append([currentIndex, item])
    for item in closeMultilineCommentList:
        currentIndex = line.find(item)
        if currentIndex != -1:
            closeHitIndexes.append([currentIndex, item])
    for i in range(len(openHitIndexes)):
        substring = line[openHitIndexes[i][0] : closeHitIndexes[i][0] + len(closeHitIndexes[i][1])]
        shortest.append(line.replace(substring, ""))
    shortest = sorted(shortest, key=lambda el: (len(el), el))
    return shortest[0]

for line in main:
    moddedLine = line
    moddedLine = removeTabs(moddedLine)
    moddedLine = removeComments(moddedLine)

input("ENTER")