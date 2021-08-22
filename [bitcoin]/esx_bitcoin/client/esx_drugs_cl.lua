local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX 			    			= nil
local Zones = {}
local Mafia = {}

local OutCoordsMeth 
local InCoordsMeth 

local OutCoordsCoke 
local InCoordsCoke 

local OutCoordsOpium 
local InCoordsOpium 

local OutCoordsWeed 
local InCoordsWeed 
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
Citizen.Wait(40)
		ESX.TriggerServerCallback('esx_drugs:getzones', function(serverzones)
		     Zones = serverzones
	    end)

	    ESX.TriggerServerCallback('esx_drugs:getzones2', function(servermafia)
		     Mafia = servermafia
	    end)

	    ESX.TriggerServerCallback('esx_drugs:getzonestp', function(outmeth,inmeth,outcoke,incoke,outopium,inopium,outweed,inweed)
		         OutCoordsMeth = outmeth
				 InCoordsMeth = inmeth

				 OutCoordsCoke = outcoke
				 InCoordsCoke  = incoke

				 OutCoordsOpium = outopium
				 InCoordsOpium  = inopium

				 OutCoordsWeed = outweed
				 InCoordsWeed = inweed
	    end)
		
		Citizen.Wait(0)
end)





local cokeQTE       			= 0
local coke_poochQTE 			= 0
local weedQTE					= 0
local weed_poochQTE 			= 0
local methQTE					= 0
local meth_poochQTE 			= 0
local opiumQTE					= 0
local opium_poochQTE 			= 0
local myJob 					= nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local isInZone                  = false
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local lastbuyertime = 0
local BuyerBlip
local lastchanged = GetGameTimer()
local ostime = 0
local PlayerData = {}
--local BuyerMenuOpen = false
local pccomponents = Config.pccomponents
local bitcoinoffer = math.random(4000,7000)
local currentoffer = 0


AddEventHandler('esx_drugs:hasEnteredMarker', function(zone)
	--if  myJob == 'ambulance' then
      --  return
	--end
	PlayerData = ESX.GetPlayerData()

	ESX.UI.Menu.CloseAll()

	if zone == 'Bitcoin_1' or  zone == 'Bitcoin_2' or  zone == 'Bitcoin_3' or  zone == 'Bitcoin_4' or  zone == 'Bitcoin_5' or  zone == 'Bitcoin_6' or  zone == 'Bitcoin_7' or  zone == 'Bitcoin_8' or  zone == 'Bitcoin_9' or  zone == 'Bitcoin_10' 
		or  zone == 'Bitcoin_11' or  zone == 'Bitcoin_12' or  zone == 'Bitcoin_13' or  zone == 'Bitcoin_14' or  zone == 'Bitcoin_15' or  zone == 'Bitcoin_16' or  zone == 'Bitcoin_17' or  zone == 'Bitcoin_18' or  zone == 'Bitcoin_19' or  zone == 'Bitcoin_20' then 
		CurrentAction     = zone
		CurrentActionMsg  = 'Натисни ~INPUT_CONTEXT~ за да копаеш биткойн'
		CurrentActionData = {}
	end

	if zone == 'Bitcoin_Lester'  then 
		CurrentAction     = zone
		CurrentActionMsg  = 'Натисни ~INPUT_CONTEXT~ за да търсиш купувачи на биткойн'
		CurrentActionData = {}
	end
end)

-- Create blips
Citizen.CreateThread(function()
	
		local blip = AddBlipForCoord(1275.61,-1710.54,54.77)

		SetBlipSprite (blip, 521)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.9)
		SetBlipColour (blip, 47)
		SetBlipAsShortRange(blip, true)

	    BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Търсене на купувач')
		EndTextCommandSetBlipName(blip)
	
end)

