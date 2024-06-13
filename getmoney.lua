local playerMoney = 0

print ("\nWelcome to Quincy's Village!\n")

local playerInventory = {
    {name = "Sword", dmg = 5},
    {name = "Health Potion", dmg = -5}
}

local things_to_do = {
    {name = "Open Inventory", ItIsA = "Inventory"},
    {name = "See Quests", ItIsA = "Quest"}
}

local quest_board = {
    {name = "Hunt Goblins", reward = 10},
    {name = "Hunt Dragon",  reward = 100}
}

local function calculate_max_lenght(item_list)
    local max_length = 0
    for _, item in ipairs(item_list) do
        if #item.name > max_length then
            max_length = #item.name
        end
    end
    return max_length
end

local max_lenght_things_to_do = calculate_max_lenght(things_to_do)
local max_lenght_inventory = calculate_max_lenght(playerInventory)
local max_lenght_quests = calculate_max_lenght(quest_board)

local function show_options()
    local index = 1
    
    for i, item in ipairs(things_to_do) do
        local spaces = string.rep(" ", max_lenght_things_to_do - #item.name + 1)
        print(index .. " - " .. item.name .. spaces .. " [ ]")
        index = index + 1
    end
    print (index .." - Done.")
end

local function quests()

    local index = 1
    for _, item in ipairs(quest_board) do
        local spaces = string.rep(" ", max_lenght_quests - #item.name + 1)
        print(index .. " - " .. item.name .. spaces .. "| Reward: $" .. item.reward)
        index = index + 1
    end
    print (index .. " - Voltar")
end

local function handle_quest_selection(playerQuest)
    if playerQuest == 1 then
        local resposta = quest_board[playerQuest]
        local rewardQuest = resposta.reward
        playerMoney = playerMoney + rewardFoda
        print ("You've concluded the quest!\n + $".. rewardQuest)
    elseif playerQuest == 2 then
        print("You've died.")
    elseif playerQuest == 3 then
        return "back"
    end
end

local function show_inventory()
    local index = 1
    for i, item in ipairs(playerInventory) do
        local spaces = string.rep(" ", max_lenght_inventory - #item.name + 1)
        local inventory_item = playerInventory[index]
        local damage = inventory_item.dmg
        print("item: " .. inventory_item.name .. spaces .. " | Damage: " .. damage)
        index = index + 1
    end
end

local function question_player()
    show_options()
    print("\nChoose an option.\n")
    io.write("> ")
    local playerAnswer = tonumber(io.read())

    if playerAnswer == 3 then
        return "cancel"
    elseif playerAnswer and things_to_do[playerAnswer] then
        local airono = things_to_do[playerAnswer]
        local aironoto = airono.ItIsA
        if aironoto == "Quest" then
            while true do
                quests()
                io.write("> ")
                local playerQuest = tonumber(io.read())

                local result = handle_quest_selection(playerQuest)
                if result == "back" then
                    break
                end
            end
        elseif aironoto == "Inventory" then
            show_inventory()

        end
    else
        print("Invalid selection. Try again.")
    end
end

question_player()