--[[
	StreetsMod: Emergency Phone
]]
core.register_node(":streets:emergencyphone",{
	description = streets.S("Emergency Phone"),
	tiles = {"streets_sos_top.png","streets_sos_bottom.png","streets_sos_side.png","streets_sos_side.png","streets_sos_side.png","streets_sos_front.png"},
	groups = {cracky = 3},
	is_ground_content = false,
	paramtype2 = "facedir",
	light_source = 5,
	on_rightclick = function(pos,node,clicker)
		if clicker:is_player() and clicker:get_hp() < 6 then
			clicker:set_hp(6)
			core.log("action",clicker:get_player_name() .. " healed by emergency phone at pos " .. core.pos_to_string(pos) .. "")
		end
	end
 })
 core.register_alias("streets:emergency_phone","streets:emergencyphone")
core.register_craft({
	output = "streets:emergencyphone",
	recipe = {
		{"wool:orange","default:torch","wool:orange"},
		{"wool:orange","default:apple","wool:orange"},
		{"default:steel_ingot","default:diamondblock","default:steel_ingot"}
	}
})
