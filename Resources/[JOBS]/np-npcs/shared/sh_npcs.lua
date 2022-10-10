Generic = {}
Generic.NPCS = {}

Generic.SpawnLocations = {
  -- vector4(620.48, 2752.6, 42.09 - 1.0, 359.94)
  vector4(-1605.03,-994.58,7.53 - 1.0,136.79),
}

Generic.ShopKeeperLocations = {
  vector4(-3037.773, 584.8989, 6.97, 30.0),
  vector4(1960.64, 3739.03, 31.50, 321.36),
  vector4(1393.84,3606.8,33.99,172.8),
  vector4(549.01,2672.44,41.16,122.33),
  vector4(2558.39,380.74,107.63,21.54),
  vector4(-1819.57,793.59,137.09,134.3),
  vector4(-1221.26,-907.92,11.3,54.44),
  vector4(-706.12,-914.56,18.22,94.66),
  vector4(24.47,-1348.47,28.5,298.26),
  vector4(-47.36,-1758.68,28.43,50.84),
  vector4(1164.95,-323.7,68.21,101.73),
  vector4(372.19,325.74,102.57,276.17),
  vector4(2678.63,3278.86,54.25,344.4),
  vector4(1727.3,6414.27,34.04,259.1),
  vector4(-160.56,6320.76,30.59,319.99),
  vector4(1165.29,2710.85,37.16,178.47),
  vector4(1697.23,4923.42,41.07,327.94),
  vector4(159.84,6640.89,30.7,242.18),
  vector4(-1486.81,-377.38,39.17,143.01),
  vector4(-3241.1,999.93,11.84,10.23),
  vector4(-2966.38,391.79,14.05,99.55),
  vector4(1134.29,-983.39,45.42,292.7)
}

Generic.SportsShopLocations = {
  vector4(-703.37164306641, -1179.4047851562, 9.609468460083, 122.92682647705),
  vector4(-23.520534515381, -106.42227935791, 56.061752319336, 154.0001373291)
}

Generic.DigitalShopLocations = {
  vector4(1134.5090332031, -468.16110229492, 65.485946655273, 165.39506530762)
}

Generic.HuntingShopLocations = {
  vector4(-679.46, 5839.32, 16.34, 218.69),
}

Generic.WeaponShopLocations = {
  vector4(18.36,-1107.82,28.8,161.03), 
  vector4(1697.02,3757.72,33.71,133.37), 
  vector4(813.26,-2155.71,28.62,358.46), 
  vector4(247.32,-51.28,68.95,341.86), 
  vector4(841.21,-1028.9,27.2,267.83), 
  vector4(-326.75,6081.95,30.46,128.64), 
  vector4(-659.13,-939.73,20.83,86.52), 
  vector4(-1310.05,-394.17,35.7,344.36), 
  vector4(-1112.51,2697.33,17.58,136.9), 
  vector4(2564.79,298.1,107.74,269.22), 
  vector4(-3167.53,1087.59,19.84,154.35), 
}

Generic.ToolShopLocations = {
  vector4(44.838947296143, -1748.5364990234, 28.549386978149, 35.3),
  vector4(2749.2309570313, 3472.3308105469, 54.679393768311, 244.4),
}

Generic.LaptopVendors = {
  vector4(-1358.93, -759.38, 21.32, 346.47),
}

Generic.CasinoLocations = {
  {
    coords = vector4(966.29,47.52,70.72,145.85), -- coat check
    flags = { "isCasinoMembershipGiver" },
  },
  {
    coords = vector4(1030.35,71.56,68.88,238.32), -- rest room 1
  },
  {
    coords = vector4(1039.24,33.85,68.88,321.23), -- rest room 2
  },
  {
    coords = vector4(963.25,19.07,70.48,276.73), -- jewel store
  },
  {
    coords = vector4(990.79,30.95,70.48,58.76), -- casino chips
    flags = { "isCasinoChipSeller" },
  },
  {
    coords = vector4(988.61,42.97,70.28,201.73), -- wheel of fortune
    npcId = "casino_wheel_spin_npc",
  },
  {
    coords = vector4(978.4,25.39,70.48,43.67), -- drinks bar
    flags = { "isCasinoDrinkGiver" },
  },
}

-- Start Of All NPC Interacts --

-- Recycling --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "recycle_exchange",
  name = "Recycle Exchange",
  pedType = 4,
  model = "s_m_y_garbage",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(-355.76, -1556.04, 24.18),
    heading = 179.96,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isRecycleExchange'] = true
  }
}

-- Laptop Guy --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "laptop_1",
  name = "laptop vendor",
  pedType = 2,
  model = "a_m_y_stwhi_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-1358.93, -759.38, 21.32 - 1.0), --   -1358.93, -759.38, 21.32, 346.47
    heading = 346.47,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
    --isLaptopInst = true,
  },
}

-- Drug Dealer --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "druggy",
  name = "",
  pedType = 2,
  model = "a_m_m_afriamer_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-1211.817, -402.1, 38.099384 - 1.0),
    heading = 299.82263,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

-- Cocaine Run --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "cocaine_run",
  name = "",
  pedType = 2,
  model = "a_m_m_mlcrisis_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(281.52877, 6789.2841, 15.865985 - 1.0),
    heading = 256.48941,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

