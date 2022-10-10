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
                        if not exports['np-death']:GetDeathStatus() then
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
                            TriggerEvent('DoLongHudText', 'Your dead dumb fuck.', 2)
                        end
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


-- Force First Person In Cars --

local INPUT_AIM = 0
local INPUT_AIM = 0
local UseFPS = false
local justpressed = 0

-- this prevents certain camera modes
local disable = 0
Citizen.CreateThread( function()

  while true do    
    
    Citizen.Wait(0)


        if IsControlPressed(0, INPUT_AIM) then
          justpressed = justpressed + 1
        end

        if IsControlJustReleased(0, INPUT_AIM) then

        	if justpressed < 15 then
        		UseFPS = true
        	end
        	justpressed = 0
        end

        if GetFollowPedCamViewMode() == 1 or GetFollowVehicleCamViewMode() == 1 then
        	Citizen.Wait(1)
        	SetFollowPedCamViewMode(0)
        	SetFollowVehicleCamViewMode(0)
        end


        if UseFPS then
        	if GetFollowPedCamViewMode() == 0 or GetFollowVehicleCamViewMode() == 0 then
        		Citizen.Wait(0)
        		
        		SetFollowPedCamViewMode(4)
        		SetFollowVehicleCamViewMode(4)
        	else
        		Citizen.Wait(0)
        		
        		SetFollowPedCamViewMode(0)
        		SetFollowVehicleCamViewMode(0)
        	end
    		UseFPS = false
        end


        if IsPedArmed(ped,1) or not IsPedArmed(ped,7) then
            if IsControlJustPressed(0,24) or IsControlJustPressed(0,141) or IsControlJustPressed(0,142) or IsControlJustPressed(0,140)  then
               disable = 50
            end
        end

        if disable > 0 then
            disable = disable - 1
            DisableControlAction(0,24)
            DisableControlAction(0,140)
            DisableControlAction(0,141)
            DisableControlAction(0,142)
        end
  end

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedArmed(PlayerPedId(), 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

RegisterNetEvent("fuckthis")
AddEventHandler("fuckthis",function()

    while firstPersonActive do
        Citizen.Wait(1)
        local crouchpos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.127,-0.29,0.801)
        if (not DoesCamExist(shitcam)) then
            shitcam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
            SetCamCoord(shitcam, crouchpos)
            SetCamRot(shitcam, 0.0, 0.0, GetEntityHeading(PlayerPedId()))
            SetCamActive(shitcam,  true)
            RenderScriptCams(true,  false,  0,  true,  true)
            SetCamCoord(shitcam, crouchpos)
            SetCamFov(shitcam, 60.0)
        end

        SetCamCoord(shitcam, crouchpos)
        SetCamRot(shitcam, GetGameplayCamRelativePitch(), 0.0, GetEntityHeading(PlayerPedId()) + GetGameplayCamRelativeHeading())
         if IsControlJustReleased(0, INPUT_AIM) then
            firstPersonActive = false
         end
    end

    if (DoesCamExist(shitcam)) then
        RenderScriptCams(false, false, 0, 1, 0)
        DestroyCam(shitcam, false)
    end

end)


-- This manages recoil and crouch / prone
local stresslevel = 0
function RecoilFactor(stress,stance)
    if stance == nil then
        stance = 0
    end
    if stance == 3 then
        stance = 1
    end
    sendFactor = ((math.ceil(stress) / 1000)) - stance


    TriggerEvent("recoil:updateposition",sendFactor)

end


local prone = true
local movFwd = true

local ctrlStage = 0
local camon = false
local shitcam = 0


imdead = 0
RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if imdead == 0 then 
        imdead = 1
    else
        beingDragged = false
        dragging = false
        imdead = 0
    end
end)

function crouchMovement()
    RequestAnimSet("move_ped_crouched")
    while not HasAnimSetLoaded("move_ped_crouched") do
        Citizen.Wait(0)
    end

    SetPedMovementClipset(PlayerPedId(), "move_ped_crouched",1.0)    
    SetPedWeaponMovementClipset(PlayerPedId(), "move_ped_crouched",1.0)
    SetPedStrafeClipset(PlayerPedId(), "move_ped_crouched_strafing",1.0)

