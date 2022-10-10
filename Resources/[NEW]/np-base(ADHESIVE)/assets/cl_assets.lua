--- Stops run after shooting
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local ped = PlayerPedId()
        if not IsPedInAnyVehicle(ped, false) then
            if IsPedUsingActionMode(ped) then
                SetPedUsingActionMode(ped, -1, -1, 1)
            end
        else
            Citizen.Wait(3000)
        end
    end
end)

-- stops barriers apearing
local gates = {
    'p_barier_test_s',
    'prop_sec_barier_01a',
    'prop_sec_barier_02a',
    'prop_sec_barier_02b',
    'prop_sec_barier_03a',
    'prop_sec_barier_03b',
    'prop_sec_barier_04a',
    'prop_sec_barier_04b',
    'prop_sec_barier_base_01',
    'prop_sec_barrier_ld_01a',
    'prop_sec_barrier_ld_02a',
    'prop_gate_airport_01',
    'prop_facgate_01',
    'prop_facgate_03_l',
    'prop_facgate_03_r',
    'prop_burgerstand_01',
    'prop_hotdogstand_01',
    'prop_food_van_01',
    'prop_road_memorial_02',
    'prop_gate_docks_ld',
}

Citizen.CreateThread(function()
    while true do
        for i=1, #gates do
            local coords = GetEntityCoords(PlayerPedId(), false)
            local gate = GetClosestObjectOfType(coords.x, coords.y, coords.z, 100.0, GetHashKey(gates[i]), 0, 0, 0)
            if gate ~= 0 then
                SetEntityAsMissionEntity(gate, 1, 1)
                DeleteObject(gate)
                SetEntityAsNoLongerNeeded(gate)
            end
        end
        Citizen.Wait(2500)
    end
end)

-- Stop NPC Drops
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_CARBINERIFLE'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN'))
    end
end)

-- Disable Pistol Whip
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if IsPedArmed(PlayerPedId(), 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        else
            Citizen.Wait(1500)
        end
    end
end)

local waitKeys = false
RegisterNetEvent('car:engineHasKeys')
AddEventHandler('car:engineHasKeys', function(targetVehicle, allow)
    if IsVehicleEngineOn(targetVehicle) then
        if not waitKeys then
            waitKeys = true
            SetVehicleEngineOn(targetVehicle,0,1,1)
            SetVehicleUndriveable(targetVehicle,true)
            TriggerEvent("DoShortHudText", "Engine Halted",1)
            Citizen.Wait(300)
            waitKeys = false
        end
    else
        if not waitKeys then
            waitKeys = true
            TriggerEvent("keys:startvehicle")
            TriggerEvent("DoShortHudText", "Engine Started",1)
            Citizen.Wait(300)
            waitKeys = false
        end
    end
end)

RegisterNetEvent('car:engine')
AddEventHandler('car:engine', function()
    local targetVehicle = GetVehiclePedIsUsing(PlayerPedId())
    TriggerEvent("keys:hasKeys", 'engine', targetVehicle)
end)

-- Crouch
local foreskin = false
local timelimit = 0
local isHolding = false
local isFlying = false
incrouch = true
Controlkey = {["movementCrouch"] = {73,"X"}} 

function crouchMovement()
    RequestAnimSet("move_ped_crouched")
    while not HasAnimSetLoaded("move_ped_crouched") do
        Citizen.Wait(0)
    end

    SetPedMovementClipset(PlayerPedId(), "move_ped_crouched",1.0)    
    SetPedWeaponMovementClipset(PlayerPedId(), "move_ped_crouched",1.0)
    SetPedStrafeClipset(PlayerPedId(), "move_ped_crouched_strafing",1.0)

end

