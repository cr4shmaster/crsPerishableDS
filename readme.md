# Perishable for Don't Starve
[![Vanilla](https://img.shields.io/badge/vanilla-yes-brightgreen.svg)](http://steamcommunity.com/workshop/filedetails/?id=442602018) 
[![Reign of Giants](https://img.shields.io/badge/RoG-yes-brightgreen.svg)](http://steamcommunity.com/workshop/filedetails/?id=442602018) 
[![Shipwrecked](https://img.shields.io/badge/SW-yes-brightgreen.svg)](http://steamcommunity.com/workshop/filedetails/?id=442602018) 
[![Steam Workshop](https://img.shields.io/badge/steam-workshop-blue.svg)](http://steamcommunity.com/workshop/filedetails/?id=442602018) 
[![Paypal Donation](https://img.shields.io/badge/donate-paypal-orange.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7AJKEDU7BYRRG) 
[![Steam Trade Offer](https://img.shields.io/badge/donate-steam%20trade%20offer-orange.svg)](https://steamcommunity.com/tradeoffer/new/?partner=42003848&token=tB7Jhg1K)

#### Vanilla, Reign of Giants and Shipwrecked compatible.

This mod handles *__perishable.lua__*. It makes it possible for other mods to have their own configurable perish multiplier and/or temperature duration modifier, without the risk of a possible conflict when two or more of these mods are used simultaneously. 
However, compliance from the other modders is required. 

### How does it work?

It modifies *__perishable.lua__* once; the only thing that a modder has to do is to add a couple properties to their created item and make their mod require Perishable. 
Here's how to do that: 
- add the options in your *__modinfo.lua__* under a name of your choice (let's assume you picked *__myModPerishMult__* and *__myModTempDuration__*) 
- then, in your item's lua script, inside the main function, add these lines: 
```
inst:AddTag("crsCustomPerishMult") 
inst.crsCustomPerishMult = GetModConfigData("myModPerishMult", "workshop-xxxxxxxxx") 
inst:AddTag("crsCustomTempDuration") 
inst.crsCustomTempDuration = GetModConfigData("myModTempDuration", "workshop-xxxxxxxxx") 
```
- and you're done; 
- remember to replace *__myModPerishMult__* and *__myModTempDuration__* with names of your choice, preferably something unique that includes the name of your mod, and __xxxxxxxxx__ with the ID of your mod; 

###  Additional information:
To install this mod you simply have to subscribe on the Steam Workshop and it will automatically be downloaded the next time you access the mods menu in the game.</br>
If your game crashes in the mod menu, try disabling __Small Textures__ in the game's settings.</br>
If you have any suggestions, feel free to post them in the comment section on the Workshop page.

