RegisterNetEvent('FinishMoneyCheckForVehpdm')
RegisterNetEvent('pdmvehshop:spawnVehicle')
local vehshop_blips = {}
local buyPlate = {}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false
local vehicle_price = 0
local backlock = false
local firstspawn = 0
local commissionbuy = 0
local rank = 0

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
local currentCarSpawnLocation = 0
local ownerMenu = false

local vehshopDefault = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	menu = {
		x = 0.14,
		y = 0.15,
		width = 0.12,
		height = 0.03,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.29,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Vehicles", description = ""},
				{name = "Cycles", description = ""},
			}
		},
		["vehicles"] = {
			title = "VEHICLES",
			name = "vehicles",
			buttons = {
				{name = "Job Vehicles", description = ''},
			}
		},
		["jobvehicles"] = {
			title = "job vehicles",
			name = "job vehicles",
			buttons = {
				{name = "Taxi Cab", costs = 4000, description = {}, model = "taxi"},
				{name = "Flat Bed", costs = 7000, description = {}, model = "flatbed"},
				{name = "News Rumpo", costs = 4000, description = {}, model = "rumpo"},
			}
		},
		["cycles"] = {
			title = "cycles",
			name = "cycles",
			buttons = {
				{name = "BMX", costs = 150, description = {}, model = "bmx"},
				{name = "Cruiser", costs = 240, description = {}, model = "cruiser"},
				{name = "Fixter", costs = 270, description = {}, model = "fixter"},
				{name = "Scorcher", costs = 300, description = {}, model = "scorcher"},
				{name = "Pro 1", costs = 2500, description = {}, model = "tribike"},
				{name = "Pro 2", costs = 2600, description = {}, model = "tribike2"},
				{name = "Pro 3", costs = 2900, description = {}, model = "tribike3"},
			}
		},		
	}
}

