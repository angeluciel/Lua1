--[[items = {
    helmet = 10,
    chestplate = 20,
    wood_shield = 10
}

for i, value in pairs(items) do
    print(i .. " costs $" .. value)
end


items = { "helmet", "chestplate", "wood_shield"}
price_items = { 15, 25, 10}

for i, value in ipairs(price_items) do
    print (items[i] .." custa $" .. value)
end
]]-- 
-- I see this as more of a "fake injection" of index value rather than a
-- best practice way to make a shop system.

local playerMoney = 50
-- sets the variable playerMoney to 50, to symbolize how many $ it has.
local index = 1
-- sets the variable index to 1, as lua starts arrays in 1 and will
-- be used afterwards

print ("\nYour wallet: $" .. playerMoney .. "\n")

local NPC_vendor_items = {
    {name = "Healing Potion", price = 5},
    {name = "Steel Sword", price = 50},
    {name = "Makeshift Spear", price = 45},
}
--[[ 
    created and array has the properties name and price, and 
    set it to different values afterwards.
]]--

local max_lenght = 0
-- created a variable to keep track of the lenght of the item name
for _, item in ipairs(NPC_vendor_items) do
-- "_" symbolizes that we will ignore the value, in this case the index
    if #item.name > max_lenght then
    -- # operator is used to get the lenght of a string << same as string.len(item.name)
        max_lenght = #item.name
    end
end

-- created a loop to determine the lenght of the longest item name.

for _, item in ipairs(NPC_vendor_items) do
    local spaces = string.rep(" ", max_lenght - #item.name + 1)
    print(index .. " - " .. item.name .. spaces .. "| Price: $" .. item.price)
    index = index + 1
end

local function inquireBuyer()
    print ("\nSelect an item you'd like to buy.")
    for i, item in ipairs(NPC_vendor_items) do
        print("[ " .. i .. " ] " .. item.name)
    end
    io.write("> ")
    local itemSelected = tonumber(io.read())

    if itemSelected and NPC_vendor_items[itemSelected] then
        local selectedItem = NPC_vendor_items[itemSelected]
        local itemPrice = selectedItem.price
        if playerMoney >= itemPrice then
            print("\nYou've bought " .. selectedItem.name .. "!")
            return true, itemPrice
        else
            print("\nYou don't have enough money to buy a " .. selectedItem.name)
            return false, itemPrice
        end
    else
        print("Invalid selection. Try again.")
        return false, 0
    end
end

local success, price = inquireBuyer(playerMoney)
if success then
    playerMoney = playerMoney - price
    print("Remaining funds: $" .. playerMoney)
end