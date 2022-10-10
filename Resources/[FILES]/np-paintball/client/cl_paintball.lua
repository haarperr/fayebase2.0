local inArena = false

Citizen.CreateThread(function()
  exports["np-polyzone"]:AddBoxZone("paintball_arena", vector3(2341.91, 2558.8, 46.66), 150, 120, {
    name="paintball_arena",
    heading=0,
    debugPoly=false,
    minZ=43.06,
    maxZ=73.06
  }) 
end)

RegisterNetEvent('np-polyzone:enter')
AddEventHandler('np-polyzone:enter', function(name)
  if name == "paintball_arena" then
    inArena = true
  end
end)

RegisterNetEvent('np-polyzone:exit')
AddEventHandler('np-polyzone:exit', function(name)
    if name == "paintball_arena" then
        inArena = false
        removeGuns()
    end
end)

RegisterNetEvent('warp:paintball:gun')
AddEventHandler('warp:paintball:gun', function()
  if not exports["np-inventory"]:hasEnoughOfItem("-2009644972",1,false) then
    TriggerEvent("player:receiveItem","-2009644972", 1, true)
    TriggerEvent("DoLongHudText", "Match Started, Get In The Arena", 2) 
  else 
    TriggerEvent("DoLongHudText", "You Are Already In a Match", "2")
  end 
end)

RegisterNetEvent('warp:paintball:ammo')
AddEventHandler('warp:paintball:ammo', function()
  if not exports["np-inventory"]:hasEnoughOfItem("paintballs",5,false) then
    TriggerEvent("player:receiveItem","paintballs", 5)
  else 
    TriggerEvent("DoLongHudText", "You Already Have 5 Bullets", "2")
  end 
end)

function removeGuns()
  local qty = exports["np-inventory"]:getQuantity("-2009644972")
  if qty and qty > 0 then
    TriggerEvent("inventory:removeItem", "-2009644972", qty)
    SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
  end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        if inArena == false then
            removeGuns()
        end
    end
end)

RegisterNetEvent("np-paintball:menu")
AddEventHandler("np-paintball:menu", function()
	TriggerEvent('np-context:sendMenu', {
		{
			id = "1",
			header = "Grab PaintBall Gun",
			txt = "PaintBall Gun | +1 Gun",
			params = {
				event = "warp:paintball:gun",
			}
		},
    {
			id = "2",
			header = "Grab PaintBalls",
			txt = "Gun ammunition | +5 Ammo",
			params = {
				event = "warp:paintball:ammo",
			}
		},
		{
			id = "3",
			header = "Close Menu",
			txt = "Exit the menu!",
			params = {
				event = "",
			}
		},
	})
end)