end



Controlkey = {["movementCrouch"] = {73,"X"},["movementCrawl"] = {20,"Z"}} 
RegisterNetEvent('event:control:update')
AddEventHandler('event:control:update', function(table)
    Controlkey["movementCrouch"] = table["movementCrouch"]
    Controlkey["movementCrawl"] = table["movementCrawl"]
end)


RegisterNetEvent("fuckthis")
AddEventHandler("fuckthis",function()

    while firstPersonActive do
        Citizen.Wait(1)
        local crouchpos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.127,-0.29,0.801)
        if (not DoesCamExist(shitcam)) then
            shitcam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
            SetCamCoord(shitcam, crouchpos)
            SetCamRot(shitcam, 0.0, 0.0, GetEntityHeading(PlayerPedId()))
            SetCamActive(shitcam,  true)
            RenderScriptCams(true,  false,  0,  true,  true)
            SetCamCoord(shitcam, crouchpos)
            SetCamFov(shitcam, 60.0)
        end

        SetCamCoord(shitcam, crouchpos)
        SetCamRot(shitcam, GetGameplayCamRelativePitch(), 0.0, GetEntityHeading(PlayerPedId()) + GetGameplayCamRelativeHeading())
         if IsControlJustReleased(0, INPUT_AIM) then
            firstPersonActive = false
         end
    end

    if (DoesCamExist(shitcam)) then
        RenderScriptCams(false, false, 0, 1, 0)
        DestroyCam(shitcam, false)
    end

end)
local fixprone = false
RegisterNetEvent("fixprone")
AddEventHandler("fixprone",function()
    if ctrlStage == 2 then
        fixprone = true
    end
end)


function doCrouchIn()

--  RequestAnimDict("swimming@swim")
--  while not HasAnimDictLoaded("swimming@swim") do
--      Citizen.Wait(0)
--  end

--  TaskPlayAnim(PlayerPedId(), "swimming@swim", "recover_down_to_idle", 0.8, 0.8, 1.0, 49, 0, 0, 0, 0)

--  Citizen.Wait(420)
    crouchMovement()
end

myWep = 0
local runningMovement = false
RegisterNetEvent("proneMovement")
AddEventHandler("proneMovement",function()
    if runningMovement then
        return
    end
    runningMovement = true

    if ((IsControlPressed(1,32)) and not movFwd) or (fixprone and (IsControlPressed(1,32))) then -- W
        fixprone = false
        movFwd = true
        SetPedMoveAnimsBlendOut(PlayerPedId())
        local pronepos = GetEntityCoords(PlayerPedId())
        TaskPlayAnimAdvanced(PlayerPedId(), "move_crawl", "onfront_fwd", pronepos["x"],pronepos["y"],pronepos["z"]+0.1, 0.0, 0.0, GetEntityHeading(PlayerPedId()), 100.0, 0.4, 1.0, 7, 2.0, 1, 1) 
        Citizen.Wait(500)
    elseif ( not (IsControlPressed(1,32)) and movFwd) or (fixprone and not (IsControlPressed(1,32))) then -- W
        fixprone = false
        curWep = GetSelectedPedWeapon(PlayerPedId())
        myWep =  GetSelectedPedWeapon(PlayerPedId())
        local pronepos = GetEntityCoords(PlayerPedId())
        TaskPlayAnimAdvanced(PlayerPedId(), "move_crawl", "onfront_fwd", pronepos["x"],pronepos["y"],pronepos["z"]+0.1, 0.0, 0.0, GetEntityHeading(PlayerPedId()), 100.0, 0.4, 1.0, 6, 2.0, 1, 1)
        Citizen.Wait(500)
        movFwd = false
    end     
    runningMovement = false

end)


local foreskin = false
local timelimit = 0
local isHolding = false
local isFlying = false
-- 0 = default, 1 = crouch, 2 = prone
incrouch = true

