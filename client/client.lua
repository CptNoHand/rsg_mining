local QBCore = exports['qbr-core']:GetCoreObject()

local mining = {
    { x = -1424.091, y = 1176.6002, z = 226.3431 }, -- mine1
	{ x = -1417.508, y = 1171.145, z = 226.57142 }, -- mine1
	{ x = 2763.174, y = 1406.2044, z = 68.444854 }, -- mine annesburg
	{ x = 2726.7871, y = 1384.9691, z = 68.878173 }, -- mine annesburg
	{ x = 2717.3491, y = 1314.0633, z = 69.75164 }, -- mine annesburg
	{ x = 835.76275, y = 1931.185, z = 259.84646 }, -- cave mine
	{ x = 835.62109, y = 1925.5421, z = 259.289 }, -- cave mine
	{ x = 831.66693, y = 1920.0919, z = 259.37493 }, -- cave mine
	{ x = 825.7395, y = 1922.6685, z = 259.20452 }, -- cave mine
}

local active = false
local MinePrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil

function SetupMinePrompt()
    Citizen.CreateThread(function()
        local str = 'Start Mining'
        MinePrompt = PromptRegisterBegin()
        PromptSetControlAction(MinePrompt, 0xF3830D8E) -- [J}
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(MinePrompt, str)
        PromptSetEnabled(MinePrompt, false)
        PromptSetVisible(MinePrompt, false)
        PromptSetHoldMode(MinePrompt, true)
        PromptRegisterEnd(MinePrompt)
    end)
end

AddEventHandler('rsg_mining:hasEnteredMarker', function(zone)
    currentZone = zone
end)

AddEventHandler('rsg_mining:hasExitedMarker', function(zone)
    if active == true then
        PromptSetEnabled(MinePrompt, false)
        PromptSetVisible(MinePrompt, false)
        active = false
    end
	currentZone = nil
end)

Citizen.CreateThread(function()
    SetupMinePrompt()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local coords = GetEntityCoords(player)
        local isInMarker, currentZone = false

        for k,v in ipairs(mining) do
            if #(coords - vector3(v.x, v.y, v.z)) < 1.5 then
                isInMarker  = true
                currentZone = 'mining'
                lastZone    = 'mining'
            end
        end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			TriggerEvent('rsg_mining:hasEnteredMarker', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('rsg_mining:hasExitedMarker', lastZone)
		end
    end
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        if currentZone then
            if active == false then
                PromptSetEnabled(MinePrompt, true)
                PromptSetVisible(MinePrompt, true)
                active = true
            end
            if PromptHasHoldModeCompleted(MinePrompt) then
                TriggerEvent('rsg_mining:clent:domining')
                PromptSetEnabled(MinePrompt, false)
                PromptSetVisible(MinePrompt, false)
                active = false

				currentZone = nil
			end
        else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent("rsg_mining:clent:domining")
AddEventHandler("rsg_mining:clent:domining", function()
	local src = source
	QBCore.Functions.TriggerCallback('rsg_mining:server:checkpickaxe', function(HasItems)  
		if HasItems then
			miningstarted = true
			TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_PICKAXE_WALL'), -1, true, false, false, false)
			Wait(18000)
			ClearPedTasksImmediately(PlayerPedId())
			ClearPedSecondaryTask(PlayerPedId())
			TriggerServerEvent('rsg_mining:server:giveMineReward')
			miningstarted = false
		else
			QBCore.Functions.Notify("You don't have a pickaxe!", "error")
		end
	end)
end)