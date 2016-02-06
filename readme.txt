In your 'modmain.lua' add the following line:

	GLOBAL.MyModPerishMult = value

Replace 'MyModPerishMult' with your own var name and 'value' with the desired value; for example: 

	GLOBAL.IcyMagicalPouchPerishMult = 0

or if you have it configurable:

	GLOBAL.IcyMagicalPouchPerishMult = GetModConfigData("IcyMagicalPouchPerishMult")

In your item's lua script add the following code where you would add tags:

	for k = 0, 99, 1 do
	 if MyModPerishMult == CUSTOM_PERISH[k] then
	  inst:AddTag("custom_perish")
	  inst:AddTag("custom_perish_"..k)
	  break
	 end
	end

Replace 'MyModPerishMult' again to match your var in 'modmain.lua'; for example:

	for k = 0, 99, 1 do
	 if IcyMagicalPouchPerishMult == CUSTOM_PERISH[k] then
	  inst:AddTag("custom_perish")
	  inst:AddTag("custom_perish_"..k)
	  break
	 end
	end
Done!