Citizen.CreateThread(function()

    local Triggered1 = false
    local Triggered2 = false
    
    while true do

        if ctrlStage == 3 then

            if IsControlJustPressed(2,23) then -- F
                firstPersonActive = false
                ctrlStage = 0
                TriggerEvent("AnimSet:Set")
                jumpDisabled = false
                SetPedStealthMovement(PlayerPedId(),0,0)
                RecoilFactor(stresslevel,0)             
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
                        
                        RecoilFactor(stresslevel,0)
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
            RecoilFactor(stresslevel,ctrlStage)
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
                RecoilFactor(stresslevel,0)
                Triggered1 = false  
                Triggered2 = false
                Triggered3 = false
            end

        end

        --TaskPlayAnim(PlayerPedId(), "move_crawl", "onfront_fwd", GetEntityCoords(PlayerPedId()), 1.0, 1.0, 999, 16, 1.0, 2, 2, 2);
    --  TASK_PLAY_ANIM_ADVANCED(Ped ped, char* animDict, char* animName, float posX, float posY, float posZ, float rotX, float rotY, float rotZ, float speed, float speedMultiplier, int duration, Any flag, float animTime, Any p14, Any p15);
        --TaskPlayAnimAdvanced(ped, animDict, animName, posX, posY, posZ, rotX, rotY, rotZ, speed, speedMultiplier, duration, flag, animTime, p14, p15)
        --TaskPlayAnimAdvanced(PlayerPedId(), "move_crawl", "onfront_fwd", GetEntityCoords(PlayerPedId()), 0.0, 0.0, GetEntityHeading(PlayerPedId()), 1.0, 1.0, -1, 47, 1.0, 0, 0) 

        --TaskPlayAnimAdvanced(PlayerPedId(), "move_crawl", "onfront_fwd", GetEntityCoords(PlayerPedId()), 0.0, 0.0, GetEntityHeading(PlayerPedId()), 1.0, 1.0, -1, 1, 1.0, 0, 0)  

        --TaskPlayAnim(ped, animDictionary, animationName, speed, speedMultiplier, duration, flag, playbackRate, lockX, lockY, lockZ)
        Citizen.Wait(1)

        if IsPedSittingInAnyVehicle( GetPlayerPed( -1 ) ) then
            Citizen.Wait(1000)
        end

    end
--  DeleteEntity(proneball)
end)
handCuffed = false
handCuffedWalking = false


RegisterNetEvent('police:currentHandCuffedState')
AddEventHandler('police:currentHandCuffedState', function(handCuffedSent,WalkingSent)
    handCuffed = handCuffedSent
    handCuffedWalking = WalkingSent
end)

RegisterNetEvent('news:HoldingState')
AddEventHandler('news:HoldingState', function(state)
    isHolding = state
end)

RegisterNetEvent("admin:isFlying")
AddEventHandler("admin:isFlying", function(state)
    isFlying = state
end)


Citizen.CreateThread( function()
    while true do
        playerPed = PlayerPedId() 
        if IsPedArmed(playerPed, 6) then
            if IsPedDoingDriveby(playerPed) then
                if GetFollowPedCamViewMode() == 0 or GetFollowVehicleCamViewMode() == 0 then
                    SetPlayerCanDoDriveBy(PlayerId(),false)
                    SetFollowPedCamViewMode(4)
                    SetFollowVehicleCamViewMode(4)
                    Wait(50)
                    SetPlayerCanDoDriveBy(PlayerId(),true)
                end
            else
                DisableControlAction(0,36,true)
                if GetPedStealthMovement(playerPed) == 1 then
                    SetPedStealthMovement(playerPed,0)
                end
            end
        end
        Wait(1)
    end
end)


local recoils = {
	-- pistols
	[416676503] = 0.04,

	--smg
	[-957766203] = 0.22,

	-- rifles
	[970310034] = 0.14,
}

local myRecoilFactor = 0.0
RegisterNetEvent("recoil:updateposition")
AddEventHandler("recoil:updateposition", function(sendFactor)
    myRecoilFactor = sendFactor / 5 + 0.0
end)


