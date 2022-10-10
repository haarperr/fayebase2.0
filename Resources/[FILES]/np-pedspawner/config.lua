--FiveM's list of Ped Models can be found here: https://docs.fivem.net/docs/game-references/ped-models/
--A list of all the animations can be found here: https://alexguirre.github.io/animations-list/

Config = {}
Config.Invincible = true --Do you want the peds to be invincible?
Config.Frozen = true --Do you want the peds to be unable to move? It's probably a yes, so leave true in there.
Config.Stoic = true --Do you want the peds to react to what is happening in their surroundings?
Config.Fade = true-- Do you want the peds to fade into/out of existence? It looks better than just *POP* its there.
Config.Distance = 25.0 --The distance you want peds to spawn at
Config.MinusOne = true

pedList = {

    

	{
		model = `cs_brad`,
		coords = vector3(-17.153085708618, 6303.44140625, 31.374612808228), -- (Trucking)
		heading = 40.0, 
		gender = "male", 
		animName = "WORLD_HUMAN_AA_SMOKE",
	},

	

	
	{
		model = `hc_gunman`,
		coords = vector3(-1612.7983398438, 5262.236328125, 3.9741015434265), -- (Boat Rental)
		heading = 205.71180725098, 
		gender = "male", 
		animName = "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT",
	},

	{
		model = `cs_brad`,
		coords = vector3(-1375.8, -335.9, 38.9), -- (Coke Sale)
		heading = 26.71180725098, 
		gender = "male", 
		animName = "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT",
	},

	{
		model = `s_m_y_prisoner_01`,
		coords = vector3(1635.0877, 2586.8872, 45.792858), -- (Prison Rental)
		heading = 356.71180725098, 
		gender = "male", 
		animName = "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT",
	},

	{
		model = `s_m_y_prismuscl_01`,
		coords = vector3(1569.2409, 2563.0708, 49.94028), -- (Prison Rental)
		heading = 350.71180725098, 
		gender = "male", 
		animName = "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT",
	},


	
}

local genderNum = 0
local isNearPed = false
local ped 
local hasAlreadyEntered = false


Citizen.CreateThread(function()
    local waitTime = 250
	while true do
		Citizen.Wait(waitTime)
		for k,v in pairs (pedList) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)
			if dist < 20.0 and hasAlreadyEntered == false then
				TriggerEvent('np-peds:nearPed', v.model, v.coords, v.heading, v.gender, v.animDict, v.animName)
				hasAlreadyEntered = true
			end

			if dist >= 25.0 and dist <= 45.0 then
                for i = 255, 0, -51 do
                    Citizen.Wait(50)
                    SetEntityAlpha(ped, i, false)
                end
				hasAlreadyEntered = false
				DeleteEntity(ped)
			end
		end
	end
end)

AddEventHandler('np-peds:nearPed', function(model, coords, heading, gender, animDict, animName)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(250)
	end
	
	if gender == 'male' then
		genderNum = 4
	elseif gender == 'female' then 
		genderNum = 5
	end	

    local x, y, z = table.unpack(coords)
    ped = CreatePed(genderNum, model, x, y, z - 1, heading, false, true)
	SetEntityAlpha(ped, 0, false)
	
	FreezeEntityPosition(ped, true)

	SetEntityInvincible(ped, true)

	SetBlockingOfNonTemporaryEvents(ped, true)
	
	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(1)
		end
		TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	elseif animName and not animDict then
		TaskStartScenarioInPlace(ped, animName, 0, true)
	end
	
    for i = 0, 255, 51 do
        Citizen.Wait(50)
        SetEntityAlpha(ped, i, false)
    end
end)

Config.PedList = {
	----------------------------------------
	---       	 Vault Bank         	 ---
	----------------------------------------

	{
		model = "cs_bankman",
		coords = vector3(242.020568847656, 227.114593505859, 106.031478881835),
		heading = 160.0, 
		gender = "male", 
	},


	----------------------------------------
	---       	 Taxi        	 ---
	----------------------------------------

	{
		model = "cs_bankman",
		coords = vector3(904.087890625,-174.29010009766,74.066650390625),
		heading = 240.94488525391, 
		gender = "male", 
	},


	----------------------------------------
	---       	 Garbage        	 ---
	----------------------------------------

	{
		model = "s_m_y_garbage",
		coords = vector3(-321.54724121094,-1545.8374023438,31.015380859375),
		heading = 0.0, 
		gender = "male", 
	},
	----------------------------------------
	---       	 Lumberjack        	 ---
	----------------------------------------

	{
		model = "s_m_y_construct_01",
		coords = vector3(-553.04174804688,5348.8745117188,74.74072265625),
		heading = 62.362197875977, 
		gender = "male", 
	},
	
	----------------------------------------
	---       	 Mining        	 ---
	----------------------------------------

	{
		model = "s_m_y_dockwork_01",
		coords = vector3(-594.87030029297,2090.1362304688,131.60876464844),
		heading = 14.173227310181, 
		gender = "male", 
	},

	{
		model = "s_m_y_dockwork_01",
		coords = vector3(1084.9055175781,-2002.3912353516,31.419799804688),
		heading = 48.188972473145, 
		gender = "male", 
	},

	{
		model = "s_m_y_dockwork_01",
		coords = vector3(182.2945098877,-1319.2087402344,29.313598632812),
		heading = 238.11022949219, 
		gender = "male", 
	},

	{
		model = "cs_bankman",
		coords = vector3(412.23297119141,315.01977539062,103.13256835938),
		heading = 209.76377868652, 
		gender = "male", 
	},


	----------------------------------------
	---       	 News        	 ---
	----------------------------------------

	{
		model = "cs_bankman",
		coords = vector3(-598.29888916016,-929.85491943359,23.854248046875),
		heading = 87.874015808105, 
		gender = "male", 
	},

	----------------------------------------
	---       	 Paintball        	 ---
	----------------------------------------

	{
		model = "a_m_y_ktown_02",
		coords = vector3(2356.7341308594,2488.9714355469,46.517211914062),
		heading = 354.33071899414, 
		gender = "male", 
	},

	----------------------------------------
	---       	 Casino        	 ---
	----------------------------------------

	{
		model = "u_f_m_casinocash_01",
		coords = vector3(1109.48, 229.35, -49.64),
		heading = 200.0, 
		gender = "male", 
	},

	----------------------------------------
	---       	 Jail Job Ped        	 ---
	----------------------------------------

	{
		model = "mp_m_securoguard_01",
		coords = vector3(1775.147, 2553.604, 45.56),
		heading = 134.62, 
		gender = "male", 
	},

		----------------------------------------
	---       	Court room ped       	 ---
	----------------------------------------

	{
		model = "mp_m_securoguard_01",
		coords = vector3(245.0484, -1075.192, 29.29406),
		heading = 152.707, 
		gender = "male", 
	},
}

