-- the ground's default material
minetest.register_node("plom:stone", {
	tiles = {"default_stone.png"},
})

-- workaround for https://github.com/minetest/minetest/issues/1840
minetest.register_alias("mapgen_water_source", "plom:stone")

-- generate map made out of air only
minetest.register_on_mapgen_init(function()
    minetest.set_mapgen_params({mgname="singlenode"})
end)

-- create stone ground; derived from Krock's flatgen mod
minetest.register_on_generated(function(minp, maxp, seed)
    local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
    local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
    local data = vm:get_data()
    for z = minp.z, maxp.z do
        for y = minp.y, maxp.y do
            local vi = area:index(minp.x, y, z)
	    for x = minp.x, maxp.x do
                if y <= -1 then
                    data[vi] = "plom:stone"
                end
		vi = vi + 1
            end
	end
    end
    vm:set_data(data)
    vm:write_to_map(data)
end)