Citizen.CreateThread( function()
	while true do 

		local ply = PlayerPedId()

		if IsPedArmed(ply, 6) then Wait(0)
		else Wait(1500) end

		local _,wep = GetCurrentPedWeapon(ply)

	    if wep ~= `WEAPON_SNOWBALL` and IsPedShooting(ply) then
	    	local GamePlayCam = GetFollowPedCamViewMode()
	    	local Vehicled = IsPedInAnyVehicle(ply, false)
	    	local MovementSpeed = math.ceil(GetEntitySpeed(ply))

	    	if MovementSpeed > 69 then
	    		MovementSpeed = 69
	    	end

	        local group = GetWeapontypeGroup(wep)

	        local p = GetGameplayCamRelativePitch()

	        local cameraDistance = #(GetGameplayCamCoord() - GetEntityCoords(ply))

	        local recoil = math.random(50,75+(math.ceil(MovementSpeed*1.5)))/100
	        local rifle = false


          	if group == 970310034 or group == 1159398588 then
          		rifle = true
          	end

          	if cameraDistance < 5.3 then
          		cameraDistance = 1.5
          	else
          		if cameraDistance < 8.0 then
          			cameraDistance = 4.0
          		else
          			cameraDistance = 7.0
          		end
          	end


	        if Vehicled then
	        	recoil = recoil + (recoil + cameraDistance)
	        else
	        	recoil = recoil * 1.0
	        end

	        if GamePlayCam == 4 then

	        	recoil = recoil * 0.35
		        if rifle then
					recoil = recoil * 0.15
				else
					recoil = recoil * 0.05
		        end

	        end

	        if rifle then
	        	recoil = recoil * 0.15
	        end

	        local rightleft = math.random(4)
	        local h = GetGameplayCamRelativeHeading()
	        local hf = math.random(10,40+MovementSpeed)/100

	        if Vehicled then
	        	hf = hf * 2.0
	        end


	        if rightleft == 1 then
	        	SetGameplayCamRelativeHeading(h+hf)
	        elseif rightleft == 2 then
	        	SetGameplayCamRelativeHeading(h-hf)
	        end 
		

	        local set = p+recoil

			SetGameplayCamRelativePitch(set,0.8)    
	       	
	    end
	end

end)

local INPUT_AIM = 0
local INPUT_AIM = 0
local UseFPS = false
local justpressed = 0

-- this prevents certain camera modes
local disable = 0
Citizen.CreateThread( function()

  while true do    
    
    Citizen.Wait(0)


        if IsControlPressed(0, INPUT_AIM) then
          justpressed = justpressed + 1
        end

        if IsControlJustReleased(0, INPUT_AIM) then

            if justpressed < 15 then
                UseFPS = true
            end
            justpressed = 0
        end

        if GetFollowPedCamViewMode() == 1 or GetFollowVehicleCamViewMode() == 1 then
            Citizen.Wait(1)
            SetFollowPedCamViewMode(0)
            SetFollowVehicleCamViewMode(0)
        end


        if UseFPS then
            if GetFollowPedCamViewMode() == 0 or GetFollowVehicleCamViewMode() == 0 then
                Citizen.Wait(0)
                
                SetFollowPedCamViewMode(4)
                SetFollowVehicleCamViewMode(4)
            else
                Citizen.Wait(0)
                
                SetFollowPedCamViewMode(0)
                SetFollowVehicleCamViewMode(0)
            end
            UseFPS = false
        end


        if IsPedArmed(ped,1) or not IsPedArmed(ped,7) then
            if IsControlJustPressed(0,24) or IsControlJustPressed(0,141) or IsControlJustPressed(0,142) or IsControlJustPressed(0,140)  then
               disable = 50
            end
        end

        if disable > 0 then
            disable = disable - 1
            DisableControlAction(0,24)
            DisableControlAction(0,140)
            DisableControlAction(0,141)
            DisableControlAction(0,142)
        end
  end

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedArmed(PlayerPedId(), 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

