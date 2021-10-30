ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback("badmin:ProvjeriAdmin_c", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	local src = source
    if xPlayer.getGroup() == 'superadmin' or xPlayer.getGroup() == 'admin' then 
        cb(true)
    else
        cb(false)
    end

end)