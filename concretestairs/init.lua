--[[
	StreetsMod: Concrete stairs (compatible to circular saw)
]]
if core.get_modpath("moreblocks") then
	stairsplus:register_all(
		"streets",
		"concrete",
		"basic_materials:concrete_block",
		{
			groups = {not_in_creative_inventory=1, cracky=2},
			tiles = {"basic_materials_concrete_block.png"},
			description = "Concrete"
		}
	)
	core.register_alias("stairs:stair_concrete","streets:stair_concrete")
else
	core.register_alias("stairs:stair_concrete","prefab:concrete_stair")
	core.register_alias("stairs:slab_concrete","prefab:concrete_slab")
end