vehshop = vehshopDefault
local vehshopOwner = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	menu = {
		x = 0.14,
		y = 0.15,
		width = 0.12,
		height = 0.03,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.29,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Vehicles", description = ""},
				{name = "Motorcycles", description = ""},
				{name = "Cycles", description = ""},
			}
		},
		["vehicles"] = {
			title = "VEHICLES",
			name = "vehicles",
			buttons = {
				{name = "Job Vehicles", description = ''},
				{name = "S-Class", description = ''},
				{name = "A-Class", description = ''},
				{name = "B-Class", description = ''},
				{name = "C-Class", description = ''},
				{name = "D-Class", description = ''},
				{name = "Off-Road", description = ''},
				{name = "SUVs", description = ''},
				{name = "Vans", description = ''},
			}
		},
		["jobvehicles"] = {
			title = "job vehicles",
			name = "job vehicles",
			buttons = {
				{name = "Taxi Cab", costs = 4000, description = {}, model = "taxi"},
				{name = "Flat Bed", costs = 7000, description = {}, model = "flatbed"},
				{name = "News Rumpo", costs = 4000, description = {}, model = "rumpo"},
			}
		},
		["s-class"] = {
			title = "s-class",
			name = "s-class",
			buttons = {
				{name = "Bravado Gauntlet Classic", costs = 700000, description = {}, model = "gauntlet3"},
				{name = "Grotti Furia", costs = 650000, description = {}, model = "furia"},
				{name = "Vapid Peyote Gasser", costs = 400000, description = {}, model = "peyote2"},
				{name = "Vulcar Nebula Turbo", costs = 350000, description = {}, model = "nebula"},
				{name = "Grotti Turismo Classic", costs = 850000, description = {}, model = "turismo2"},
				{name = "Grotti Cheetah Classic", costs = 800000, description = {}, model = "cheetah2"},
				
			}
		},
		["b-class"] = {
			title = "b-class",
			name = "b-class",
			buttons = {
				{name = "Lampadati Komoda", costs = 275000, description = {}, model = "komoda"},
				{name = "Dinka Blista", costs = 60000, description = {}, model = "blista"},
				{name = "Albany VSTR", costs = 225000, description = {}, model = "vstr"},
				{name = "Dinka Sugoi", costs = 200000, description = {}, model = "sugoi"},
				{name = "Karin Kuruma", costs = 85000, description = {}, model = "kuruma"},
				{name = "Vapid GB200", costs = 138000, description = {}, model = "gb200"},
				{name = "Lampadati Tropos Rally", costs = 140000, description = {}, model = "tropos"},
				{name = "Bollokon Prairie", costs = 100000, description = {}, model = "prairie"},
				{name = "Annis Savestra", costs = 75000, description = {}, model = "savestra"},
				{name = "Ubermacht Sentinel", costs = 60000, description = {}, model = "sentinel"},
				{name = "Ubermacht Sentinel XS", costs = 100000, description = {}, model = "sentinel2"},
				{name = "Ubermacht Zion Classic", costs = 210000, description = {}, model = "zion3"},
				{name = "Bravado Buffalo", costs = 155000, description = {}, model = "buffalo"},
				{name = "Bravado Buffalo S", costs = 275000, description = {}, model = "buffalo2"},				
				{name = "Enus Windsor Drop", costs = 400000, description = {}, model = "windsor2"},
				{name = "Shyster Fusilade", costs = 120000, description = {}, model = "fusilade"},
				{name = "Karin Futo", costs = 100000, description = {}, model = "futo"},
				{name = "Revolter", costs = 130000, description = {}, model = "revolter"},
				{name = "Ubermacht Schafter", costs = 190000, description = {}, model = "schafter2"},
				{name = "Enus Cognoscenti", costs = 125000, description = {}, model = "cognoscenti"},
				{name = "Enus Cognoscenti 55", costs = 150000, description = {}, model = "cog55"},
				{name = "Cheval Fugitive", costs = 90000, description = {}, model = "fugitive"},
				{name = "Karin Intruder", costs = 145000, description = {}, model = "intruder"},
				{name = "Declasse Premier", costs = 50000, description = {}, model = "premier"},
				{name = "Zirconium Stratum", costs = 160000, description = {}, model = "stratum"},
				{name = "Enus Super Diamond", costs = 135000, description = {}, model = "superd"},
				{name = "Obey Tailgater", costs = 90000, description = {}, model = "tailgater"},
				{name = "Dewbauchee Exemplar", costs = 120000, description = {}, model = "exemplar"},
				{name = "Ocelot Jackal", costs = 130000, description = {}, model = "jackal"},
				{name = "Ubermacht Oracle", costs = 86000, description = {}, model = "oracle"},
				{name = "Ubermacht Oracle XS", costs = 130000, description = {}, model = "oracle2"},
				{name = "Lampadati Felon", costs = 115000, description = {}, model = "felon"},
				{name = "Coil Raiden", costs = 300000, description = {}, model = "raiden"},
				{name = "Cheval Surge", costs = 80000, description = {}, model = "surge"},
				{name = "Ubermacht Rebla", costs = 100000, description = {}, model = "rebla"},
				{name = "Lampadati Novak", costs = 90000, description = {}, model = "novak"},				
				{name = "Gallivanter Baller LE", costs = 200000, description = {}, model = "baller3"},
				{name = "Benefactor Dubsta Mandem", costs = 150000, description = {}, model = "dubsta2"},
				{name = "Benefactor Dubsta", costs = 130000, description = {}, model = "dubsta"},
				{name = "Bravado Gresley", costs = 90000, description = {}, model = "gresley"},
				{name = "Enus Huntley S", costs = 135000, description = {}, model = "huntley"},
				{name = "Obey Rocoto", costs = 90000, description = {}, model = "rocoto"},
				{name = "Benefactor Serrano", costs = 100000, description = {}, model = "serrano"},
				{name = "Benefactor XLS", costs = 105500, description = {}, model = "xls"},
				{name = "Vapid Scuffvan Custom", costs = 130000, description = {}, model = "minivan2"},
				{name = "Weeny Issi Sport", costs = 95500, description = {}, model = "issi7"},
				{name = "Lampadati Michelli GT", costs = 40000, description = {}, model = "michelli"},
				{name = "Vapid Retinue", costs = 100000, description = {}, model = "retinue"},
				{name = "Vapid Retinue MkII", costs = 150000, description = {}, model = "retinue2"},
				{name = "Nagasaki Outlaw", costs = 225000, description = {}, model = "outlaw"},
				{name = "Maxwell Vagrant", costs = 130000, description = {}, model = "vagrant"},
				{name = "Karin Everon", costs = 100000, description = {}, model = "everon"},
				{name = "Vapid Trophy Truck", costs = 125000, description = {}, model = "trophytruck"},
				{name = "Vapid Desert Raid", costs = 140000, description = {}, model = "trophytruck2"},
				{name = "Vapid Slamvan", costs = 105000, description = {}, model = "cheburek"},
				{name = "RUNE Cheburek", costs = 90000, description = {}, model = "zion3"},
				{name = "Albany Buccaneer", costs = 95000, description = {}, model = "buccaneer"},
				{name = "Albany Buccaneer Custom", costs = 100000, description = {}, model = "buccaneer2"},				
				{name = "Vapid Clique", costs = 85000, description = {}, model = "clique"},
				{name = "Willard Faction", costs = 90000, description = {}, model = "faction"},
				{name = "Declasse Impaler", costs = 80000, description = {}, model = "impaler"},
				{name = "Imponte Nightshade", costs = 115000, description = {}, model = "nightshade"},
				{name = "Imponte Phoenix", costs = 95000, description = {}, model = "phoenix"},
				{name = "Cheval Picador", costs = 65000, description = {}, model = "picador"},
				{name = "Bravado Rat-Truck", costs = 100000, description = {}, model = "ratloader2"},
				{name = "Declasse Sabre Turbo Custom", costs = 135000, description = {}, model = "sabregt2"},
				{name = "Declasse Stallion", costs = 87000, description = {}, model = "stalion"},
				{name = "Declasse Tulip", costs = 85000, description = {}, model = "tulip"},
				{name = "Declasse Vigero", costs = 95000, description = {}, model = "vigero"},
				{name = "Albany Virgo", costs = 110000, description = {}, model = "virgo"},
				{name = "Benefactor Stirling GT", costs = 145000, description = {}, model = "feltzer3"},
				{name = "Invetero Coquette Classic", costs = 135000, description = {}, model = "coquette2"},
				{name = "Invetero Coquette Blackfin", costs = 125000, description = {}, model = "coquette3"},
				{name = "Grotti GT500", costs = 95000, description = {}, model = "gt500"},
				{name = "Declasse Mamba", costs = 126000, description = {}, model = "mamba"},
				{name = "Grotti Stinger", costs = 130000, description = {}, model = "stinger"},
				{name = "Grotti Stinger GT", costs = 145000, description = {}, model = "stingergt"},
				{name = "Ocelot Swinger", costs = 350000, description = {}, model = "swinger"},
				{name = "Lampadati Viseris", costs = 180000, description = {}, model = "viseris"},
				{name = "Dewbauchee Rapid GT Classic", costs = 155000, description = {}, model = "rapidgt3"},
			}
		},
		["c-class"] = {
			title = "c-class",
			name = "c-class",
			buttons = {
				{name = "Dinka Blista Compact", costs = 100000, description = {}, model = "blista2"},
				{name = "Karin Asterope", costs = 40000, description = {}, model = "asterope"},
				{name = "Vulcar Ingot", costs = 34000, description = {}, model = "ingot"},
				{name = "Albany Primo", costs = 33500, description = {}, model = "primo"},
				{name = "Albany Primo Custom", costs = 36000, description = {}, model = "primo2"},
				{name = "Vapid Stanier", costs = 34000, description = {}, model = "stanier"},
				{name = "Dundreary Stretch", costs = 250000, description = {}, model = "stretch"},
				{name = "Vulcar Warrener", costs = 33500, description = {}, model = "warrener"},
				{name = "Albany Washington", costs = 32500, description = {}, model = "washington"},
				{name = "Weeny Issi", costs = 31500, description = {}, model = "issi2"},
				{name = "Benefactor Panto", costs = 100000, description = {}, model = "panto"},
				{name = "Declasse Rhapsody", costs = 32500, description = {}, model = "rhapsody"},
				{name = "Gallivanter Baller", costs = 80000, description = {}, model = "baller"},
				{name = "Gallivanter Baller", costs = 120000, description = {}, model = "baller2"},
				{name = "Karin BeeJay XL", costs = 36000, description = {}, model = "bjxl"},
				{name = "Albany Cavalcade", costs = 38000, description = {}, model = "cavalcade"},
				{name = "Albany Cavalcade", costs = 70000, description = {}, model = "cavalcade2"},
				{name = "Fathom FQ-2", costs = 34000, description = {}, model = "fq2"},
				{name = "Karin 190z", costs = 195000, description = {}, model = "z190"},
				{name = "Lampadati Casco", costs = 127000, description = {}, model = "casco"},
				{name = "Declasse Granger", costs = 110000, description = {}, model = "granger"},
				{name = "Emperor Habanero", costs = 67500, description = {}, model = "habanero"},
				{name = "Dundreary Landstalker", costs = 35000, description = {}, model = "landstalker"},
				{name = "Mammoth Patriot", costs = 100000, description = {}, model = "patriot"},
				{name = "Mammoth Patriot WCR", costs = 400000, description = {}, model = "patriot2"},
				{name = "Vapid Radius", costs = 33000, description = {}, model = "radi"}, 
				{name = "Canis Seminole", costs = 35000, description = {}, model = "seminole"},
				{name = "Bravado Youga", costs = 24000, description = {}, model = "youga"},
				{name = "Vapid Caracara", costs = 67000, description = {}, model = "caracara2"},
				{name = "Vapid Contender", costs = 93000, description = {}, model = "contender"},
				{name = "Bravado Rumpo Custom", costs = 79000, description = {}, model = "rumpo3"},
				{name = "Benefactor Streiter", costs = 39000, description = {}, model = "streiter"},
				{name = "Canis Mesa", costs = 35000, description = {}, model = "mesa"},
				{name = "Canis Mesa Lifted", costs = 56000, description = {}, model = "mesa3"},
				{name = "Pfister Comet Safari", costs = 45000, description = {}, model = "comet4"},
				{name = "BF Bifta", costs = 60000, description = {}, model = "bifta"},
				{name = "Coil Brawler", costs = 35000, description = {}, model = "brawler"},
				{name = "Benefactor Dubsta 6x6", costs = 48000, description = {}, model = "dubsta3"},
				{name = "BF Dune Buggy", costs = 32000, description = {}, model = "dune"},
				{name = "Canis Freecrawler", costs = 50000, description = {}, model = "freecrawler"},
				{name = "Canis Kamacho", costs = 41000, description = {}, model = "kamacho"},
				{name = "Karin Rebel", costs = 40000, description = {}, model = "rebel2"},
				{name = "Vapid Guardian", costs = 80000, description = {}, model = "guardian"},
				{name = "Bravado Bison", costs = 40000, description = {}, model = "bison"},
				{name = "Vapid Bobcat XL", costs = 67000, description = {}, model = "bobcatxl"},
				{name = "Vapid Riata", costs = 90000, description = {}, model = "riata"},
				{name = "Benefactor Glendale", costs = 220000, description = {}, model = "glendale"},
				{name = "Vulcar Fagaloa", costs = 200000, description = {}, model = "fagaloa"},
				{name = "Weeny Issi Classic", costs = 150000, description = {}, model = "issi3"},
				{name = "Willard Faction Donk", costs = 170000, description = {}, model = "faction3"},
				{name = "Vapid Chino", costs = 90000, description = {}, model = "chino"},
				{name = "Vapid Chino Custom", costs = 120000, description = {}, model = "chino2"},
				{name = "Vapid Hotknife", costs = 440000, description = {}, model = "hotknife"},
				{name = "Albany Roosevelt", costs = 225000, description = {}, model = "btype"}, 
				{name = "Albany Roosevelt Valor", costs = 245000, description = {}, model = "btype3"},
				{name = "Truffade Z-Type", costs = 800000, description = {}, model = "ztype"},
				{name = "Declasse Moonbeam", costs = 50000, description = {}, model = "moonbeam"},
				{name = "Declasse Moonbeam Custom", costs = 70000, description = {}, model = "moonbeam2"},
			}
		},
		["casino"] = {
			title = "casino",
			name = "casino",
			buttons = {
--				{name = "Jugular", costs = 175000, description = {}, model = "jugular"},
--				{name = "Peyote", costs = 75000, description = {}, model = "peyote2"},
--				{name = "Gauntlet 4", costs = 150000, description = {}, model = "gauntlet4"},
--				{name = "Caracara", costs = 190000, description = {}, model = "caracara2"},
--				{name = "Novak", costs = 140000, description = {}, model = "Novak"},
--				{name = "Issi 7", costs = 200000, description = {}, model = "issi7"},
--				{name = "Hellion", costs = 110000, description = {}, model = "hellion"},
--				{name = "Dynasty", costs = 110000, description = {}, model = "Dynasty"},
--				{name = "Gauntlet 3", costs = 130000, description = {}, model = "gauntlet3"},
--				{name = "Nebula", costs = 83000, description = {}, model = "nebula"},
--				{name = "Zion 3", costs = 75000, description = {}, model = "zion3"},
--				{name = "Drafter", costs = 140000, description = {}, model = "drafter"},
--				{name = "Komoda", costs = 195000, description = {}, model = "komoda"},
--				{name = "Rebla", costs = 110000, description = {}, model = "rebla"},
--				{name = "Retinue", costs = 80000, description = {}, model = "retinue2"},
--				{name = "Sugoi", costs = 105000, description = {}, model = "sugoi"},
--				{name = "Sultan 2", costs = 155000, description = {}, model = "sultan2"},
--				{name = "VSTR", costs = 186000, description = {}, model = "vstr"},



			}
		},
		
		["d-class"] = {
			title = "d-class",
			name = "d-class",
			buttons = {
				{name = "Declasse Asea", costs = 15000, description = {}, model = "asea"},
				{name = "Declasse Emperor", costs = 22500, description = {}, model = "emperor"},
				{name = "Dundreary Regina", costs = 20000, description = {}, model = "regina"},
				{name = "Chariot Romero Hearse", costs = 100000, description = {}, model = "romero"},
				{name = "Vapid Minivan", costs = 23000, description = {}, model = "minivan"},
				{name = "Bravado Paradise", costs = 24000, description = {}, model = "paradise"},
				{name = "Brute Pony", costs = 24000, description = {}, model = "pony"},
				{name = "Bravado Rumpo News", costs = 24000, description = {}, model = "rumpo"},	
				{name = " Bravado Rumpo HerrKutz", costs = 24000, description = {}, model = "rumpo2"},
				{name = "Vapid Speedo", costs = 24000, description = {}, model = "speedo"},
				{name = "Brute Camper", costs = 30000, description = {}, model = "camper"},
				{name = "Declasse Burrito", costs = 25000, description = {}, model = "burrito3"},
				{name = "Canis Kalahari", costs = 26000, description = {}, model = "kalahari"},
				{name = "Declasse Burrito G", costs = 45000, description = {}, model = "gburrito"},
				{name = "Declasse Burrito G2", costs = 85000, description = {}, model = "gburrito2"},
				{name = "Karin Dilettante", costs = 23500, description = {}, model = "dilettante"},
				{name = "Canis Bodhi", costs = 26000, description = {}, model = "bodhi2"},
				{name = "Declasse Rancher XL", costs = 28000, description = {}, model = "rancherxl"},
				{name = "Bravado Duneloader", costs = 28000, description = {}, model = "dloader"},
				{name = "Vapid Sadler", costs = 30000, description = {}, model = "sadler"},
				{name = "Vapid Sandking", costs = 52000, description = {}, model = "sandking2"},
				{name = "Vapid Sandking XL", costs = 95000, description = {}, model = "sandking"},
				{name = "Weeny Dynasty", costs = 23500, description = {}, model = "dynasty"},
				{name = "BF Surfer", costs = 24000, description = {}, model = "surfer"},
				{name = "Albany Hermes", costs = 130000, description = {}, model = "hermes"},
				{name = "Vapid Hustler ", costs = 150000, description = {}, model = "hustler"},
				{name = "Albany Virgo Custom", costs = 200000, description = {}, model = "virgo2"},
				{name = "Albany Virgo Classic", costs = 160000, description = {}, model = "virgo3"},
				{name = "Albany Manana", costs = 130000, description = {}, model = "manana"},
				{name = "Declasse Voodoo", costs = 140000, description = {}, model = "voodoo"},		
				{name = "Vapid Peyote", costs = 150000, description = {}, model = "peyote"},
				{name = "Declasse Tornado", costs = 170000, description = {}, model = "tornado"},
				{name = "Declasse Tornado Cabrio", costs = 190000, description = {}, model = "tornado2"},
				{name = "Declasse Tornado Custom", costs = 190000, description = {}, model = "tornado5"},
				{name = "Lampadati Pigalle", costs = 27000, description = {}, model = "pigalle"},				
				{name = "Bravado Youga Classic", costs = 28000, description = {}, model = "youga2"},
			}
		},
		["offroad"] = {
			title = "off-road",
			name = "off-road",
			buttons = {
				{name = "Bifta", costs = 15000, description = {}, model = "bifta"},
				{name = "Blazer", costs = 7000, description = {}, model = "blazer"},
				{name = "Brawler", costs = 40000, description = {}, model = "brawler"},
				{name = "Dune Buggy", costs = 10000, description = {}, model = "dune"},
				{name = "Rebel", costs = 45000, description = {}, model = "rebel2"},
				{name = "Sadler", costs = 65000, description = {}, model = "sadler"},
				{name = "Sandking", costs = 70000, description = {}, model = "sandking"},
				{name = "Kamacho", costs = 90000, description = {}, model = "kamacho"},
				{name = "Dubsta 6x6", costs = 140000, description = {}, model = "dubsta3"},
			}
		},
		["suvs"] = {
			title = "suvs",
			name = "suvs",
			buttons = {
				{name = "Cavalcade", costs = 30000, description = {}, model = "cavalcade2"},
				{name = "Granger", costs = 110000, description = {}, model = "granger"},
				{name = "Huntley S", costs = 135000, description = {}, model = "huntley"},
				{name = "Landstalker", costs = 35000, description = {}, model = "landstalker"},
				{name = "Radius", costs = 16000, description = {}, model = "radi"},
				{name = "Rocoto", costs = 90000, description = {}, model = "rocoto"},
				{name = "Seminole", costs = 35000, description = {}, model = "seminole"},
				{name = "XLS", costs = 110000, description = {}, model = "xls"},
				{name = "Dubsta", costs = 130000, description = {}, model = "dubsta"},
				{name = "Patriot", costs = 100000, description = {}, model = "patriot"},
				{name = "Gresley", costs = 90000, description = {}, model = "gresley"},
				{name = "Toros", costs = 175000, description = {}, model = "toros"},
			}
		},
		["vans"] = {
			title = "vans",
			name = "vans",
			buttons = {
				{name = "Bison", costs = 40000, description = {}, model = "bison"},
				{name = "Bobcat XL", costs = 67000, description = {}, model = "bobcatxl"},
				{name = "Gang Burrito", costs = 45000, description = {}, model = "gburrito"},
				{name = "Journey", costs = 10000, description = {}, model = "journey"},
				{name = "Minivan", costs = 23000, description = {}, model = "minivan"},
				{name = "Paradise", costs = 24000, description = {}, model = "paradise"},
				{name = "Surfer", costs = 24000, description = {}, model = "surfer"},
				{name = "Youga", costs = 24000, description = {}, model = "youga"},
				{name = "Moonbeam", costs = 24000, description = {}, model = "moonbeam"},
				{name = "Camper", costs = 30000, description = {}, model = "camper"},
			}
		},
		["a-class"] = {
			title = "a-class",
			name = "a-class",
			buttons = {
				{name = "Pegassi Toros", costs = 175000, description = {}, model = "toros"},
				{name = "Dewbauchee Seven-70", costs = 350000, description = {}, model = "seven70"},
				{name = "Dewbauchee Specter", costs = 305000, description = {}, model = "specter"},
				{name = "Dewbauchee Specter Sport", costs = 350000, description = {}, model = "specter2"},
				{name = "Dinka Jester", costs = 650000, description = {}, model = "jester"},
				{name = "Bravado Banshee", costs = 300000, description = {}, model = "banshee"},
				{name = "Invetero Coquette", costs = 225000, description = {}, model = "coquette"},
				{name = "Obey 9F", costs = 180000, description = {}, model = "ninef"},
				{name = "Ocelot Locust", costs = 195000, description = {}, model = "locust"},
				{name = "Obey 9F Cabrio", costs = 250000, description = {}, model = "ninef2"},
				{name = "Albany Alpha", costs = 215000, description = {}, model = "alpha"},
				{name = "Grotti Bestia GTS", costs = 210000, description = {}, model = "bestiagts"},
				{name = "Grotti Carbonizzare", costs = 200000, description = {}, model = "carbonizzare"},
				{name = "Pfister Comet", costs = 450000, description = {}, model = "comet2"},
				{name = "Pfister Comet Retro", costs = 325000, description = {}, model = "comet3"},
				{name = "Benefactor Feltzer", costs = 295000, description = {}, model = "feltzer2"},
				{name = "Lampadati Furore GT", costs = 285000, description = {}, model = "furoregt"},
				{name = "Dewbauchee Massacro", costs = 235000, description = {}, model = "massacro"},
				{name = "Ocelot Pariah", costs = 280000, description = {}, model = "pariah"},
				{name = "Dewbauchee Rapid GT", costs = 200000, description = {}, model = "rapidgt"},
				{name = "Dewbauchee Rapid GT Cabrio", costs = 250000, description = {}, model = "rapidgt2"},
				{name = "Hijak Ruston", costs = 225000, description = {}, model = "ruston"},
				{name = "Benefactor Schwartzer", costs = 85000, description = {}, model = "schwarzer"},
				{name = "Benefactor Surano", costs = 145000, description = {}, model = "surano"},
				{name = "Enus Cognoscenti Cabrio", costs = 180000, description = {}, model = "cogcabrio"},
				{name = "Ocelot F620", costs = 285000, description = {}, model = "f620"},
				{name = "Lampadati Felon GT", costs = 150000, description = {}, model = "zion"},
				{name = "Ubermacht Zion", costs = 200000, description = {}, model = "furoregt"},
				{name = "Ubermacht Zion Cabrio", costs = 175000, description = {}, model = "zion2"},
				{name = "Enus Windsor", costs = 400000, description = {}, model = "windsor"},
				{name = "Grotti Brioso R/A", costs = 100000, description = {}, model = "brioso"},
				{name = "Coil Voltic", costs = 255000, description = {}, model = "voltic"},
				{name = "Vapid Dominator", costs = 260000, description = {}, model = "dominator"},
				{name = "Enus Stafford", costs = 125000, description = {}, model = "stafford"},
				{name = "Vapid Blade", costs = 130000, description = {}, model = "blade"},
				{name = "Imponte Dukes", costs = 110000, description = {}, model = "dukes"},
				{name = "Declasse Vamos", costs = 135000, description = {}, model = "vamos"},
				{name = "Vapid Ellie", costs = 115000, description = {}, model = "ellie"},
				{name = "Imponte Ruiner", costs = 130000, description = {}, model = "ruiner"},
				{name = "Declasse Sabre Turbo", costs = 145000, description = {}, model = "sabregt"},
				{name = "Vapid Slamvan", costs = 50000, description = {}, model = "slamvan"},
				{name = "Vapid Slamvan Custom", costs = 76000, description = {}, model = "slamvan3"},
			}
		},
		["motorcycles"] = {
			title = "MOTORCYCLES",
			name = "motorcycles",
			buttons = {		
				{name = "Akuma", costs = 70000, description = {}, model = "AKUMA"},
				{name = "Bagger", costs = 50000, description = {}, model = "bagger"},
				{name = "Bati 801", costs = 65000, description = {}, model = "bati"},
				{name = "BF400", costs = 72000, description = {}, model = "bf400"},
				{name = "Carbon RS", costs = 55000, description = {}, model = "carbonrs"},
				{name = "Daemon", costs = 25000, description = {}, model = "daemon"},
				{name = "Enduro", costs = 55000, description = {}, model = "enduro"},
				{name = "Faggio", costs = 10000, description = {}, model = "faggio"},
				{name = "Gargoyle", costs = 35000, description = {}, model = "gargoyle"},
				{name = "Hexer", costs = 45000, description = {}, model = "hexer"},
				{name = "Innovation", costs = 75000, description = {}, model = "innovation"},
				{name = "Nemesis", costs = 50000, description = {}, model = "nemesis"},
				{name = "PCJ-600", costs = 55000, description = {}, model = "pcj"},
				{name = "Ruffian", costs = 54000, description = {}, model = "ruffian"},
				{name = "Sanchez", costs = 25000, description = {}, model = "sanchez"},
				{name = "Sovereign", costs = 59000, description = {}, model = "sovereign"},
				{name = "Zombiea", costs = 65000, description = {}, model = "zombiea"},
				{name = "Vespa", costs = 10000, description = {}, model = "faggio2"},
				{name = "Manchez", costs = 37000, description = {}, model = "manchez"},
				{name = "Vortex", costs = 80000, description = {}, model = "vortex"},
				{name = "Avarus", costs = 55000, description = {}, model = "avarus"},
				{name = "Vader", costs = 75000, description = {}, model = "vader"},
				{name = "Esskey", costs = 65000, description = {}, model = "esskey"},
				{name = "Defiler", costs = 85000, description = {}, model = "defiler"},
				{name = "Chimera", costs = 65000, description = {}, model = "chimera"},
				{name = "Daemon", costs = 75000, description = {}, model = "daemon"},
				{name = "DaemonHigh", costs = 65000, description = {}, model = "daemon2"},
			}
		},
		["cycles"] = {
			title = "cycles",
			name = "cycles",
			buttons = {
				{name = "BMX", costs = 550, description = {}, model = "bmx"},
				{name = "Cruiser", costs = 240, description = {}, model = "cruiser"},
				{name = "Fixter", costs = 270, description = {}, model = "fixter"},
				{name = "Scorcher", costs = 300, description = {}, model = "scorcher"},
				{name = "Pro 1", costs = 2500, description = {}, model = "tribike"},
				{name = "Pro 2", costs = 2600, description = {}, model = "tribike2"},
				{name = "Pro 3", costs = 2900, description = {}, model = "tribike3"},
			}
		},
	}
}

