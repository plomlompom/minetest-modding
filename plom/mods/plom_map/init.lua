minetest.register_node("plom_map:red_cross", {
    tiles = {"darkredcross.png"}
})

minetest.register_on_generated(function(minp, maxp, seed)
    local pr = PseudoRandom(seed)
    if minp.y < 0 and maxp.y > 0 then
        local max = {x=maxp.x, z=maxp.z}
        local min = {x=minp.x, z=minp.z}
        local x = pr:next(minp.x, maxp.x)
        local z = pr:next(minp.z, maxp.z)
        local test_x = x
        local test_z = z
        if minp.x < 0 then
            min.x = 0
            max.x = maxp.x + (0 - minp.x)
            test_x = x + (0 - minp.x)
        end
        if minp.z < 0 then
            min.z = 0
            max.z = maxp.z + (0 - minp.z)
            test_z = z + (0 - minp.z)
        end
        local dist = max.x - min.x
        if dist > max.x - test_x then
            dist = max.x - test_x
        end
        if dist > test_x - min.x then
            dist = test_x - min.x
        end
        if dist > max.z - test_z then
            dist = max.z - test_z
        end
        if dist > test_z - min.z then
            dist = test_z - min.z
        end
        local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
        local data = vm:get_data()
        local area = VoxelArea:new{
            MinEdge=emin,
            MaxEdge=emax
        }
        local i_y
        local i_x
        local i_z
        local red_cross = minetest.get_content_id("plom_map:red_cross")
        for i_y=3,3+(2*dist) do
            for i_x = x-dist, x+dist do
                for i_z = z-dist, z+dist do
                    data[area:index(i_x, i_y, i_z)] = red_cross 
                end
            end
        end
        vm:set_data(data)
        vm:write_to_map(data)
    end
end)