-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('esx_drugs:ReturnInventory')
AddEventHandler('esx_drugs:ReturnInventory', function(cokeNbr, cokepNbr, methNbr, methpNbr, weedNbr, weedpNbr, opiumNbr, opiumpNbr, jobName, currentZone)
	cokeQTE	   = cokeNbr
	coke_poochQTE = cokepNbr
	methQTE 	  = methNbr
	meth_poochQTE = methpNbr
	weedQTE 	  = weedNbr
	weed_poochQTE = weedpNbr
	opiumQTE	   = opiumNbr
	opium_poochQTE = opiumpNbr
	myJob		 = jobName
	TriggerEvent('esx_drugs:hasEnteredMarker', currentZone)
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
				isInMarker  = true
				currentZone = k
			end
		end
		for k,v in pairs(Mafia) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
				isInMarker  = true
				currentZone = k
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone				= currentZone
			TriggerServerEvent('esx_drugs:GetUserInventory', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
		end

		if isInMarker and isInZone then
			TriggerEvent('esx_drugs:hasEnteredMarker', 'exitMarker')
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, Keys['E']) then
				isInZone = true -- unless we set this boolean to false, we will always freeze the user
				if CurrentAction == 'exitMarker' then
					isInZone = false -- do not freeze user
					TriggerEvent('esx_drugs:freezePlayer', false)
					print('FREEZE')
					TriggerEvent('esx_drugs:hasExitedMarker', lastZone)
					Citizen.Wait(15000)
                elseif  CurrentAction == 'Bitcoin_1' or CurrentAction == 'Bitcoin_2' or CurrentAction == 'Bitcoin_3' or CurrentAction == 'Bitcoin_4' or CurrentAction == 'Bitcoin_5' or CurrentAction == 'Bitcoin_6' or CurrentAction == 'Bitcoin_7' or CurrentAction == 'Bitcoin_8' or CurrentAction == 'Bitcoin_9' or CurrentAction == 'Bitcoin_10'
                or CurrentAction == 'Bitcoin_11' or CurrentAction == 'Bitcoin_12'or CurrentAction == 'Bitcoin_13'or CurrentAction == 'Bitcoin_14' or CurrentAction == 'Bitcoin_15'or CurrentAction == 'Bitcoin_16'or CurrentAction == 'Bitcoin_17'or CurrentAction == 'Bitcoin_18'or CurrentAction == 'Bitcoin_19'or CurrentAction == 'Bitcoin_20'then
                	isInZone = false
                    OpenBitcoinMenu(CurrentAction)
                    ESX.TriggerServerCallback('esx_drugs:getostime', function(serverostime)
                    	ostime = serverostime
                end)
                elseif  CurrentAction == 'Bitcoin_Lester' then
                	isInZone = false
                    OpenLesterBitcoinMenu()     
				else
					isInZone = false -- not a esx_drugs zone
				end
				
				if isInZone then
					TriggerEvent('esx_drugs:freezePlayer', true)
				end
				
				CurrentAction = nil
			end
		end
	end
end)

function SetCoords(playerPed, x, y, z)
  SetEntityCoords(playerPed, x, y, z)
  Citizen.Wait(100)
  SetEntityCoords(playerPed, x, y, z)
end
RegisterNetEvent('esx_drugs:freezePlayer')
AddEventHandler('esx_drugs:freezePlayer', function(freeze)
	FreezeEntityPosition(GetPlayerPed(-1), freeze)
end)

--==============
function GetArrayValues(house, pair)
    for k,v in pairs(pair) do
        if k == house then
            return v
        end
    end
end

--=========================BITCOIN
local ispcon = false
local pcpower = 0
local startbtntext = 'Включи'
local PCName
local videopercent = 0
local cpupercent = 0
local rampercent = 0
local cpuhot = 0
local powersupplypercent = 0
local ishacking = false
local bitcoinprogress = 0
local pctext = 'Компютър'
local bitcoinvals = {}
local translate =   {['cpu']={prevod='Процесор'},['hdd']={prevod='Хард Диск'},['ram']={prevod='Рам памет'},['mobo']={prevod='Дънна Платка'},['case']={prevod='Кутия'},['cooler']={prevod='Охлаждане'},['videocard']={prevod='Видео Карта'},['psu']={prevod='Захранване'}}
local comprequire = {['cpu']={hascomp=false},['hdd']={hascomp=false},['ram']={hascomp=false},['mobo']={hascomp=false},['case']={hascomp=false},['cooler']={hascomp=false},['videocard']={hascomp=false},['psu']={hascomp=false}}
function OpenBitcoinMenu(PC)
	ESX.TriggerServerCallback('esx_drugs:getbitcoinvalues', function(bitcoinvalues)
	PCName = PC
	bitcoinprogress = 0
	--print(PC)
	setcomprequirevalues(false)

		local getbittext = ('(Вземи)Bitcoin: '.. 0)
		for k,v in pairs(bitcoinvalues) do
			 if k == PCName then
			 	bitcoinvals = v
			 	ispcon = v.started
			 	getbittext = ('(Вземи)Bitcoin: '.. v.bitcoinvalue)
			 	if v.customname ~= '' and not v.locked then
			 		pctext = ('Компютър - Име: '..v.customname)
			 	else
			 		pctext = 'Компютър'
			 	end
			 if v.started then
			 	if v.paused then
			 		v.started = false
			 		ispcon = false
			 		ostime = v.pausedostime
			 	end
				 	local farmtimeval = (v.farmtime/1000)
				 	local started_time = v.started_time
				 	local ostavatime = (farmtimeval-(ostime - started_time))
	                local izminalovreme = farmtimeval - ostavatime
				 	--print('farm time :'.. farmtimeval)
				 	--print('ostime: '..ostime)
				 	--print('started_time'..started_time)
				 	--print('ostava time: '..ostavatime)
				 	--print('izminali seconds: '..izminalovreme)
				 	if(izminalovreme >0 and farmtimeval > 0) then
				 	--print('Percent: '..  (string.format("%.1f", (izminalovreme/farmtimeval)*100)))
				 	--((izminalovreme/farmtimeval)*100))
				 	bitcoinprogress = (string.format("%.1f", (izminalovreme/farmtimeval)*100))
				     end
			 end



			 end
		end
