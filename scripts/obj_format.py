from os import path
from collections import defaultdict
import re

# Parse the ObjEditing wurst file to get the attribute Id and function prototype
def parse_obj_editing_reference_file(file_to_open):

    with open(file_to_open, 'r') as f:
        lines = f.readlines()

    dict_attribute = defaultdict(str)

    # match function name like the following : from "..setName()", we get setName
    pattern_obj_func_name = r'(?<=\tfunction )(set|hide).+(?=\()'

    # match the fieldAttributeId, like the following : from "def.setString("utub", data)", we get "utub"
    pattern_obj_attr_id = r'(?<=\(\").+(?=\",)'

    new_func_name = None

    for line in lines:
        match_func_name = re.search(pattern_obj_func_name, line)
        if match_func_name:
            new_func_name = match_func_name.group()
            continue

        match_attribute_id = re.search(pattern_obj_attr_id, line)
        if match_attribute_id and new_func_name:
            attribute_id = match_attribute_id.group()
            if attribute_id not in dict_attribute:
                dict_attribute[attribute_id] += new_func_name
            new_func_name = None
    return dict_attribute


# Param contains the object type ID (unit, item, ability, buff), the newID and the originID
# Return the new ObjDefinition line, e.g "new UnitDefinition("TROL","Obla") or "new ItemDefinition("I000","mnst")
def get_obj_definition_start(match_obj_def):
    # TODO: Handle case where the definition isn't unit/ability/buff/item
    obj_type = ""
    if match_obj_def[0] == "\"w3u\"":
        obj_type = "Unit"
    elif match_obj_def[0] == "\"w3t\"":
        obj_type = "Item"
    elif match_obj_def[0] == "\"w3a\"":
        obj_type = "Ability"
    elif match_obj_def[0] == "\"w3h\"":
        obj_type = "Buff"
    strDef = "\n\tnew {}Definition({}, {})\n".format(
        obj_type, match_obj_def[1], match_obj_def[2])
    return strDef

# Return an attribute setter line, e.g "..setName("Bilbo")
def get_attribute_setter_line(obj_definition_dict, data, dict_attribute):
    data[0] = data[0].replace("\"", "")
    obj_definition_dict[data[0]].append(data[1])

    if dict_attribute.get(data[0]) != None:
        return "\t\t..{}({})\n".format(dict_attribute.get(data[0]), data[1])
    return ""

# This function generate an output from the file_to_open
def get_wurst_out_put(dict_attribute, file_to_format):
    obj_definition_dict = defaultdict(list)
    output = ""

    pattern_obj_def = r'(?<=createObjectDefinition\().+(?=\))'
    pattern_attr_line = r'(?<=\w\().+(?=\)\n)'

    with open(file_to_format, 'r') as f:
        lines = f.readlines()

    obj_def_counter = 0
    for line in lines:
        match_obj_def = re.search(pattern_obj_def, line)
        if match_obj_def:
            output += get_obj_definition_start(match_obj_def.group().split(", ", 2))
            obj_def_counter += 1

        match_attr_line = re.search(pattern_attr_line, line)
        if match_attr_line:
            ret = get_attribute_setter_line(obj_definition_dict, match_attr_line.group().split(", ", 1), dict_attribute)
            output += ret
    print("Formatted %s Object Definition from %s" % (obj_def_counter, file_to_format))
    return output

def main():
    wurst_definition_item_path    = "_build\\dependencies\\wurstStdlib2\\wurst\\objediting\\ItemObjEditing.wurst"
    wurst_definition_unit_path    = "_build\\dependencies\\wurstStdlib2\\wurst\\objediting\\UnitObjEditing.wurst"
    wurst_definition_ability_path = "_build\\dependencies\\wurstStdlib2\\wurst\\objediting\\AbilityObjEditing.wurst"
    wurst_definition_buff_path    = "_build\\dependencies\\wurstStdlib2\\wurst\\objediting\\BuffObjEditing.wurst"

    # Store the attribute Id and function prototype in a dictionary, e.g ["unam","setName"]
    itemDict    = parse_obj_editing_reference_file(wurst_definition_item_path)
    unitDict    = parse_obj_editing_reference_file(wurst_definition_unit_path)
    abilityDict = parse_obj_editing_reference_file(wurst_definition_ability_path)
    buffDict    = parse_obj_editing_reference_file(wurst_definition_buff_path)

    file_to_open = "wurst\\objects\\items\\raw.wurst"
    with open("scripts\\DefinitionOutput\\items.wurst", "w+") as new_file:
        new_file.write(get_wurst_out_put(itemDict, file_to_open))

    file_to_open = "wurst\\objects\\units\\units.wurst"
    with open("scripts\\DefinitionOutput\\units.wurst", "w+") as new_file:
        new_file.write(get_wurst_out_put(unitDict, file_to_open))

    file_to_open = "wurst\\objects\\abilities\\abilities.wurst"
    with open("scripts\\DefinitionOutput\\abilities.wurst", "w+") as new_file:
        new_file.write(get_wurst_out_put(abilityDict, file_to_open))

    file_to_open = "wurst\\objects\\buffs.wurst"
    with open("scripts\\DefinitionOutput\\buffs.wurst", "w+") as new_file:
        new_file.write(get_wurst_out_put(buffDict, file_to_open))
    print("END")

if __name__ == "__main__":
    main()