Citizen.CreateThread(function()

    local Triggered1 = false
    local Triggered2 = false
    
    while true do

        if ctrlStage == 3 then

            if IsControlJustPressed(2,23) then
                firstPersonActive = false
                ctrlStage = 0
                TriggerEvent("AnimSet:Set")
                jumpDisabled = false
                SetPedStealthMovement(PlayerPedId(),0,0)       
            else
                if not Triggered3 then
                    ClearPedTasks(PlayerPedId())
                    Triggered1 = false  
                    Triggered2 = false
                    Triggered3 = true
                    crouchMovement()

                else
                    if IsControlJustReleased(1,Controlkey["movementCrouch"][1]) then -- X
                        SetPedStealthMovement(PlayerPedId(),true,"")
                        firstPersonActive = false
                        ctrlStage = 0

                        TriggerEvent("AnimSet:Set")

                        Citizen.Wait(100)  
                        ClearPedTasks(PlayerPedId())

                        jumpDisabled = false
                        
                        Citizen.Wait(500)
                        SetPedStealthMovement(PlayerPedId(),false,"")
                        Triggered3 = false

                    else
                        if GetEntitySpeed(PlayerPedId()) > 1.0 and not incrouch then
                            incrouch = true
                            SetPedWeaponMovementClipset(PlayerPedId(), "move_ped_crouched",1.0)
                            SetPedStrafeClipset(PlayerPedId(), "move_ped_crouched_strafing",1.0)
                        elseif incrouch and GetEntitySpeed(PlayerPedId()) < 1.0 and (GetFollowPedCamViewMode() == 4 or GetFollowVehicleCamViewMode() == 4) then
        
                            incrouch = false
                            ResetPedWeaponMovementClipset(PlayerPedId())
                            ResetPedStrafeClipset(PlayerPedId())
                        end     
                    end         
                end
            end
        end




        if timelimit > 0 then
            timelimit = timelimit - 1
        end



        if IsControlJustPressed(0, 142) or IsDisabledControlJustPressed(0, 142) then
            if ctrlStage == 2 then
                ctrlStage = 3
            end
        end

        if IsControlJustReleased(1,Controlkey["movementCrouch"][1]) and not isFlying and not isHolding and not ( IsPedSittingInAnyVehicle( GetPlayerPed( -1 ) ) ) and not (handCuffed or handCuffedWalking or imdead == 1) then

            ctrlStage = 3
            if GetPedStealthMovement(PlayerPedId()) then
                SetPedStealthMovement(PlayerPedId(),0,0)
            end             
            firstPersonActive = false
        end

        if IsPedJacking(PlayerPedId()) or IsPedInMeleeCombat(PlayerPedId()) or IsControlJustReleased(1,22) or IsPedRagdoll(PlayerPedId()) or handCuffed or handCuffedWalking or imdead == 1 or ( IsPedSittingInAnyVehicle( GetPlayerPed( -1 ) ) ) then

            if ctrlStage ~= 0 then
                ClearPedTasks(PlayerPedId())
                firstPersonActive = false
                ctrlStage = 0
                TriggerEvent("AnimSet:Set")
                jumpDisabled = false
                SetPedStealthMovement(PlayerPedId(),0,0)
                Triggered1 = false  
                Triggered2 = false
                Triggered3 = false
            end

        end
        Citizen.Wait(7)

        if IsPedSittingInAnyVehicle( GetPlayerPed( -1 ) ) then
            Citizen.Wait(1000)
        end

    end
end)

local relationshipTypes = {
    "PLAYER",
    "COP",
    "MISSION2",
    "MISSION3",
    "MISSION4",
    "MISSION5",
    "MISSION6",
    "MISSION7",
    "MISSION8",
}

