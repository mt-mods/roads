--[[
	Streets Mod: All kinds of asphalt
]]
core.register_node(":streets:asphalt",{
	description = streets.S("Asphalt"),
	tiles	= {"streets_asphalt.png"},
	groups	= {cracky=3},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
})

if core.get_modpath("building_blocks") then
	core.register_craft({
		type = "shapeless",
		output = "streets:asphalt 3",
		recipe = {
			"default:sand",
			"default:gravel",
			"building_blocks:Tar"
		},
	})
else
	core.register_craft({
		type = "cooking",
		output	= "streets:asphalt",
		recipe 	= "default:gravel",
		cooktime = 2
	})
end
