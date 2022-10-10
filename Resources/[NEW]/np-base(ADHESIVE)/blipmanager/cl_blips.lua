local blips = {
    {id = "lsch", name = "Los Santos City Hall", scale = 0.7, color = 25, sprite = 438, x=-547.36, y=-200.0, z=38.22},
    {id = "casino1", name = "Casino Resort", color = 5, sprite = 207, x = 925.329, y = 46.152, z = 80.908 },
    {id = "hosp3", name = "Hospital", scale = 0.75, color = 2, sprite = 61, x = -449.67, y= -340.83, z= 34.50},
    {id = "hosp4", name = "Hospital", scale = 0.75, color = 2, sprite = 61, x = 357.43, y= -593.36, z= 28.79},
    {id = "hosp5", name = "Hospital", scale = 0.75, color = 2, sprite = 61, x = 295.83, y= -1446.94, z= 29.97},
    {id = "hosp6", name = "Hospital", scale = 0.75, color = 2, sprite = 61, x = -676.98, y= 310.68, z= 83.08},
    {id = "hosp7", name = "Hospital", scale = 0.75, color = 2, sprite = 61, x = 1151.21, y= -1529.62, z= 35.37},
    {id = "hosp8", name = "Hospital", scale = 0.75, color = 2, sprite = 61, x = -874.64, y= -307.71, z= 39.58},

    {id = "police1", name = "Police Department HQ", scale = 0.8, color = 3, sprite = 60, x = 425.130, y = -979.558, z = 30.711},
    {id = "police2", name= "Sheriff Department HQ", scale = 0.8, color = 52, sprite=60, x=-450.063201904297, y=6016.5751953125, z=31.7163734436035},
    {id = "police3", name= "State Police HQ", scale = 0.8, color = 16, sprite=60, x=373.1340637207, y=-1602.3824462891, z=30.0380859375},
    {id = "police4", name = "Police Air HQ", scale = 0.8, color = 3, sprite = 43, x = 449.359, y = -980.727, z = 42.60},
    {id = "police5", name = "Prison", scale = 0.8, color = 76, sprite = 237, x = 1679.049, y = 2513.711, z = 45.565},

    {id = "cloth1", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = 425.236, y=-806.008, z=29.491},
    {id = "cloth2", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = -162.658, y=-303.397, z=39.733},
    {id = "cloth3", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = 75.950, y=-1392.891, z=29.376},
    {id = "cloth4", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = -822.194, y=-1074.134, z=11.328},
    {id = "cloth5", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = -1450.711, y=-236.83, z=49.809},
    {id = "cloth6", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = 4.254, y=6512.813, z=31.877},
    {id = "cloth7", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = 615.180, y=2762.933, z=44.088},
    {id = "cloth8", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = 1196.785, y=2709.558, z=38.222},
    {id = "cloth9", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = -3171.453, y=1043.857, z=20.863},
    {id = "cloth10", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = -1100.959, y=2710.211, z=19.107},
    {id = "cloth11", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = -1192.9453125, y=-772.62481689453, z=17.3254737854},
    {id = "cloth12", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = -707.33416748047, y=-155.07914733887, z=37.415187835693},
    {id = "cloth13", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = 1683.45667, y=4823.17725, z=42.1631294},
    {id = "cloth14", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x =121.76, y=-224.6, z=54.56},
    {id = "cloth15", name = "Clothing", scale = 0.6, color = 3, sprite = 73, x = 1950.24, y = 3766.1, z = 32.6},

    {id = "bar1", name = "Bahama Mamas", sprite = 93, x = -1388.53430175781, y=-586.615295410156, z=29.2186660766602},
    {id = "bar2", name = "Tequilala", sprite = 93, x =-564.68, y= 276.15, z =83.12 },

    {id = "ttruckjob", name = "Impound Lot", color = 17, sprite = 68, x = -189.88, y = -1163.99, z = 23.68},
    {id = "ottosauto", name = "Otto's Auto", color = 17, sprite = 227, x = 834.9, y = -821.57, z = 26.35},
    {id = "ironhog", name = "Iron Hog", color = 1, sprite = 226, x = 1769.51, y = 3327.99, z = 40.57},

    {id = "postop", name = "Post OP", scale = 0.7, color = 17, sprite = 616, x = -416.05712890625, y = -2793.1516113281, z = 5.993408203125},
    {id = "fishingsales", name = "Fish Sales", scale = 0.7, color = 3, sprite = 304, x= -371.57, y= 277.15, z= 86.42},
    {id = "fishingspot", name = "Fishing Spot", scale = 0.7, color = 47, sprite = 58, x= -335.38021850586, y= 6106.0219726562, z= 31.436645507812},
    {id = "bobcatsecurity", name = "Bobcat Security", scale = 0.7, color = 2, sprite = 498, x=880.8951, y=-2258.308, z=32.53486},
    {id = "airshop", name = "Aircraft Sales & Rentals", scale = 0.7, color = 2, sprite = 307, x=-1621.42, y=-3152.99, z=14.0},
    {id = "veh_rentals", name = "Vespucci Vehicle Rentals", scale = 0.5, color = 2, sprite = 326, x=108.77, y=-1088.88, z=29.3},
    {id = "veh_rentals2", name = "Paleto Vehicle Rentals", scale = 0.5, color = 2, sprite = 326, x=-247.94, y=6205.98, z=30.82},
    {id = "flight_school", name = "Flight School - AirX", scale = 0.6, color = 3, sprite = 307, x=-1875.02, y=2811.66, z=32.81},
    {id = "galleryvlc", name = "The Gallery", scale = 0.6, color = 18, sprite = 617, x=-424.47, y=22.29, z=46.27},
    {id = "bobmulet", name = "Bob Mulet", scale = 0.6, color = 9, sprite = 71, x=-817.28, y=-184.71, z=37.57},

    {id = "Tuner", name = "Tuner Shop", scale = 0.7, color = 7, sprite = 326, x=155.79, y = -3031.23, z = 7.04},
    {id = "Bicycles", name = "Bicycle Shop", scale = 0.7, color = 7, sprite = 226, x=-1100.69, y= -1702.88, z= 4.38},
    {id = "tattoos", name = "Blazing Tattoo", scale = 0.5, color = 1, sprite = 75, x=322.139, y=180.467, z=103.587},
    {id = 'HayesAutos', name = 'Hayes Autos Repairs', scale = 0.7, color = 12, sprite = 478, x = -1416.86, y = -447.97, z = 35.91},
    {id = "burgies", name = "Burger Shot", scale = 0.7, color = 8, sprite = 106, x = -1199.61, y = -899.79, z = 14.0},
    {id = "digitalden", name = "Digital Den", scale = 0.8, color = 26, sprite = 619, x=1136.88, y=-474.85, z=66.44},
    {id = "dwfm", name = "Farmers Market", scale = 0.6, color = 7, sprite = 479, x=-1696.68, y=-1059.89, z=13.02},
    {id = "deanworld", name = "Dean World", scale = 0.6, color = 59, sprite = 266, x=-1591.7, y=-1063.21, z=13.02},
    {id = "newscenter", name = "LS News Center", scale = 0.8, color = 5, sprite = 135, x=-582.95, y=-930.09, z=36.84},
    {id = "scrapyard", name = "Scrapyard", color = 5, sprite = 566, x =-455.73, y = -1707.39, z = 18.8},

    {id = "weedshop", name = "Cosmic Canabis", scale = 0.6, color = 2, sprite = 140, x = 195.2, y= -242.5, z= 54.09},
    {id = "uwucafe", name = "UwU Cafe", scale = 0.9, color = 23, sprite = 621, x = -579.5027, y= -1061.327, z= 22.3519},

    {id = "asp", name = "Alta Street Apartments", scale = 0.9, color = 3, sprite = 475, x = -267.45495605469, y= -960.69891357422, z= 31.234375},
    {id = "mine", name = "Mine", scale = 0.7, color = 3, sprite = 617, x = -595.25274658203, y= 2086.6682128906, z= 131.37292480469},
    {id = "waterandpower", name = "Water & Power", scale = 0.8, color = 46, sprite = 354, x = 448.74725341797, y= -1970.3472900391, z= 22.961181640625},
    {id = "garbagedepo", name = "Garbage Depo", scale = 0.8, color = 5, sprite = 318, x = -351.79779052734, y= -1544.2681884766, z= 27.712768554688},
    {id = "diving", name = "Diving", scale = 0.7, color = 29, sprite = 356, x = -1613.079, y= 5262.372, z= 3.974097},
    {id = "autoexotic", name = "Auto Exotic", scale = 0.8, color = 3, sprite = 566, x = 542.75, y = -183.1, z = 54.49},

}

AddEventHandler("np-base:playerSessionStarted", function()
    Citizen.CreateThread(function()
        for k,v in ipairs(blips) do
            Void.BlipManager:CreateBlip(v.id, v)
        end
    end)
end)


