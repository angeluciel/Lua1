local playerMoney = 0
   
-- o que fazer (ver quests / ver inventario)
-- quest (selecionar / voltar)
-- se aceitar -> (o que fazer (ver inventario / sair da cidade))
-- sair da cidade -> pode ou encontar money ou [Goblin]
-- combate (atacar, poção, especial)
-- HP / Stack_Especial / Cura

print ("\nWelcome to Quincy's Village!\n")

local playerInventory = {
    {name = "Sword", dmg = 5},
    {name = "Health Potio,", dmg = -5}
}

local things_to_do = {
    {name = "Open Inventory", ItIsA = "Inventory"},
    {name = "See Quests", ItIsA = "Quest"}
}

local max_length = 0

for _, item in ipairs(things_to_do) do
    if #item.name > max_length then
        max_length = #item.name
    end
end

local function show_options()
    local index = 1
    for i, item in ipairs(things_to_do) do
        local spaces = string.rep(" ", max_length - #item.name + 1)
        print(index .. " - " .. item.name .. spaces .. " [ ]")
        index = index + 1
    end
    print (index .." - Done.")
end

local function question_player()
    print("\nChoose an option.\n")
    io.write("> ")
    local playerAnswer = tonumber(io.read())

    if playerAnswer == 3 then
        return "cancel"
    elseif playerAnswer and things_to_do[playerAnswer] then
        local airono = things_to_do[playerAnswer]
        local aironoto = airono.ItIsA
