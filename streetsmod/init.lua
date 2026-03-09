--[[
	StreetsMod 1.5 by webdesigner97:
		License : CC-BY-SA 3.0 Unported (see license.txt)
		Readme	: see readme.txt
		Forum	: http://bit.ly/12cPMeo
		Depends	: default
]]
streets	= {}

-- Kaeza intllib
	-- Boilerplate to support localized strings if intllib mod is installed.
	if core.get_modpath("intllib") then
		streets.S = intllib.make_gettext_pair()
	else
		streets.S = function(s) return s end
	end
	
-- Create variable and tables
	print("Streets: " .. streets.S("Creating variables and tables..."))
	streets.version	= "1.5"
	streets.modpath = core.get_modpath("streetsmod")
	streets.extendedBy	= {}
	streets.load = {
		start = os.clock(),
		fin = 0
	}
	streets.forms = {}

-- rubenwardy: smartfs
	if not core.get_modpath("smartfs") then
		dofile(streets.modpath .. "/libs/smartfs/smartfs.lua")
	end
	
-- Load forms
	dofile(streets.modpath .. "/forms.lua")
	
-- Check for mods which change this mod's beahaviour
	print("Streets: " .. streets.S("Checking installed mods..."))
	if core.get_modpath("wool")	 then
		streets.extendedBy.wool = true
	else
		streets.extendedBy.wool = false
	end
	if core.get_modpath("technic")	then
		streets.extendedBy.technic = true
	else
		streets.extendedBy.technic = false
	end
	if core.get_modpath("moreblocks") then
		streets.extendedBy.moreblocks = true
	else
		streets.extendedBy.moreblocks = false
	end
	if core.get_modpath("mesecons") then
		streets.extendedBy.mesecons = true
	else
		streets.extendedBy.mesecons = false
	end
	if core.get_modpath("digilines") then
		streets.extendedBy.digilines = true
	else
		streets.extendedBy.digilines = false
	end
	if core.get_modpath("prefab") then
		streets.extendedBy.prefab = true
	else
		streets.extendedBy.prefab = false
	end
	if core.get_modpath("awards") then
		streets.extendedBy.awards = true
	else
		streets.extendedBy.awards = false
	end
	
-- Streets chatcommand
	local function round(num, idp)
		local mult = 10^(idp or 0)
		return math.floor(num * mult + 0.5) / mult
	end
	core.register_chatcommand("streets",{
		description = streets.S("Check version of your installed StreetsMod and find information"),
		func = function(name,param)
			streets.forms.chatcmd:show(name);
		end
	})
	
-- Done	
	print("Streets: " .. streets.S("Setup completed, have fun with StreetsMod") .. " " .. streets.version .. "!")
	streets.load.fin = os.clock()
