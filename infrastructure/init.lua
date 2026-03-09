infrastructure = {}

-- Load settings
dofile(core.get_modpath("infrastructure").."/settings.lua")

-- Register nodes
dofile(core.get_modpath("infrastructure").."/nodes.lua")
-- Register special nodes
dofile(core.get_modpath("infrastructure").."/nodes_extension.lua")
-- Register advanced devices
dofile(core.get_modpath("infrastructure").."/advanced_road_signs.lua")
dofile(core.get_modpath("infrastructure").."/advanced_emergency_phone.lua")
dofile(core.get_modpath("infrastructure").."/advanced_traffic_lights_pedestrians.lua")
dofile(core.get_modpath("infrastructure").."/advanced_crosswalk_warning_light.lua")
dofile(core.get_modpath("infrastructure").."/advanced_lane_control_lights.lua")
dofile(core.get_modpath("infrastructure").."/advanced_curve_chevron.lua")
dofile(core.get_modpath("infrastructure").."/advanced_crosswalk_lighting.lua")
dofile(core.get_modpath("infrastructure").."/advanced_crosswalk_safety_sign.lua")
dofile(core.get_modpath("infrastructure").."/advanced_automatic_warning_device.lua")
dofile(core.get_modpath("infrastructure").."/advanced_boom_barrier.lua")
dofile(core.get_modpath("infrastructure").."/advanced_aircraft_warning_light.lua")
dofile(core.get_modpath("infrastructure").."/advanced_warning_light.lua")
-- Register crafting recipes
dofile(core.get_modpath("infrastructure").."/crafts.lua")

print("Infrastructure mod loaded succesfully!")
