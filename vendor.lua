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

print ("\nYour wallet: $" .. playerMoney .. "\n")

local NPC_vendor_items = {
    {name = "Healing Potion", price = 5},
    {name = "Steel Sword", price = 50},
    {name = "Makeshift Spear", price = 45},
}
--[[ 
    created an array has the properties name and price, and 
    set it to different values afterwards.
]]--

local max_length = 0
-- created a variable to keep track of the length of the item name
for _, item in ipairs(NPC_vendor_items) do
-- "_" symbolizes that we will ignore the value, in this case the index
    if #item.name > max_length then
    -- # operator is used to get the length of a string << same as string.len(item.name)
        max_length = #item.name
    end
end

-- created a loop to determine the length of the longest item name.
local function show_items()
    local index = 1 -- Reset index inside the function
    for _, item in ipairs(NPC_vendor_items) do
        local spaces = string.rep(" ", max_length - #item.name + 1)
        print(index .. " - " .. item.name .. spaces .. "| Price: $" .. item.price)
        index = index + 1
    end
    print ("4 - Cancel")
end

local function inquireBuyer()
    print ("\nSelect an item you'd like to buy.")
    show_items()
    io.write("> ")
    local itemSelected = tonumber(io.read())
    
    if itemSelected == 4 then
        return "cancel"
    elseif itemSelected and NPC_vendor_items[itemSelected] then
        local selectedItem = NPC_vendor_items[itemSelected]
        local itemPrice = selectedItem.price
        if playerMoney >= itemPrice then
            print("\nYou've bought " .. selectedItem.name .. "!\n")
            return true, itemPrice, selectedItem.name
        else
            print("\nYou don't have enough money to buy a " .. selectedItem.name)
            return false, itemPrice
        end
    else
        print("Invalid selection. Try again.")
        return false, 0
    end
end

local function main()
    local items_bought = {} 
    while playerMoney > 0 do
        local success, price, itemName = inquireBuyer()
        if success == "cancel" then
            break 
        elseif success then
            playerMoney = playerMoney - price
            print("Remaining funds: $" .. playerMoney)
            if not items_bought[itemName] then
                items_bought[itemName] = 0
            end
            items_bought[itemName] = items_bought[itemName] + 1
        end
    end

    if next(items_bought) then
        print("Thanks for buying!")
        for item, quantity in pairs (items_bought) do
            print("You bought " .. quantity .. "x " .. item)
        end
    else
        print("Thank you for stopping by!")
    end
end

main()