-- Police Duty --

local PDService = false
local SASPService = false
local BCSOService = false
local SAPRService = false
local DOCService = false
local DISPATCHERService = false

RegisterNetEvent('np-police:DOCDuty')
AddEventHandler('np-police:DOCDuty', function()

	local menuData = {
		{
            title = "DOC",
            description = "Sign On/Off Duty",
            key = "EVENTS.DOC",
			children = {
				{ title = "Sign On Duty", action = "np-duty:OnDutyDOC", key = "EVENTS.DOC" },
				{ title = "Sign Off Duty", action = "np-duty:OffDutyDOC", key = "EVENTS.DOC" },
            },
        },
    }
    exports["np-interface"]:showContextMenu(menuData)
end)

RegisterCommand('duty', function()
	TriggerEvent('np-duty:PoliceMenu')
end)

RegisterNetEvent('np-duty:PoliceMenu')
AddEventHandler('np-duty:PoliceMenu', function()
	local menuData = {
		{
            title = "Police",
            description = "Sign On/Off Duty",
            key = "EVENTS.POLICE",
			children = {
				{
					title = "LSPD",
					key = "EVENTS.LSPD",
					children = {
						{
							title = "Sign On Duty",
							action = "np-duty:OnDutyPD",
						},
						{
							title = "Sign Off Duty",
							action = "np-duty:OffDutyPD",
						},
					}
				},
				{
					title = "SASP",
					key = "EVENTS.SASP",
					children = {
						{
							title = "Sign On Duty",
							action = "np-duty:OnDutyHP",
						},
						{
							title = "Sign Off Duty",
							action = "np-duty:OffDutyHP",
						},
					}
				},
				{
					title = "BCSO",
					key = "EVENTS.SASP",
					children = {
						{
							title = "Sign On Duty",
							action = "np-duty:OnDutySH",
						},
						{
							title = "Sign Off Duty",
							action = "np-duty:OffDutySH",
						},
					}
				},
				{
					title = "Rangers",
					key = "EVENTS.RANGERS",
					children = {
						{
							title = "Sign On Duty",
							action = "np-duty:OnDutyRN",
						},
						{
							title = "Sign Off Duty",
							action = "np-duty:OffDutyRN",
						},
					}
				},
            },
        },
		{
            title = "DOC",
            description = "Sign On/Off Duty",
            key = "EVENTS.DOC",
			children = {
				{ title = "Sign On Duty", action = "np-duty:OnDutyDOC", key = "EVENTS.DOC" },
				{ title = "Sign Off Duty", action = "np-duty:OffDutyDOC", key = "EVENTS.DOC" },
            },
        },
		{
            title = "Dispatcher",
            description = "Sign On/Off Duty",
            key = "EVENTS.DISPATCHER",
			children = {
				{ title = "Sign On Duty", action = "np-duty:OnDutyDispatcher", key = "EVENTS.DISPATCHER" },
				{ title = "Sign Off Duty", action = "np-duty:OffDutyDispatcher", key = "EVENTS.DISPATCHER" },
            },
        },
    }
    exports["np-interface"]:showContextMenu(menuData)
end)

