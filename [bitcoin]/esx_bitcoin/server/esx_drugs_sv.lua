ESX = nil TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local PlayersHarvestingOpium   = {}
local PlayersTransformingOpium = {}
local PlayersSellingOpium      = {}
local PlayersWashingMoney      = {}
local PlayersFarmingBitcoin    = {}

local bitcoinprice = math.random(8000,15000)
local computers = {}
local pccomponents = nil

local limitprocent = 30
local procent = 86
local defprocent = 86
local limitbit = 2
local delay = 450000 --= For test - 15000  900000 -- default
local time = 3100000 --5400000 --90 minutes -- for test - 2400000 -- default 6200000

-----------
local Zones = {
	--CokeField =			{x = -169.35,	y = 6144.77,	z = 42.64,	name = 'coke_field',		sprite = 501,	color = 40},---1762.8137207032,2193.857421875,106.84548187256 - RDY
	--CokeProcessing =	{x = 1094.15,	y = -3196.91,	z = -38.99,	name = 'coke_processing',	sprite = 478,	color = 40},-- -594.77923583984,-1600.0433349609,27.010808944702 - RDY
	--CokeDealer =		{x = 836.78,	y =-2872.50,    z = 10.36,	name = 'coke_dealer',		sprite = 500,	color = 75},-- 836.78131103516,-2872.5083007813,11.265098571777  
	--MethField =			{x = 1005.73,	y = -114.69,	z = 73.97,	name = 'meth_field',		sprite = 499,	color = 26},--  1976.5736083984,3820.0678710938,33.450057983398 - RDY
	--MethProcessing =	{x = 1009.37,	    y = -3194.96,	    z = -38.99,	name = 'meth_processing',	sprite = 499,	color = 26},-- 
	--MethDealer =		{x = 1508.08,	y = -2154.76,	z = 76.66,	name = 'meth_dealer',		sprite = 500,	color = 75},-- 1508.0836181641,-2154.7692871094,77.569541931152
      
	--OpiumField =		{x = 2963.11,	y = 5332.97,	z = 100.92,	name = 'opium_field',		sprite = 51,	color = 60},-- 3425.6865234375,5490.02734375,24.412145614624 - rdy
	--OpiumProcessing =	{x = 1115.4,	    y = -3161.22,	    z = -36.87,	name = 'opium_processing',	sprite = 51,	color = 60},-- 998.2822265625,-2145.5068359375,29.476442337036 - rdy
	--OpiumDealer =		{x = 579.15,	y = 136.58,	    z = 97.14,	name = 'opium_dealer',		sprite = 500,	color = 75}--  579.15191650391,136.58848571777,98.041442871094  -rdy
	--PCFakeid =	        {x = -1053.68,	    y = -230.54,	    z = 44.02,	name = 'opium_processing',	sprite = 51,	color = 60},
}

