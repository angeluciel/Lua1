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

print ("\nYour wallet: $" .. playerMoney .. "\n")


local NPC_vendor_items = {
    ["Healing Potion"]  = 5,
    ["Steel Sword"]     = 50,
    ["Makeshift Spear"] = 45
}

local max_lenght = 0
for i, _ in pairs(NPC_vendor_items) do
    if #i > max_lenght then
        max_lenght = #i
    end
end

-- created a loop to determine the lenght of the longest item name.

for i, value in pairs(NPC_vendor_items) do
    local spaces = string.rep(" ", max_lenght - #i + 1)
    print(i .. spaces .. "| Price: $" .. value)
end

local function inquireBuyer()
    print ("\nWhich item would you like to buy?\n")
    io.write("> ")
    local itemSelected = io.read()

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

-- I want to change this so that instead of it being a one-buy system, I can
-- continue buying until money runs out.
-- maybe I could add a option like <cancel>, maybe before asking which item
-- I should inquire if the player wants to buy something...