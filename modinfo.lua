-- Perishable provides an easy way to make mods compatible with each other
--  when it comes to perishable.lua; instead of each mod altering that file,
--  Perishable does it once and all other mods only need a couple lines of 
--  code to use it.

-- To add a custom perish multiplier to an item, add the following code to the
--  main function of that item:
--   inst:AddTag("crsCustomPerishMult")
--   inst.crsCustomPerishMult = <your value here>
--  To make the value customizable use the GetModConfigData function.
--  Use the following format, where myModPerishMult and xxxxxxxxx should be replaced
--  with the name of the option in your modinfo and your mod's workshop ID respectively: 
--   inst.crsCustomPerishMult = GetModConfigData("myModPerishMult", "workshop-xxxxxxxxx")

-- Similarly, to add a custom value for temperature duration to an item, add the following
--  code the main function of that item:
--   inst:AddTag("crsCustomTempDuration")
--   inst.crsCustomTempDuration = GetModConfigData("myModTempDuration", "workshop-xxxxxxxxx") 

-- Author:
-- cr4shmaster: http://steamcommunity.com/id/cr4shmaster

name = "Perishable v2.1"
description = "This mod is required by other mods that are using 'perishable.lua'."
author = "cr4shmaster"
version = "2.1.3.1"
forumthread = ""
api_version = 6
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true
icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
    {
        name = "cfgTestCheck",
        label = "Installed",
        options = {
            {description = "Yes", data = true},
        },
        default = true,
    },
}