local Mafia = {
	
	--CokeDealer =		{x = 836.78,	y =-2872.50,    z = 10.36,	name = '',		sprite = 500,	color = 75},-- 836.78131103516,-2872.5083007813,11.265098571777  
	MethDealer =		{x = 1508.08,	y = -2154.76,	z = 76.66,	name = '',		sprite = 500,	color = 75},-- 1508.0836181641,-2154.7692871094,77.569541931152
	--OpiumDealer =		{x = 579.15,	y = 136.58,	    z = 97.14,	name = '',		sprite = 500,	color = 75},--  579.15191650391,136.58848571777,98.041442871094  -rdy
	Wash =		        {x = 1117.41,	y = -3195.91,	z = -41.3,	name = money_wash,		sprite = 500,	color = 75},  --  579.15191650391,136.58848571777,98.041442871094  -rdy
	--WashTpOut =		    {x = 263.13,	y = 2592.32,	z = 44.14,	name = wash_getin,		sprite = 500,	color = 75},--  579.15191650391,136.58848571777,98.041442871094  -rdy
	--WashTpIn =		    {x = 1137.93,	y = -3198.71,	z = -41.00,	name = wash_goout,		sprite = 500,	color = 75},  --  579.15191650391,136.58848571777,98.041442871094  -rdy
	--WashTpOutMeth =		{x = -338.73,	y = -2444.66,    z = 7.3,	name = wash_getin,		    sprite = 500,	color = 75},--  579.15191650391,136.58848571777,98.041442871094  -rdy
	--WashTpInMeth =		{x = 996.91,	y = -3200.62,	z = -36.39,	name = wash_goout,		sprite = 500,	color = 75},  --  579.15191650391,136.58848571777,98.041442871094  -rdy
	
	--WashTpOutCoke =		{x = 2508.92,	y = -305.03,	z = 93.09,	name = wash_getin,		    sprite = 500,	color = 75},--  579.15191650391,136.58848571777,98.041442871094  -rdy
	--WashTpInCoke =		{x = 1088.51,	y = -3187.63,	z = -38.99,	name = wash_goout,		sprite = 500,	color = 75},  --  579.15191650391,136.58848571777,98.041442871094  -rdy
	
	--WashTpOutOpium =	{x = 374.95,	y = -576.14,	z = 18.48,	name = _U('wash_getin'),		    sprite = 500,	color = 75},--  579.15191650391,136.58848571777,98.041442871094  -rdy
	--WashTpInOpium =		{x = 1120.92,	y = -3152.72,	z = -37.06,	name = _U('wash_goout'),		sprite = 500,	color = 75},  --  579.15191650391,136.58848571777,98.041442871094  -rdy
	
	--WashTpOutWeed =	{x = 126.43,	y = 6353.36,	z = 31.38,	name = wash_getin,		    sprite = 500,	color = 75},--  579.15191650391,136.58848571777,98.041442871094  -rdy
	--WashTpInWeed =		{x = 1065.91,	y = -3183.34,	z = -39.16,	name = wash_goout,		sprite = 500,	color = 75},  --  579.15191650391,136.58848571777,98.041442871094  -rdy
	
	--WashTpOutPolice1 =	{x = 452.16,	y = -984.1,	z = 26.67,	name = changerpu,		    sprite = 500,	color = 75},--  579.15191650391,136.58848571777,98.041442871094  -rdy
	--WashTpInPolice1 =	{x = 1848.51,	y = 3690.17,	z = 34.27,	name = wash_goout,		sprite = 500,	color = 75},  --  579.15191650391,136.58848571777,98.041442871094  -rdy
	
	--WashTpOutPolice2 =	{x = -448.51,	y = 6008.09,	z = 31.72,	name = wash_getin,		    sprite = 500,	color = 75},--  579.15191650391,136.58848571777,98.041442871094  -rdy
	--WashTpInPolice2 =	{x = 417.4,	y = -1002.8,	z = -99.0,	name = _U('wash_goout'),		sprite = 500,	color = 75},  --  579.15191650391,136.58848571777,98.041442871094  -rdy


	--Hospital_LosSantos =	{x = 315.45,y = -583.07,	z = 43.27,	name = changerpu,		    sprite = 500,	color = 75},--  579.15191650391,136.58848571777,98.041442871094  -rdy
	--Hospital_Sandy =	{x = 1838.75,	y = 3673.6,	z = 34.28,	name = wash_goout,		sprite = 500,	color = 75},  --  579.15191650391,136.58848571777,98.041442871094  -rdy
	
	--Hospital_Paleto =	{x = -248.68,	y = 6332.28,	z = 32.43,	name = wash_getin,		    sprite = 500,	color = 75},

	--[[Bitcoin_1 =	{x = 2169.09,	y = 2925.6,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_2 =	{x = 2171.6,	y = 2927.28,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_3 =	{x = 2174.65,	y = 2927.11,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_4 =	{x = 2177.78,	y = 2925.26,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_5 =	{x = 2179.1,	y = 2922.73,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_6 =	{x = 2179.11,	y = 2919.12,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_7 =	{x = 2177.6,	y = 2916.7,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_8 =	{x = 2174.3,	y = 2914.79,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_9 =	{x = 2171.73,	y = 2914.84,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_10 =	{x = 2168.22,	y = 2916.86,	z = -81.08,	name = wash_getin,		    sprite = 500,	color = 75},--]]
	Bitcoin_1 =	{x = 2355.02 ,	y = 3117.34,	z = 48.21,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_2 =	{x = -226.21,	y = -1999.46,	z = 24.69,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_3 =	{x = 95.43,	y = -1293.57,	z = 29.27,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_4 =	{x = 570.88,	y = -3123.49,	z = 18.77,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_5 =	{x = -60.46,	y = -2517.85,	z = 7.4,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_6 =	{x = 3536.92,	y = 3668.67,	z = 28.12,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_7 =	{x = -806.9,	y = 167.36,	z = 76.74,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_8 =	{x = -2357.13,	y = 3251.31,	z = 101.45,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_9 =	{x = -560.95,	y = 281.52,	z = 85.68,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_10 =	{x = 1450.54,	y = 1136.73,	z = 114.33,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_11 =	{x = -3183.9,	y = 1311.98,	z = 14.56,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_12 =	{x = -2166.91,	y = 5196.52,	z = 16.88,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_13 =	{x = -883.16,	y = -1286.25,	z = 13.2,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_14 =	{x = -1124.19,	y = -2818.68,	z = 39.73,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_15 =	{x = -470.3,	y = -1654.67,	z = 18.78,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_16 =	{x = 309.59,	y = -3250.33,	z = 5.92,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_17 =	{x = -1130.74,	y = -1547.45,	z = 15.6,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_18 =	{x = 1669.16,	y = 4970.91,	z = 42.27,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_19 =	{x = 1198.89,	y = -3120.16,	z = 5.54,	name = wash_getin,		    sprite = 500,	color = 75},
	Bitcoin_20 =	{x = 2427.11,	y = 3082.31,	z = 51.81,	name = wash_getin,		    sprite = 500,	color = 75},

	Bitcoin_Lester =	{x = 1275.61,	y = -1710.54,	z = 54.77,	name = wash_getin,		    sprite = 500,	color = 75},
	--Morga_LosSantos =	{x = 339.26,	y = -592.51,	z = 43.28,	name = wash_getin,		    sprite = 500,	color = 75}, --  579.15191650391,136.58848571777,98.041442871094  -rdy
}

--local OutCoordsMeth = {x = -338.73,	y = -2444.66,    z = 7.3} -- edited
--local InCoordsMeth = {x = 996.91,	y = -3200.62,	z = -36.39}
--
--local OutCoordsCoke = {x = 2508.92,	y = -305.03,	z = 93.09} -- edited
--local InCoordsCoke = {x = 1088.51,	y = -3187.63,	z = -38.99}
--
--local OutCoordsOpium = {x = 374.95,	y = -576.14,	z = 18.48} -- edited
--local InCoordsOpium = {x = 1120.92,	y = -3152.72,	z = -37.06}
--
--local OutCoordsWeed = {x = 126.43,	y = 6353.36,	z = 31.38} -- edited
--local InCoordsWeed = {x = 1065.91,	y = -3183.34,	z = -39.16}


ESX.RegisterServerCallback('esx_drugs:getzones', function(source, cb)

cb(Zones)
end)
ESX.RegisterServerCallback('esx_drugs:getzones2', function(source, cb)

cb(Mafia)
end)
ESX.RegisterServerCallback('esx_drugs:getzonestp', function(source, cb)

cb(OutCoordsMeth,InCoordsMeth,OutCoordsCoke,InCoordsCoke,OutCoordsOpium,InCoordsOpium,OutCoordsWeed,InCoordsWeed)
end)







local bitcoinvalues = {

	['Bitcoin_1'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_2'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_3'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_4'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_5'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_6'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_7'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_8'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_9'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_10'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_11'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_12'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_13'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_14'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_15'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_16'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_17'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_18'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_19'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''},
	['Bitcoin_20'] = {bitcoinvalue=0,number='',started=false,locked=false,farmtime=0,started_time=0,pausedostime=0,paused=false,pass='',customname=''}

}
local buyerplaces = {

	 ['Buyer_1'] = {active=false},
	 ['Buyer_2'] = {active=false},
	 ['Buyer_3'] = {active=false},
	 ['Buyer_4'] = {active=false},
     ['Buyer_5'] = {active=false},
     ['Buyer_6'] = {active=false},
     ['Buyer_7'] = {active=false},
     ['Buyer_8'] = {active=false},
     ['Buyer_9'] = {active=false},
     ['Buyer_10'] = {active=false},
     ['Buyer_11'] = {active=false},
	 ['Buyer_12'] = {active=false},
	 ['Buyer_13'] = {active=false},
	 ['Buyer_14'] = {active=false},
	 ['Buyer_15'] = {active=false},
	 ['Buyer_16'] = {active=false},
	 ['Buyer_17'] = {active=false},
	 ['Buyer_18'] = {active=false},
	 ['Buyer_19'] = {active=false},
	 ['Buyer_20'] = {active=false}

}


Citizen.CreateThread(function()
	while pccomponents == nil do
		pccomponents = Config.pccomponents
		Citizen.Wait(0)
	end
end)

--opium

local function HarvestOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToFarm, function()

		if PlayersHarvestingOpium[source] == true then

			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local opium = xPlayer.getInventoryItem('opium')

			if opium.limit ~= -1 and opium.count >= opium.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHpizzeriamammamiaarvestOpium')
AddEventHandler('esx_drugs:startHpizzeriamammamiaarvestOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))

	HarvestOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopHarvestpizzeriamammamiaOpium')
AddEventHandler('esx_drugs:stopHarvestpizzeriamammamiaOpium', function()

	local _source = source

	PlayersHarvestingOpium[_source] = false

end)

local function TransformOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToProcess, function()

		if PlayersTransformingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 100 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif opiumQuantity < 2 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 2)
				xPlayer.addInventoryItem('opium_pooch', 1)
			
				TransformOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:starpizzeriamammamiatTransformOpium')
AddEventHandler('esx_drugs:starpizzeriamammamiatTransformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))

	TransformOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopTranspizzeriamammamiaformOpium')
AddEventHandler('esx_drugs:stopTranspizzeriamammamiaformOpium', function()

	local _source = source

	PlayersTransformingOpium[_source] = false

end)

local function SellOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(Config.TimeToSell, function()

		if PlayersSellingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('opium_pooch', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('black_money', OpiumPrice)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('black_money', OpiumPrice)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('black_money', OpiumPrice)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('black_money', OpiumPrice)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('black_money', OpiumPrice)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('black_money', OpiumPrice)
					TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
				end
				
				SellOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellpizzeriamammamiaOpium')
AddEventHandler('esx_drugs:startSellpizzeriamammamiaOpium', function()

	local _source = source

	PlayersSellingOpium[_source] = true

	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))

	SellOpium(_source)

end)

RegisterServerEvent('esx_drugs:stopSellOpiupizzeriamammamiam')
AddEventHandler('esx_drugs:stopSellOpiupizzeriamammamiam', function()

	local _source = source

	PlayersSellingOpium[_source] = false

end)

RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_drugs:ReturnInventory', 
		_source, 
		xPlayer.getInventoryItem('coke').count, 
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.getInventoryItem('meth').count, 
		xPlayer.getInventoryItem('meth_pooch').count, 
		xPlayer.getInventoryItem('weed').count, 
		xPlayer.getInventoryItem('weed_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.job.name, 
		currentZone
	)
end)


--BITCOIN

ESX.RegisterServerCallback('esx_drugs:getPlayerInventory', function(source, cb)
	local xPlayer    = ESX.GetPlayerFromId(source)
	local blackMoney = xPlayer.getAccount('black_money').money
	local items      = xPlayer.inventory

	cb({
		blackMoney = blackMoney,
		items      = items,
		weapons    = xPlayer.getLoadout()
	})
end)



--=============


ESX.RegisterUsableItem('weed', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))
end)
ESX.RegisterUsableItem('marijuana', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('marijuana', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))
end)
--============ BITCOIN
local comprequire = {['cpu']={hascomp=false},['hdd']={hascomp=false},['ram']={hascomp=false},['mobo']={hascomp=false},['case']={hascomp=false},['cooler']={hascomp=false},['videocard']={hascomp=false},['psu']={hascomp=false}}
function GetArrayValues(house, pair)
    for k,v in pairs(pair) do
        if k == house then
            return v
        end
    end
end

function setcomprequirevalues(bool)
	 for k,v in pairs(comprequire) do
	 	v.hascomp = bool
	 end
end

function notification(msgtype,text)
TriggerClientEvent('esx_drugs:bitcoin_notify',source,msgtype,text)
end

function getIdentifierByPhoneNumber(phone_number) 
    local result = MySQL.Sync.fetchAll("SELECT users.identifier FROM users WHERE users.phone_number = @phone_number", {
        ['@phone_number'] = phone_number
    })
    if result[1] ~= nil then
        return result[1].identifier
    end
    return nil
end

ESX.RegisterServerCallback('esx_drugs:getcomputers', function(source, cb)

cb(computers)
end)

ESX.RegisterServerCallback('esx_drugs:getbitcoinvalues', function(source, cb)

cb(bitcoinvalues)
end)

ESX.RegisterServerCallback('esx_drugs:getbitcoinprice', function(source, cb)

cb(bitcoinprice)
end)

ESX.RegisterServerCallback('esx_drugs:getostime', function(source, cb)
local ostime = os.time()
cb(ostime)

end)

RegisterServerEvent('esx_drugs:addpccomponent')
AddEventHandler('esx_drugs:addpccomponent', function(item,label,comptype,PC)
local _source      = source
local xPlayer      = ESX.GetPlayerFromId(_source)
local playerItemCount = xPlayer.getInventoryItem(item).count
local var
local mobo2066 = false
local cpu2066 = false
local cooler2066 = false

   if playerItemCount > 0 then

--CHECK COMPATABLE COMPONENTS
   	--[[for k,v in pairs(computers) do
   		if v.pcname == PC then
      	     if v.itemname == 'coolermasterliquid' then
               cooler2066 = true
             elseif v.itemname == 'mobox299' then
             	mobo2066 = true
             elseif v.itemname == 'cpui97980xe' or v.itemname == 'cpui97900x' or v.itemname == 'cpui97920x' or v.itemname == 'cpui97940x' or v.itemname == 'cpui97960x' then
             	cpu2066 = true
      	     end
        end
      end


      if mobo2066 then
      	print('MOBO')
         if not cpu2066 and comptype =='cpu' then
         	local val = GetArrayValues(item,pccomponents)
         	if val.socket ~= '2066' then
         		notification('error','Този процесор има различен сокет от този на дъното !')
         		return
         	end        
         elseif not cooler2066 and comptype == 'cooler' then
             local val = GetArrayValues(item,pccomponents)
         	if val.socket ~= '2066' and val.socket ~= '2066-1151' then
         		notification('error','Този охладител има различен сокет от този на дъното !')
         		return
         	end        
         end

      elseif cpu2066 then
       print('CPU')
         if not mobo2066 and comptype =='mobo' then
         	local val = GetArrayValues(item,pccomponents)
         	if val.socket ~= '2066' then
         		notification('error','Това дъно има различен сокет от този на процесора !')
         		return
         	end        
         elseif not cooler2066 and comptype == 'cooler' then
             local val = GetArrayValues(item,pccomponents)
         	if val.socket ~= '2066' and val.socket ~= '2066-1151' then
         		notification('error','Този охладител има различен сокет от този на процесора !')
         		return
         	end        
         end


      elseif cooler2066 then
            print('COOLER')
           if not mobo2066 and comptype =='mobo' then
         	local val = GetArrayValues(item,pccomponents)
         	if val.socket ~= '2066' or not cpu2066 then
         		notification('error','Това дъно има различен сокет от този на охладителя !')
         		return
         	end     
         elseif not cpu2066 and comptype == 'cpu' then
             local val = GetArrayValues(item,pccomponents)
         	if val.socket ~= '2066' then
         		notification('error','Този процесор има различен сокет от този на охладителя !')
         		return
         	end        
         end
  elseif not mobo2066 and (comptype =='cpu' or comptype == 'cooler') then
  	local val = GetArrayValues(item,pccomponents)
         	if val.socket == '2066' then
         		if comptype == 'cpu'  then
         		notification('error','Този процесор е несъвместим!')
         		elseif comptype == 'cooler' then
         		notification('error','Този охладител несъвместим !')
         		end
              return
         	end--]]

      
     

  --end

    if comptype == 'cooler' then
     	local pcvals = GetArrayValues(item,pccomponents)
     	local sock = pcvals.socket
     	if sock ~= '2066-1151' then

		     	for k,v in pairs(computers) do
		           if v.comptype == 'mobo' and v.pcname == PC then

		              if v.socket ~= sock[1] and v.socket ~= sock[2] then
		              	notification('error','Този охладител има различен сокет от този на дъното')
		              	return
		              end
		              
		           elseif v.comptype == 'cpu' and v.pcname == PC then

		               if v.socket ~= sock[1] and v.socket ~= sock[2] then
		              	notification('error','Този охладител има различен сокет от този на процесора')
		              	return
		              end

		           end
		     	end
		 end
     end

    if comptype == 'mobo' then
     	local pcvals = GetArrayValues(item,pccomponents)
     	local sock = pcvals.socket

     	for k,v in pairs(computers) do
           if v.comptype == 'cpu' and v.pcname == PC then

              if v.socket ~= sock then
              	notification('error','Сокетът е различен или дъното не поддържа генерацията на процесора!')
              	return
              end
              
           elseif v.comptype == 'cooler' and v.pcname == PC and v.socket ~= '2066-1151' then

              if v.socket[1] ~= sock and v.socket[2] ~= sock then
              	notification('error','Сокетът е различен от този на охладителя !')
              	return
              end

           end
     	end
     end


     if comptype == 'cpu' then
     	local pcvals = GetArrayValues(item,pccomponents)
     	local sock = pcvals.socket

     	for k,v in pairs(computers) do
           if v.comptype == 'mobo' and v.pcname == PC then

              if v.socket ~= sock then
              	notification('error','Сокетът е различен или дъното не поддържа генерацията на процесора!')
              	return
              end
              
           elseif v.comptype == 'cooler' and v.pcname == PC and v.socket ~= '2066-1151' then

              if v.socket[1] ~= sock and v.socket[2] ~= sock  then
              	notification('error','Сокетът на процесора не съвпада с този на охладителя!')
              	return
              end

           end
     	end
     end

--=========================================================================================================

      for k,v in pairs(computers) do
      	if v.comptype == comptype and (v.pcname == PC) then
         notification('error','Вече има такъв вид компонент !')
         return
      	end
      end
          for k,v in pairs(pccomponents) do
             
              if k == item then
               xPlayer.removeInventoryItem(item, 1)
               if v.comptype == 'hdd' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,storage=v.storage,pcname=PC}
               elseif v.comptype =='mobo' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,socket=v.socket,gen=v.gen,pcname=PC}
               elseif v.comptype == 'cooler' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,socket=v.socket,pcname=PC}
               elseif v.comptype == 'case' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,pcname=PC}
               elseif v.comptype == 'ram' then
                var = {itemname=k,comptype=v.comptype,label=v.label,storage=v.storage,ramtype=v.ramtype,pcname=PC}
               elseif v.comptype == 'cpu' then
                 var = {itemname=k,comptype=v.comptype,label=v.label,power=v.power,socket=v.socket,gen=v.gen,pcname=PC}
               else
                 var = {itemname=k,comptype=v.comptype,label=v.label,power=v.power,pcname=PC}
             end
               table.insert(computers,var)
               MySQL.Async.execute('INSERT INTO computers (pc, itemname) VALUES (@pc, @itemname)', {
				['@pc']   = var.pcname,
				['@itemname']  = var.itemname
			  },function (addedpart)

		       end)

		      end

           end
   end


end)

RegisterServerEvent('esx_drugs:getcomponentfrompc')
AddEventHandler('esx_drugs:getcomponentfrompc', function(item,kvalue,PC)
local _source      = source
local xPlayer      = ESX.GetPlayerFromId(_source)


xPlayer.addInventoryItem(item, 1)
 table.remove(computers,kvalue)
 MySQL.Async.execute('DELETE FROM computers WHERE pc = @pc AND itemname = @itemname', {
		['@pc']  = PC,
		['@itemname'] = item
	}, function(deleted)
end)
end)

RegisterServerEvent('esx_drugs:setpcphonenumber')
AddEventHandler('esx_drugs:setpcphonenumber', function(PC,number)


local values = GetArrayValues(PC,bitcoinvalues)
values.number = number
MySQL.Async.execute("UPDATE computers_data SET phone =@phone   WHERE pc=@pc",{
					['@phone'] = number,
					['@pc'] = PC

				}, function(updated)
			end)
end)

RegisterServerEvent('esx_drugs:startfarmbitcoin')
AddEventHandler('esx_drugs:startfarmbitcoin', function(PC)
	for k,v in pairs(bitcoinvalues) do
	 if k == PC then
	 	v.started = true
	 end
	end
	local _source = source
FarmBitcoin(PC,_source)
randombrokecomps(PC,_source)
end)

RegisterServerEvent('esx_drugs:stopfarmbitcoin')
AddEventHandler('esx_drugs:stopfarmbitcoin', function(PC)

	for k,v in pairs(bitcoinvalues) do
	 if k == PC then
	 	v.started = false
	 end
	end

	setcomprequirevalues(false)

end)
RegisterServerEvent('esx_drugs:setpcpass')
AddEventHandler('esx_drugs:setpcpass', function(PC,locked,pass)
local count = 0
--print('RECEIVED PAS'..pass)
for k,v in pairs(computers) do

 if v.pcname == PC then
 	count = count + 1
 end
	
end
if count < 5 then
  notification('error','Трябва да има поне 5 компонента, за да може да го заключиш!')
  return
end
SetPCpass(PC,locked,pass)

end)


RegisterServerEvent('esx_drugs:getcurrentbitcoin')
AddEventHandler('esx_drugs:getcurrentbitcoin', function(PC)
--print(PC)
local xPlayer  = ESX.GetPlayerFromId(source)
for k,v in pairs(bitcoinvalues) do
	if k == PC then
		if v.bitcoinvalue > 0 then
			xPlayer.addInventoryItem('bitcoin', v.bitcoinvalue) 
			TriggerClientEvent('esx_drugs:bitcoin_notify',source,'success','Ти взе '.. v.bitcoinvalue ..' биткойн')
            v.bitcoinvalue = 0
            MySQL.Async.execute("UPDATE computers_data SET bitcoin =@bitcoin   WHERE pc=@pc",{
					['@bitcoin'] = 0,
					['@pc'] = PC

				}, function(updated)
			end)		
        else
        	TriggerClientEvent('esx_drugs:bitcoin_notify',source,'error','Няма биткойн')
        end
	end
end
end)

function FarmBitcoin(PC,source)
	local values = GetArrayValues(PC,bitcoinvalues)
	local pcpower = 0
if values.started == true then


--CHECK ALL COMPONENTS
     for k,v in pairs(computers) do
		  if v.pcname == PC then   	
		         local comptype = v.comptype
		         local values = v
		         for k,v in pairs(comprequire) do
		         	if comptype == k then
		         		v.hascomp = true
		         		for k,v in pairs(pccomponents) do -- OT KOI CHASTI ZAVISI POWERA
		         			if values.itemname == k and (values.comptype == 'videocard' or values.comptype == 'cpu' or values.comptype == 'ram' or values.comptype == 'psu') then 
		        		     pcpower = pcpower + v.power
		         			end
		         		end
		         	end
		         end
		     end
       end

       for k,v in pairs(comprequire) do
         	if v.hascomp then
         	else    		 
         		 TriggerEvent('esx_drugs:stopfarmbitcoin')
         		return
         	end
         end

--==================
--[[

--RANDOM BROKE COMPONENTS
  
  local r = math.random(1,50)
   if r == 9 then
   	for k,v in pairs(computers) do
   		local kvalue = k
   		if v.pcname == PC then
   			local r2 = math.random(5,10)
   			if r2 > 5 then
   				print('BROKEN COMPONENT: '.. v.itemname)
   			 local val = GetArrayValues(PC,bitcoinvalues)
   			 local text = ('[КОМПЮТЪР] Изгоря компонент: '..v.label)
   			 local validnumber = getIdentifierByPhoneNumber(val.number)
   			 Citizen.Wait(10)
   			 if validnumber ~= nil then 
   			-- print('SEND MESSAGE')	
   			 TriggerClientEvent('esx_drugs:pcphonemessage',source,val.number,text)
   			 end
             table.remove(computers,kvalue)
             TriggerEvent('esx_drugs:stopfarmbitcoin')
             return
   			end
   		end
   	end
     
   end
--]]
--==============







--CALCULATE DELAY

pcpower = pcpower * 3200
local timeout = time - pcpower
if values.paused then

   values.paused = false

	local farmtimeval = (values.farmtime/1000)
 	local started_time = values.started_time
 	local ostavatime = (farmtimeval-(values.pausedostime - started_time))
    local izminalovreme = farmtimeval - ostavatime

    timeout = timeout - (izminalovreme*1000)

end
--==============
  
    values.farmtime = timeout
    values.started_time = os.time()


	--print('RECEIVED START FARM REQUEST')
	SetTimeout(timeout, function()
      -- print('GIVE BITCOIN REQUEST')local farmtimeval = (v.farmtime)

    local farmtimeval = (values.farmtime/1000)
 	local started_time = values.started_time
 	local ostavatime = (farmtimeval-(os.time() - started_time))
    local izminalovreme = farmtimeval - ostavatime
       if values.paused then
       --  print('paused')
       else
        --  print('not paused')
       end
       -- print('izminalovreme : '..izminalovreme)
       -- print('farmtimeval: '..farmtimeval)
        if values.started then
        --	print('started')

        else
        --    print('not started')

        end
	     if values.started == true and values.paused == false and (izminalovreme == farmtimeval or izminalovreme > farmtimeval) then
	     	values.bitcoinvalue = values.bitcoinvalue + 1
	     	MySQL.Async.execute("UPDATE computers_data SET bitcoin =@bitcoin   WHERE pc=@pc",{
					['@bitcoin'] = values.bitcoinvalue,
					['@pc'] = PC

				}, function(updated)
			end)
	     	--print(PC..' +1 BITCOIN')

     FarmBitcoin(PC,source)
      end
	end)
   
end
end


function randombrokecomps(PC,source)
local values = GetArrayValues(PC,bitcoinvalues)
--print('RANDOM BROKE CHECK')
	if values.started then
		
		SetTimeout(delay, function()
			values = GetArrayValues(PC,bitcoinvalues)

	    if values.started == true and values.paused == false then
           local r = math.random(1,100)
         --  print('RANDOM :'.. r)
         local bitvalue = values.bitcoinvalue
         if bitvalue >= limitbit then
         	procent = limitprocent
         else
         	procent = defprocent
         end
		   if r > procent then -- 80
		   	for k,v in pairs(computers) do
		   		local kvalue = k
		   		if v.pcname == PC and v.comptype ~= 'case' then
		   		--	print('1')
		   			local r2 =  math.random(0,100)
		   			local compname = ''
                    if r2 >= 60 then
                    --	print('2')
                    	compname ='videocard'
                    elseif r2 >= 50 and r2 < 60 then
                    	--print('3')
                    	compname ='cpu'
                    elseif r2 >= 40 and r2 < 50 then
                    	--print('4')
                    	compname = 'psu'
                    else
                    	--print('5')
                    	 compname = v.comptype
                    end

                    
                  --  print('COMPNAME: '..compname)

			      for k,v in pairs(computers) do
			      	kvalue = k
			       if v.pcname == PC and v.comptype == compname then
		   		     print('BROKEN COMPONENT: '.. v.itemname..' PC: '..PC)
		   			 local val = GetArrayValues(PC,bitcoinvalues)
		   			 local text = ('[КОМПЮТЪР] Изгоря компонент: '..v.label)
		   			 if val.customname ~= '' then
		   			 	text = ('[КОМПЮТЪР] ['..val.customname..'] Изгоря компонент: '..v.label)
		   			 end
		   			 local validnumber = getIdentifierByPhoneNumber(val.number)
		   			 Citizen.Wait(10)
		   			 if validnumber ~= nil then 
		   			-- print('SEND MESSAGE')	
		   			 TriggerClientEvent('esx_drugs:pcphonemessage',source,val.number,text)
		   			 end
		             table.remove(computers,kvalue)
		             val.paused = true
		             val.pausedostime = os.time()
		             MySQL.Async.execute('DELETE FROM computers WHERE pc = @pc AND itemname = @itemname', {
						['@pc']  = PC,
						['@itemname'] = v.itemname
					}, function(deleted)
				end)
		             TriggerEvent('esx_drugs:stopfarmbitcoin')
		             return
		   		   end
			     end
		   		end
		   	end
		     
		   end
 
	     randombrokecomps(PC,source)
	 end
		end)

	else
		return
	end
end





function SetPCpass(PC,lockstate,password)

local values = GetArrayValues(PC,bitcoinvalues)
values.locked = lockstate
values.pass = password
local lockint = 0
if values.locked then
lockint = 0
else
lockint = 1
end
MySQL.Async.execute("UPDATE computers_data SET password =@password   WHERE pc=@pc",{
					['@password'] = password,
					--['@locked'] = lockint,
					['@pc'] = PC

				}, function(updated)
			end)
MySQL.Async.execute("UPDATE computers_data SET locked =@locked   WHERE pc=@pc",{
					['@locked'] = lockint,
					['@pc'] = PC

				}, function(updated)
			end)



--print('NEW PASS = '..values.pass)
if values.locked then
 --print('LOCKSTATE= TRUE')
else
 --print('LOCKSTATE= FALSE')
end

end

RegisterServerEvent('esx_drugs:pchack')
AddEventHandler('esx_drugs:pchack', function()
local r = math.random(0,100)
local xPlayer = ESX.GetPlayerFromId(source)
if xPlayer.getInventoryItem('hackerDevice').count >= 1 then
if r < 30 then
xPlayer.removeInventoryItem('hackerDevice', 1)
notification('inform','Устройството за хакване изгоря!')
end

TriggerClientEvent('esx_drugs:currentlypchack', source)

else
   notification('inform','Трябва ти Raspberry , за да хакваш!')
   TriggerClientEvent('esx_drugs:sethacking',source,false)
end

end)

RegisterServerEvent('esx_drugs:checkbitcoinlester')
AddEventHandler('esx_drugs:checkbitcoinlester', function()
local xPlayer = ESX.GetPlayerFromId(source)
local minbitcoin = 1
local _source = source
  if xPlayer.getInventoryItem('bitcoin').count >= minbitcoin then

	
	notification('inform','Започва търсене на купувачи..')
   
	TriggerClientEvent('esx_drugs:startprogbar', source,2000,'Търсене на купувачи...')
	Wait(2000)
	local freeplaces = {}
	local rmax = 0
	local izbrano 
     for k,v in pairs(buyerplaces) do
     	 if not v.active then
          table.insert(freeplaces,k)
          rmax = rmax + 1
     	 end
     end
    -- print(rmax)
     local r = math.random(1,rmax)
   
     for i=1, #freeplaces, 1 do
     --	print(freeplaces[i])
     	if i == r then
          izbrano = freeplaces[i]
        --  print('IZBRANO: '..izbrano)
     	end
     	 
     end
     local vals = GetArrayValues(izbrano,buyerplaces)
     vals.active = true
	 TriggerClientEvent('esx_drugs:startbuyer', _source,izbrano)

  else
	   notification('inform','Трябва да имаш поне '..minbitcoin..' биткойн')
    end

end)

RegisterServerEvent('esx_drugs:buyeraccept')
AddEventHandler('esx_drugs:buyeraccept', function(offer)

local xPlayer = ESX.GetPlayerFromId(source)
local _source = source
local minbit = 1
local animation = {lib="mp_ped_interaction",anim = "handshake_guy_a"}
  if xPlayer.getInventoryItem('bitcoin').count >= minbit then
    
    TriggerClientEvent('esx_drugs:playanimation',_source,animation.lib,animation.anim,true)

    local sellfor = xPlayer.getInventoryItem('bitcoin').count * (offer/47)
    --xPlayer.addMoney(sellfor)
    xPlayer.addAccountMoney('bank', sellfor)
    local bittcount = xPlayer.getInventoryItem('bitcoin').count
    xPlayer.removeInventoryItem('bitcoin', xPlayer.getInventoryItem('bitcoin').count)
    notification('success','Сделката е сключена.Ти продаде '..bittcount..' биткойн за $'..sellfor)
    TriggerClientEvent('esx_drugs:buyercomplete',_source)
  
  else
  notification('error','Трябва да имаш поне '..minbit..' биткойн!')
  TriggerClientEvent('esx_drugs:setfreezeplayer',source,false)

  end

end)

RegisterServerEvent('esx_drugs:setbuyerplaceactive')
AddEventHandler('esx_drugs:setbuyerplaceactive', function(place,value)

local val = GetArrayValues(place,buyerplaces)
val.active = false

end)

RegisterServerEvent('esx_drugs:setpccustomname')
AddEventHandler('esx_drugs:setpccustomname', function(PC,custom)

local val = GetArrayValues(PC,bitcoinvalues)
val.customname = custom

MySQL.Async.execute("UPDATE computers_data SET customname =@customname   WHERE pc=@pc",{
					['@customname'] = custom,
					['@pc'] = PC

				}, function(updated)
			end)

end)

RegisterServerEvent('esx_drugs:getcompsfromdatabase')
AddEventHandler('esx_drugs:getcompsfromdatabase', function()
MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM computers', {}, function(comps)
		computers = {}
local var       

      for i=1, #comps, 1 do

            local PC  = nil
			local item      = nil
 
				PC = comps[i].pc
				item = comps[i].itemname

if PC ~= nil and item ~= nil then
	  for k,v in pairs(pccomponents) do
             
              if k == item then
               if v.comptype == 'hdd' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,storage=v.storage,pcname=PC}
               elseif v.comptype =='mobo' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,socket=v.socket,gen = v.gen,pcname=PC}
               elseif v.comptype == 'cooler' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,socket=v.socket,pcname=PC}
               elseif v.comptype == 'case' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,pcname=PC}
               elseif v.comptype == 'ram' then
                var = {itemname=k,comptype=v.comptype,label=v.label,storage=v.storage,ramtype=v.ramtype,pcname=PC}
               elseif v.comptype == 'cpu' then
                 var = {itemname=k,comptype=v.comptype,label=v.label,power=v.power,socket=v.socket,gen=v.gen,pcname=PC}
               else
                 var = {itemname=k,comptype=v.comptype,label=v.label,power=v.power,pcname=PC}
             end
               table.insert(computers,var)
		      end

           end

       end -- nil if
       end

      	

	end)
	       MySQL.Async.fetchAll('SELECT * FROM computers_data', {}, function(compsdata)

			    for i=1, #compsdata, 1 do
			       	
					local password  = nil
					local phone     = nil
					local locked  = nil
					local bitcoin     = nil
					local PC     = nil
					local customname = nil
					password = compsdata[i].password
					phone = compsdata[i].phone
					locked = compsdata[i].locked
					bitcoin = compsdata[i].bitcoin
					PC = compsdata[i].pc
					customname = compsdata[i].customname

					if password ~= nil and phone ~= nil and locked ~= nil and bitcoin ~= nil and PC ~= nil then
						local vals = GetArrayValues(PC,bitcoinvalues)
						vals.pass = password
						vals.number = phone
						vals.customname = customname
						if locked == 0 then
						vals.locked = false
						else
                        vals.locked = true
						end
						vals.bitcoinvalue = bitcoin
					end

		       end
		end)
end)
end)


--========= WHEN JOIN SYNC
MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM computers', {}, function(comps)
		computers = {}
local var       

      for i=1, #comps, 1 do

            local PC  = nil
			local item      = nil
 
				PC = comps[i].pc
				item = comps[i].itemname
				--print(PC)
				--print(item)

if PC ~= nil and item ~= nil then
	  for k,v in pairs(pccomponents) do
             
              if k == item then
               if v.comptype == 'hdd' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,storage=v.storage,pcname=PC}
               elseif v.comptype =='mobo' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,socket=v.socket,gen = v.gen,pcname=PC}
               elseif v.comptype == 'cooler' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,socket=v.socket,pcname=PC}
               elseif v.comptype == 'case' then
               	var = {itemname=k,comptype=v.comptype,label=v.label,pcname=PC}
               elseif v.comptype == 'ram' then
                var = {itemname=k,comptype=v.comptype,label=v.label,storage=v.storage,ramtype=v.ramtype,pcname=PC}
               elseif v.comptype == 'cpu' then
                 var = {itemname=k,comptype=v.comptype,label=v.label,power=v.power,socket=v.socket,gen=v.gen,pcname=PC}
               else
                 var = {itemname=k,comptype=v.comptype,label=v.label,power=v.power,pcname=PC}
             end
               table.insert(computers,var)
		      end

           end

       end -- nil if
       end

      	

	end)
	       MySQL.Async.fetchAll('SELECT * FROM computers_data', {}, function(compsdata)

			    for i=1, #compsdata, 1 do
			       	
					local password  = nil
					local phone     = nil
					local locked  = nil
					local bitcoin     = nil
					local PC     = nil
					local customname = nil
					password = compsdata[i].password
					phone = compsdata[i].phone
					locked = compsdata[i].locked
					bitcoin = compsdata[i].bitcoin
					PC = compsdata[i].pc
					customname = compsdata[i].customname
					--print(locked)

					if password ~= nil and phone ~= nil and locked ~= nil and bitcoin ~= nil and PC ~= nil then
						local vals = GetArrayValues(PC,bitcoinvalues)
						vals.pass = password
						vals.number = phone
						vals.customname = customname
						if locked == 0 then
						vals.locked = false
						else
                        vals.locked = true
						end
						vals.bitcoinvalue = bitcoin
					end

		       end
		end)
end)
--========================
--==FAKEID=====================
ESX.RegisterServerCallback('esx_drugs:hasfakeiditem', function(source, cb)
local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getInventoryItem('fakeid').count >= 1 then

      

		xPlayer.removeInventoryItem('fakeid', 1)
		cb(true) 
	else
        cb(false) 
	end

end)
--===================================

function setvarsfromcommand(var,value)

 --[[limitprocent = 30
 procent = 83
 defprocent = 83
 limitbit = 1
 delay = 900000 --= For test - 15000  900000
 time = 7200000 --5400000 --90 minutes -- for test - 2400000--]]


 if var == 'limitprocent' then
 	limitprocent = tonumber(value)
 elseif var == 'procent' then
 	procent =  tonumber(value)
 elseif var == 'defprocent' then
 	defprocent = tonumber(value)
 elseif var == 'limitbit' then
 	limitbit = tonumber(value)
 elseif var == 'delay' then
 	delay = tonumber(value)
 elseif var == 'time' then
 	time = tonumber(value)
 end

--print('limitprocent: '..limitprocent)
--print('Procent: '..procent)
--print('Defprocent: '..defprocent)
--print('Limitbit: '..limitbit)
--print('Delay: '..delay)
--print('Time: '..time)

end

function brokepcfromcommand(PC,compname,source)
local kvalue
local values = GetArrayValues(PC,bitcoinvalues)

  if values.started == true and values.paused == false then
			      for k,v in pairs(computers) do
			      	kvalue = k
			       if v.pcname == PC and v.comptype == compname then
		   		     --print('BROKEN COMPONENT: '.. v.itemname..' PC: '..PC)
		   			 local val = GetArrayValues(PC,bitcoinvalues)
		   			 local text = ('[КОМПЮТЪР] Изгоря компонент: '..v.label)
				   			 if val.customname ~= '' then
				   			 	text = ('[КОМПЮТЪР] ['..val.customname..'] Изгоря компонент: '..v.label)
				   			 end
		   			 local validnumber = getIdentifierByPhoneNumber(val.number)
		   			 Citizen.Wait(10)
				   			 if validnumber ~= nil then 
				   			-- print('SEND MESSAGE')	
				   			 TriggerClientEvent('esx_drugs:pcphonemessage',source,val.number,text)
				   			 end
		             table.remove(computers,kvalue)
		             val.paused = true
		             val.pausedostime = os.time()
				             MySQL.Async.execute('DELETE FROM computers WHERE pc = @pc AND itemname = @itemname', {
								['@pc']  = PC,
								['@itemname'] = v.itemname
							}, function(deleted)
						end)
		             TriggerEvent('esx_drugs:stopfarmbitcoin')
		             return
		   		   end
			     end
			 else
			 	--print('======================')
			 	--print('Paused or Not started!')
			 	--print('======================')
			 end

end










 
TriggerEvent('es:addGroupCommand', 'bvalues', 'admin', function(source, args, user) --usage: /bvalues procent 50
	if args[1] and args[2] ~= nil then
		 setvarsfromcommand(args[1],args[2])
	else
		--TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'),'Грешни данни' } } )
	end
end, function(source, args, user)
--	TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), _U('insufficient_permissions') } })
end)

TriggerEvent('es:addGroupCommand', 'bpc', 'admin', function(source, args, user) --/usage /bpc Bitcoin_1 gpu
	if args[1] and args[2] ~= nil then
		 brokepcfromcommand(args[1],args[2],source)
	else
		--TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'),'Грешни данни' } } )
	end
end, function(source, args, user)
--	TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), _U('insufficient_permissions') } })
end)


print('Скрипта е направен с цел вземане пари от децата\n Стефан е велик!')