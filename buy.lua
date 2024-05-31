local itemPrice = 100.00

-- sets the price of the item X to 100.00

local function checkPrice ()
    print("How much money have you got?")
    io.write("> ")

    -- prompts the user to type their money value.

    local playerMoney = tonumber(io.read())

    -- reads what the player typed and transforms it into a number.
    
    if playerMoney and playerMoney >= itemPrice then

    --              ↑- Checks if the value is false or a number.
    --                              ↑ - compares the player's money to the item's price.

        return true
    else
        return false
    end
end

local function main ()
    local buy = checkPrice()
    
    -- sets the value of "buy" to be what was returned by the previous function (false or true)

    if buy then

        -- if the previous function is true (player has enough money) print:

        print("Voce adquiriu o item! Fundos:")
    else
        print("Sem fundos suficientes. Fundos:")
    end
end

main()