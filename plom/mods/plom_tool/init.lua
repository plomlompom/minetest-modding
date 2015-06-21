-- the "hand" tool that's active with no tool in hand
minetest.register_item(":", {
    type = "none",
    wield_image = "skeleton.png",
    tool_capabilities = {groupcaps= {unbreakable = {times={[0] = 0}}}}
})
