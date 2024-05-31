local itemPrice = 100.00

local function checkPrice ()
    print("How much money have you got?")
    io.write("> ")
    local playerMoney = toNumber(io.read())

    if playerMoney and playerMoney >= itemPrice then
        return true
    else
        return false
    end
end

local function main ()
    local buy = checkPrice()
    
    if buy then
        print("Você adquiriu o item!")
    else
        print("Sem fundos suficientes.")
    end
end

main()