local fakecar = {model = '', car = nil}
local vehshop_locations = {
	{
		entering = {-32.953842163086,-1097.5648193359,27.257934570312},
		inside = {-75.283508300781,-819.25714111328,326.17358398438},
		outside = {-32.953842163086,-1097.5648193359,27.257934570312},
	}
}

local carspawns = {
	[1] =  { ['x'] = -55.35854, ['y'] = -1097.312, ['z'] = 27.302284, ['h'] = 297.27362, ['info'] = ' Car Spot 1' },
	[2] =  { ['x'] = -50.11037, ['y'] = -1083.689, ['z'] = 27.302312, ['h'] = 242.33491, ['info'] = ' Car Spot 2' },
	[3] =  { ['x'] = -47.82233, ['y'] = -1091.208, ['z'] = 27.30231, ['h'] = 196.30415, ['info'] = ' Car Spot 3' },
	[4] =  { ['x'] = -37.54843, ['y'] = -1092.576, ['z'] = 27.30231, ['h'] = 209.72738, ['info'] = ' Car Spot 4' },
	[5] =  { ['x'] = -42.70881, ['y'] = -1100.687, ['z'] = 27.302312, ['h'] = 196.69639, ['info'] = ' Car Spot 5' },
}

local carTable = { 
	[1] = { ["model"] = "dubsta3", ["baseprice"] = 100000, ["commission"] = 15 },
	[2] = { ["model"] = "landstalker", ["baseprice"] = 100000, ["commission"] = 15 },
	[3] = { ["model"] = "bobcatxl", ["baseprice"] = 100000, ["commission"] = 15 },
	[4] = { ["model"] = "surfer", ["baseprice"] = 100000, ["commission"] = 15 },
}

