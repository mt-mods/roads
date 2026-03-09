-- Emergency phone (only if enabled)
	if ENABLE_EMERGENCY_PHONE then
		core.register_node("infrastructure:emergency_phone_top", {
			description = "Emergency phone",
			tiles = {
				"infrastructure_emergency_phone_top.png",
				"infrastructure_emergency_phone_bottom.png",
				"infrastructure_emergency_phone_side.png",
				"infrastructure_emergency_phone_side.png",
				"infrastructure_emergency_phone_side.png",
				"infrastructure_emergency_phone_front.png"
			},
			drawtype = "nodebox",
			drop = "streets:emergencyphone",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky=1,not_in_creative_inventory=1},
			is_ground_content = false,
			light_source = EMERGENCY_PHONE_LIGHT_RANGE,
			node_box = {
				type = "fixed",
				fixed = {
					{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
					{-0.25, -0.5, -0.3125, -0.1875, 0.5, -0.25},
					{0.1875, -0.5, -0.3125, 0.25, 0.5, -0.25},
					{-0.1875, 0.4375, -0.3125, 0.1875, 0.5, -0.25}
				}
			},
			selection_box = {
				type = "fixed",
				fixed = {
					{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
					{-0.25, -0.5, -0.3125, -0.1875, 0.5, -0.25},
					{0.1875, -0.5, -0.3125, 0.25, 0.5, -0.25},
					{-0.1875, 0.4375, -0.3125, 0.1875, 0.5, -0.25},
				}
			},

			after_dig_node = function(pos)
				pos.y = pos.y - 1
				if core.get_node(pos).name == "infrastructure:emergency_phone_bottom" then
					core.remove_node(pos)
				end
			end,

			on_punch = function(pos, node, puncher)
				if dial_handler ~= nil then
					core.sound_stop(dial_handler)
					dial_handler = nil
				end
				dial_handler = core.sound_play("infrastructure_emergency_phone", {
					pos = pos,
					gain = EMERGENCY_PHONE_VOLUME,
					max_hear_distance = 50
				})
				if (puncher:is_player() and puncher:get_hp() < HEALTH_TO_RESTORING and puncher:get_hp() <= HEALTH_TO_TRIGGER) then
					puncher:set_hp(HEALTH_TO_RESTORING)
					core.chat_send_player(puncher:get_player_name(), "You got healed!")
					core.chat_send_all("Server: -!- "..puncher:get_player_name().." used an emergency phone at "..pos.x..","..pos.y..","..pos.z);
				end
			end
		})

		core.register_node("infrastructure:emergency_phone_bottom", {
			tiles = {"infrastructure_emergency_phone_bottom.png"},
			drawtype = "nodebox",
			drop = "streets:emergencyphone",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky=1,not_in_creative_inventory=1},
			is_ground_content = false,
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}
			},
			selection_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25}
			},

			after_dig_node = function(pos)
				pos.y = pos.y+1
				if core.get_node(pos).name == "infrastructure:emergency_phone_top" then
					core.remove_node(pos)
				end
			end,
		})

		core.register_alias("infrastructure:emergency_phone", "infrastructure:emergency_phone_top")

		core.register_abm({
			nodenames = {"streets:emergencyphone"},
			interval = 1,
			chance = 1,
			action = function(pos, node)
				local node = core.get_node(pos)
				local node_above = core.get_node({x=pos.x,y=pos.y+1,z=pos.z})
				if node_above.name == "air" then
					node.name = "infrastructure:emergency_phone_bottom"
					core.set_node(pos, node)
					pos.y = pos.y+1
				end
				node.name = "infrastructure:emergency_phone_top"
				core.set_node(pos, node)
			end,
		})
	else
		print("Infrastructure mod: -!- Emergency-Phone is disabled!")
	end
