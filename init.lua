local modname = "yogurts_and_cheese"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")
local S = minetest.get_translator(minetest.get_current_modname())

-- normal milk bag to cheese

minetest.register_node("yogurts_and_cheese:milk_bag",{
    description = S("Bag of Fresh Milk"),
	wield_image = "milk_bagfresh.png",
	tiles = {"milk_bagfresh.png"},
    inventory_image = "milk_bagfresh.png",
	drawtype = "plantlike",
	groups = {dig_immediate = 3},
	paramtype = "light",
	sunlight_propagates = true,
    walkable = false,
	on_use = minetest.item_eat(4, "wool:white"),
	selection_box = {
	   type = "fixed",
	   fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 6 / 16, 4 / 16},
	},
})

minetest.register_craft({
    output = "yogurts_and_cheese:milk_bag",
	recipe = {
	    {"mobs:bucket_milk","wool:white",""},
		{"","",""},
		{"","",""},
	},
	replacements = {{"mobs:bucket_milk","bucket:bucket_empty"}},
})

minetest.register_node("yogurts_and_cheese:cheese_bag",{
    description = S("Bag of Cheese"),
	wield_image = "milk_bagfresh.png",
	tiles = {"cheese_bagfresh.png"},
    inventory_image = "cheese_bagfresh.png",
	drawtype = "plantlike",
	groups = {dig_immediate = 3, not_in_creative_inventory = 1},
	paramtype = "light",
	sunlight_propagates = true,
    walkable = false,
	on_use = minetest.item_eat(6, "wool:white"),
	selection_box = {
	   type = "fixed",
	   fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 6 / 16, 4 / 16},
	},
})

minetest.register_craft({
    output = "mobs:cheese",
	recipe = {
	    {"yogurts_and_cheese:cheese_bag","",""},
		{"","",""},
		{"","",""},
	},
	replacements = {{"yogurts_and_cheese:cheese_bag","wool:white"}},
})

minetest.register_abm({
    nodenames = {"yogurts_and_cheese:milk_bag"},
	interval = 45.0,
	chance = 9,
	action = function(pos,node)
	    if minetest.find_node_near(pos, 3, {"air"}) then
		    node.name = "yogurts_and_cheese:cheese_bag"
			minetest.swap_node(pos,node)
		end
	end
})

-- vegan cheese

minetest.register_node("yogurts_and_cheese:soymilk_bag",{
    description = S("Bag of Fresh Soy Milk"),
	wield_image = "milk_bagfresh.png",
	tiles = {"milk_bagfresh.png"},
    inventory_image = "milk_bagfresh.png",
	drawtype = "plantlike",
	groups = {dig_immediate = 3},
	paramtype = "light",
	sunlight_propagates = true,
    walkable = false,
	on_use = minetest.item_eat(4, "wool:white"),
	selection_box = {
	   type = "fixed",
	   fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 6 / 16, 4 / 16},
	},
})

minetest.register_craft({
    output = "yogurts_and_cheese:soymilk_bag",
	recipe = {
	    {"farming:soy_milk","farming:soy_milk","wool:white"},
		{"farming:soy_milk","farming:soy_milk","farming:salt"},
		{"group:food_peppercorn","",""},
	},
	replacements = {{"farming:soy_milk","vessels:drinking_glass"}},
})
minetest.register_node("yogurts_and_cheese:soycheese_bag",{
    description = S("Bag of Vegan Cheese"),
	wield_image = "milk_bagfresh.png",
	tiles = {"cheese_bagfresh.png"},
    inventory_image = "cheese_bagfresh.png",
	drawtype = "plantlike",
	groups = {dig_immediate = 3,  not_in_creative_inventory = 1},
	paramtype = "light",
	sunlight_propagates = true,
    walkable = false,
	on_use = minetest.item_eat(6, "wool:white"),
	selection_box = {
	   type = "fixed",
	   fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 6 / 16, 4 / 16},
	},
})

minetest.register_craft({
    output = "farming:cheese_vegan",
	recipe = {
	    {"yogurts_and_cheese:soycheese_bag","",""},
		{"","",""},
		{"","",""},
	},
	replacements = {{"yogurts_and_cheese:soycheese_bag","wool:white"}},
})

minetest.register_abm({
    nodenames = {"yogurts_and_cheese:soymilk_bag"},
	interval = 45.0,
	chance = 9,
	action = function(pos,node)
	    if minetest.find_node_near(pos, 3, {"air"}) then
		    node.name = "yogurts_and_cheese:soycheese_bag"
			minetest.swap_node(pos,node)
		end
	end
})

-- yogurt