Citizen.CreateThread(function()
while true do
    Wait(600)
    for _, group in ipairs(relationshipTypes) do
        if group == "COP" then
        SetRelationshipBetweenGroups(3, `PLAYER`,GetHashKey(group))
        SetRelationshipBetweenGroups(3, GetHashKey(group), `PLAYER`)
        SetRelationshipBetweenGroups(0, `MISSION2`,GetHashKey(group))
        SetRelationshipBetweenGroups(0, GetHashKey(group), `MISSION2`)

        else
        SetRelationshipBetweenGroups(0, `PLAYER`,GetHashKey(group))
        SetRelationshipBetweenGroups(0, GetHashKey(group), `PLAYER`)
        SetRelationshipBetweenGroups(0, `MISSION2`,GetHashKey(group))
        SetRelationshipBetweenGroups(0, GetHashKey(group), `MISSION2`)
        end  
    SetRelationshipBetweenGroups(5, GetHashKey(group), `MISSION8`)
    end
    
    
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_WEICHENG`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `PLAYER`)
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_FAMILY`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `PLAYER`)
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_BALLAS`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`)

    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_SALVA`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `PLAYER`)
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_MEXICAN`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`)

    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_WEICHENG`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_FAMILY`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_BALLAS`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `AMBIENT_GANG_LOST`)

    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_SALVA`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `AMBIENT_GANG_MEXICAN`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `AMBIENT_GANG_LOST`)

    --WEST SIDE
    SetRelationshipBetweenGroups(1, `MISSION4`, `AMBIENT_GANG_WEICHENG`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `MISSION4`)

    -- MEDIC / POLICE WEST SIDE
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_WEICHENG`)

    --CENTRAL
    SetRelationshipBetweenGroups(1, `MISSION5`, `AMBIENT_GANG_FAMILY`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `MISSION5`)
    SetRelationshipBetweenGroups(1, `MISSION5`, `AMBIENT_GANG_BALLAS`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `MISSION5`)

    -- MEDIC / POLICE CENTRAL
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_BALLAS`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_FAMILY`)

    --EAST SIDE
    SetRelationshipBetweenGroups(1, `MISSION6`, `AMBIENT_GANG_SALVA`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `MISSION6`)
    SetRelationshipBetweenGroups(1, `MISSION6`, `AMBIENT_GANG_MEXICAN`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `MISSION6`)

    -- MEDIC / POLICE EAST SIDE
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_SALVA`)
    SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_MEXICAN`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `MISSION2`)

    SetRelationshipBetweenGroups(1, -86095805, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`, -86095805)

    SetRelationshipBetweenGroups(1,1191392768, `MISSION2`)
    SetRelationshipBetweenGroups(1, `MISSION2`,1191392768)

    SetRelationshipBetweenGroups(1, `MISSION2`, 45677184)
    SetRelationshipBetweenGroups(1, 45677184, `MISSION2`)

    SetRelationshipBetweenGroups(3, `PLAYER`, `MISSION7`)
    SetRelationshipBetweenGroups(3, `MISSION7`, `PLAYER`)

    SetRelationshipBetweenGroups(0, `MISSION7`, `COP`)
    SetRelationshipBetweenGroups(0, `COP`, `MISSION7`)

    SetRelationshipBetweenGroups(0, `MISSION2`, `MISSION7`)
    SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION2`)

    SetRelationshipBetweenGroups(0, `MISSION7`, `MISSION7`)

    SetRelationshipBetweenGroups(3, `COP`,`PLAYER`)
    SetRelationshipBetweenGroups(3, `PLAYER`, `COP`)

    SetRelationshipBetweenGroups(0, `PLAYER`, `MISSION3`)
    SetRelationshipBetweenGroups(0, `MISSION3`,`PLAYER`)

    -- LOST MC
    SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `PLAYER`)
    SetRelationshipBetweenGroups(1,  `COP`, `AMBIENT_GANG_LOST`)
    SetRelationshipBetweenGroups(1,  `AMBIENT_GANG_LOST`, `COP`)
    
    end
end)

-- Weapon Dmg -- 

Citizen.CreateThread(function()
    while true do
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.2)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.4)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.4)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIGHTSTICK"), 0.4)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CROWBAR"), 0.4)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYPISTOL"), 0.95)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPISTOL"), 1.2)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL_MK2"), 1.1)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SNSPISTOL"), 0.80)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOl"), 0.81)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE_MK2"), 1.2)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE"), 0.85)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE"), 1.4)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), 1.1)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHINEPISTOL"), 0.82)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_APPISTOl"), 1.9)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG"), 0.83)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MICROSMG"), 1.55)
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMPACTRIFLE"), 1.1)
        Wait(0)
    end
end)

-- Driver Cant Shoot

-- Allow passengers to shoot
local passengerDriveBy = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
			if GetPedInVehicleSeat(car, -1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)


AddEventHandler('client:anchor', function()
    local currVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if currVeh ~= 0 then
        local vehModel = GetEntityModel(currVeh)
        if vehModel ~= nil and vehModel ~= 0 then
            if DoesEntityExist(currVeh) then
                if IsThisModelABoat(vehModel) or IsThisModelAJetski(vesModel) or IsThisModelAnAmphibiousCar(vehModel) or IsThisModelAnAmphibiousQuadbike(vehModel) then
                	local finished = exports["np-taskbar"]:taskBar(2000,"Toggling Anchor")
					if (finished ~= 100) then
					    return
					end
                    if IsBoatAnchoredAndFrozen(currVeh) then
                    	TriggerEvent("customNotification","Anchor Disabled")
                        SetBoatAnchor(currVeh, false)
                        SetBoatFrozenWhenAnchored(currVeh, false)
                        SetForcedBoatLocationWhenAnchored(currVeh, false)
                    elseif not IsBoatAnchoredAndFrozen(currVeh) and CanAnchorBoatHere(currVeh) and GetEntitySpeed(currVeh) < 3 then
                    	SetEntityAsMissionEntity(currVeh,false,true)
                    	TriggerEvent("customNotification","Anchor Enabled")
                        SetBoatAnchor(currVeh, true)
                        SetBoatFrozenWhenAnchored(currVeh, true)
                        SetForcedBoatLocationWhenAnchored(currVeh, true)
                    end
                end
            end
        end
    end
end)