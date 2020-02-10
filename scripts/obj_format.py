from os import path
from collections import defaultdict
import re

# Parse the ObjEditing wurst file to get the attribute Id and function prototype
def parseObjEditingReferenceFile(fileToOpen):

    with open(fileToOpen, 'r') as f:
        lines = f.readlines()

    dictAttribute = defaultdict(str)

    # match function name like the following : from "..setName()", we get setName
    patternObjFuncName = r'(?<=\tfunction )(set|hide).+(?=\()'

    # match the fieldAttributeId, like the following : from "def.setString("utub", data)", we get "utub"
    patternObjAttrId = r'(?<=\(\").+(?=\",)'

    newFuncName = None

    for line in lines:
        matchFuncName = re.search(patternObjFuncName, line)
        if matchFuncName:
            newFuncName = matchFuncName.group()
            continue

        matchAttributeId = re.search(patternObjAttrId, line)
        if matchAttributeId and newFuncName:
            attributeId = matchAttributeId.group()
            if attributeId not in dictAttribute:
                dictAttribute[attributeId] += newFuncName
            newFuncName = None
    return dictAttribute


# Param contains the object type ID (unit, item, ability, buff), the newID and the originID
# Return the new ObjDefinition line, e.g "new UnitDefinition("TROL","Obla") or "new ItemDefinition("I000","mnst")
def getObjDefinitionStart(matchObjDef):
    # TODO: Handle case where the definition isn't unit/ability/buff/item
    ObjType = ""
    if matchObjDef[0] == "\"w3u\"":
        ObjType = "Unit"
    elif matchObjDef[0] == "\"w3t\"":
        ObjType = "Item"
    elif matchObjDef[0] == "\"w3a\"":
        ObjType = "Ability"
    elif matchObjDef[0] == "\"w3h\"":
        ObjType = "Buff"
    strDef = "\n\tnew {}Definition({}, {})\n".format(
        ObjType, matchObjDef[1], matchObjDef[2])
    return strDef

# Return an attribute setter line, e.g "..setName("Bilbo")
def getAttributeSetterLine(objDefinitionDict, data, dictAttribute):
    data[0] = data[0].replace("\"", "")
    objDefinitionDict[data[0]].append(data[1])

    if dictAttribute.get(data[0]) != None:
        return "\t\t..{}({})\n".format(dictAttribute.get(data[0]), data[1])
    return ""

# This function generate an output from the fileToOpen
def getWurstOutPut(dictAttribute, fileToFormat):
    objDefinitionDict = defaultdict(list)
    output = ""

    patternObjDef = r'(?<=createObjectDefinition\().+(?=\))'
    patternAttrLine = r'(?<=\w\().+(?=\)\n)'

    with open(fileToFormat, 'r') as f:
        lines = f.readlines()

    ObjDefCounter = 0
    for line in lines:
        matchObjDef = re.search(patternObjDef, line)
        if matchObjDef:
            output += getObjDefinitionStart(matchObjDef.group().split(", ", 2))
            ObjDefCounter += 1

        matchAttrLine = re.search(patternAttrLine, line)
        if matchAttrLine:
            ret = getAttributeSetterLine(objDefinitionDict, matchAttrLine.group().split(", ", 1), dictAttribute)
            output += ret
    print("Formatted %s Object Definition from %s" % (ObjDefCounter, fileToFormat))
    return output

def main():
    wurstDefinitionItemPath    = "_build\\dependencies\\wurstStdlib2\\wurst\\objediting\\ItemObjEditing.wurst"
    wurstDefinitionUnitPath    = "_build\\dependencies\\wurstStdlib2\\wurst\\objediting\\UnitObjEditing.wurst"
    wurstDefinitionAbilityPath = "_build\\dependencies\\wurstStdlib2\\wurst\\objediting\\AbilityObjEditing.wurst"
    wurstDefinitionBuffPath    = "_build\\dependencies\\wurstStdlib2\\wurst\\objediting\\BuffObjEditing.wurst"

    # Store the attribute Id and function prototype in a dictionary, e.g ["unam","setName"]
    itemDict    = parseObjEditingReferenceFile(wurstDefinitionItemPath)
    unitDict    = parseObjEditingReferenceFile(wurstDefinitionUnitPath)
    abilityDict = parseObjEditingReferenceFile(wurstDefinitionAbilityPath)
    buffDict    = parseObjEditingReferenceFile(wurstDefinitionBuffPath)

    fileToOpen = "wurst\\objects\\items\\raw.wurst"
    with open("scripts\\DefinitionOutput\\items.wurst", "w+") as newFile:
        newFile.write(getWurstOutPut(itemDict, fileToOpen))

    fileToOpen = "wurst\\objects\\units\\units.wurst"
    with open("scripts\\DefinitionOutput\\units.wurst", "w+") as newFile:
        newFile.write(getWurstOutPut(unitDict, fileToOpen))

    fileToOpen = "wurst\\objects\\abilities\\abilities.wurst"
    with open("scripts\\DefinitionOutput\\abilities.wurst", "w+") as newFile:
        newFile.write(getWurstOutPut(abilityDict, fileToOpen))

    fileToOpen = "wurst\\objects\\buffs.wurst"
    with open("scripts\\DefinitionOutput\\buffs.wurst", "w+") as newFile:
        newFile.write(getWurstOutPut(buffDict, fileToOpen))
    print("END")

if __name__ == "__main__":
    main()