ESX.UI.Menu.CloseAll()

		
if not ispcon then
	starttbntext = 'Включи'
	videopercent = 0
    cpupercent = 0
    rampercent = 0
    cpuhot = 0
    powersupplypercent = 0
else
	starttbntext = 'Изключи'
	videopercent = math.random(95,100)
	cpupercent = math.random(50,100)
    rampercent = math.random(45,100)
    cpuhot = math.random(55,70)
    powersupplypercent = math.random(60,100)
end

local unlockedmenu = {
      	{ label = starttbntext, value = 'startbutton' },
      	{ label = 'Сложи Парола', value = 'setpass' },
      	{ label = 'Сложи тел.номер за известия', value = 'setphone' },
      	{ label = 'Сложи име на компютъра', value = 'setpccustomname' },
        { label = "Процесор:"..cpupercent..'%', value = 'cpurefresh' },
        { label = "Видео карта:"..videopercent..'%', value = 'videorefresh' },
        { label = "Рам:"..rampercent..'%', value = 'ramrefresh' },
        { label = "Захранване:"..powersupplypercent..'%', value = 'powerrefresh' },
        { label = "Градуси CPU:"..cpuhot, value = 'hotrefresh' },
        { label = "Отвори Компютър", value = 'openpccase' },
        { label = "Добави компонент", value = 'player_inventory' },
        { label = "Вземи компонент", value = 'room_inventory' },
        { label = getbittext, value = 'getbitcoin' },
        { label = 'Прогрес: '..bitcoinprogress..'%', value = 'bitcoinprogress' },
      }
local lockedmenu = {
      	{ label = 'Въведи Парола', value = 'enterpass' },
      	{ label = 'Хакни', value = 'hackpc' }

      }

       local elementi = {}
      if bitcoinvals.locked then
      	elementi = lockedmenu
      	print('locked')
      elseif not bitcoinvals.locked then
        elementi = unlockedmenu
        print('unlocked')
      end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'wea_cat',
    {
      title = pctext,
	  align    = 'bottom-right',
      elements = elementi
    },
    function (data, menu)
      
      local value = data.current.value
      local rvalue = value

      if data.current.value == 'openpccase' then
           OpenCasePCMenu()
      elseif data.current.value == 'player_inventory' then
               OpenPlayerInventoryPCMenu()
      elseif data.current.value == 'room_inventory' then
         OpenGetComponentPCMenu()
      elseif data.current.value == 'startbutton' then
         StartButtonPCMenu()
         OpenBitcoinMenu(PCName)
     elseif data.current.value == 'getbitcoin' then
          GetBitcoinFromPC()
     elseif data.current.value == 'setpass' then
          SetPCpassMenu(PCName)
     elseif data.current.value == 'enterpass' then
          EnterPCpass(PCName)
     elseif data.current.value == 'hackpc' then
          Hackpc(PCName)
     elseif data.current.value == 'setpccustomname' then
          SetPCCustomName(PCName)     
     elseif data.current.value == 'bitcoinprogress' then
     	OpenBitcoinMenu(CurrentAction)
                    ESX.TriggerServerCallback('esx_drugs:getostime', function(serverostime)
                    	ostime = serverostime
                    	OpenBitcoinMenu(PC)
                end)
           
     elseif data.current.value == 'setphone' then
          SetPCPhoneNumber(PCName)     
     elseif data.current.value == 'videorefresh' or data.current.value == 'cpurefresh'  or data.current.value == 'ramrefresh' or data.current.value == 'powerrefresh' or data.current.value == 'hotrefresh' then
          RefreshMenuValues()
	  end

      --menu.close()
    end,
    function (data, menu)
      menu.close()
    end
  )
