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
local index = 1

print ("\nYour wallet: $" .. playerMoney .. "\n")


local NPC_vendor_items = {
    ["Healing Potion"]  = 5,
    ["Steel Sword"]     = 50,
    ["Makeshift Spear"] = 45
}

--[[
local NPC_vendor_items = {
    {name = "Healing Potion", price = 5},
    {name = "Steel Sword", price = 50},
    {name = "Makeshift Spear", price = 45},
} ]]--

local max_lenght = 0
for i, _ in pairs(NPC_vendor_items) do
    if #i > max_lenght then
        max_lenght = #i
    end
end

-- created a loop to determine the lenght of the longest item name.

for i, value in pairs(NPC_vendor_items) do
    local spaces = string.rep(" ", max_lenght - #i + 1)
    print(index .. " - " .. i .. spaces .. "| Price: $" .. value)
    index = index + 1
end

local function inquireBuyer()
    print ("\nSelect an item you'd like to buy.\n[ 1 ] [ 2 ] [ 3 ]\n")
    io.write("> ")
    local itemSelected = tonumber(io.read())

    if itemSelected and itemSelected == 1 then
        itemSelected = "Healing Potion"
    elseif itemSelected and itemSelected == 2 then
        itemSelected = "Steel Sword"
    elseif itemSelected == 3 then
        itemSelected = "Makeshift Spear"
    else
        print("Check your spelling.")
        return false
    end

    if NPC_vendor_items[itemSelected] then
        local itemPrice = NPC_vendor_items[itemSelected]
        if playerMoney >= itemPrice then
            print("You've bought " .. itemSelected .. "!")
            return true, itemPrice
        else
            print ("You don't have enough money to buy " .. itemSelected)
            return false, itemPrice
        end
    else
        print("Sorry, we don't have " .. itemSelected .. " in stock.")
        return false, 0
    end
end

local success, price = inquireBuyer(playerMoney)
if success then
    playerMoney = playerMoney - price
    print("Remaining funds: $" .. playerMoney)
end