-- Car Rental --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "vehicle_rental",
  name = "",
  pedType = 2,
  model = "a_m_y_smartcaspat_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(110.59, -1090.72, 29.31 - 1.0),
    heading = 17.39,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

-- Car Impound --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "car_impound",
  name = "",
  pedType = 2,
  model = "a_m_m_genfat_02",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-193.2518, -1162.343, 23.671382 - 1.0),
    heading = 270,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

-- Chop Shop --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "chop_shop",
  name = "",
  pedType = 2,
  model = "csb_brucie2",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-499.0379, -1713.959, 19.899194 - 1.0),
    heading = 142.06584,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "zyloz_fleeca",
  name = "",
  pedType = 2,
  model = "a_m_m_genfat_02",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(236.53715, -3311.493, 5.7902712 - 1.0),
    heading = 191.67613,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

-- House Robberies --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "void_house_robberies",
  name = "",
  pedType = 2,
  model = "a_m_m_beach_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(197.38322, -1493.481, 29.319213 - 1.0),
    heading = 133.78881,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "void_house_robberies_sell",
  name = "",
  pedType = 2,
  model = "s_m_y_ammucity_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-277.7816, 2205.3457, 130.3946 - 1.0),
    heading = 69.446563,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

-- Fishing --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "evan_fishing",
  name = "",
  pedType = 2,
  model = "a_m_m_fatlatin_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(1530.3297119141, 3778.4174804688, 34.503295898438 - 1.0),
    heading = 226.77166748047,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

-- Post OP --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "evan_post_op",
  name = "",
  pedType = 2,
  model = "s_m_m_postal_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-417.9560546875, -2792.6110839844, 5.993408203125 - 1.0),
    heading = 226.7716674804,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

-- Hunting --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "evan_hunting",
  name = "",
  pedType = 2,
  model = "cs_hunter",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-679.5197, 5839.1289, 17.331441 - 1.0),
    heading = 223.19871,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "pd_heli",
  name = "",
  pedType = 2,
  model = "S_M_M_Pilot_02",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(441.92965698242, -974.62414550781, 43.686401367188 - 1.0),
    heading = 232.44094848633,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}
Generic.NPCS[#Generic.NPCS + 1] = {
  id = "sheriff_heli",
  name = "",
  pedType = 2,
  model = "S_M_Y_Pilot_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(1845.3171, 3708.5532, 33.974605 - 1.0),
    heading = 232.44094848633,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

-- EMS Heli --

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "ems_heli",
  name = "",
  pedType = 2,
  model = "s_m_y_dockwork_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(351.24395751953, -575.05053710938, 74.15087890625 - 1.0),
    heading = 192.75592041016,
},
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true },
  },
  flags = {
    ['isNPC'] = true,
  },
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "recycle_employer",
  name = "Recycle Employer",
  pedType = 4,
  model = "s_m_y_garbage",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(-353.90753173828, -1545.7307128906, 26.72091293335),
    heading = 277.81228637695,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true,
      ['isRecycleExchange'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "trucker_employer",
  name = "24/7 Trucker Employer",
  pedType = 4,
  model = "s_m_y_ammucity_01",
  networked = false,
  distance = 150.0,
  position = {
    coords = vector3(919.92041015625, -1256.6762695312, 24.519781112671),
    heading = 31.363286972046,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "fish_employer",
  name = "Fisherman",
  pedType = 4,
  model = "a_m_m_farmer_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-335.83563232422, 6106.2534179688, 30.448036193848),
    heading = 230.94131469727,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "waterpower_employer",
  name = "Water & Power Employer",
  pedType = 4,
  model = "s_m_y_construct_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(442.72363, -1969.699, 23.40176),
    heading = 313.58587,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "fishing_sales",
  name = "Sell Fish",
  pedType = 4,
  model = "ig_chef",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-1846.514, -1191.102, 13.322576),
    heading = 108.52353,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "oxy_runs",
  name = "Start Oxy Run",
  pedType = 4,
  model = "ig_chef",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-3169.195, 1093.5676, 20.858024 -1.0),
    heading = 70.335464,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "gang_ped",
  name = "Gang Ped",
  pedType = 4,
  model = "cs_fbisuit_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-12.18861, -598.7109, 78.430221),
    heading = 320.56506,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "ped_prison",
  name = "Jail Jobs",
  pedType = 4,
  model = "csb_prolsec",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(1775.1687, 2553.4843, 44.552841),
    heading = 122.26394,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "ped_weed",
  name = "Weed Deliveries",
  pedType = 4,
  model = "csb_ortega",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(226.70031, -1776.401, 27.961931),
    heading = 310.8106,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "ped_weed_plants",
  name = "Weed Plants",
  pedType = 4,
  model = "csb_ortega",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(-289.9468, 2542.8293, 75.41542 -1.0),
    heading = 357.38079,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}

Generic.NPCS[#Generic.NPCS + 1] = {
  id = "ped_weed_vouched",
  name = "Weed Plants",
  pedType = 4,
  model = "a_f_m_eastsa_01",
  networked = false,
  distance = 50.0,
  position = {
    coords = vector3(711.27551, 4185.4287, 41.082633 -1.0),
    heading = 86.007751,
    random = false
  },
  appearance = nil,
  settings = {
      { mode = "invincible", active = true },
      { mode = "ignore", active = true },
      { mode = "freeze", active = true }
  },
  flags = {
      ['isNPC'] = true
  }
}