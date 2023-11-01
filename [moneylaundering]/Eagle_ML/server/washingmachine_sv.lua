ESX = exports['es_extended']:getSharedObject()

require('config')

RegisterServerEvent('eaglecore:giveitem')
AddEventHandler('eaglecore:giveitem', function(item, count)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, count)
end)

RegisterServerEvent('eaglecore:removeitem')
AddEventHandler('eaglecore:removeitem', function(item, count)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(item, count)
end)