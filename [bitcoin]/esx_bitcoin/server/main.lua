ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

 RegisterServerEvent('esx_godipizzeriamammamiartyjob:pay')
  AddEventHandler('esx_godipizzeriamammamiartyjob:pay', function(amount)
 	local _source = source
 	local xPlayer = ESX.GetPlayerFromId(_source)
 	if xPlayer ~= nil and amount > 1 then
 		local money = xPlayer.getAccount('black_money').money
 		if money > amount or money == amount then
 			xPlayer.addMoney(tonumber(amount)) -- Add Clean Money
 			xPlayer.removeAccountMoney('black_money', amount) -- Removes Dirty Money
 			TriggerClientEvent('esx:showNotification', _source, "Ти ~g~изпра: $" ..amount)
 		else
 			TriggerClientEvent('esx:showNotification', _source, "Нямаш мръсни пари...")
 		end
 		if money < amount then
 			local money = xPlayer.getAccount('black_money').money
 			xPlayer.addMoney(tonumber(money)) -- Add Clean Money
 			xPlayer.removeAccountMoney('black_money', money) -- Removes Dirty Money
 			TriggerClientEvent('esx:showNotification', _source, "Ти ~g~изпра всичките мръсни пари: $" ..money)
 			retourcamion_oui()
 			isJobTrucker = false
 		end
 	end
 end)