minetest.register_node("yogurts_and_cheese:yogurt_bag",{
    description = S("Bag of Milk (For Yogurt)"),
	wield_image = "yogurt_bagfresh.png",
	tiles = {"yogurt_bagfresh.png"},
    inventory_image = "yogurt_bagfresh.png",
	drawtype = "plantlike",
	groups = {dig_immediate = 3},
	paramtype = "light",
	sunlight_propagates = true,
    walkable = false,
	on_use = minetest.item_eat(4, "wool:white"),
	selection_box = {
	   type = "fixed",
	   fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 6 / 16, 4 / 16},
	},
})

minetest.register_craft({
    output = "yogurts_and_cheese:yogurt_bag 2",
	recipe = {
	    {"mobs:bucket_milk","wool:white",""},
		{"mobs:bucket_milk","wool:white",""},
		{"","",""},
	},
	replacements = {{"mobs:bucket_milk","bucket:bucket_empty"}},
})

minetest.register_node("yogurts_and_cheese:yogurt",{
    description = S("Bag of Yogurt"),
	wield_image = "yogurt_bag.png",
	tiles = {"yogurt_bag.png"},
    inventory_image = "yogurt_bag.png",
	drawtype = "plantlike",
	groups = {dig_immediate = 3},
	paramtype = "light",
	sunlight_propagates = true,
    walkable = false,
	selection_box = {
	   type = "fixed",
	   fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 6 / 16, 4 / 16},
	},
})

minetest.register_abm({
    nodenames = {"yogurts_and_cheese:yogurt_bag"},
	interval = 45.0,
	chance = 9,
	action = function(pos,node)
	    if minetest.find_node_near(pos, 3, {"air"}) then
		    node.name = "yogurts_and_cheese:yogurt"
			minetest.swap_node(pos,node)
		end
	end
})

minetest.register_node("yogurts_and_cheese:yogurt_bottle",{
    description = S("Bottle of Yogurt"),
	wield_image = "bottle_yogurt.png",
	tiles = {"bottle_yogurt.png"},
    inventory_image = "bottle_yogurt.png",
	drawtype = "plantlike",
	groups = {dig_immediate = 3},
	paramtype = "light",
	sunlight_propagates = true,
    walkable = false,
	minetest.item_eat(4, "vessels:glass_bottle"),
	selection_box = {
	   type = "fixed",
	   fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 4 / 16, 3 / 16},
	},
})

minetest.register_craft({
    output = "yogurts_and_cheese:yogurt_bottle",
	recipe = {
	    {"yogurts_and_cheese:yogurt","group:food_honey",""},
		{"vessels:glass_bottle","vessels:glass_bottle",""},
		{"vessels:glass_bottle","vessels:glass_bottle",""},
	},
	replacements = {{"yogurts_and_cheese:yogurt_bag","wool:white"}},
})

-- Flavoured Milks

minetest.register_craftitem("yogurts_and_cheese:chocomilk",{
    description = S("Bottle of Chocolate Milk"),
	inventory_image = "bottle_chocolate_milk.png",
	on_use = minetest.item_eat(7, "vessels:glass_bottle"),
})

minetest.register_craft({
    output = "yogurts_and_cheese:chocomilk 4",
	recipe = {
	    {"mobs:bucket_milk","group:food_cocoa","group:food_sugar"},
		{"vessels:glass_bottle","vessels:glass_bottle",""},
		{"vessels:glass_bottle","vessels:glass_bottle",""},
	},
	replacements = {{"mobs:bucket_milk","bucket:bucket_empty"}},
})
minetest.register_craftitem("yogurts_and_cheese:strawberrymilk",{
    description = S("Bottle of Strawberry Milk"),
	inventory_image = "bottle_strawberry_milk.png",
	on_use = minetest.item_eat(7, "vessels:glass_bottle"),
})

minetest.register_craft({
    output = "yogurts_and_cheese:strawberrymilk 4",
	recipe = {
	    {"mobs:bucket_milk","ethereal:strawberry","group:food_sugar"},
		{"vessels:glass_bottle","vessels:glass_bottle",""},
		{"vessels:glass_bottle","vessels:glass_bottle",""},
	},
	replacements = {{"mobs:bucket_milk","bucket:bucket_empty"}},
})

minetest.register_craftitem("yogurts_and_cheese:bananamilk",{
    description = S("Bottle of Banana Milk"),
	inventory_image = "bottle_banana_milk.png",
	on_use = minetest.item_eat(7, "vessels:glass_bottle"),
})

minetest.register_craft({
    output = "yogurts_and_cheese:bananamilk 4",
	recipe = {
	    {"mobs:bucket_milk","ethereal:banana","group:food_sugar"},
		{"vessels:glass_bottle","vessels:glass_bottle",""},
		{"vessels:glass_bottle","vessels:glass_bottle",""},
	},
	replacements = {{"mobs:bucket_milk","bucket:bucket_empty"}},
})