end)
end

function setcomprequirevalues(bool)
	 for k,v in pairs(comprequire) do
	 	v.hascomp = bool
	 end
end
--==============
function StartButtonPCMenu()
local computer = {}
		ESX.TriggerServerCallback('esx_drugs:getcomputers', function(computers)
if not ispcon then
           computer = computers

        for k,v in pairs(computer) do
		  if v.pcname == PCName then   	
		         local comptype = v.comptype
		         local values = v
		         for k,v in pairs(comprequire) do
		         	if comptype == k then
		         		v.hascomp = true
		         		for k,v in pairs(pccomponents) do
		         			if values.itemname == k and (values.comptype == 'videocard' or values.comptype == 'cpu' or values.comptype == 'ram' or values.comptype == 'psu') then 
		        		     pcpower = pcpower + v.power
		        		     --print('POWER:'.. pcpower)
		         			end
		         		end
		         	end
		         end
		     end
       end

         for k,v in pairs(comprequire) do
         	if v.hascomp then
         	else
         		local lipsvat = {}
         		for k,v in pairs(comprequire) do
		         	if not v.hascomp then
                    local tranvals = GetArrayValues(k,translate)
                     table.insert(lipsvat,tranvals.prevod)
		         	end
		         end
                 pcpower = 0
         		 TriggerServerEvent('esx_drugs:stopfarmbitcoin')
         		 setcomprequirevalues(false)
         		 notification('error','Липсват компоненти!')
         		 for i=1, #lipsvat, 1 do
         		 	notification('inform',lipsvat[i])
         		 	Citizen.Wait(30)
         		 end
         		return
         	end
         end
	  ispcon = true
	  TriggerServerEvent('esx_drugs:startfarmbitcoin',PCName)
	  notification('inform','Компютърът е включен,започва копаенето на биткойн')
    else
	  ispcon = false
	  pcpower = 0
	  TriggerServerEvent('esx_drugs:stopfarmbitcoin',PCName)
	  setcomprequirevalues(false)
	  notification('error','Компютърът е изключен')
	  bitcoinprogress = 0
	end

	end)
		Citizen.Wait(100)
		OpenBitcoinMenu(PCName)
end

function notification(msgtype,text)
exports['mythic_notify']:DoHudText(msgtype, text)
end

RegisterNetEvent('esx_drugs:bitcoin_notify')
AddEventHandler('esx_drugs:bitcoin_notify', function(msgtype,text)
	notification(msgtype,text)
end)
function OpenPlayerInventoryPCMenu()
	if not ispcon then
ESX.TriggerServerCallback('esx_drugs:getPlayerInventory', function(inventory)
		local elements = {}



		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

            for k,v in pairs(pccomponents) do
             
              if k == item.name then
               
			    if item.count > 0 then
				   table.insert(elements, {
				  	label = item.label .. ' x' .. item.count,
					type  = 'item_pc',
					value = item.name,
					comptype = v.comptype
				  })
			    end

		      end

		    end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_inventory', {
			title    = 'Добави Компонент',
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)

				--ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
				--	title = _U('amount')
				--}, function(data2, menu2)
				--	local quantity = tonumber(data2.value)

				--	if quantity == nil then
				--		ESX.ShowNotification(_U('amount_invalid'))
					--else
         
	               --    menu2.close()

						TriggerServerEvent('esx_drugs:addpccomponent',data.current.value, data.current.label,data.current.comptype,PCName)
						ESX.SetTimeout(300, function()
							OpenPlayerInventoryPCMenu()
						end)          		                        
				--[[	end
				end, function(data2, menu2)
					menu2.close()
				end)	--]]
			
		end, function(data, menu)
			menu.close()
		end)
	end)
 else
	    notification('inform','Първо трябва да изключиш компютъра')
 end
end

function OpenCasePCMenu()
		ESX.TriggerServerCallback('esx_drugs:getcomputers', function(computers)

	--if number ~= 0 then

		local elements = {}
        
    
		for k,v in pairs(computers) do
			if v.pcname == PCName then


        
			table.insert(elements, {
				  	label = v.label,
					type  = 'item_pc',
					value = v.itemname
				  })
		end
		end
           Citizen.Wait(10)
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_inventory', {
				title    = 'Компютър',
				align    = 'bottom-right',
				elements = elements
				},function(data, menu)
			end, function(data, menu)
					menu.close()

			end)
	--	end

		end)

