from tkinter import filedialog
from tkinter import *
from os import path
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


#Return the new ObjDefinition line, e.g "new UnitDefinition("TROL","Obla") or "new ItemDefinition("I000","mnst")
def getObjDefinitionStart(line, matchObjDef):
    ObjType = ""
    if matchObjDef[0][3] == "u":
        ObjType = "Unit"
    elif matchObjDef[0][3] == "t":
        ObjType = "Item"
    elif matchObjDef[0][3] == "a":
        ObjType = "Ability"
    strDef = "\n\tnew {}Definition({}, {})\n".format(
        ObjType, matchObjDef[1], matchObjDef[2])
    return strDef

#Return an attribute setter line, e.g "..setName("Bilbo")
def getAttributeSetterLine(objDefinitionDict, data, dictAttribute):
    data[0] = data[0].replace("\"", "")
    objDefinitionDict[data[0]].append(data[1])

    if dictAttribute.get(data[0]) != None:
        return "\t\t..{}({})\n".format(dictAttribute.get(data[0]), data[1])
    return ""

def getWurstOutPut(dictAttribute, fileToOpen):
    objDefinitionDict = defaultdict(list)
    output = ""

    patternObjDef = r'(?<=createObjectDefinition\().+(?=\))'
    patternAttrLine = r'(?<=\w\().+(?=\)\n)'

    with open(fileToOpen, 'r') as f:
        lines = f.readlines()

    for line in lines:
        matchObjDef = re.search(patternObjDef, line)
        if matchObjDef:
            output += getObjDefinitionStart(line, matchObjDef.group().split(", ", 2))

        matchAttrLine = re.search(patternAttrLine, line)
        if matchAttrLine:
            ret = getAttributeSetterLine(objDefinitionDict, matchAttrLine.group().split(", ", 1), dictAttribute)
            output += ret
    return output

def main():
    #Uber Duber GUI, used just for the file browser
    root = Tk()
    root.filename = filedialog.askopenfilename(
        initialdir=path.dirname(__file__), title="Select file", filetypes=(("text files", "*.txt"), ("all files", "*.*")))

    fileToOpen = ""

    #Opening the file to parse in order to get the current function name from the ObjEditing.wurst file,
    if root.filename.count("w3t.wurst.txt") == 1:
        fileToOpen = "ItemObjEditing.wurst"
    elif root.filename.count("w3u.wurst.txt") == 1:
        fileToOpen = "UnitObjEditing.wurst"

    #Store the attribute Id and function prototype in a dictionary, e.g ["unam","setName"]
    dictAttribute = parseObjEditingReferenceFile(fileToOpen)

    with open("DefinitionOutPut.wurst", "w+") as newFile:
        newFile.write(getWurstOutPut(dictAttribute, root.filename))
    print("END")

if __name__ == "__main__":
    main()