function updateCarTable(model,price,name)
	for i=1, #carTable do
		carTable[currentCarSpawnLocation]["id"] = i
		carTable[currentCarSpawnLocation]["model"] = model
		carTable[currentCarSpawnLocation]["baseprice"] = price
		carTable[currentCarSpawnLocation]["name"] = name
		TriggerServerEvent("np-pdm:CarTablePDM",carTable)
	end
end

local myspawnedvehs = {}

RegisterNetEvent("np-pdm:testdrive")
AddEventHandler("np-pdm:testdrive", function()
	if exports["isPed"]:GroupRank("pdm") >= 1 or #(vector3(-23.69871, -1094.529, 27.305231) - GetEntityCoords(PlayerPedId())) > 50.0 then

	local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent('DoLongHudText', 'Could not locate vehicle!', 2)
		return
	end

	local model = GetEntityModel(veh)
	local veh = GetClosestVehicle(-23.69871, -1094.529, 27.305231, 3.000, 0, 70)

	if not DoesEntityExist(veh) then

		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model,-23.69871, -1094.529, 27.305231,340.06222,true,false)
		local vehplate = "PDM"..math.random(10000,99999)
		SetVehicleNumberPlateText(veh, vehplate)
		local plate = GetVehicleNumberPlateText(veh, vehplate)
		Citizen.Wait(100)
		TriggerEvent("keys:addNew",vehplate, plate)
		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)

		TaskWarpPedIntoVehicle(PlayerPedId(),veh,-1)
		Citizen.Wait(100)
		exports['np-interface']:hideInteraction()
		myspawnedvehs[veh] = true
		end
	else
		TriggerEvent('DoLongHudText', 'A car is on the spawn point.', 2)
	end