end

function OpenGetComponentPCMenu()
if not ispcon then
		ESX.TriggerServerCallback('esx_drugs:getcomputers', function(computers)
		local elements = {}

		for k,v in pairs(computers) do
          if v.pcname == PCName then
			--print('Get Component ' .. v.label .. 'K=' .. v.itemname)

			table.insert(elements, {
				  	label = v.label,
					type  = 'item_pc',
					value = v.itemname
				  })
		end
		end
           Citizen.Wait(10)
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_inventory', {
				title    = 'Вземи компонент',
				align    = 'bottom-right',
				elements = elements
				},function(data, menu)
			       local kvalue
			       for k,v in pairs(computers) do
			       	 if data.current.value == v.itemname and (v.pcname == PCName) then
			       	 	kvalue = k
			       	 end
			       end
					
					TriggerServerEvent('esx_drugs:getcomponentfrompc',data.current.value,kvalue,PCName)
                    menu.close()

			end, function(data, menu)
		   menu.close()
			end)

		end)


 else
    notification('inform','Първо трябва да изключиш компютъра')
 end
end

function GetBitcoinFromPC()
 TriggerServerEvent('esx_drugs:getcurrentbitcoin',PCName)
 OpenBitcoinMenu(PCName)
end

function RefreshMenuValues()
OpenBitcoinMenu(PCName)
end
function SetPCpass(PC,locked,pass)
TriggerServerEvent('esx_drugs:setpcpass',PC,locked,pass)
end
function SetPCpassMenu(PC)

					ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
					title = 'Задай Парола'
				}, function(data2, menu2)
					local password = data2.value

					if password == nil then
						ESX.ShowNotification('Не е въведено нищо')
					else
         
	                   menu2.close()

						TriggerServerEvent('esx_drugs:setpcpass',PC,true,password)
						ESX.SetTimeout(300, function()
							OpenBitcoinMenu(PCName)
						end)          		                        
					end
				end, function(data2, menu2)
					menu2.close()
				end)
end

function  EnterPCpass(PC)

	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
					title = 'Въведи Парола'
				}, function(data2, menu2)
					local password = data2.value

					if password == nil then
						ESX.ShowNotification('Не е въведено нищо')
					else
         
	                   menu2.close()

                        if bitcoinvals.pass == password then
                               
                        TriggerServerEvent('esx_drugs:setpcpass',PC,false,password)
                        notification('success','Успешно влизане')
                        else
                         
                         notification('error','Грешна парола!')
                         ESX.UI.Menu.CloseAll()
                        end
						
						ESX.SetTimeout(300, function()
							OpenBitcoinMenu(PCName)
						end)          		                        
					end
				end, function(data2, menu2)
					menu2.close()
				end)
end


function Hackpc(PC)
--print('paca')
if ishacking == false then
ishacking = true
TriggerServerEvent('esx_drugs:pchack')
end
end

RegisterNetEvent('esx_drugs:currentlypchack')
AddEventHandler('esx_drugs:currentlypchack', function()

TriggerEvent("mhacking:show")
TriggerEvent("mhacking:start",7,18,mycbwe)

end)

RegisterNetEvent('esx_drugs:sethacking')
AddEventHandler('esx_drugs:sethacking', function(value)

ishacking = value

end)

function mycbwe(success, timeremaining)
	if success then
		TriggerEvent('mhacking:hide')
		notification('success','Успешно хакна паролата')
		 TriggerServerEvent('esx_drugs:setpcpass',PCName,false,password)
		 ESX.SetTimeout(300, function()
		 OpenBitcoinMenu(PCName)
		 ishacking = false
		end) 
	else
		TriggerEvent('mhacking:hide')
		notification('error','Неуспешно хакване')
		ishacking = false
	end
end
RegisterNetEvent('esx_drugs:pcphonemessage')
AddEventHandler('esx_drugs:pcphonemessage', function(number,text)

local playerPed = PlayerPedId()
PedPosition        = GetEntityCoords(playerPed)
    

local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }        

TriggerServerEvent('esx_addons_gcphone:startCall', number, message, PlayerCoords, {

    PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
})

end)

