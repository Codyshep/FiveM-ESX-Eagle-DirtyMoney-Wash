ESX = exports['es_extended']:getSharedObject()

require('config')

RegisterServerEvent('eaglecore:cleanmoney')
AddEventHandler('eaglecore:cleanmoney', function(count)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    local found = false
    for _, v in pairs(config.washinglocations) do
        local dist = #(xPlayer.getCoords(true) - v)
        if dist <= 1.5 then
            found = true
            break
        end
    end

    if count >= xPlayer.getInventoryItem(config.moneytypes.dirtymoney).count or not found then
        DropPlayer(source, 'Trying to exploit the Moneywash')
        return
    end
    xPlayer.addInventoryItem(config.moneytypes.cleanmoney, count / 1.2)
    xPlayer.removeInventoryItem(config.moneytypes.dirtymoney, count)
end)