end)

RegisterNetEvent("np-pdm:EnableBuy")
AddEventHandler("np-pdm:EnableBuy", function()
	if #(vector3(-23.69871, -1094.529, 27.305231) - GetEntityCoords(PlayerPedId())) > 50.0 and exports["isPed"]:GroupRank("pdm") >= 1 then
		return
	end

	local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent('DoLongHudText', 'Could not locate vehicle!', 2)
		return
	end
	local vehplate = GetVehicleNumberPlateText(veh)
	TriggerServerEvent("np-pdm:BuyEnabledSV",vehplate)
end)

RegisterNetEvent("np-pdm:BuyEnabledCL")
AddEventHandler("np-pdm:BuyEnabledCL", function(addplate)
	buyPlate[addplate] = true
	Citizen.Wait(60000)
	buyPlate[addplate] = nil
end)

RegisterNetEvent("np-pdm:PDMCommission")
AddEventHandler("np-pdm:PDMCommission", function(newAmount)
	if exports["isPed"]:GroupRank("pdm") >= 1 or #(vector3(-23.69871, -1094.529, 27.305231) - GetEntityCoords(PlayerPedId())) > 50.0 then
	for i = 1, #carspawns do
		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			carTable[i]["commission"] = tonumber(newAmount)
			TriggerServerEvent("np-pdm:CarTablePDM",carTable)
			end
		end
	end
end)

