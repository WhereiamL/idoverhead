ESX = nil

Citizen.CreateThread(function()


    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
	end
end)

local idovi = false
RegisterCommand("id", function()

	ESX.TriggerServerCallback("badmin:ProvjeriAdmin_c", function(jel)

		if jel then
			if not idovi then
			ESX.ShowNotification("ID over head ~b~ON~w~", true, true, false)
			idovi = true
			else
			idovi = false
			ESX.ShowNotification("ID over head ~r~OFF~w~", true, true, false)
			end
		end
	end)

end)




Citizen.CreateThread(function()
	while true do
		if not idovi then
			Citizen.Wait(2000)
		else

			for _, id in ipairs(GetActivePlayers()) do
				local loc = GetEntityCoords(GetPlayerPed(id))
				local loc = vector3(loc.x, loc.y, loc.z + 1)
				if not NetworkIsPlayerTalking(id) then
					DrawText3D(
						loc,
						string.format("~y~ID:~w~ %d \n ~y~Player:~w~ %s",GetPlayerServerId(id), GetPlayerName(id)),
						255,
						true
					)
				else
					DrawText3D(
						loc,
						string.format("~y~ID:~w~ %d \n ~r~ 🎤 Player:~w~ %s",GetPlayerServerId(id), GetPlayerName(id)),
						255,
						true
					)
				end
            end
        end 
        Citizen.Wait(0)
    end
end)



function DrawText3D(coords, text, scale2)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)

    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)


    -- Format the text
    SetTextScale(0.0, 0.45 * scale)
    SetTextFont(6)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextOutline()
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end
