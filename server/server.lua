QBCore = exports['qbr-core']:GetCoreObject()

-- check for pickaxe
QBCore.Functions.CreateCallback('rsg_mining:server:checkpickaxe', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local pickaxe = Ply.Functions.GetItemByName("pickaxe")
    if pickaxe ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

-- give reward
RegisterServerEvent('rsg_mining:server:giveMineReward')
AddEventHandler('rsg_mining:server:giveMineReward', function()
    local src = tonumber(source)
    local item = {}
    local xPlayer = QBCore.Functions.GetPlayer(src)
	local randomNumber = math.random(1,100)
	
	if randomNumber > 0 and randomNumber <= 70 then
		local _subRan = math.random(1,5)
			if _subRan == 1 then
				xPlayer.Functions.AddItem('copper', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['copper'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'you found some copper', 'success')
			elseif _subRan == 2 then
				xPlayer.Functions.AddItem('aluminum', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['aluminum'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'you found some aluminum', 'success')
			elseif _subRan == 3 then
				xPlayer.Functions.AddItem('iron', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['iron'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'you found some iron', 'success')
			elseif _subRan == 4 then
				xPlayer.Functions.AddItem('steel', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['steel'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'you found some steel', 'success')
			else
			TriggerClientEvent('QBCore:Notify', src, 'You did not find anything!', 'error')
		end
			
	elseif randomNumber > 70 and randomNumber <= 100 then
		local _subRan = math.random(1,4)
			if _subRan == 1 then
				xPlayer.Functions.AddItem('smallnugget', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['smallnugget'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'you found a small gold nugget', 'success')
			elseif _subRan == 2 then
				xPlayer.Functions.AddItem('mediumnugget', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mediumnugget'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'you found a medium gold nugget', 'success')
			elseif _subRan == 3 then
				xPlayer.Functions.AddItem('largenugget', 1)
				TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['largenugget'], "add")
				TriggerClientEvent('QBCore:Notify', src, 'you found a large gold nugget', 'success')
			else
			TriggerClientEvent('QBCore:Notify', src, 'You did not find anything!', 'error')
		end
    end
end)