RegisterInterfaceCallback("np-duty:OnDutyPD", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if PDService == false then
		TriggerServerEvent('np-duty:AttemptDuty', 'police')
		TriggerEvent('np-clothing:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterInterfaceCallback("np-duty:OffDutyPD", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if PDService == true then
		PDService = false
		TriggerEvent('np-clothing:inService', false)
		exports['np-voice']:removePlayerFromRadio()
		exports["np-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('np-duty:OffDutyComplete', 'police')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)

-- Sheriff

RegisterInterfaceCallback("np-duty:OnDutySH", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if BCSOService == false then
		TriggerServerEvent('np-duty:AttemptDuty', 'sheriff')
		TriggerEvent('np-clothing:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterInterfaceCallback("np-duty:OnDutyRN", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if SAPRService == false then
		TriggerServerEvent('np-duty:AttemptDuty', 'ranger')
		TriggerEvent('np-clothing:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterInterfaceCallback("np-duty:OffDutySH", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if BCSOService == true then
		BCSOService = false
		TriggerEvent('np-clothing:inService', false)
		exports['np-voice']:removePlayerFromRadio()
		exports["np-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('np-duty:OffDutyComplete', 'sheriff')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)

RegisterInterfaceCallback("np-duty:OffDutyRN", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if SAPRService == true then
		SAPRService = false
		TriggerEvent('np-clothing:inService', false)
		exports['np-voice']:removePlayerFromRadio()
		exports["np-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('np-duty:OffDutyComplete', 'ranger')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)


-- State

RegisterInterfaceCallback("np-duty:OnDutyHP", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if SASPService == false then
		TriggerServerEvent('np-duty:AttemptDuty', 'state')
		TriggerEvent('np-clothing:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterInterfaceCallback("np-duty:OffDutyHP", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if SASPService == true then
		SASPService = false
		TriggerEvent('np-clothing:inService', false)
		exports['np-voice']:removePlayerFromRadio()
		exports["np-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('np-duty:OffDutyComplete', 'state')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)

-- DOC

RegisterInterfaceCallback("np-duty:OnDutyDOC", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if DOCService == false then
		TriggerServerEvent('np-duty:AttemptDuty', 'doc')
		TriggerEvent('np-clothing:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterInterfaceCallback("np-duty:OnDutyDispatcher", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if DISPATCHERService == false then
		DISPATCHERService = true
		TriggerEvent('DoLongHudText', 'Clocked in as Dispatcher.', 1)
		TriggerServerEvent('np-duty:AttemptDuty', 'dispatcher')
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterInterfaceCallback("np-duty:OffDutyDOC", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if DOCService == true then
		DOCService = false
		TriggerEvent('np-clothing:inService', false)
		exports['np-voice']:removePlayerFromRadio()
		exports["np-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('np-duty:OffDutyComplete', 'doc')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)

RegisterInterfaceCallback("np-duty:OffDutyDispatcher", function(data, cb)
	cb({ data = {}, meta = { ok = true, message = 'done' } })
	if DISPATCHERService == true then
		DISPATCHERService = false
		TriggerEvent('np-clothing:inService', false)
		exports['np-voice']:removePlayerFromRadio()
		exports["np-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("police:noLongerCop")
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You wasnt on duty!', 2)
	end
end)

RegisterNetEvent('np-duty:PDSuccess')
AddEventHandler('np-duty:PDSuccess', function()
	if PDService == false then
		exports["np-voice"]:setVoiceProperty("radioEnabled", true)
		exports['np-voice']:addPlayerToRadio(1)
		TriggerEvent('radio:SetRadioStatus', true)
		PDService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:BCSOSuccess')
AddEventHandler('np-duty:BCSOSuccess', function()
	if BCSOService == false then
		exports["np-voice"]:setVoiceProperty("radioEnabled", true)
		exports['np-voice']:addPlayerToRadio(1)
		TriggerEvent('radio:SetRadioStatus', true)
		BCSOService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:SAPRSuccess')
AddEventHandler('np-duty:SAPRSuccess', function()
	if SAPRService == false then
		exports["np-voice"]:setVoiceProperty("radioEnabled", true)
		exports['np-voice']:addPlayerToRadio(1)
		TriggerEvent('radio:SetRadioStatus', true)
		SAPRService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:SASPSuccess')
AddEventHandler('np-duty:SASPSuccess', function()
	if SASPService == false then
		exports["np-voice"]:setVoiceProperty("radioEnabled", true)
		exports['np-voice']:addPlayerToRadio(1)
		TriggerEvent('radio:SetRadioStatus', true)
		SASPService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:DOCSuccess')
AddEventHandler('np-duty:DOCSuccess', function()
	if DOCService == false then
		exports["np-voice"]:setVoiceProperty("radioEnabled", true)
		exports['np-voice']:addPlayerToRadio(3)
		TriggerEvent('radio:SetRadioStatus', true)
		DOCService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- EMS Duty --

local EMSService = false

RegisterNetEvent('np-duty:EMSMenu')
AddEventHandler('np-duty:EMSMenu', function()

	local EMSData = {
		{
            title = "EMS",
            description = "Sign On/Off Duty",
            key = "EVENTS.EMS",
			children = {
				{ title = "Sign On Duty", action = "np-duty:ems_41", key = "EVENTS.EMS" },
				{ title = "Sign Off Duty", action = "np-duty:ems_42", key = "EVENTS.EMS" },
            },
        },
    }
    exports["np-interface"]:showContextMenu(EMSData)
end)

RegisterInterfaceCallback('np-duty:ems_42', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-duty:OffDutyEMS')
end)

RegisterInterfaceCallback('np-duty:ems_41', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-duty:OnDutyEMS')
end)

RegisterNetEvent('np-duty:OnDutyEMS')
AddEventHandler('np-duty:OnDutyEMS', function()
	if EMSService == false then
		TriggerServerEvent('np-duty:AttemptDutyEMS')
		TriggerEvent('np-clothing:inService', true)
		TriggerServerEvent('dispatch:setcallsign')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:OffDutyEMS')
AddEventHandler('np-duty:OffDutyEMS', function()
	if EMSService == true then
		EMSService = false
		TriggerEvent('np-clothing:inService', false)
		exports['np-voice']:removePlayerFromRadio()
		exports["np-voice"]:setVoiceProperty("radioEnabled", false)
		TriggerEvent('radio:SetRadioStatus', false)
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerServerEvent('myskin_customization:wearSkin')
		TriggerServerEvent('tattoos:retrieve')
		TriggerServerEvent('Blemishes:retrieve')
		TriggerEvent("logoffmedic")		
		TriggerEvent("loggedoff")					
		TriggerEvent('nowCopSpawnOff')
		TriggerEvent('nowMedicOff')
		SetPedRelationshipGroupHash(PlayerPedId(),`PLAYER`)
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`PLAYER`)
		SetPoliceIgnorePlayer(PlayerPedId(),false)
		TriggerServerEvent('np-duty:OffDutyCompleteEMS')
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('np-duty:EMSSuccess')
AddEventHandler('np-duty:EMSSuccess', function()
	if EMSService == false then
		exports["np-voice"]:setVoiceProperty("radioEnabled", true)
		exports['np-voice']:addPlayerToRadio(2)
		TriggerEvent('radio:SetRadioStatus', true)
		EMSService = true
		TriggerEvent('nowCop')
		TriggerEvent('nowService')
		TriggerEvent('nowCopHud')
		TriggerEvent('nowCopDeath')
		TriggerEvent('nowCopSpawn')
		TriggerEvent('nowMedic')
		SetPedRelationshipGroupDefaultHash(PlayerPedId(),`MISSION2`)
		SetPedRelationshipGroupHash(PlayerPedId(),`MISSION2`)
		SetPoliceIgnorePlayer(PlayerPedId(),true)
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)


-- Judge Duty ------------------------------------------------------------

local JudgeService = false

RegisterNetEvent('np-duty:OnDutyJudge')
AddEventHandler('np-duty:OnDutyJudge', function()
	if JudgeService == false then
		TriggerServerEvent('np-duty:AttemptDutyJudge')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:OffDutyJudge')
AddEventHandler('np-duty:OffDutyJudge', function()
	if JudgeService == true then
		JudgeService = false
		TriggerServerEvent('np-duty:OffDutyCompleteEMS')
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('np-duty:JudgeSuccess')
AddEventHandler('np-duty:JudgeSuccess', function()
	if JudgeService == false then
		JudgeService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- DA Duty --

local DAService = false

RegisterNetEvent('np-duty:OnDutyDA')
AddEventHandler('np-duty:OnDutyDA', function()
	if DAService == false then
		TriggerServerEvent('np-duty:AttemptDutyDA')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:OffDutyDA')
AddEventHandler('np-duty:OffDutyDA', function()
	if DAService == true then
		DAService = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('np-duty:DASuccess')
AddEventHandler('np-duty:DASuccess', function()
	if DAService == false then
		DAService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

-- Public Duty --

local PublicService = false

RegisterNetEvent('np-duty:OnDutyPublic')
AddEventHandler('np-duty:OnDutyPublic', function()
	if PublicService == false then
		TriggerServerEvent('np-duty:AttemptDutyPublic')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:OffDutyPublic')
AddEventHandler('np-duty:OffDutyPublic', function()
	if PublicService == true then
		PublicService = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed off Duty!',1)
	else
		TriggerEvent("DoLongHudText",'You are not on duty!', 2)
	end
end)

RegisterNetEvent('np-duty:PublicSuccess')
AddEventHandler('np-duty:PublicSuccess', function()
	if PublicService == false then
		PublicService = true
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)


curPolice = 0

RegisterNetEvent('job:policecount')
AddEventHandler('job:policecount', function(pAmount)
	curPolice = pAmount
end)

function LawAmount()
	return curPolice
end

-- DOJ Duty --

local ClockedInAsJudge = false

local ClockedInAsPublicDefender = false

local ClockedInAsDistrictAttorney = false

RegisterNetEvent('np-duty:doj_board')
AddEventHandler('np-duty:doj_board', function()

	local JudgeData = {
		{
            title = "Judge Duty",
            description = "Sign On/Off Duty",
            key = "EVENTS.JUDGE",
			children = {
				{ title = "Sign On Duty", action = "np-duty:judge_on", key = "EVENTS.JUDGE" },
				{ title = "Sign Off Duty", action = "np-duty:judge_off", key = "EVENTS.JUDGE" },
            },
        },
		{
            title = "Public Defender Duty",
            description = "Sign On/Off Duty",
            key = "EVENTS.DEFENDER",
			children = {
				{ title = "Sign On Duty", action = "np-duty:defender_on", key = "EVENTS.DEFENDER" },
				{ title = "Sign Off Duty", action = "np-duty:defender_off", key = "EVENTS.DEFENDER" },
            },
        },
		{
            title = "District Attorney Duty",
            description = "Sign On/Off Duty",
            key = "EVENTS.ATTORNEY",
			children = {
				{ title = "Sign On Duty", action = "np-duty:attorney_on", key = "EVENTS.ATTORNEY" },
				{ title = "Sign Off Duty", action = "np-duty:attorney_off", key = "EVENTS.ATTORNEY" },
            },
        },
    }
    exports["np-interface"]:showContextMenu(JudgeData)
end)

RegisterInterfaceCallback('np-duty:attorney_on', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-duty:clock_in:district_attorney')
end)

RegisterInterfaceCallback('np-duty:attorney_off', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-duty:clock_out:district_attorney')
end)

RegisterInterfaceCallback('np-duty:defender_on', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-duty:clock_in:public_defender')
end)

RegisterInterfaceCallback('np-duty:defender_off', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-duty:clock_out:public_defender')
end)

RegisterInterfaceCallback('np-duty:judge_on', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-duty:clock_in:judge')
end)

RegisterInterfaceCallback('np-duty:judge_off', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
	TriggerEvent('np-duty:clock_out:judge')
end)


-- Judge --

RegisterNetEvent('np-duty:clock_in:judge')
AddEventHandler('np-duty:clock_in:judge', function()
	if ClockedInAsJudge == false then
		TriggerServerEvent('np-duty:attempt_duty:judge')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:clock_out:judge')
AddEventHandler('np-duty:clock_out:judge', function()
	if ClockedInAsJudge == true then
		ClockedInAsJudge = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed out. You are no longer a Judge', 2)
		TriggerServerEvent('np-duty:offDutyJudge')
	else
		TriggerEvent("DoLongHudText",'You was never clocked in as a Judge', 2)
	end
end)

RegisterNetEvent('np-duty:clocked_in:judge_successful')
AddEventHandler('np-duty:clocked_in:judge_successful', function()
	if ClockedInAsJudge == false then
		ClockedInAsJudge = true
	else
		TriggerEvent("DoLongHudText",'You are already clocked in as a Judge', 2)
	end
end)

-- Public Defender --

RegisterNetEvent('np-duty:clock_in:public_defender')
AddEventHandler('np-duty:clock_in:public_defender', function()
	if ClockedInAsPublicDefender == false then
		TriggerServerEvent('np-duty:attempt_duty:public_defender')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:clock_out:public_defender')
AddEventHandler('np-duty:clock_out:public_defender', function()
	if ClockedInAsPublicDefender == true then
		ClockedInAsPublicDefender = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed out. You are no longer a Public Defender', 2)
		TriggerServerEvent('np-duty:offDutyDefender')
	else
		TriggerEvent("DoLongHudText",'You was never clocked in as a Public Defender', 2)
	end
end)

RegisterNetEvent('np-duty:clocked_in:public_defender_successful')
AddEventHandler('np-duty:clocked_in:public_defender_successful', function()
	if ClockedInAsPublicDefender == false then
		ClockedInAsPublicDefender = true
	else
		TriggerEvent("DoLongHudText",'You are already clocked in as a Public Defender', 2)
	end
end)

-- District Attorney --

RegisterNetEvent('np-duty:clock_in:district_attorney')
AddEventHandler('np-duty:clock_in:district_attorney', function()
	if ClockedInAsDistrictAttorney == false then
		TriggerServerEvent('np-duty:attempt_duty:district_attorney')
	else
		TriggerEvent("DoLongHudText",'You are on duty already!', 2)
	end
end)

RegisterNetEvent('np-duty:clock_out:district_attorney')
AddEventHandler('np-duty:clock_out:district_attorney', function()
	if ClockedInAsDistrictAttorney == true then
		ClockedInAsDistrictAttorney = false
		TriggerServerEvent("jobssystem:jobs", "unemployed")
		TriggerEvent("DoLongHudText",'Signed out. You are no longer a District Attorney', 2)
	else
		TriggerEvent("DoLongHudText",'You was never clocked in as a District Attorney', 2)
	end
end)

RegisterNetEvent('np-duty:clocked_in:district_attorney_successful')
AddEventHandler('np-duty:clocked_in:district_attorney_successful', function()
	if ClockedInAsDistrictAttorney == false then
		ClockedInAsDistrictAttorney = true
	else
		TriggerEvent("DoLongHudText",'You are already clocked in as a District Attorney', 2)
	end
end)