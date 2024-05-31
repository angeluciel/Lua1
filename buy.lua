local itemPrice = 100.00

local function checkPrice ()
    print("How much money have you got?")
    io.write("> ")
    local playerMoney = tonumber(io.read())

    if playerMoney and playerMoney >= itemPrice then
        return true
    else
        return false
    end
end

local function main ()
    local buy = checkPrice()
    
    if buy then
        print("Voce adquiriu o item! Fundos:")
    else
        print("Sem fundos suficientes. Fundos:")
    end
end

main()