RegisterNetEvent("np-pdm:ReturnPDMTTable")
AddEventHandler("np-pdm:ReturnPDMTTable", function(newTable)
	carTable = newTable
	DespawnSaleVehicles()
	SpawnSaleVehicles()
end)

local hasspawned = false
local spawnedvehicles = {}
local vehicles_spawned = false

function BuyMenu()
	for i = 1, #carspawns do

		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			local veh = GetClosestVehicle(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"], 3.000, 0, 70)
			local addplate = GetVehicleNumberPlateText(veh)
			if GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= nil and GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= 0 then
				ClearPedTasksImmediately(PlayerPedId())
			end
			DisableControlAction(0,23)
			if IsControlJustReleased(0,47) and buyPlate[addplate] ~= nil then
				TriggerEvent('DoLongHudText', 'Attempting Purchase!', 1)
				AttemptBuy(i, false)
			end
		end
	end
end

function AttemptBuy(tableid)

	local veh = GetClosestVehicle(carspawns[tableid]["x"],carspawns[tableid]["y"],carspawns[tableid]["z"], 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent('DoLongHudText', 'Could not locate vehicle!', 2)
		return
	end

	local model = carTable[tableid]["model"]
	local commission = carTable[tableid]["commission"]
	local baseprice = carTable[tableid]["baseprice"]
	local name = carTable[tableid]["name"]
	local price = baseprice + (baseprice * commission/ 100)

	currentlocation = vehshop_blips[1]
	TaskWarpPedIntoVehicle(PlayerPedId(),veh,-1)
	TriggerEvent("keys:addNew",veh, plate)
	TriggerServerEvent('np-pdm:ChechMoney',name, model, price)
	commissionbuy = (baseprice * commission / 100)
	Citizen.Wait(100)
	exports['np-interface']:hideInteraction()
end

function OwnerMenu()
	if not vehshop.opened then
		currentCarSpawnLocation = 0
		ownerMenu = false
	end
	for i = 1, #carspawns do
		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			ownerMenu = true
			currentCarSpawnLocation = i
			if IsControlJustReleased(0,38) then
				if vehshop.opened then
					CloseCreator()
				else
					OpenCreator()
				end
			end
		end
	end
end

function DrawPrices()
	for i = 1, #carspawns do
		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 1.5 then
			local commission = carTable[i]["commission"]
			local baseprice = carTable[i]["baseprice"]
			local price = baseprice + (baseprice * commission/100)
			local veh = GetClosestVehicle(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"], 3.000, 0, 70)
			local addplate = GetVehicleNumberPlateText(veh)
			icon = "<center><i class='fas fa-car' style=' color: white;font-size: 25px;text-align:center; padding:5px;'></i></center>"
			if exports["isPed"]:GroupRank("pdm") >= 1 then
				if buyPlate[addplate] ~= nil then
					exports['np-interface']:showInteraction("$" .. math.ceil(price) .. " | Com: %" ..commission.. " | [E] to change | [G] to buy.")
				else
					exports['np-interface']:showInteraction("$" .. math.ceil(price) .. " | Com: %" ..commission.. " | [E] to change")
				end
			else
				if buyPlate[addplate] ~= nil then
					exports['np-interface']:showInteraction("$" .. math.ceil(price) .. " [G] to buy.")
				else
					exports['np-interface']:showInteraction("Buy Price: $" .. math.ceil(price) .. " ")
				end
			end
		elseif #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			exports['np-interface']:hideInteraction()
		end
	end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function SpawnSaleVehicles()
	if not hasspawned then
		TriggerServerEvent("np-pdm:RequestPDMTTable")
		Citizen.Wait(1500)
	end
	DespawnSaleVehicles(true)
	hasspawned = true
	for i = 1, #carTable do
		local model = GetHashKey(carTable[i]["model"])
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model,carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]-1,carspawns[i]["h"],false,false)
		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)
		SetEntityInvincible(veh,true)

		FreezeEntityPosition(veh,true)
		spawnedvehicles[#spawnedvehicles+1] = veh
		SetVehicleNumberPlateText(veh, i .. "CARSALE")
	end
	vehicles_spawned = true
end

function DespawnSaleVehicles(pDontWait)
	if pDontWait == nil and not pDontWait then
		Wait(15000)
	end
	for i = 1, #spawnedvehicles do
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(spawnedvehicles[i]))
	end
	vehicles_spawned = false
end

Controlkey = {["generalUse"] = {38,"E"},["generalUseSecondary"] = {191,"Enter"}}
RegisterNetEvent('event:control:update')
AddEventHandler('event:control:update', function(table)
	Controlkey["generalUse"] = table["generalUse"]
	Controlkey["generalUseSecondary"] = table["generalUseSecondary"]
end)

--[[Functions]]--

function LocalPed()
	return PlayerPedId()
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

function ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			-- 60 58 137
			SetBlipSprite(blip,326)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Premium Deluxe Motorsport')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			SetBlipScale(blip, 0.7)
			SetBlipColour(blip, 3)
			vehshop_blips[#vehshop_blips+1]= {blip = blip, pos = loc}
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(1)
				local inrange = false

				if #(vector3(-23.69871, -1094.529, 27.305231) - GetEntityCoords(LocalPed())) < 5.0 then
					local veh = GetVehiclePedIsUsing(LocalPed())
					if myspawnedvehs[veh] ~= nil then
						DrawText3D(-23.69871, -1094.529, 27.305231,"["..Controlkey["generalUse"][2].."] Return Vehicle")
						if IsControlJustReleased(0,Controlkey["generalUse"][1]) then
							Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
						end
					end
				end

				for i,b in ipairs(vehshop_blips) do
					if #(vector3(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3]) - GetEntityCoords(LocalPed())) < 100 then
						currentlocation = b
						if not vehicles_spawned then
--							print("Spawning Display Vehicles?")
							SpawnSaleVehicles()
						end
						if #(vector3(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3]) - GetEntityCoords(LocalPed())) < 35 then
							DrawPrices()
						end

						if exports["isPed"]:GroupRank("pdm") >= 1 then
							OwnerMenu()
						end
						BuyMenu()
					else
						if vehicles_spawned then
--							print("Despawning Display ?")
							DespawnSaleVehicles()
						end
						Citizen.Wait(1000)
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

function f(n)
	return n + 0.0001
end

function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function OpenCreator()
	boughtcar = false
	if ownerMenu then
		vehshop = vehshopOwner
	else
		vehshop = vehshopDefault
	end

	local ped = LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	exports['np-interface']:hideInteraction()
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end

function CloseCreator(name, veh, price, plate)
	Citizen.CreateThread(function()
		local ped = LocalPed()
		local pPrice = price
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			local name = name	
			local vehicle = veh
			local price = price		
			local veh = GetVehiclePedIsUsing(ped)
			local model = GetEntityModel(veh)
			local colors = table.pack(GetVehicleColours(veh))
			local extra_colors = table.pack(GetVehicleExtraColours(veh))

			local mods = {}
			for i = 0,24 do
				mods[i] = GetVehicleMod(veh,i)
			end
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
			local pos = currentlocation.pos.outside

			FreezeEntityPosition(ped,false)
			RequestModel(model)
			while not HasModelLoaded(model) do
				Citizen.Wait(0)
			end
			personalvehicle = CreateVehicle(model,-23.69871, -1094.529, 27.305231,true,false)
			SetEntityHeading(personalvehicle, 340.06222)
			SetModelAsNoLongerNeeded(model)

			if name == "rumpo" then
				SetVehicleLivery(personalvehicle,0)
			end

			if name == "taxi" then
				SetVehicleExtra(personalvehicle, 8, 0)
				SetVehicleExtra(personalvehicle, 9, 0)
				SetVehicleExtra(personalvehicle, 5, 1)
			end

			for i,mod in pairs(mods) do
				SetVehicleModKit(personalvehicle,0)
				SetVehicleMod(personalvehicle,i,mod)
			end

			SetVehicleOnGroundProperly(personalvehicle)
			SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
			local id = NetworkGetNetworkIdFromEntity(personalvehicle)
			SetNetworkIdCanMigrate(id, true)
			Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
			SetVehicleColours(personalvehicle,colors[1],colors[2])
			SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
			TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
			SetEntityVisible(ped,true)			
			local primarycolor = colors[1]
			local secondarycolor = colors[2]	
			local pearlescentcolor = extra_colors[1]
			local wheelcolor = extra_colors[2]
			local VehicleProps = exports['np-base']:FetchVehProps(personalvehicle)
			local model = GetEntityModel(personalvehicle)
			local vehname = GetDisplayNameFromVehicleModel(model)
			SetVehicleNumberPlateText(personalvehicle, plate)
			TriggerEvent("keys:addNew",personalvehicle, plate)
			TriggerServerEvent('np-pdm:BuyVehicle', plate, name, vehicle, price, VehicleProps)
			DespawnSaleVehicles()
			SpawnSaleVehicles()
			Citizen.Wait(100)
			exports['np-interface']:hideInteraction()
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

RegisterNetEvent("np-pdm:FailedPurchase")
AddEventHandler("np-pdm:FailedPurchase", function()
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	TaskLeaveVehicle(PlayerPedId(),veh,0)
end)


function drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,255,55,55,220)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,250)
	DrawText(0.255, 0.254)
end

function drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.2, 0.2)
	--SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(250,250,250, 255)
	end

	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 + 0.025, y - menu.height/3 + 0.0002)

	if selected then
		DrawRect(x + menu.width/2 + 0.025, y,menu.width / 3,menu.height,255,255,255,255)
	else
		DrawRect(x + menu.width/2 + 0.025, y,menu.width / 3,menu.height,255,55,55,220)
	end
end

function drawMenuTitle(txt,x,y)
	local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)

	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,250)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function ButtonSelected(button)
	local ped = PlayerPedId()
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Vehicles" then
			OpenMenu('vehicles')
		elseif btn == "Motorcycles" then
			OpenMenu('motorcycles')
		elseif btn == "Cycles" then
			OpenMenu('cycles')
		end
	elseif this == "vehicles" then
		if btn == "B-Class" then
			OpenMenu('b-class')
		elseif btn == "A-Class" then
			OpenMenu('a-class')
		elseif btn == "Job Vehicles" then
			OpenMenu('jobvehicles')
		elseif btn == "S-Class" then
			OpenMenu('s-class')
		elseif btn == "C-Class" then
			OpenMenu("c-class")
		elseif btn == "casino" then
			OpenMenu('casino')
		elseif btn == "D-Class" then
			OpenMenu('d-class')
		elseif btn == "Off-Road" then
			OpenMenu('offroad')
		elseif btn == "SUVs" then
			OpenMenu('suvs')
		elseif btn == "Vans" then
			OpenMenu('vans')
		end
	elseif this == "jobvehicles" or this == "s-class" or this == "a-class" or this == "b-class" or this == "c-class" or this == "casino" or this == "d-class" or this == "offroad" or this == "suvs" or this == "vans" or this == "industrial" or this == "cycles" or this == "motorcycles" then
		if ownerMenu then
			updateCarTable(button.model,button.costs,button.name)
		else
			TriggerServerEvent('np-pdm:ChechMoney',button.name, button.model, button.costs)
		end
	end
end

function OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "vehicles" then
		vehshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end

function Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		CloseCreator()
	elseif vehshop.currentmenu == "jobvehicles" or vehshop.currentmenu == "s-class" or vehshop.currentmenu == "a-class" or vehshop.currentmenu == "b-class" or vehshop.currentmenu == "c-class" or vehshop.currentmenu == "casino" or vehshop.currentmenu == "d-class" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		OpenMenu(vehshop.lastmenu)
	else
		OpenMenu(vehshop.lastmenu)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ( IsControlJustPressed(1,Controlkey["generalUse"][1]) or IsControlJustPressed(1, Controlkey["generalUseSecondary"][1]) ) and IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				CloseCreator()
			else
				OpenCreator()
			end
		end
		if vehshop.opened then

			local ped = LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			local y = vehshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			for i,button in pairs(menu.buttons) do
				--local br = button.rank ~= nil and button.rank or 0
				if exports["isPed"]:GroupRank("pdm") >= 1 and i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,vehshop.menu.x,y,selected)

					if button.costs ~= nil then
						drawMenuRight("$"..button.costs,vehshop.menu.x,y,selected)
					end

					y = y + 0.04
					if vehshop.currentmenu == "jobvehicles" or vehshop.currentmenu == "s-class" or vehshop.currentmenu == "a-class" or vehshop.currentmenu == "b-class" or vehshop.currentmenu == "c-class" or vehshop.currentmenu == "casino" or vehshop.currentmenu == "d-class" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								while not HasModelLoaded(hash) do
									Citizen.Wait(0)


								end
								local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
								SetModelAsNoLongerNeeded(hash)
								local timer = 9000
								while not DoesEntityExist(veh) and timer > 0 do
									timer = timer - 1
									Citizen.Wait(1)
								end
								TriggerEvent("vehsearch:disable",veh)

								FreezeEntityPosition(veh,true)
								SetEntityInvincible(veh,true)
								SetVehicleDoorsLocked(veh,4)
								--SetEntityCollision(veh,false,false)
								TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
								for i = 0,24 do
									SetVehicleModKit(veh,0)
									RemoveVehicleMod(veh,i)
								end
								fakecar = { model = button.model, car = veh}
								local topspeed = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveMaxFlatVel') / 2)
								local handling = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock') * 2)
								local braking = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce') * 100)
								local accel = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce') * 100) 
								if button.model == "rumpo" then
									SetVehicleLivery(veh,2)
								end
							end
						end
					end
					if selected and ( IsControlJustPressed(1,Controlkey["generalUse"][1]) or IsControlJustPressed(1, Controlkey["generalUseSecondary"][1])  ) then
						ButtonSelected(button)
					end
				end
			end

			if DoesEntityExist(fakecar.car) then
				if vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then
					daz = 6.0
					if fakecar.model == "Chimera" then
						daz = 8.0
					end
					if fakecar.model == "bmx" then
						daz = 8.0
					end
					 x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 3.0, -1.5, daz))
		        	Citizen.InvokeNative(0x87D51D72255D4E78,scaleform, x,y,z, 0.0, 180.0, 100.0, 1.0, 1.0, 1.0, 7.0, 7.0, 7.0, 0)
				else
		       		x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 3.0, -1.5, 10.0))
		       		Citizen.InvokeNative(0x87D51D72255D4E78,scaleform, x,y,z, 0.0, 180.0, 100.0, 1.0, 1.0, 1.0, 10.0, 10.0, 10.0, 0)		
				end
				TaskWarpPedIntoVehicle(LocalPed(),fakecar.car,-1)
		    end

		end
		if vehshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end
	end
end)

AddEventHandler('FinishMoneyCheckForVehpdm', function(name, vehicle, price, plate)
	local name = name
	local vehicle = vehicle
	local price = price
	boughtcar = true
	CloseCreator(name, vehicle, price, plate)
	TriggerServerEvent("server:GroupPayment","pdm",commissionbuy)
end)

local firstspawn = 0

ShowVehshopBlips(true)
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		--326 car blip 227 225
		ShowVehshopBlips(true)
		firstspawn = 1
	end
end)

AddEventHandler('pdmvehshop:spawnVehicle', function(v)
	local car = GetHashKey(v)
	local playerPed = PlayerPedId()
	if playerPed and playerPed ~= -1 then
		RequestModel(car)
		while not HasModelLoaded(car) do
			Citizen.Wait(0)
		end
		local playerCoords = GetEntityCoords(playerPed)
		veh = CreateVehicle(car, playerCoords, 0.0, true, false)
		SetModelAsNoLongerNeeded(car)
		TaskWarpPedIntoVehicle(playerPed, veh, -1)
		SetEntityInvincible(veh, true)
	end
end)

RegisterCommand('commission', function(source, args, raw)
	if exports["isPed"]:GroupRank("pdm") >= 1 then
		local amount = args[1]
		if tonumber(amount) > 0 and tonumber(amount) <= 60 then
			TriggerEvent('np-pdm:PDMCommission', amount)
		else
			TriggerEvent('DoLongHudText', 'Invalid amount "/commision [amount]', 2)
		end
	else
		TriggerEvent('DoLongHudText', 'You dont have permissions for this!', 2)
	end
end)

RegisterCommand('testdrive', function(source, args, raw)
	if exports["isPed"]:GroupRank("pdm") >= 1 then
		TriggerEvent('np-pdm:testdrive')
	else
		TriggerEvent('DoLongHudText', 'You dont have permissions for this!', 2)
	end
end)

RegisterCommand('enableBuy', function(source, args, raw)
	if exports["isPed"]:GroupRank("pdm") >= 1 then
		TriggerEvent('np-pdm:EnableBuy')
	else
		TriggerEvent('DoLongHudText', 'You dont have permissions for this!', 2)
	end
end)

RegisterNetEvent('np-pdm:elevator_roof')
AddEventHandler('np-pdm:elevator_roof', function()
	if exports["isPed"]:GroupRank("pdm") >= 1 then
		local FinishedPdm = exports['np-taskbar']:taskBar(5000, 'Calling Elevator')
		if FinishedPdm == 100 then
			SetEntityHeading(GetPlayerPed(-1), 70.700042)
			SetEntityCoords(PlayerPedId(), -22.94916, -1101.914, 35.919536)
		end
	else
		TriggerEvent('DoLongHudText', 'Insuficcient Permissions.', 2)
	end
end)

RegisterNetEvent('np-pdm:elevator_bottom')
AddEventHandler('np-pdm:elevator_bottom', function()
	if exports["isPed"]:GroupRank("pdm") >= 1 then
		local FinishedPdm1 = exports['np-taskbar']:taskBar(5000, 'Calling Elevator')
		if FinishedPdm1 == 100 then
			SetEntityHeading(GetPlayerPed(-1), 63.833606)
			SetEntityCoords(PlayerPedId(), -28.97126, -1094.361, 26.442609)
		else
			TriggerEvent('DoLongHudText', 'Insuficcient Permissions,', 2)
		end
	end
end)