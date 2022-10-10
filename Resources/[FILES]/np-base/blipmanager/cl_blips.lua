local blips = {
    {id = "courthouse", name = "Los Santos Courthouse", scale = 0.7, color = 5, sprite = 58, x=-552.2664, y=-191.6409, z=38.219322},
    -- {id = "Tuner Shop", name = "Tuner Shop", scale = 0.7, color = 1, sprite = 127, x=141.23828125, y=-3031.89343261719, z=7.543106079102},
    {id = "Burger Shot", name = "Burger Shot", scale = 0.7, color = 1, sprite = 106, x=-1191.6701660156, y=-889.74584960938, z= 14.508341789246},
    {id = "police1", name = "LSPD HQ", scale = 0.7, color = 3, sprite = 60, x = 425.130, y = -979.558, z = 30.711},
    {id = "police2", name= "BCSO HQ", scale = 0.7, color = 52, sprite=60, x=-450.063201904297, y=6016.5751953125, z=31.7163734436035},
    {id = "police3", name= "SASP HQ", scale = 0.7, color = 16, sprite=60, x=373.1340637207, y=-1602.3824462891, z=30.0380859375},
    -- {id = "police4", name = "Police Air HQ", scale = 0.7, color = 3, sprite = 43, x = 449.359, y = -980.727, z = 42.60},
    {id = "police5", name = "Prison", scale = 0.7, color = 76, sprite = 237, x = 1679.049, y = 2513.711, z = 45.565},
    {id = "cloth1", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = 425.236, y=-806.008, z=29.491},
    {id = "cloth2", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = -162.658, y=-303.397, z=39.733},
    {id = "cloth3", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = 75.950, y=-1392.891, z=29.376},
    {id = "cloth4", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = -822.194, y=-1074.134, z=11.328},
    {id = "cloth5", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = -1450.711, y=-236.83, z=49.809},
    {id = "cloth6", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = 4.254, y=6512.813, z=31.877},
    {id = "cloth7", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = 615.180, y=2762.933, z=44.088},
    {id = "cloth8", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = 1196.785, y=2709.558, z=38.222},
    {id = "cloth9", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = -3171.453, y=1043.857, z=20.863},
    {id = "cloth10", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = -1100.959, y=2710.211, z=19.107},
    {id = "cloth11", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = -1192.9453125, y=-772.62481689453, z=17.3254737854},
    {id = "cloth12", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = -707.33416748047, y=-155.07914733887, z=37.415187835693},
    {id = "cloth13", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = 1683.45667, y=4823.17725, z=42.1631294},
    {id = "cloth14", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = -712.215881, y=-155.352982, z=37.4151268},
    {id = "cloth15", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x =121.76, y=-224.6, z=54.56},
    {id = "cloth16", name = "Clothing", scale = 0.7, color = 0, sprite = 73, x = -1207.5267333984, y=-1456.9530029297, z=4.3763856887817},
    {id = "hosp1", name = "Hospital", scale = 0.7, color = 2, sprite = 61, x = 357.43, y= -593.36, z= 28.79},
    -- {id = "redcircle", name = "Red Circle", scale = 0.7, color = 1, sprite = 143, x = -309.09, y= 217.7, z= 87.79},
    {id = "artgallery", name = "Art Gallery", scale = 0.7, color = 3, sprite = 617, x = -424.4, y= 27.3, z= 46.79},
    {id = "weedshop", name = "Cosmic Canabis", scale = 0.7, color = 2, sprite = 140, x = 195.2, y= -242.5, z= 54.09}, 
    -- {id = "uwucafe", name = "UwU Cafe", scale = 0.7, color = 23, sprite = 304, x = -579.5027, y= -1061.327, z= 22.3519},
    -- {id = "maldinis", name = "Maldinis", scale = 0.7, color = 51, sprite = 124, x = 806.49072, y= -752.8955, z= 26.780834},
    {id = "hayes", name = "Hayes Autos", scale = 0.7, color = 5, sprite = 118, x = -1423.774, y= -449.2006, z= 35.903717},    
    {id = "warriors_table", name = "Warriors Table", scale = 0.6, color = 40, sprite = 58, x = -164.2093, y= 293.12942, z= 103.72494},

}

AddEventHandler("np-base:playerSessionStarted", function()
    Citizen.CreateThread(function()
        for k,v in ipairs(blips) do
            Void.BlipManager:CreateBlip(v.id, v)
        end
    end)
end)


