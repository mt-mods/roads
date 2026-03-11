--[[
	StreetsMod: Steel support for hanging signs on highways etc.
]]
core.register_node(":streets:steel_support",{
	description = streets.S("Steel support"),
	tiles = {"streets_support.png"},
	groups = {cracky = 1},
	is_ground_content = false,
	drawtype = "glasslike_framed",
	climbable = true,
	sunlight_propagates = true,
	paramtype = "light",
})
core.register_craft({
	output = "streets:steel_support 5",
	recipe = {
		{"default:steel_ingot","","default:steel_ingot"},
		{"","default:steel_ingot",""},
		{"default:steel_ingot","","default:steel_ingot"}
	}
})