function SetPCPhoneNumber(PC) 

	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
					title = 'Въведи телефонен номер'
				}, function(data2, menu2)
					local phonenumber = data2.value

					if phonenumber == nil then
						ESX.ShowNotification('Не е въведено нищо')
					else
         
	                   menu2.close()

                               
                        TriggerServerEvent('esx_drugs:setpcphonenumber',PC,phonenumber)
                        notification('success','Успешно въведен тел.номер')
						
						ESX.SetTimeout(300, function()
							OpenBitcoinMenu(PCName)
						end)          		                        
					end
				end, function(data2, menu2)
					menu2.close()
				end)
end

function  OpenLesterBitcoinMenu()
ESX.UI.Menu.CloseAll()

local elementilester = {
      	{ label = 'Търси купувачи на биткойн', value = 'search' }
      }


  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'wea_cat',
    {
      title = "Компютър",
	  align    = 'bottom-right',
      elements = elementilester
    },
    function (data, menu)


      if data.current.value == 'search' then
      	TriggerServerEvent('esx_drugs:checkbitcoinlester')
            ESX.UI.Menu.CloseAll()
	  end

    end,
    function (data, menu)
      menu.close()
    end
  )
end

RegisterNetEvent('esx_drugs:startprogbar')
AddEventHandler('esx_drugs:startprogbar', function(duration,text)

TriggerEvent("mythic_progbar:client:progress", {
					name = "repair_car",
					duration = duration,
					label = text,
					useWhileDead = false,
					canCancel = true,
					controlDisables = {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					}})

end)
RegisterNetEvent('esx_drugs:startbuyer')
AddEventHandler('esx_drugs:startbuyer', function(place)

StartBuyerPlace(place)

end)

--[[Citizen.CreateThread(function() --=========================DEBUG================================
	while true do

		Citizen.Wait(5)
		if IsControlJustReleased(0, Keys['DELETE']) then
		TriggerServerEvent('esx_drugs:checkbitcoinlester')

		end

		if IsControlJustReleased(0, Keys['PAGEUP']) then
		TriggerServerEvent('esx_drugs:getcompsfromdatabase')

		end

	end
	end)--================================================DEBUG=====================--]]
