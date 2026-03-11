--[[
	StreetsMod: Poles
]]

-- Simple pole
core.register_node(":streets:pole_bottom",{
	description = streets.S("Pole"),
	tiles = {"streets_pole.png"},
	groups = {cracky=2},
	is_ground_content = false,
	inventory_image = "streets_pole_inv.png",
	wield_image = "streets_pole_inv.png",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4},
			{-0.125,-0.5,-0.525,0.125,-0.3,-0.375}
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4}
		}
	},
	after_place_node = function(pos,placer,itemstack)
		pos.y = pos.y +1
		if core.get_node(pos).name == "air" then
			core.add_node(pos,{name = "streets:pole_top", param2 = core.dir_to_facedir(placer:get_look_dir())})
		else
			core.chat_send_player(placer:get_player_name(),"Not enough free space! A pole has a height of 2 blocks!")
			pos.y = pos.y -1
			core.remove_node(pos)
		end
	end,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		pos.y = pos.y +1
		if core.get_node(pos).name == "streets:pole_top" then
			core.remove_node(pos)
		end
	end
})

core.register_node(":streets:pole_top",{
	description = streets.S("Y u no play minetest without cheating?"),
	tiles = {"streets_pole.png"},
	groups = {not_in_creative_inventory=1,cracky=2},
	is_ground_content = false,
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	drop = "",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1,-0.5,-0.5,0.1,0.5,-0.4}
		}
	}
})

core.register_craft({
	output = "streets:pole_bottom 3",
	recipe = {
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""}
	}
})

-- Big pole

core.register_node(":streets:bigpole", {
	description = "Pole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15, -0.5, -0.15, 0.15, 0.5, 0.15}
		}
	},
	on_place = core.rotate_node,
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
				{x= 0, y=-2, z= 0}
			}
		}
	}
})
core.register_node(":streets:bigpole_edge", {
	description = "Pole",
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15,-0.5,-0.15,0.15,0.15,0.15},
			{-0.15,-0.15,-0.15,0.15,0.15,-0.5}
		}
	},
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
			}
		}
	}
})
core.register_node(":streets:bigpole_tjunction", {
	description = "Pole",
	drop = "streets:bigpole",
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	tiles = {"streets_pole.png"},
	sunlight_propagates = true,
	groups = {cracky = 1, level = 2, bigpole = 1},
	is_ground_content = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.15, -0.5, -0.15, 0.15, 0.15, 0.15},
			{-0.15, -0.15, -0.5, 0.15, 0.15, 0.5}
		}
	},
	digiline = {
		wire = {
			rules = {
				{x= 0, y= 0, z=-1},
				{x= 0, y= 0, z= 1},
				{x= 1, y= 0, z= 0},
				{x=-1, y= 0, z= 0},
				{x= 0, y=-1, z= 0},
				{x= 0, y= 1, z= 0},
			}
		}
	}
})
core.register_craft({
	output = "streets:bigpole 3",
	recipe = {
		{"","",""},
		{"","default:steel_ingot",""},
		{"","default:steel_ingot",""}
	}
})
core.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{"","",""},
		{"streets:bigpole","streets:bigpole",""},
		{"streets:bigpole","",""}
	}
})
core.register_craft({
	output = "streets:bigpole_edge 3",
	recipe = {
		{"","",""},
		{"streets:bigpole","streets:bigpole",""},
		{"","streets:bigpole",""}
	}
})
core.register_craft({
	output = "streets:bigpole_tjunction 2",
	recipe = {
		{"","",""},
		{"streets:bigpole_edge","streets:bigpole",""},
		{"","",""}
	}
})
