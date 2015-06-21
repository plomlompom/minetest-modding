minetest.register_node("plom_map:red_cross", {
    tiles = {"darkredcross.png"}
})

minetest.register_on_generated(function(minp, maxp, seed)
    minetest.set_node({x=3, y=3, z=3}, {name="plom_map:red_cross"})
    minetest.set_node({x=-3, y=-1, z=-3}, {name="plom_map:red_cross"})
end)