local refreshfreeze = false
local startedplace = false
local currentbuyer = {x = 0, y = 0, z = 0}
local currentbuyerped 
local spawnedvehicles = {}
local spawnedpeds = {}
function StartBuyerPlace(place)
local osstime = 0
ESX.TriggerServerCallback('esx_drugs:getostime', function(ostime)
osstime = ostime
     --1200 for 20min
      if osstime - lastbuyertime < 1200 and lastbuyertime ~= 0 then
      	notification('inform','Трябва да изчакате 20 минути преди да търсите нов купувач')
      	return
      end


     -- print('BUYER PLACE: '..place)
      local vehicles = {}
      local peds = {}
 
         for k,v in pairs(Config.BuyerPlaces) do
         	if place == k then
         		vehicles = v.vehicles
         		peds = v.peds
         	end
         end




	      spawnedvehicles = {}
	      spawnedpeds = {}
	        
	        for k,v in pairs(vehicles) do

	        	if not ESX.Game.IsSpawnPointClear(v.pos, 5.0) then
					notification('inform','Потърси отново.')
					TriggerServerEvent('esx_drugs:setbuyerplaceactive',place,false)
					return
			    end

	        end

	        lastbuyertime = osstime
        	local time = GetClockHours()
        	local lights = false
        	if time > 21 or time < 5 then
             lights = true
        	end
	        for k,v in pairs(vehicles) do

	             ESX.Game.SpawnVehicle(v.vehname,v.pos, v.rotation, function(vehicle)
	             	table.insert(spawnedvehicles,vehicle)
	             	SetVehicleDoorsLocked(vehicle, 4)
	             	--FreezeEntityPosition(vehicle, true)
	             	SetEntityInvincible(vehicle,true)
	             	SetVehicleOnGroundProperly(vehicle)
	             	if lights then
	             		SetVehicleLights(vehicle,2)
	             	end
	             end)

	        end

 
            for k,v in pairs(peds) do

            	RequestModel(v.hash)
			  while not HasModelLoaded(v.hash) do
			    Wait(1)
			  end

            end
			  

			  RequestAnimDict("mini@strip_club@idles@bouncer@base")
			  while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
			    Wait(1)
			  end

 	    -- Spawn the  Peds
			  for _, item in pairs(peds) do
			   local  dmvmainped =  CreatePed(item.type, item.hash, item.pos.x, item.pos.y, item.pos.z,item.pos.h, true, true)
				SetEntityInvincible(dmvmainped, true)
				SetBlockingOfNonTemporaryEvents(dmvmainped, true)
				if not item.buyer then
			    TaskPlayAnim(dmvmainped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
			    else
			    	currentbuyerped = dmvmainped
			    	
			    end
			    table.insert(spawnedpeds,dmvmainped)

					    if item.buyer then
					    	currentbuyer.x = item.pos.x
					    	currentbuyer.y = item.pos.y
					    	currentbuyer.z = item.pos.z
                             TriggerServerEvent('zone:addserverzone',currentbuyer.x,currentbuyer.y,currentbuyer.z)
                             TriggerEvent('zone:addzone',currentbuyer.x,currentbuyer.y,currentbuyer.z)

						    	BuyerBlip = AddBlipForCoord(currentbuyer.x, currentbuyer.y, currentbuyer.z)
							    SetBlipSprite(BuyerBlip, 280)
							    SetNewWaypoint(currentbuyer.x, currentbuyer.y)
							    SetBlipColour(BuyerBlip,17)
							    SetBlipScale  (BuyerBlip, 1.2)
							    BeginTextCommandSetBlipName("STRING")
								AddTextComponentString('Биткойн купувач')
								EndTextCommandSetBlipName(BuyerBlip)

								refreshfreeze = false
								calcbitcoinoffer()

					    end

			    end

			    Citizen.Wait(1000)
			    for k, v in pairs(spawnedpeds) do
			    	startedplace = true
                FreezeEntityPosition(v, true)
			    end
			    for k,v in pairs(spawnedvehicles) do
			    FreezeEntityPosition(v, true)
			    end


	          Citizen.Wait(600000) --600000
	          TriggerServerEvent('zone:removeserverzone',currentbuyer.x,currentbuyer.y,currentbuyer.z)
	        --  TriggerEvent('zone:removedzone')
	          TriggerServerEvent('esx_drugs:setbuyerplaceactive',place,false)
	          RemoveBlip(BuyerBlip)
	          	startedplace = false
	          	ESX.UI.Menu.CloseAll()
	          	FreezeEntityPosition(GetPlayerPed(-1), false)
	         if #spawnedvehicles > 0 then 
		          --	print('Remove vehicles')
		        for k,v in pairs(spawnedvehicles) do
		        	print(GetVehicleBodyHealth(v))
		        	ESX.Game.DeleteVehicle(v)
		        end
	         end
	         if #spawnedpeds > 0 then
               --  print('Remove peds')
	         	for k,v in pairs(spawnedpeds) do
	         		DeleteEntity(v)
	         	end

	         end
	    end)
         
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local talktodmvped = true
--Buyer Ped Interaction
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if startedplace then
				local pos = GetEntityCoords(GetPlayerPed(-1), false)
				local dist = Vdist(currentbuyer.x, currentbuyer.y, currentbuyer.z, pos.x, pos.y, pos.z)
				if(dist < 1.0)then
					DisplayHelpText("Натисни ~INPUT_CONTEXT~ за да говориш с ~y~купувача")
					if(IsControlJustReleased(1, 38))then
							if talktodmvped then
							    --Notify("~b~Добре дошъл~h~!")
							    Citizen.Wait(50)
								BuyerMenu()
								RemoveBlip(BuyerBlip)
								local bheading = GetEntityHeading(currentbuyerped)
								SetEntityHeading(GetPlayerPed(-1),bheading+180)
								--Menu.hidden = false
								talktodmvped = false
							else
								talktodmvped = true
							end
					end
					--Menu.renderGUI(options)
				elseif(dist > 40.0 and dist < 50.0 and not refreshfreeze)then
                  refreshfreeze = true







		                 if #spawnedvehicles > 0 then 
				          	--print('ReFreeze Vehicles')
						        for k,v in pairs(spawnedvehicles) do
				                    FreezeEntityPosition(v, false)
				                    local pos = GetEntityCoords(v, false)
				                    SetCoords(v, pos.x, pos.y, pos.z+0.20)
				                    SetVehicleOnGroundProperly(vehicle)
						        end
			             end
				         if #spawnedpeds > 0 then
			                -- print('ReFreeze Peds')
				         	for k,v in pairs(spawnedpeds) do
				         		FreezeEntityPosition(v, false)
				         	end

				         end
				         Citizen.Wait(1000)
				         TriggerEvent('zone:setactivezone',currentbuyer.x,currentbuyer.y,currentbuyer.z)

				         if #spawnedvehicles > 0 then 
				          	--print('ReFreeze Vehicles2')
						        for k,v in pairs(spawnedvehicles) do
				                    FreezeEntityPosition(v, true)
				                    SetVehicleOnGroundProperly(vehicle)
						        end
			             end
				         if #spawnedpeds > 0 then
			               --  print('ReFreeze Peds2')
				         	for k,v in pairs(spawnedpeds) do
				         		FreezeEntityPosition(v, true)
				         	end

				         end

				end
			end
	end
end)
function calcbitcoinoffer()
	local max = 15000
	local r = math.random(0,100)
	if r > 60 then
		max = 15000
	else
		max = 12000
	end
	local offer = math.random(8000,max)
	bitcoinoffer = offer
	currentoffer = bitcoinoffer * 47
