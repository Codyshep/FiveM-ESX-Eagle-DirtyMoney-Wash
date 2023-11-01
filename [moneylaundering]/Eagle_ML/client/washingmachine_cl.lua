ESX = exports['es_extended']:getSharedObject()

require('config')

local washingloc = config.washinglocations
local cleanmoney = config.moneytypes.cleanmoney
local dirtymoney = config.moneytypes.dirtymoney
local skilldifficulty = config.skillcheck.difficulty
local keybinds = config.skillcheck.keybinds
local sprite = config.debug.spritedebug
local zone = config.debug.zonedebug

local notify = function(title, description, type)
    lib.notify({
        title = title,
        description = description,
        type = type
    })
end

local createMachine = function(veccoords)
    exports.ox_target:addBoxZone({
        coords = veccoords,
        size = vec3(1,1,1),
        drawSprite = sprite,
        debug = zone,
        options = {
            {
                label = 'Wash Money!',
                icon = 'fa-solid fa-dollar',
                onSelect = function(source)
                    local dirtymoney = ESX.SearchInventory(dirtymoney)
                    if not dirtymoney then
                        notify('Notification', 'You dont have any dirt money to wash!', 'warning')
                        return
                    end
                    local moneycount = dirtymoney.count
                    print(dirtymoney)
                    local input = lib.inputDialog('Dialog title', {
                        {type = 'slider', label = 'Input amount to clean', required = true, min = 1, max = moneycount}
                    }) 
                    if input then
                        local skillcheck = lib.skillCheck(skilldifficulty, keybinds)
                        if skillcheck then
                            notify('Notification', 'Washed Money!', 'success')
                            TriggerServerEvent('eaglecore:giveitem', cleanmoney, input[1]/1.2)
                            TriggerServerEvent('eaglecore:removeitem', dirtymoney, input[1])
                        else
                            notify('Notification', 'Money Wash Failed!', 'error')
                        end
                    else
                        notify('Notification', 'Money Wash Cancelled!', 'warning')
                    end
                end
            }
        }
    })
end


for i, v in ipairs(washingloc) do
    createMachine(v)
end