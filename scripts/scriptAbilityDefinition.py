from tkinter import filedialog
from tkinter import *
from os import path
from os import walk
from collections import defaultdict
import json
import re

#Parse the ObjEditing wurst file to get the attribute Id and function prototype
def parseObjEditingReferenceFile(fileToOpen):
    dictio = defaultdict(str)
    newFuncName = None

    # match function name like the following : from "..setName()", we get setName
    patternObjFuncName = r'(?<=\tfunction )(set|hide).+(?=\()'

    # match the fieldAttributeId, like the following : from "def.setString("utub", data)", we get "utub"
    patternObjAttrId = r'(?<=\(\").+(?=\",)'

    with open(fileToOpen, 'r') as f:
        lines = f.readlines()

    for line in lines:
        #print(line)
        matchFuncName = re.search(patternObjFuncName, line)
        if matchFuncName:
            newFuncName = matchFuncName.group()
            continue

        matchAttributeId = re.search(patternObjAttrId, line)
        if matchAttributeId and newFuncName:
            attributeId = matchAttributeId.group()
            if attributeId not in dictio:
                print(attributeId + " " + newFuncName)
                dictio[attributeId] += newFuncName
    return dictio

def main():
    #Uber Duber GUI, used just for the file browser
    root = Tk()
    root.filename = filedialog.askopenfilename(
        initialdir=path.dirname(__file__), title="Select file", filetypes=(("text files", "*.txt"), ("all files", "*.*")))

    fileToOpen = "UnitObjEditing.wurst"
    print(path.dirname(path.realpath(__file__)))
    for root, dirs, files in walk("."):
        for filename in files:
            if path.isfile(path.join(root, filename)):
                print(filename)


    #Store the attribute Id and function prototype in a dictionary, e.g ["unam","setName"]
    dictAttribute = parseObjEditingReferenceFile(fileToOpen)
    print(dictAttribute)

#    with open("DefinitionOutPut.wurst", "w+") as newFile:
#        newFile.write(getWurstOutPut(dictAttribute, root.filename))
    print("END")


if __name__ == "__main__":
    main()
