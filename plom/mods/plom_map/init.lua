minetest.register_node("plom_map:red_cross", {
    tiles = {"darkredcross.png"}
})

minetest.register_on_generated(function(minp, maxp, seed)
    local pr = PseudoRandom(seed)
    if minp.y < 0 and maxp.y > 0 then
        minetest.set_node(
            {x=pr:next(minp.x, maxp.x), y=0, z=pr:next(minp.z, maxp.z)},
            {name="plom_map:red_cross"})
    end
end)