end
function BuyerMenu()
--ESX.TriggerServerCallback('esx_drugs:getbitcoinprice', function(bitcoinprice)
ESX.UI.Menu.CloseAll()
Citizen.Wait(100)
FreezeEntityPosition(GetPlayerPed(-1), true)

local elementsbuyer = {
	    { label = 'ОФЕРТА: $'..bitcoinoffer..' за 1 биткойн', value = 'offer' },
      	{ label = 'Сключи сделка', value = 'accept' },
      	{ label = 'Откажи офертата', value = 'deny' }
      }


  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'wea_cat',
    {
      title = "Купувач",
	  align    = 'bottom-right',
      elements = elementsbuyer
    },
    function (data, menu)


      if data.current.value == 'accept' then
      	buyeraccept()
            ESX.UI.Menu.CloseAll()
      elseif data.current.value == 'deny' then
            ESX.UI.Menu.CloseAll()
          --  BuyerMenuOpen = false
            FreezeEntityPosition(GetPlayerPed(-1), false)

	  end

    end,
    function (data, menu)
      menu.close()
    end
  )
--end)
end
--[[function disablecontrols()
		while true do
		Citizen.Wait(0)

		if BuyerMenuOpen then
			DisableControlAction(0, 289, true)  -- Disable  - inventory 
			DisableControlAction(0, 246, true)  -- Disable  - tablet
			DisableControlAction(0, 311, true)  -- Disable  - Animations
			DisableControlAction(0, 288, true)  -- Disable  - Phone
			DisableControlAction(0, 170, true)  -- Disable  - Bagajnik
			DisableControlAction(0, 182, true)  -- Disable  - L
			DisableControlAction(0, 26, true)  -- 
			DisableControlAction(0, 36, true)  --
			DisableControlAction(0, 323, true)  -- X
		else
			print('WAITING')
			Citizen.Wait(500)
		end
	end
end--]]
function startAnim(lib, anim,buyer)
	ESX.Streaming.RequestAnimDict(lib, function()
        if not buyer then
		TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	    else
	    TaskPlayAnim(currentbuyerped, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
	    end

	end)
end

RegisterNetEvent('esx_drugs:playanimation')
AddEventHandler('esx_drugs:playanimation', function(lib, anim,buyersync)

startAnim(lib, anim,false)
if buyersync then
startAnim(lib, anim,true)
end

end)

RegisterNetEvent('esx_drugs:setfreezeplayer')
AddEventHandler('esx_drugs:setfreezeplayer', function(value)

FreezeEntityPosition(GetPlayerPed(-1), value)

end)

RegisterNetEvent('esx_drugs:buyercomplete')
AddEventHandler('esx_drugs:buyercomplete', function()
-- BuyerMenuOpen = false
FreezeEntityPosition(GetPlayerPed(-1), false)

end)


function buyeraccept()

TriggerServerEvent('esx_drugs:buyeraccept',currentoffer)

end

function SetPCCustomName(PC)

	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
					title = 'Въведи желано от теб име за компютъра'
				}, function(data2, menu2)
					local customname = data2.value

					if customname == nil then
						ESX.ShowNotification('Не е въведено нищо')
					else
         
	                   menu2.close()

                               
                        TriggerServerEvent('esx_drugs:setpccustomname',PC,customname)
                        notification('success','Успешно въведено име: '..customname)
                        Citizen.Wait(20)
                        OpenBitcoinMenu(PC)
						         		                        
					end
				end, function(data2, menu2)
					menu2.close()
				end)

end
