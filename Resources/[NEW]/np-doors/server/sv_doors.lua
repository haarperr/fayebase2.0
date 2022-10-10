--[[

DOOR CONFIG SETUP AND INSTRUCTIONS

id = same key as table index
active = register door with system (do not delete doors, only set active to false)

EXAMPLE:
    {
      info = "",
      id = 173,
      coords = vector3(-770.62261962891, -240.0270690918, 37.545078277588),
      model = 1501451068,
      lock = true,
      desc = "fastlane",
      access = {
        job = {
          ["PD"] = true,
          ["DR"] = true,
        },
        business = {
          ["dojo"] = true,
          ["fastlane"] = true,
        },
      },
      forceUnlocked = false,
    },

access = job -> PD = Police, DOC, Judge, DA
access = job -> DR = Medic, Doctor, Therapist
access = business -> "fastlane" = business.code in the database, with employee property_keys access permission
access = business -> "dojo" = business.code in the database, with employee property_keys access permission

]]--

DOOR_CONFIG = {
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison main gate",
    model = 741314661,
    lock = true,
    active = true,
    keyFob = true,
    id = 1,
    coords = vector3(1844.998046875, 2604.8029785156, 44.637271881104),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison main gate inner",
    model = 741314661,
    lock = true,
    active = true,
    keyFob = true,
    id = 2,
    coords = vector3(1818.54296875, 2604.8129882812, 44.610000610352),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison main gate inner",
    model = 741314661,
    lock = true,
    active = true,
    keyFob = true,
    id = 3,
    coords = vector3(1801.1259765625, 2616.9753417969, 44.601043701172),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "paleto pd",
    model = -1765048490,
    lock = false,
    active = true,
    id = 4,
    coords = vector3(1855.6899414062, 3683.919921875, 34.592720031738),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "paleto pd",
    model = -1501157055,
    lock = false,
    active = true,
    id = 5,
    coords = vector3(-442.66003417969, 6015.2216796875, 31.866329193115),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "paleto pd",
    model = -1501157055,
    lock = false,
    active = true,
    id = 6,
    coords = vector3(-444.49847412109, 6017.0600585938, 31.866329193115),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "paleto pd",
    model = 741314661,
    lock = true,
    active = true,
    id = 7,
    coords = vector3(1827.7265625, 2710.4248046875, 44.446701049805),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 8,
    coords = vector3(1814.1224365234, 2490.0524902344, 44.46155166626),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 9,
    coords = vector3(1808.4652099609, 2473.0249023438, 44.479473114014),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 10,
    coords = vector3(1763.935546875, 2427.1879882812, 44.43985748291),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 11,
    coords = vector3(1744.947265625, 2417.6950683594, 44.42716217041),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 12,
    coords = vector3(1674.9473876953, 2406.7541503906, 44.42879486084),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 13,
    coords = vector3(1648.7509765625, 2410.0895996094, 44.445068359375),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 14,
    coords = vector3(1561.6689453125, 2462.8774414062, 44.395286560059),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 15,
    coords = vector3(1550.2398681641, 2484.0383300781, 44.394580841064),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 16,
    coords = vector3(1546.6015625, 2568.8068847656, 44.390327453613),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 17,
    coords = vector3(1547.7791748047, 2592.6884765625, 44.5071144104),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 18,
    coords = vector3(1571.4664306641, 2661.1784667969, 44.509468078613),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 19,
    coords = vector3(1585.5863037109, 2681.021484375, 44.5071144104),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 20,
    coords = vector3(1647.0657958984, 2740.9768066406, 44.445941925049),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 21,
    coords = vector3(1666.2685546875, 2750.8894042969, 44.445941925049),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 22,
    coords = vector3(1755.3217773438, 2755.0422363281, 44.446689605713),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 23,
    coords = vector3(1778.1319580078, 2746.6267089844, 44.445278167725),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison",
    model = 741314661,
    lock = true,
    active = true,
    id = 24,
    coords = vector3(1837.7927246094, 2682.2133789062, 44.446701049805),
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 25,
    coords = vector3(1764.4519042969, 2497.4738769531, 49.431346893311),
    model = -1167410167,
    lock = false,
    desc = "prison cell door",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 26,
    coords = vector3(1761.2351074219, 2495.6188964844, 49.430904388428),
    model = -1167410167,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 27,
    coords = vector3(1758.2139892578, 2493.8989257812, 49.428310394287),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 28,
    coords = vector3(1755.2066650391, 2492.1467285156, 49.43045425415),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 29,
    coords = vector3(1752.1845703125, 2490.4045410156, 49.427753448486),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 30,
    coords = vector3(1749.2471923828, 2488.7119140625, 49.425899505615),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 31,
    coords = vector3(1746.0877685547, 2486.896484375, 49.427043914795),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 32,
    coords = vector3(1743.1550292969, 2485.2099609375, 49.423957824707),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 33,
    coords = vector3(1764.1823730469, 2497.3188476562, 44.82377243042),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 34,
    coords = vector3(1761.1732177734, 2495.5869140625, 44.822597503662),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 35,
    coords = vector3(1755.0570068359, 2492.0642089844, 44.822154998779),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 36,
    coords = vector3(1752.2060546875, 2490.4174804688, 44.821727752686),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 37,
    coords = vector3(1749.125, 2488.6474609375, 44.821376800537),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 38,
    coords = vector3(1746.1831054688, 2486.9523925781, 44.822734832764),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 39,
    coords = vector3(1743.2032470703, 2485.2370605469, 44.82209777832),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 40,
    coords = vector3(1772.6505126953, 2484.748046875, 49.425800323486),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 41,
    coords = vector3(1769.5023193359, 2482.9338378906, 49.426296234131),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 42,
    coords = vector3(1766.5654296875, 2481.2424316406, 49.427722930908),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prison small gate",
    model = -1156020871,
    lock = true,
    active = true,
    keyFob = true,
    id = 43,
    coords = vector3(1797.7608642578, 2596.5649414062, 46.387306213379),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "paleto bank",
    model = 1309269072,
    lock = false,
    active = false,
    id = 44,
    coords = vector3(-104.81363677979, 6473.646484375, 31.9547996521),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "paletovault",
    model = -2050208642,
    lock = true,
    active = true,
    id = 45,
    coords = vector3(-101.0146, 6464.0034, 31.634132),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "vault door first",
    model = -222270721,
    lock = true,
    active = true,
    id = 46,
    coords = vector3(256.31155395508, 220.65788269043, 106.4295425415),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        -- ["PD"] = true,
      },
      business = {},
    },
    desc = "vault office door upper",
    model = 1956494919,
    lock = true,
    active = true,
    id = 47,
    coords = vector3(266.36236572266, 217.56977844238, 110.43280792236),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "vault door second",
    model = 746855201,
    lock = true,
    active = true,
    id = 48,
    coords = vector3(262.19808959961, 222.51884460449, 106.4295425415),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "vault door inner bar door 1",
    model = -1508355822,
    lock = true,
    active = true,
    id = 49,
    coords = vector3(251.85757446289, 221.06552124023, 101.83238983154),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "vault door inner bar door 2",
    model = -1508355822,
    lock = true,
    active = true,
    id = 50,
    coords = vector3(261.30041503906, 214.50517272949, 101.83238983154),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        -- ["PD"] = true,
      },
      business = {},
    },
    desc = "vault door",
    model = -1023447729,
    lock = true,
    active = true,
    id = 51,
    coords = vector3(735.1982421875, 132.41223144531, 80.906539916992),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "",
    model = -1011692606,
    lock = true,
    active = true,
    id = 52,
    coords = vector3(-7.404239654541, -678.65899658203, 16.358612060547),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1011692606,
    lock = true,
    active = true,
    id = 53,
    coords = vector3(-2.9891395568848, -676.64025878906, 16.358600616455),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1011692606,
    lock = true,
    active = true,
    id = 54,
    coords = vector3(2.2664804458618, -678.55090332031, 16.358600616455),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1011692606,
    lock = true,
    active = true,
    id = 55,
    coords = vector3(4.3517303466797, -682.93389892578, 16.358612060547),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1011692606,
    lock = true,
    active = true,
    id = 56,
    coords = vector3(-0.97740936279297, -671.11315917969, 16.358600616455),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1011692606,
    lock = true,
    active = true,
    id = 57,
    coords = vector3(-3.5844497680664, -668.16436767578, 16.358612060547),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1011692606,
    lock = true,
    active = true,
    id = 58,
    coords = vector3(-1.6562404632568, -662.13287353516, 16.358600616455),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1011692606,
    lock = true,
    active = true,
    id = 59,
    coords = vector3(10.572834014893, -666.58392333984, 16.358600616455),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1011692606,
    lock = true,
    active = true,
    id = 60,
    coords = vector3(8.1715278625488, -672.43927001953, 16.358612060547),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1011692606,
    lock = true,
    active = true,
    id = 61,
    coords = vector3(4.2780303955078, -673.02374267578, 16.358600616455),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -1932297301,
    lock = false,
    active = true,
    id = 62,
    coords = vector3(-1.7279491424561, -686.54174804688, 16.689130783081),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "union",
    model = -341973294,
    lock = true,
    active = true,
    id = 63,
    coords = vector3(2046.6971435547, 2969.0944824219, -67.152450561523),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -341973294,
    lock = true,
    active = true,
    id = 64,
    coords = vector3(2048.1884765625, 2971.2243652344, -67.152450561523),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -341973294,
    lock = true,
    active = true,
    id = 65,
    coords = vector3(2060.0520019531, 2976.9985351562, -67.152450561523),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -341973294,
    lock = true,
    active = true,
    id = 66,
    coords = vector3(2061.5432128906, 2979.1281738281, -67.152450561523),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -341973294,
    lock = true,
    active = true,
    id = 67,
    coords = vector3(2049.2504882812, 2972.7419433594, -61.752464294434),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -341973294,
    lock = true,
    active = true,
    id = 68,
    coords = vector3(2047.7592773438, 2970.6123046875, -61.752464294434),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 69,
    coords = vector3(2060.4587402344, 2985.0070800781, -67.151954650879),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 70,
    coords = vector3(2062.5893554688, 2983.5153808594, -67.151954650879),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 71,
    coords = vector3(2054.6967773438, 2980.51953125, -67.152450561523),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 72,
    coords = vector3(2050.6818847656, 2974.7854003906, -67.152450561523),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 73,
    coords = vector3(2054.6921386719, 2969.34375, -67.152450561523),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 74,
    coords = vector3(2050.6770019531, 2963.6096191406, -67.152450561523),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 75,
    coords = vector3(2050.6789550781, 2974.78125, -61.752468109131),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 76,
    coords = vector3(2057.0795898438, 2983.9228515625, -61.752468109131),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 77,
    coords = vector3(2060.458984375, 2985.0068359375, -61.751953125),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 78,
    coords = vector3(2062.5886230469, 2983.515625, -61.751953125),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 79,
    coords = vector3(2128.1083984375, 2924.849609375, -61.752445220947),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "fib",
    model = -147325430,
    lock = true,
    active = true,
    id = 80,
    coords = vector3(2122.7348632812, 2928.193359375, -61.752445220947),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["vanilla_unicorn"] = true,
      },
    },
    desc = "vufront",
    model = -1116041313,
    lock = false,
    active = true,
    id = 81,
    coords = vector3(127.95523834229, -1298.5034179688, 29.419622421265),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["vanilla_unicorn"] = true,
      },
    },
    desc = "vuback",
    model = 668467214,
    lock = true,
    active = true,
    id = 82,
    coords = vector3(96.091972351074, -1284.8537597656, 29.43878364563),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["vanilla_unicorn"] = true,
      },
    },
    desc = "vuback",
    model = -495720969,
    lock = true,
    active = true,
    id = 83,
    coords = vector3(113.98224639893, -1297.4304199219, 29.418678283691),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["ottos_pastels"] = true,
      },
    },
    desc = "paperfactoryfrontright", 
    model = -681066206,
    lock = true,
    active = true,
    id = 84,
    coords = vector3(719.3818359375, -975.41851806641, 25.005716323853),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["ottos_pastels"] = true,
      },
    },
    desc = "paperfactoryfrontleft",
    model = 245182344,
    lock = true,
    active = true,
    id = 85,
    coords = vector3(716.78082275391, -975.42065429688, 25.005716323853),
    forceUnlocked = false,
  },
  {
    info = "",
    active = false,
    id = 86,
    coords = vector3(981.15057373047, -103.25524902344, 74.993576049805),
    model = 2271212864,
    lock = true,
    desc = "quickfixfrontdoor",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 87,
    coords = vector3(709.98126220703, -963.53106689453, 30.545291900635),
    model = 551491569,
    lock = true,
    desc = "paperfactoryoffice",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["ottos_pastels"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 88,
    coords = vector3(709.98944091797, -960.66754150391, 30.545291900635),
    model = 933053701,
    lock = true,
    desc = "paperfactorystorage",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["ottos_pastels"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 89,
    coords = vector3(150.29132080078, -1047.6290283203, 29.666297912598),
    model = -1591004109,
    lock = false,
    desc = "fleeca",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 90,
    coords = vector3(482.41107177734, -3115.9248046875, 5.1623539924622),
    model = 1286392437,
    lock = true,
    keyFob = true,
    desc = "merryweathersecurityfrontgateright",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 91,
    coords = vector3(493.71960449219, -3115.93359375, 5.1601490974426),
    model = 1286392437,
    lock = true,
    keyFob = true,
    desc = "merryweathersecurityfrontgateleft",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 92,
    coords = vector3(-801.09887695312, -218.48577880859, 37.240409851074),
    model = -1821777087,
    lock = true,
    desc = "fastlane",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["fastlane"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 93,
    coords = vector3(-798.83862304688, -217.19999694824, 37.240409851074),
    model = -1821777087,
    lock = true,
    desc = "fastlane",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["fastlane"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "prisongatetothetopofvisitation",
    model = 91564889,
    lock = true,
    active = true,
    keyFob = true,
    id = 94,
    coords = vector3(1838.4018554688, 2559.8381347656, 46.098838806152),
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 95,
    coords = vector3(1846.3365478516, 3682.8596191406, 34.416320800781),
    model = 631614199,
    lock = true,
    desc = "sandyshorespdcell1",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 96,
    coords = vector3(1841.8596191406, 3683.2365722656, 34.416320800781),
    model = 631614199,
    lock = true,
    desc = "sandyshorespdcell2",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 97,
    coords = vector3(1840.3712158203, 3685.8415527344, 34.416320800781),
    model = 631614199,
    lock = true,
    desc = "sandyshorespdcell3",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "sandyshorespdcell4",
    active = true,
    id = 98,
    coords = vector3(1844.8323974609, 3685.4611816406, 34.416320800781),
    model = 631614199,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 99,
    coords = vector3(-433.91046142578, 6004.7915039062, 31.866170883179),
    model = 631614199,
    lock = true,
    desc = "paletopdcell1",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 100,
    coords = vector3(103.36805725098, 3609.7470703125, 40.872360229492),
    model = -543490328,
    lock = true,
    desc = "lostmccompoundgaragedoorleft",
    access = {
      job = {},
      business = {
        ["lostmc"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 101,
    coords = vector3(103.40389251709, 3612.3474121094, 40.872360229492),
    model = -543490328,
    lock = true,
    desc = "lostmccompoundgaragedoorright",
    access = {
      job = {},
      business = {
        ["lostmc"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 102,
    coords = vector3(90.942749023438, 3608.9328613281, 40.875526428223),
    model = 190770132,
    lock = true,
    desc = "lostmccompoundfrontdoor",
    access = {
      job = {},
      business = {
        ["lostmc"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 103,
    coords = vector3(300.69100952148, 203.64735412598, 104.64311981201),
    model = 1888438146,
    lock = true,
    main = true,
    desc = "dojo",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["ddojo"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 104,
    coords = vector3(302.52127075195, 202.98120117188, 104.64311981201),
    model = 272205552,
    lock = true,
    desc = "dojo",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["ddojo"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 105,
    coords = vector3(948.57757568359, -965.35668945312, 39.651340484619),
    model = 1289778077,
    lock = true,
    main = true,
    desc = "tuner",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["tuner_shop"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 106,
    coords = vector3(955.39764404297, -972.458984375, 39.655712127686),
    model = -626684119,
    lock = true,
    desc = "tuner",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["tuner_shop"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 107,
    coords = vector3(1844.3527832031, 2579.5871582031, 46.160011291504),
    model = -1320876379,
    lock = true,
    desc = "prisonvisitationofficedoor",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 108,
    coords = vector3(1841.0472412109, 2595.0183105469, 46.164154052734),
    model = -1437850419,
    lock = true,
    desc = "prisonvisitationfirstgate",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 109,
    coords = vector3(1833.6701660156, 2595.0202636719, 46.164154052734),
    model = -1437850419,
    lock = true,
    desc = "prisonvisitationsecondgate",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 110,
    coords = vector3(1827.2995605469, 2592.8630371094, 46.160942077637),
    model = -1033001619,
    lock = true,
    desc = "prison",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 111,
    coords = vector3(-631.95538330078, -236.33326721191, 38.206531524658),
    model = 1425919976,
    lock = true,
    desc = "jewel",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 112,
    coords = vector3(-630.42651367188, -238.43754577637, 38.206531524658),
    model = 9467943,
    lock = true,
    desc = "jewel",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 113,
    coords = vector3(1763.3104248047, 2479.3625488281, 49.428890228271),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 114,
    coords = vector3(1760.5416259766, 2477.7692871094, 49.427257537842),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 115,
    coords = vector3(1757.5354003906, 2476.0400390625, 49.429347991943),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 116,
    coords = vector3(1754.5555419922, 2474.3220214844, 49.429214477539),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        "",
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 117,
    coords = vector3(1751.5261230469, 2472.5764160156, 49.430191040039),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 118,
    coords = vector3(1772.5831298828, 2484.70703125, 44.818382263184),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 119,
    coords = vector3(1769.4412841797, 2482.8974609375, 44.817367553711),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 120,
    coords = vector3(1766.5521240234, 2481.2338867188, 44.816417694092),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 121,
    coords = vector3(1763.5983886719, 2479.537109375, 44.815486907959),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 122,
    coords = vector3(1760.5462646484, 2477.7744140625, 44.816192626953),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 123,
    coords = vector3(1757.5634765625, 2476.056640625, 44.813514709473),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 124,
    coords = vector3(1754.5463867188, 2474.318359375, 44.812152862549),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 125,
    coords = vector3(1751.5368652344, 2472.5903320312, 44.82933807373),
    model = -1167410167,
    lock = false,
    desc = "pcd",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 126,
    coords = vector3(1758.064453125, 2493.7941894531, 45.96915435791),
    model = -1033001619,
    lock = false,
    desc = "prisoncellblockdoortooutside1",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 127,
    coords = vector3(1754.8530273438, 2501.7468261719, 46.027267456055),
    model = 1373390714,
    lock = false,
    desc = "prisoncellblockdoortooutside2",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 128,
    coords = vector3(1771.6512451172, 2494.3786621094, 50.583248138428),
    model = -2109504629,
    lock = true,
    desc = "prison",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 129,
    coords = vector3(1772.94921875, 2492.125, 50.582962036133),
    model = -2109504629,
    lock = true,
    desc = "prison",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 130,
    coords = vector3(1781.0659179688, 2510.1574707031, 45.973655700684),
    model = 1373390714,
    lock = true,
    desc = "prison",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 131,
    coords = vector3(1779.7202148438, 2507.5935058594, 45.976219177246),
    model = -1033001619,
    lock = true,
    desc = "prison",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 132,
    coords = vector3(-152.83229064941, 295.14059448242, 98.989059448242),
    model = -574290911,
    lock = true,
    desc = "roostercabfrontdoor1",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 133,
    coords = vector3(-150.44529724121, 295.14059448242, 98.989059448242),
    model = 1773345779,
    lock = true,
    desc = "roostercabfrontdoor2",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 134,
    coords = vector3(-160.27130126953, 316.37158203125, 99.096061706543),
    model = 1971752884,
    lock = true,
    desc = "roostercabofficedoor",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 135,
    coords = vector3(-178.37829589844, 306.79058837891, 101.28005981445),
    model = 1971752884,
    lock = true,
    desc = "roostercabcellardoor",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 136,
    coords = vector3(-1879.1531982422, 2056.4060058594, 141.13409423828),
    model = 534758478,
    lock = true,
    desc = "winerybasementdoor",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 137,
    coords = vector3(-1883.2299804688, 2059.8811035156, 145.73190307617),
    model = 534758478,
    lock = true,
    desc = "wineryupstairsdoor1",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 138,
    coords = vector3(-1885.6789550781, 2060.7749023438, 145.73190307617),
    model = 534758478,
    lock = true,
    desc = "wineryupstairsdoor2",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 139,
    coords = vector3(1775.7957763672, 2512.6845703125, 45.978141784668),
    model = -1033001619,
    lock = true,
    desc = "prisonarmorydoor",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 140,
    coords = vector3(1770.7302246094, 2506.4345703125, 45.973712921143),
    model = -1033001619,
    lock = true,
    desc = "prisoninfermery",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 141,
    coords = vector3(-1864.2130126953, 2061.2651367188, 141.14559936523),
    model = 988364535,
    lock = true,
    desc = "winerysecretbasementdoor1",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 142,
    coords = vector3(-1864.1999511719, 2059.8989257812, 141.14520263672),
    model = -1141522158,
    lock = true,
    desc = "winerysecretbasementdoor2",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 143,
    coords = vector3(-178.32029724121, 315.56558227539, 98.211059570312),
    model = 1641293839,
    lock = true,
    desc = "roostercabbackdoor1",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 144,
    coords = vector3(-178.32029724121, 313.12759399414, 98.211059570312),
    model = 1507503102,
    lock = true,
    desc = "roostercabbackdoor2",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 145,
    coords = vector3(-171.9162902832, 319.88858032227, 93.952056884766),
    model = 1971752884,
    lock = true,
    desc = "roostercabbasementdoor",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 146,
    coords = vector3(-178.37829589844, 306.79058837891, 97.627059936523),
    model = 1971752884,
    lock = true,
    desc = "roostercabtopofficedoor",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 147,
    coords = vector3(-161.63330078125, 328.12557983398, 93.954055786133),
    model = 1971752884,
    lock = true,
    desc = "roostercabsideofficedoor1",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 148,
    coords = vector3(-161.63330078125, 334.00259399414, 93.954055786133),
    model = 1971752884,
    lock = true,
    desc = "roostercabsideofficedoor2",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 149,
    coords = vector3(-167.21929931641, 328.12557983398, 93.954055786133),
    model = 1971752884,
    lock = true,
    desc = "roostercabsideofficedoor3",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 150,
    coords = vector3(-167.21929931641, 334.00259399414, 93.954055786133),
    model = 1971752884,
    lock = true,
    desc = "roostercabsideofficedoor4",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 151,
    coords = vector3(-172.7912902832, 334.00259399414, 93.954055786133),
    model = 1971752884,
    lock = true,
    desc = "roostercabsideofficedoor5",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 152,
    coords = vector3(-172.7912902832, 328.12557983398, 93.954055786133),
    model = 1971752884,
    lock = true,
    desc = "roostercabsideofficedoor6",
    access = {
      job = {},
      business = {
        ["rooster"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 153,
    coords = vector3(15.915170669556, -2534.6853027344, 5.0471730232239),
    model = 1286392437,
    lock = true,
    desc = "driftschoolentrancegate1",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 154,
    coords = vector3(9.81858253479, -2543.3957519531, 5.0435070991516),
    model = 1286392437,
    lock = true,
    desc = "driftschoolentrancegate2",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 155,
    coords = vector3(-193.42407226562, -2515.3093261719, 5.0471730232239),
    model = 1286392437,
    lock = true,
    desc = "driftschoolentrancegate3",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 156,
    coords = vector3(-203.94105529785, -2515.3083496094, 5.0454182624817),
    model = 1286392437,
    lock = true,
    desc = "driftschoolentrancegate4",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 157,
    coords = vector3(-63.310394287109, -2519.1291503906, 7.5452351570129),
    model = 3610585061,
    lock = true,
    desc = "driftsachoolofficedoor",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 158,
    coords = vector3(324.23602294922, -589.22619628906, 43.433910369873),
    model = -434783486,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 159,
    coords = vector3(326.6549987793, -590.10662841797, 43.433910369873),
    model = -1700911976,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 160,
    coords = vector3(325.66946411133, -580.45959472656, 43.433910369873),
    model = -1700911976,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 161,
    coords = vector3(326.54989624023, -578.04064941406, 43.433910369873),
    model = -434783486,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 162,
    coords = vector3(325.6565246582, -576.30993652344, 43.433910369873),
    model = -1700911976,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 163,
    coords = vector3(323.23754882812, -575.42944335938, 43.433910369873),
    model = -434783486,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 164,
    coords = vector3(320.26153564453, -574.34631347656, 43.433910369873),
    model = -1700911976,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 165,
    coords = vector3(317.84255981445, -573.46588134766, 43.433910369873),
    model = -434783486,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 166,
    coords = vector3(314.4241027832, -572.22155761719, 43.433910369873),
    model = -1700911976,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 167,
    coords = vector3(312.00512695312, -571.34118652344, 43.433910369873),
    model = -434783486,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 168,
    coords = vector3(348.4333190918, -588.74499511719, 43.433910369873),
    model = -1700911976,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        --["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 169,
    coords = vector3(349.3137512207, -586.32598876953, 43.433910369873),
    model = -434783486,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        --["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 170,
    coords = vector3(303.95962524414, -572.55792236328, 43.433910369873),
    model = 854291622,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 171,
    coords = vector3(307.11819458008, -569.56896972656, 43.433910369873),
    model = 854291622,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 172,
    coords = vector3(-793.77630615234, -217.07330322266, 37.247722625732),
    model = -1687047623,
    lock = true,
    desc = "fastlane",
    main = true,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["fastlane"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 173,
    coords = vector3(-770.62261962891, -240.0270690918, 37.545078277588),
    model = 1501451068,
    lock = true,
    desc = "fastlane",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["fastlane"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 174,
    coords = vector3(-765.61291503906, -237.96246337891, 37.55924987793),
    model = 1501451068,
    lock = true,
    desc = "fastlane",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["fastlane"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 175,
    coords = vector3(-803.02227783203, -222.58409118652, 37.879753112793),
    model = 1015445881,
    lock = false,
    desc = "fastlane",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["fastlane"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 176,
    coords = vector3(-801.96221923828, -224.52029418945, 37.879753112793),
    model = 1015445881,
    lock = false,
    desc = "fastlane",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["fastlane"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 177,
    coords = vector3(-31.723524093628, -1101.8465576172, 26.572254180908),
    model = -2051651622,
    lock = true,
    desc = "pdm",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["pdm"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 178,
    coords = vector3(-33.80989074707, -1107.5787353516, 26.572254180908),
    model = -2051651622,
    lock = true,
    desc = "pdm",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["pdm"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = false,
    id = 179,
    coords = vector3(-354.98828125, -135.17259216309, 42.00309753418),
    model = -550347177,
    lock = false,
    desc = "lscustomseastborneway",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 180,
    coords = vector3(-776.15911865234, -243.50129699707, 37.333881378174),
    model = 447044832,
    lock = false,
    desc = "fastlane",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["fastlane"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 181,
    coords = vector3(-778.18548583984, -244.30130004883, 37.333881378174),
    model = 447044832,
    lock = false,
    desc = "fastlane",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["fastlane"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 182,
    coords = vector3(303.90869140625, -596.57800292969, 43.433910369873),
    model = 854291622,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 183,
    coords = vector3(309.13372802734, -597.75146484375, 43.433910369873),
    model = 854291622,
    lock = true,
    desc = "hosp",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 184,
    coords = vector3(-1479.7586669922, 880.49291992188, 181.88272094727),
    model = 741314661,
    lock = true,
    keyFob = true,
    desc = "ParsonsGate",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = false,
    id = 185,
    coords = vector3(1004.7983398438, -115.02404022217, 74.136001586914),
    model = 1335311341,
    lock = true,
    desc = "quickfixbackgaragedoor",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = false,
    id = 186,
    coords = vector3(985.6103515625, -95.162536621094, 74.997932434082),
    model = 2271212864,
    lock = true,
    desc = "quickfixofficedoor",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 187,
    coords = vector3(1856.1257324219, 3689.6560058594, 34.41915512085),
    model = -1033001619,
    lock = true,
    desc = "sandyshorespdbreefingroomdoor",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 188,
    coords = vector3(-440.67562866211, 6008.0234375, 32.052379608154),
    model = -1765048490,
    lock = true,
    desc = "paletopdofficedoor",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 189,
    coords = vector3(1218.8403320312, -416.1416015625, 67.916000366211),
    model = 4007304890,
    lock = true,
    desc = "hoatavernfrontdoor",
    access = {
      job = {},
      business = {
        ["tavern"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 190,
    coords = vector3(1227.5942382812, -422.72311401367, 67.915786743164),
    model = 1335311341,
    lock = true,
    desc = "hoatavernbackdoor",
    access = {
      job = {},
      business = {},
      cid = {
        [1811] = true,
        [1380] = true,
        [1463] = true,
        [1052] = true,
        [1449] = true,
        [2835] = true,
        [4916] = true,
        [1078] = true,
        [1129] = true,
        [3758] = true,
        [5019] = true,
        [1191] = true,
        [1114] = true,
        [6304] = true,
        [2082] = true,
        [1250] = true,
        [1134] = true,
        [1292] = true,
        [1146] = true,
        [1579] = true,
        [3527] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 191,
    coords = vector3(-1083.5445556641, -818.47357177734, 19.449235916138),
    model = -1320876379,
    lock = true,
    desc = "VpdCaptainsOffice",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 192,
    coords = vector3(-1085.8247070312, -824.80438232422, 19.449235916138),
    model = -129553421,
    lock = true,
    desc = "VpdLockerRooms",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 193,
    coords = vector3(-1091.2763671875, -823.90997314453, 19.449235916138),
    model = -129553421,
    lock = true,
    desc = "VpdDoorToCellsLeft",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 194,
    coords = vector3(-1092.8963623047, -821.87615966797, 19.449235916138),
    model = -129553421,
    lock = true,
    desc = "VpdDoorToCellsRight",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 195,
    coords = vector3(-1082.2290039062, -840.43450927734, 13.674360275269),
    model = 631614199,
    lock = true,
    desc = "VpdMainDoorToCells",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 196,
    coords = vector3(-1085.3153076172, -839.35974121094, 13.674360275269),
    model = 631614199,
    lock = true,
    desc = "VpdCell1",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 197,
    coords = vector3(-1087.857421875, -841.38446044922, 13.674360275269),
    model = 631614199,
    lock = true,
    desc = "VpdCell2",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 198,
    coords = vector3(-1090.7069091797, -843.654296875, 13.674360275269),
    model = 631614199,
    lock = true,
    desc = "VpdCell3",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 199,
    coords = vector3(-1081.9772949219, -825.54351806641, 19.449197769165),
    model = 749848321,
    lock = true,
    desc = "VpdArmory",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 200,
    coords = vector3(-1072.9871826172, -850.93347167969, 5.9836754798889),
    model = -1573772550,
    lock = true,
    desc = "VpdInnerGate",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 201,
    coords = vector3(-1138.6423339844, -840.14184570312, 13.515572547913),
    model = 1286535678,
    lock = true,
    desc = "VpdOuterGarageGate",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 202,
    coords = vector3(-1063.6356201172, -880.70892333984, 6.2145581245422),
    model = -1368913668,
    lock = true,
    desc = "VpdOuterGarageGateLowerLeft",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 203,
    coords = vector3(-1053.2840576172, -874.33184814453, 6.2055821418762),
    model = -1657444801,
    lock = true,
    desc = "VpdOuterGarageGateLowerRight",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 204,
    coords = vector3(-808.64410400391, -1212.8168945312, 7.4871892929077),
    model = 854291622,
    lock = true,
    desc = "VespHospitalLaboratory",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 205,
    coords = vector3(-804.65802001953, -1216.1535644531, 7.4871892929077),
    model = -434783486,
    lock = true,
    desc = "VespHospitalSurgeryLeft",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 206,
    coords = vector3(-802.68603515625, -1217.8083496094, 7.4871892929077),
    model = -1700911976,
    lock = true,
    desc = "VespHospitalSurgeryRight",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 207,
    coords = vector3(-799.89935302734, -1220.1468505859, 7.4871892929077),
    model = -434783486,
    lock = true,
    desc = "VespHospitalSurgeryLeft2",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 208,
    coords = vector3(-797.92736816406, -1221.8015136719, 7.4871892929077),
    model = -1700911976,
    lock = true,
    desc = "VespHospitalSurgeryRight2",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 209,
    coords = vector3(-795.50128173828, -1223.8370361328, 7.4871892929077),
    model = -434783486,
    lock = true,
    desc = "VespHospitalSurgeryLeft3",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 210,
    coords = vector3(-793.529296875, -1225.4916992188, 7.4871892929077),
    model = -1700911976,
    lock = true,
    desc = "VespHospitalSurgeryRight3",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 211,
    coords = vector3(-793.28173828125, -1227.4237060547, 7.4871892929077),
    model = -434783486,
    lock = true,
    desc = "VespHospitalWardBLeft",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 212,
    coords = vector3(-794.93640136719, -1229.3956298828, 7.4871892929077),
    model = -1700911976,
    lock = true,
    desc = "VespHospitalWardBRight",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 213,
    coords = vector3(-799.28179931641, -1237.1431884766, 7.4871892929077),
    model = -434783486,
    lock = true,
    desc = "VespHospitalWardBLeft2",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 214,
    coords = vector3(-797.30987548828, -1238.7978515625, 7.4871892929077),
    model = -1700911976,
    lock = true,
    desc = "VespHospitalWardBRight2",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 215,
    coords = vector3(-784.96667480469, -1232.6845703125, 7.4871892929077),
    model = 854291622,
    lock = true,
    desc = "VespHospitalMri",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 216,
    coords = vector3(-784.54064941406, -1239.8239746094, 7.4871892929077),
    model = 854291622,
    lock = true,
    desc = "VespHospitalAdmin",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 217,
    coords = vector3(-776.31646728516, -1239.9429931641, 7.4871892929077),
    model = 854291622,
    lock = true,
    desc = "VespHospitalX-Ray",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 218,
    coords = vector3(-816.38909912109, -1239.9891357422, 7.4871892929077),
    model = 854291622,
    lock = true,
    desc = "VespHospitalStaff",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 219,
    coords = vector3(-781.20129394531, -1235.8441162109, 7.4871892929077),
    model = 854291622,
    lock = true,
    desc = "VespHospitalDiagnostics",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 220,
    coords = vector3(469.77426147461, -1014.4060058594, 26.483816146851),
    model = -692649124,
    lock = true,
    desc = "MRPDBack_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 221,
    coords = vector3(467.36862182617, -1014.4060058594, 26.483816146851),
    model = -692649124,
    lock = true,
    desc = "MRPDBack_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 222,
    coords = vector3(471.36785888672, -1007.7933959961, 26.40548324585),
    model = 149284793,
    lock = true,
    desc = "MRPDProc_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 223,
    coords = vector3(471.37582397461, -1010.1978759766, 26.40548324585),
    model = 149284793,
    lock = true,
    desc = "MRPDProc_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 224,
    coords = vector3(475.95385742188, -1006.9378051758, 26.406385421753),
    model = -288803980,
    lock = true,
    desc = "MRPDProcessing",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 225,
    coords = vector3(476.61569213867, -1008.8754272461, 26.480054855347),
    model = -53345114,
    lock = true,
    desc = "MRPDCellEnt01",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 226,
    coords = vector3(477.91259765625, -1012.188659668, 26.480054855347),
    model = -53345114,
    lock = true,
    desc = "MRPDCell01",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 227,
    coords = vector3(480.9128112793, -1012.188659668, 26.480054855347),
    model = -53345114,
    lock = true,
    desc = "MRPDCell02",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 228,
    coords = vector3(483.91271972656, -1012.188659668, 26.480054855347),
    model = -53345114,
    lock = true,
    desc = "MRPDCell03",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 229,
    coords = vector3(486.91311645508, -1012.188659668, 26.480054855347),
    model = -53345114,
    lock = true,
    desc = "MRPDCell04",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 230,
    coords = vector3(484.17642211914, -1007.734375, 26.480054855347),
    model = -53345114,
    lock = true,
    desc = "MRPDCell05",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 231,
    coords = vector3(481.00836181641, -1004.117980957, 26.480054855347),
    model = -53345114,
    lock = true,
    desc = "MRPDCellEnt02",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 232,
    coords = vector3(479.05996704102, -1003.1729736328, 26.406503677368),
    model = -288803980,
    lock = true,
    desc = "MRPDLineup",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 233,
    coords = vector3(479.66375732422, -997.90997314453, 26.406503677368),
    model = 149284793,
    lock = true,
    desc = "MRPDCellR",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 234,
    coords = vector3(482.06857299805, -997.90997314453, 26.406503677368),
    model = 149284793,
    lock = true,
    desc = "MRPDCellL",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 235,
    coords = vector3(482.67013549805, -987.57916259766, 26.40548324585),
    model = -1406685646,
    lock = true,
    desc = "MRPDInt01",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 236,
    coords = vector3(482.66943359375, -983.98681640625, 26.40548324585),
    model = -1406685646,
    lock = true,
    desc = "MRPDObs01",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 237,
    coords = vector3(482.67025756836, -995.728515625, 26.40548324585),
    model = -1406685646,
    lock = true,
    desc = "MRPDInt02",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 238,
    coords = vector3(482.669921875, -992.29913330078, 26.40548324585),
    model = -1406685646,
    lock = true,
    desc = "MRPDObs02",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 239,
    coords = vector3(478.28915405273, -997.91009521484, 26.40548324585),
    model = 149284793,
    lock = true,
    desc = "MRPDIdentify",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 240,
    coords = vector3(475.83233642578, -990.48394775391, 26.40548324585),
    model = -692649124,
    lock = true,
    desc = "MRPDEvidence",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 241,
    coords = vector3(471.37530517578, -987.43737792969, 26.40548324585),
    model = -96679321,
    lock = true,
    desc = "MRPDEIIOL_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 242,
    coords = vector3(471.37530517578, -985.03192138672, 26.40548324585),
    model = -1406685646,
    lock = true,
    desc = "MRPDEIIOL_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 243,
    coords = vector3(479.06240844727, -985.03234863281, 26.40548324585),
    model = 149284793,
    lock = true,
    desc = "MRPDIOLC_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 244,
    coords = vector3(479.06240844727, -987.43756103516, 26.40548324585),
    model = 149284793,
    lock = true,
    desc = "MRPDIOLC_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 245,
    coords = vector3(464.15905761719, -974.66558837891, 26.370704650879),
    model = 1830360419,
    lock = true,
    desc = "MRPDGarage01",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 246,
    coords = vector3(464.15655517578, -997.50927734375, 26.370704650879),
    model = 1830360419,
    lock = true,
    desc = "MRPDGarage02",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 247,
    coords = vector3(467.52221679688, -1000.5437011719, 26.40548324585),
    model = -288803980,
    lock = true,
    desc = "MRPDBackInt_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 248,
    coords = vector3(469.92736816406, -1000.5437011719, 26.40548324585),
    model = -288803980,
    lock = true,
    desc = "MRPDBackInt_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 249,
    keyFob = true,
    coords = vector3(452.3005065918, -1000.7794189453, 26.72912979126),
    model = 2130672747,
    lock = true,
    desc = "MRPDGarageExit01",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 250,
    coords = vector3(431.41192626953, -1000.7789306641, 26.726903915405),
    model = 2130672747,
    keyFob = true,
    lock = true,
    desc = "MRPDGarageExit02",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 251,
    coords = vector3(469.44061279297, -987.43768310547, 30.823192596436),
    model = -288803980,
    lock = true,
    desc = "MRPDMCD_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 252,
    coords = vector3(469.44061279297, -985.03131103516, 30.823192596436),
    model = -288803980,
    lock = true,
    desc = "MRPDMCD_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 253,
    coords = vector3(475.38369750977, -989.82470703125, 30.823192596436),
    model = 149284793,
    lock = true,
    desc = "MRPDBriefing_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 254,
    coords = vector3(472.97769165039, -989.82470703125, 30.823192596436),
    model = 149284793,
    lock = true,
    desc = "MRPDBriefing_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 255,
    coords = vector3(476.75115966797, -999.63067626953, 30.823192596436),
    model = 149284793,
    lock = true,
    desc = "MRPDBriefingBack",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 256,
    coords = vector3(479.75073242188, -999.62902832031, 30.789167404175),
    model = -692649124,
    lock = true,
    desc = "MRPDArmory01",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 257,
    coords = vector3(487.43783569336, -1000.1892700195, 30.786972045898),
    model = -692649124,
    lock = true,
    desc = "MRPDArmory02",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 258,
    coords = vector3(485.61334228516, -1002.9019775391, 30.786972045898),
    model = -692649124,
    lock = true,
    desc = "MRPDShootRange_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 259,
    coords = vector3(488.01843261719, -1002.9019775391, 30.786972045898),
    model = -692649124,
    lock = true,
    desc = "MRPDShootRange_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 260,
    coords = vector3(452.26626586914, -995.525390625, 30.823192596436),
    model = -96679321,
    lock = true,
    desc = "MRPDArchives",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 261,
    coords = vector3(458.08941650391, -995.52465820312, 30.823192596436),
    model = 149284793,
    lock = true,
    desc = "MRPDLockers",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 262,
    coords = vector3(443.06176757812, -998.74621582031, 30.81530380249),
    model = -1547307588,
    lock = true,
    desc = "MRPDSideDoor_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 263,
    coords = vector3(440.73919677734, -998.74621582031, 30.81530380249),
    model = -1547307588,
    lock = true,
    desc = "MRPDSideDoor_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 264,
    coords = vector3(440.52008056641, -977.60107421875, 30.823192596436),
    model = -1406685646,
    lock = true,
    desc = "MRPDLobby_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 265,
    coords = vector3(440.52008056641, -986.23345947266, 30.823192596436),
    model = -96679321,
    lock = true,
    desc = "MRPDLobby_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 266,
    coords = vector3(455.88616943359, -972.25427246094, 30.815307617188),
    model = -1547307588,
    lock = true,
    desc = "MRPDStreetSideDoor_R",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 267,
    coords = vector3(458.20874023438, -972.25427246094, 30.815307617188),
    model = -1547307588,
    lock = true,
    desc = "MRPDStreetSideDoor_L",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 268,
    coords = vector3(458.65432739258, -990.64978027344, 30.823192596436),
    model = -96679321,
    lock = true,
    desc = "MRPDCaptain",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 269,
    coords = vector3(448.98455810547, -995.5263671875, 35.103763580322),
    model = -96679321,
    lock = true,
    desc = "MRPDDispatch",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 270,
    coords = vector3(448.98681640625, -990.20074462891, 35.103763580322),
    model = -1406685646,
    lock = true,
    desc = "MRPDTraining",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 271,
    coords = vector3(464.30856323242, -984.52844238281, 43.771240234375),
    model = -692649124,
    lock = true,
    desc = "MRPDRoof",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 272,
    coords = vector3(488.89410400391, -1017.1262817383, 27.148464202881),
    model = -1603817716,
    lock = true,
    desc = "MRPDBackGate",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  -- bobcat
  {
    info = "bobcat front door 1",
    active = true,
    id = 273,
    coords = vector3(883.0863, -2258.081, 30.541435),
    model = -1259801187,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "bobcat front door 2",
    active = true,
    id = 274,
    coords = vector3(881.40032, -2258.853, 30.471155),
    model = -1563799200,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "bobcat first inner door",
    active = true,
    id = 275,
    coords = vector3(880.93457, -2264.645, 30.467809),
    model = -551608542,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "bobcat armed inner door 1",
    active = true,
    id = 276,
    coords = vector3(882.03509, -2268.166, 30.467811),
    model = 933053701,
    lock = true,
    desc = "",
    access = {
      job = {
        -- ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "bobcat armed inner door 2",
    active = true,
    id = 277,
    coords = vector3(880.71289, -2268.234, 30.467794),
    model = 933053701,
    lock = true,
    desc = "",
    access = {
      job = {
        -- ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  -- vault
  {
    info = "lower vault main door 1",
    active = true,
    id = 278,
    coords = vector3(273.1413, 230.5395, 96.68304),
    model = -1887114592,
    lock = true,
    desc = "",
    access = {
      job = {
        -- ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "lower vault main door 2",
    active = true,
    id = 279,
    coords = vector3(272.255, 228.0946, 96.68304),
    model = -1887114592,
    lock = true,
    desc = "",
    access = {
      job = {
        -- ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "lower vault inside slide door 1",
    active = true,
    id = 280,
    coords = vector3(294.5411, 208.0697, 96.68283),
    model = -219532439,
    lock = true,
    desc = "",
    access = {
      job = {
        --["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "lower vault inside slide door 2",
    active = true,
    id = 281,
    coords = vector3(311.2454, 214.1708, 96.68283),
    model = -219532439,
    lock = true,
    desc = "",
    access = {
      job = {
        --["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "lower vault inside slide door 3",
    active = true,
    id = 282,
    coords = vector3(303.1045, 231.6025, 96.68283),
    model = -219532439,
    lock = true,
    desc = "",
    access = {
      job = {
        --["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "sandy pd, meeting room",
    active = true,
    id = 283,
    coords = vector3(1856.1257324219, 3689.6560058594, 34.41915512085),
    model = -1033001619,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "sandy pd, to cells",
    active = true,
    id = 284,
    coords = vector3(1849.9676513672, 3684.1044921875, 34.421806335449),
    model = -2023754432,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "sandy pd, to cells",
    active = true,
    id = 285,
    coords = vector3(1851.2883300781, 3681.8684082031, 34.420181274414),
    model = -2023754432,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "sandy pd, to office",
    active = true,
    id = 286,
    coords = vector3(1847.1575927734, 3689.8916015625, 34.41915512085),
    model = -2023754432,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "sandy pd, to office",
    active = true,
    id = 287,
    coords = vector3(1849.4094238281, 3691.1882324219, 34.41915512085),
    model = -2023754432,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "paleto pd, to office",
    active = true,
    id = 288,
    coords = vector3(-440.98745727539, 6012.7646484375, 31.866329193115),
    model = -2023754432,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "paleto pd, to office",
    active = true,
    id = 289,
    coords = vector3(-442.82684326172, 6010.9252929688, 31.866329193115),
    model = -2023754432,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "paleto pd, to locker",
    active = true,
    id = 290,
    coords = vector3(-450.71597290039, 6016.3696289062, 31.866329193115),
    model = -2023754432,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "bean machine",
    active = false,
    id = 291,
    coords = vector3(-629.7998, 228.9898, 82.0489),
    model = 736699661,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "court house holding entry",
    active = true,
    id = 292,
    coords = vector3(-510.8223, -203.0728, 34.4023),
    model = -519068795,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "court house holding cell 1",
    active = true,
    id = 293,
    coords = vector3(-516.2435, -201.4633, 34.40555),
    model = 631614199,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "court house holding cell 2",
    active = true,
    id = 294,
    coords = vector3(-514.1594, -205.0734, 34.40555),
    model = 631614199,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "court house outside door 1",
    active = true,
    id = 295,
    coords = vector3(-506.0826, -200.8349, 34.40414),
    model = 605731446,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "court house outside door 2",
    active = true,
    id = 296,
    coords = vector3(-507.1621, -198.9598, 34.40414),
    model = 605731446,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "court house outside ladder",
    active = true,
    id = 297,
    coords = vector3(-527.4601, -166.2868, 46.459111),
    model = 693714950,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "court house outside ladder",
    active = true,
    id = 298,
    coords = vector3(-538.4393, -171.6742, 46.459111),
    model = 693714950,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "secrex big",
    active = true,
    id = 299,
    coords = vector3(2527.992, 2622.527, 39.33549),
    model = -190780785,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      cid = {
        [1007] = true,
      },
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "secrex small",
    active = true,
    id = 300,
    coords = vector3(2527.981, 2626.549, 38.10261),
    model = -664582244,
    lock = true,
    desc = "",
    access = {
      cid = {
        [1007] = true,
      },
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "pr",
    active = true,
    id = 301,
    coords = vector3(387.7515, 792.8711, 187.8491),
    model = -117185009,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "pr",
    active = true,
    id = 302,
    coords = vector3(388.6313, 799.6823, 187.8263),
    model = -117185009,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "prc",
    active = true,
    id = 303,
    coords = vector3(378.1726, 796.8284, 187.6123),
    model = 517369125,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "prc",
    active = true,
    id = 304,
    coords = vector3(381.6628, 796.8287, 187.6117),
    model = 517369125,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "pr",
    active = true,
    id = 305,
    coords = vector3(380.2174, 792.7883, 190.6414),
    model = -117185009,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "mineshaft",
    active = true,
    id = 306,
    coords = vector3(972.4699, 2733.931, 30.2),
    model = 237621997,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "mineshaft",
    active = true,
    id = 307,
    coords = vector3(974.8727, 2734.315, 30.2143),
    model = 237621997,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "methlab",
    active = true,
    id = 308,
    coords = vector3(228.8063, -790.5078, 21.32163),
    model = 362975687,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
  },
  {
    info = "jewelry store inner",
    active = true,
    id = 309,
    coords = vector3(-629.13385009766, -230.15170288086, 38.20658493042),
    model = 1335309163,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
  },
  {
    info = "vault outer backdoor 1",
    active = true,
    id = 310,
    coords = vector3(258.20220947266, 204.10057067871, 106.4048538208),
    model = 110411286,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = true,
  },
  {
    info = "vault outer backdoor 2",
    active = true,
    id = 311,
    coords = vector3(260.64321899414, 203.20527648926, 106.4048538208),
    model = 110411286,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = true,
  },
  {
    info = "vault outer front door 1",
    active = true,
    id = 312,
    coords = vector3(231.51234436035, 216.51770019531, 106.40486907959),
    model = 110411286,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = true,
  },
  {
    info = "vault outer front door 2",
    active = true,
    id = 313,
    coords = vector3(232.60537719727, 214.1584777832, 106.40487670898),
    model = 110411286,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = true,
  },
  {
    info = "",
    active = true,
    id = 314,
    keyFob = true,
    coords = vector3(410.02578735352, -1024.2199707031, 29.220199584961),
    model = -1635161509,
    lock = true,
    automatic = {
      distance = 100.0,
      rate = 1.0
    },
    desc = "MRPDBollard01",
    access = {
      job = {
        ["PD"] = true,
        ["pd_impound"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 315,
    keyFob = true,
    coords = vector3(410.02578735352, -1024.2259521484, 29.220220565796),
    model = -1868050792,
    lock = true,
    automatic = {
      distance = 100.0,
      rate = 1.0
    },
    desc = "MRPDBollard02",
    access = {
      job = {
        ["PD"] = true,
        ["pd_impound"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "gov building east of highway",
    active = true,
    id = 316,
    keyFob = true,
    coords = vector3(2569.2211914062, -325.56640625, 94.123634338379),
    model = -43433986,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "gov building east of highway",
    active = true,
    id = 317,
    keyFob = true,
    coords = vector3(2559.6140136719, -325.55575561523, 94.123634338379),
    model = -43433986,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "gov building east of highway",
    active = true,
    id = 318,
    keyFob = true,
    coords = vector3(2491.8854980469, -303.48767089844, 91.990074157715),
    model = 569833973,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "impound east street gate",
    active = true,
    id = 319,
    keyFob = true,
    coords = vector3(-171.6424407959, -1160.6770019531, 22.635126113892),
    model = 1286535678,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
        ["impound"] = true,
        ["pd_impound"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "impound west street gate",
    active = true,
    id = 320,
    keyFob = true,
    coords = vector3(-232.58993530273, -1158.8249511719, 22.091827392578),
    model = 1286535678,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
        ["impound"] = true,
        ["pd_impound"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "impound west inner gate",
    active = true,
    id = 321,
    keyFob = true,
    coords = vector3(-226.14630126953, -1168.8063964844, 22.080400466919),
    model = 1286535678,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
        ["impound"] = true,
        ["pd_impound"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "impound east inner gate",
    active = true,
    id = 322,
    keyFob = true,
    coords = vector3(-156.90669250488, -1169.6063232422, 22.086107254028),
    model = 1286535678,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
        ["impound"] = true,
        ["pd_impound"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "impound office",
    active = true,
    id = 323,
    keyFob = false,
    coords = vector3(-187.06140136719, -1162.3486328125, 23.821239471436),
    model = -952356348,
    lock = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
        ["impound"] = true,
        ["pd_impound"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "impound backdoor",
    active = true,
    id = 324,
    keyFob = false,
    coords = vector3(-189.63600158691, -1167.8836669922, 23.821239471436),
    model = 97297972,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
        ["impound"] = true,
        ["pd_impound"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "lower vault inside slide door entry",
    active = true,
    id = 325,
    coords = vector3(288.209, 222.5047, 96.68108),
    model = -219532439,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "pillbox lower entry reception door",
    active = true,
    id = 326,
    coords = vector3(348.54669189453, -585.15844726562, 28.947092056274),
    model = 854291622,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "pillbox lower entry garage door left",
    active = true,
    id = 327,
    coords = vector3(338.44665527344, -590.05297851562, 28.947092056274),
    model = -434783486,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "pillbox lower entry garage door right",
    active = true,
    id = 328,
    coords = vector3(339.32659912109, -587.63452148438, 28.947092056274),
    model = -1700911976,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "pillbox garage gate left",
    active = true,
    keyFob = true,
    id = 329,
    coords = vector3(337.27212524414, -564.44732666016, 30.634208679199),
    model = -820650556,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "pillbox garage gate right",
    active = true,
    keyFob = true,
    id = 330,
    coords = vector3(330.04742431641, -562.07354736328, 31.129365921021),
    model = -820650556,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "pillbox garage backdoor right",
    active = true,
    id = 331,
    coords = vector3(321.01483154297, -559.91271972656, 28.947238922119),
    model = -1421582160,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "pillbox garage backdoor right",
    active = true,
    id = 332,
    coords = vector3(318.66561889648, -561.00860595703, 28.947238922119),
    model = 1248599813,
    lock = true,
    desc = "hospital",
    access = {
      job = {
        ["PD"] = true,
        ["DR"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "methlab_op",
    active = true,
    id = 333,
    coords = vector3(1071.311, -2316.445, 22.54868),
    model = 362975687,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "methlab_ss",
    active = true,
    id = 334,
    coords = vector3(371.3661, 3564.562, 25.6122),
    model = 362975687,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "methlab_bb",
    active = true,
    id = 335,
    coords = vector3(2298.077, 4851.159, 34.13586),
    model = 362975687,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "tunershop",
    active = true,
    id = 336,
    coords = vector3(945.9179, -985.0026, 43.34682),
    model = -823173123,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
  },
  {
    info = "gallery showroom 1",
    active = true,
    id = 337,
    coords = vector3(-491.35897827148, 28.952125549316, 46.5758934021),
    model = 1709680887,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery showroom 2",
    active = true,
    id = 338,
    coords = vector3(-488.96105957031, 28.74153137207, 46.5758934021),
    model = -752680088,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 339,
    coords = vector3(-426.07656860352, 23.748023986816, 46.523895263672),
    model = -1663450520,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 340,
    coords = vector3(-423.59674072266, 23.533863067627, 46.523220062256),
    model = -1854854241,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 341,
    coords = vector3(-438.99099731445, 40.008834838867, 53.064792633057),
    model = -1663450520,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 342,
    coords = vector3(-441.46917724609, 40.223148345947, 53.064792633057),
    model = -1854854241,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery showroom garage door",
    active = true,
    id = 343,
    coords = vector3(-491.20520019531, 51.213733673096, 53.231643676758),
    model = -429115342,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 344,
    coords = vector3(-478.33380126953, 54.553005218506, 52.554546356201),
    model = -1204133321,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 345,
    coords = vector3(-470.62832641602, 51.051769256592, 52.555488586426),
    model = -1193319547,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 346,
    coords = vector3(-440.6862487793, 50.442222595215, 53.065963745117),
    model = 1967988229,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 347,
    coords = vector3(-440.47055053711, 52.913578033447, 53.065402984619),
    model = 1566764593,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 348,
    coords = vector3(-456.15530395508, 43.424518585205, 46.393482208252),
    model = -2066395222,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery main 1",
    active = true,
    id = 349,
    coords = vector3(-465.36431884766, 29.296127319336, 46.833976745605),
    model = -2066395222,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery warehouse 1",
    active = true,
    id = 350,
    coords = vector3(-460.75750732422, -47.077758789062, 46.886547088623),
    model = -901044889,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery warehouse 2",
    active = true,
    id = 351,
    coords = vector3(-449.26681518555, -48.022987365723, 44.663257598877),
    model = -1795835524,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "gallery warehouse 3",
    active = true,
    id = 352,
    coords = vector3(-454.50430297852, -47.630306243896, 46.384452819824),
    model = -901044889,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["art_gallery"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino entrance left 1",
    active = true,
    id = 353,
    coords = vector3(927.7387, 49.60353, 81.54192),
    model = 21324050,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino entrance left 2",
    active = true,
    id = 354,
    coords = vector3(926.4083, 47.47442, 81.54192),
    model = 21324050,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino middle  1",
    active = true,
    id = 355,
    coords = vector3(926.2393, 47.21412, 81.54192),
    model = 21324050,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino middle  2",
    active = true,
    id = 356,
    coords = vector3(924.9089, 45.085, 81.54192),
    model = 21324050,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino right  1",
    active = true,
    id = 357,
    coords = vector3(924.75, 44.83086, 81.54192),
    model = 21324050,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino right  2",
    active = true,
    id = 358,
    coords = vector3(923.4196, 42.70175, 81.54192),
    model = 21324050,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino MANAGE DOOR LEFT",
    active = true,
    id = 359,
    coords = vector3(1017.637, 65.47773, 70.01009),
    model = 680601509,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino MANAGE DOOR RIGHT",
    active = true,
    id = 360,
    coords = vector3(1018.692, 67.17648, 70.01009),
    model = 680601509,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "burgershot kitchen door",
    active = true,
    id = 361,
    coords = vector3(-1201.11, -892.96, 14.24),
    model = -1448591934,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
	      ["burger_shot"] = true,
	    },
    },
  },
  {
    info = "burgershot back door",
    active = true,
    id = 362,
    coords = vector3(-1199.35, -903.87, 14.0),
    model = -1300743830,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
	  ["burger_shot"] = true,
	},
    },
  },
  {
    info = "lostmc door",
    active = true,
    keyFob = true,
    id = 363,
    coords = vector3(107.3448, 3620.268, 41.25948),
    model = -822900180,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["lostmc"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "burgershot front right",
    active = true,
    id = 364,
    coords = vector3(-1184.902, -883.29, 14.24),
    model = -186646702,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
      ["burger_shot"] = true,
    },
    },
  },
  {
    info = "burgershot front left",
    active = true,
    id = 365,
    coords = vector3(-1183.22, -885.78, 14.24),
    model = 1934064671,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
	  ["burger_shot"] = true,
	},
    },
  },
  {
    info = "burgershot side left",
    active = true,
    id = 366,
    coords = vector3(-1196.54, -883.48, 14.24),
    model = 1934064671,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
      ["burger_shot"] = true,
    },
    },
  },
  {
    info = "burgershot side right",
    active = true,
    id = 367,
    coords = vector3(-1199.0, -885.17, 14.24),
    model = -186646702,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
      ["burger_shot"] = true,
    },
    },
  },
  {
    info = "burgershot drive thru window",
    active = true,
    id = 368,
    coords = vector3(-1193.2, -906.83, 13.0),
    model = -1518705307,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
	  ["burger_shot"] = true,
	},
    },
  },
  {
    info = "hayes door 1",
    active = true,
    id = 369,
    coords = vector3(-1414.869, -436.3675, 34.90352),
    model = `denis3d_hayes_auto_shuttergate`,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
          ["hayes_autos"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "hayes door 2",
    active = true,
    id = 370,
    coords = vector3(-1421.118, -440.2721, 34.90352),
    model = `denis3d_hayes_auto_shuttergate`,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
          ["hayes_autos"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "hayes door 3",
    active = true,
    id = 371,
    coords = vector3(-1427.326, -444.1516, 34.90352),
    model = `denis3d_hayes_auto_shuttergate`,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
          ["hayes_autos"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "digital den front door",
    active = false,
    id = 372,
    coords = vector3(1136.8, -470.7, 66.48),
    model = 1181020301,
    lock = true, --locked while shop is "closed"
    desc = "",
    access = {
      job = {},
      business = {
          ["digital_den"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "digital den secret door 1",
    active = true,
    id = 373,
    coords = vector3(1136.5, -467.64, 66.48),
    model = 547719377,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
          ["digital_den"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "digital den secret door 2",
    active = true,
    id = 374,
    coords = vector3(1135, -463.85, 66.48),
    model = -1577379202,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
          ["digital_den"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "digital den secret door 3",
    active = true,
    id = 375,
    coords = vector3(1136, -464.25, 66.48),
    model = -1577379202,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
          ["digital_den"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "digital den back door",
    active = true,
    id = 376,
    coords = vector3(1129.3, -463.9, 66.48),
    model = -1565285813,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
          ["digital_den"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino gate door 1",
    active = true,
    id = 377,
    coords = vector3(1000.851, 43.75714, 70.6665), 
    model = -389557955,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
          ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino gate door 2",
    active = true,
    id = 378,
    coords = vector3(1000.426, 45.56562, 70.6665),
    model = -389557955,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
          ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "VU front door",
    active = true,
    id = 379,
    coords = vector3(127.9501, -1298.507, 29.41962),
    model = -1116041313,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["vanilla_unicorn"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "VU bac door",
    active = true,
    id = 380,
    coords = vector3(96.09197, -1284.854, 29.43878),
    model = 1695461688,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["vanilla_unicorn"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Rooster Hidden Door",
    active = true,
    id = 381,
    coords = vector3(-173.6,313.78,93.76),
    model = 1944861230,
    lock = true,
    desc = "roostercabbasementhidden",
    access = {
      cid = {
        [1391] = true, -- lang buddha
      },
      job = {},
      business = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "wuchang front door",
    active = true,
    id = 382,
    coords = vector3(-826.4025, -695.8148, 28.49083),
    model = 2001816392,
    lock = true,
    desc = "wuchang front door",
    access = {
      job = {},
      business = {
        ["wuchang"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "wuchang front door",
    active = true,
    id = 383,
    coords = vector3(-826.4025, -697.9944, 28.49083),
    model = 2001816392,
    lock = true,
    desc = "wuchang front door",
    access = {
      job = {},
      business = {
        ["wuchang"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "wuchang front door",
    active = true,
    id = 384,
    coords = vector3(-826.4025, -698.7478, 28.49083),
    model = 2001816392,
    lock = true,
    desc = "wuchang front door",
    access = {
      job = {},
      business = {
        ["wuchang"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "wuchang front door",
    active = true,
    id = 385,
    coords = vector3(-826.4025, -700.9301, 28.49083),
    model = 2001816392,
    lock = true,
    desc = "wuchang front door",
    access = {
      job = {},
      business = {
        ["wuchang"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "wuchang garage door",
    active = true,
    id = 386,
    coords = vector3(-816.2236, -740.1801, 24.24792),
    model = -700626879,
    lock = true,
    keyFob = true,
    desc = "wuchang garage door",
    access = {
      job = {},
      business = {
        ["wuchang"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "wuchang ceo",
    active = true,
    id = 387,
    coords = vector3(-822.0345, -703.1276, 32.48665),
    model = 693644064,
    lock = true,
    desc = "wuchang ceo door",
    access = {
      job = {},
      business = {
        ["wuchang"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino inside track left",
    active = true,
    id = 388,
    coords = vector3(1008.494, 63.48211, 70.61002),
    model = 680601509,
    lock = false,
    desc = "casino inside track left",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casino inside track right",
    active = true,
    id = 389,
    coords = vector3(1010.441, 63.93729, 70.61002),
    model = 680601509,
    lock = false,
    desc = "casino inside track right",
    access = {
      job = {},
      business = {
        ["casino"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "wuchangstoreroom",
    active = true,
    id = 390,
    coords = vector3(-823.1431, -711.9124, 23.92465),
    model = -2023754432,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["wuchang"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "wuchangstoreroom",
    active = true,
    id = 391,
    coords = vector3(-820.6585, -715.6949, 23.93994),
    model = -2023754432,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["wuchang"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "yogadoor1",
    active = true,
    id = 392,
    coords = vector3(1157.34, -452.78, 67.05),
    model = -1666470363,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["happy_yoga"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "yogadoor2",
    active = true,
    id = 393,
    coords = vector3(1164.62, -454.83, 67.05),
    model = -1666470363,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["happy_yoga"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "yogadoor3",
    active = true,
    id = 394,
    coords = vector3(1158.73, -447.94, 67.08),
    model = 1743859485,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["happy_yoga"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "casinohidden",
    active = true,
    id = 395,
    coords = vector3(969.6023, 47.0294, 116.2636),
    model = -242110718,
    lock = true,
    desc = "",
    access = {
      cid = {
        [3503] = true,
      },
      job = {},
      business = {
        ["creampie"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "nudist camp doors",
    active = true,
    id = 396,
    coords = vector3(-1044.749, 4914.972, 209.953),
    model = -1578791031,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["roosterranch"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "nudist camp doors",
    active = true,
    id = 397,
    coords = vector3(-1041.233, 4906.101, 209.96),
    model = -13153749,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["roosterranch"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "blazin tattoos",
    active = true,
    id = 398,
    coords = vector3(321.8085, 178.3599, 103.6782),
    model = 543652229,
    lock = false,
    desc = "",
    access = {
      job = {},
      business = {
        ["btat"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "blazin tattoos",
    active = true,
    id = 399,
    coords = vector3(320.5102, 184.7164, 103.7365),
    model = 1243635233,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["btat"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "mayor office",
    active = true,
    id = 400,
    coords = vector3(-566.0358, -200.2471, 38.34028),
    model = 110411286,
    lock = true,
    desc = "",
    access = {
      job = {
        ["mayor"] = true,
        ["deputy_mayor"] = true,
      },
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "lfb front",
    active = true,
    id = 401,
    coords = vector3(1395.92, 1140.705, 114.7902),
    model = 262671971,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "burgershot employee door",
    active = true,
    id = 402,
    coords = vector3(-1179.221, -891.50, 14.0),
    model = -1300743830,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
	  ["burger_shot"] = true,
	},
    },
  },
  {
    info = "lfb front",
    active = true,
    id = 403,
    coords = vector3(1395.92, 1142.90, 114.8),
    model = 1504256620,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "burgershot employee door kitchen",
    active = true,
    id = 404,
    coords = vector3(-1193.9, -900.4, 14.24),
    model = -1448591934,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
	  ["burger_shot"] = true,
	},
    },
  },
  {
    info = "lfb front left",
    active = true,
    id = 405,
    coords = vector3(1395.828, 1153.858, 114.4834),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb front left",
    active = true,
    id = 406,
    coords = vector3(1395.828, 1151.659, 114.4834),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb front far left",
    active = true,
    id = 407,
    coords = vector3(1390.478, 1163.438, 114.4832),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb front far left",
    active = true,
    id = 408,
    coords = vector3(1390.478, 1161.238, 114.4832),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb front right",
    active = true,
    id = 409,
    coords = vector3(1390.666, 1133.317, 114.4808),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb front right",
    active = true,
    id = 410,
    coords = vector3(1390.666, 1131.117, 114.4808),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb right",
    active = true,
    id = 411,
    coords = vector3(1398.289, 1128.314, 114.4836),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb right",
    active = true,
    id = 412,
    coords = vector3(1400.489, 1128.314, 114.4836),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb right",
    active = true,
    id = 413,
    coords = vector3(1400.488, 1128.314, 114.4836),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb right",
    active = true,
    id = 414,
    coords = vector3(1402.688, 1128.314, 114.4836),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back",
    active = true,
    id = 415,
    coords = vector3(1409.292, 1144.054, 114.4869),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back",
    active = true,
    id = 416,
    coords = vector3(1409.292, 1146.254, 114.4869),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back",
    active = true,
    id = 417,
    coords = vector3(1409.292, 1146.254, 114.4869),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back",
    active = true,
    id = 418,
    coords = vector3(1409.292, 1148.454, 114.4869),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back",
    active = true,
    id = 419,
    coords = vector3(1409.292, 1148.454, 114.4869),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back",
    active = true,
    id = 420,
    coords = vector3(1409.292, 1150.654, 114.4869),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back right",
    active = true,
    id = 421,
    coords = vector3(1408.581, 1161.165, 114.4833),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back right",
    active = true,
    id = 422,
    coords = vector3(1408.581, 1158.965, 114.4833),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back far right",
    active = true,
    id = 423,
    coords = vector3(1408.581, 1165.834, 114.4833),
    model = -1032171637,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lfb back far right",
    active = true,
    id = 424,
    coords = vector3(1408.581, 1163.634, 114.4833),
    model = -52575179,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["le_fuente_blanca"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Otto's back door",
    active = true,
    id = 425,
    coords = vector3(835.07501220703, -816.44854736328, 26.672168731689),
    model = 2142711795,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["ottos_auto"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Otto's side door",
    active = true,
    id = 426,
    coords = vector3(824.87268066406, -820.35577392578, 26.623023986816),
    model = 2142711795,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["ottos_auto"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Otto's garage door",
    active = true,
    id = 427,
    coords = vector3(825.89849853516, -825.54052734375, 29.298183441162),
    model = 750116887,
    lock = true,
    desc = "",
    keyFob = true,
    access = {
      job = {},
      business = {
        ["ottos_auto"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "burgershot boss door",
    active = true,
    id = 428,
    coords = vector3(-1182.1, -895.5, 14.1),
    model = 1042741067,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
	  ["burger_shot"] = true,
	},
    },
  },
  {
    info = "burgershot pier door",
    active = true,
    id = 429,
    coords = vector3(-1680.79, -1095.9, 13.3),
    model = -1300743830,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
	  ["burger_shot"] = true,
	},
    },
  },
  {
    info = "burgershot pier window",
    active = true,
    id = 430,
    coords = vector3(-1687.12, -1091.7, 12.2),
    model = -1518705307,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
	  ["burger_shot"] = true,
	},
    },
  },
  {
    info = "methlab_ja", --jazz
    active = true,
    id = 431,
    coords = vector3(50.23402, -2689.355, -1.678635),
    model = 362975687,
    lock = false,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "methlab_mt", -- megatron
    active = true,
    id = 432,
    coords = vector3(2451.212, 1578.782, 25.04652),
    model = 362975687,
    lock = false,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "methlab_bc", -- bonecrusher
    active = true,
    id = 433,
    coords = vector3(182.3292, 2432.331, 51.04614),
    model = 362975687,
    lock = false,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "gallery cg warehouse door",
    active = true,
    id = 434,
    coords = vector3(-445.0654, -26.46161, 44.72485),
    model = 1221385821,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "wuchang doors",
    active = true,
    id = 435,
    coords = vector3(-819.4991, -711.9124, 28.2056),
    model = 693644064,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["wuchang"] = true,
      },
    },
    forceUnlocked = false,
    hidden = true,
  },
  {
    info = "prison_kitchen",
    active = true,
    id = 436,
    coords = vector3(1789.201, 2558.44, 45.82531),
    model = -1033001619,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "prison_garden1",
    active = true,
    id = 437,
    coords = vector3(1697.409, 2541.411, 46.26889),
    model = -1156020871,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "prison_garden2",
    active = true,
    id = 438,
    coords = vector3(1697.409, 2544.789, 46.26889),
    model = -1156020871,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "prison_gym",
    active = true,
    id = 439,
    coords = vector3(1771.956, 2493.91, 45.97048),
    model = -1437850419,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "prison_showers",
    active = true,
    id = 440,
    coords = vector3(1738.991, 2492.181, 45.97176),
    model = -1033001619,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "prison_scrap",
    active = true,
    id = 441,
    coords = vector3(1640.017, 2538.436, 46.28986),
    model = -1156020871,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "prison_scrap",
    active = true,
    id = 442,
    coords = vector3(1642.188, 2541.023, 46.28986),
    model = -1156020871,
    lock = false,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "bobcat surevilence",
    active = true,
    id = 443,
    coords = vector3(882.3375, -2295.273, 30.61766),
    model = -311575617,
    lock = true,
    desc = "",
    access = {
      job = {},
    },
    forceUnlocked = false,
  },
  {
    info = "waynes green beans",
    active = true,
    id = 444,
    coords = vector3(1330.11,4382.85,44.25),
    model = 227019171,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["green_beans"] = true
      }
    },
    forceUnlocked = false,
  },
  {
    info = "lsbb office left entrance",
    active = true,
    id = 445,
    coords = vector3(-894.543,-442.47,141.17),
    model = 220394186,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["lsbb"] = true
      }
    }
  },
  {
    info = "lsbb office right entrance",
    active = true,
    id = 446,
    coords = vector3(-894.27,-442.99,142.36),
    model = 220394186,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["lsbb"] = true
      }
    }
  },
  {
    info = "bob mulet main right door",
    active = true,
    id = 447,
    coords = vector3(-823.1,-187.82,37.57),
    model = 145369505,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["bobby_brown"] = true
      }
    }
  },
  {
    info = "bob mulet main left door",
    active = true,
    id = 448,
    coords = vector3(-822.7,-187.01,37.57),
    model = -1663512092,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["bobby_brown"] = true
      }
    }
  },
  {
    info = "split sides comedy club front left door",
    active = true,
    id = 449,
    connected = 450,
    coords = vector3(-430.74,262.75,83.02),
    model = 2059227086,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["split_sides"] = true
      }
    }
  },
  {
    info = "split sides comedy club front right door",
    active = true,
    id = 450,
    connected = 449,
    coords = vector3(-429.23,262.61,83.02),
    model = 1417577297,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["split_sides"] = true
      }
    }
  },
  {
    info = "Ace Industries Backdoor",
    active = true,
    id = 451,
    coords = vector3(1065.237, -2006.079, 32.23295),
    model = -1428622127,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["ace_industries"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Ace Industries Frontdoor",
    active = true,
    id = 452,
    coords = vector3(1083.547, -1975.435, 31.62222),
    model = -1428622127,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["ace_industries"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "hayes staff door",
    active = true,
    id = 453,
    coords = vector3(-1427.525, -455.6805, 36.05956),
    model = 1289778077,
    lock = true,
    desc = "",
    access = {
        job = {},
        business = {
            ["hayes_autos"] = true
        }
    }
  },
  {
    info = "harmony repairs right gate",
    active = true,
    id = 454,
    coords = vector3(1176.224, 2645.41, 40.39615),
    model = -822900180,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
        job = {},
        business = {
            ["harmony_repairs"] = true
        }
    }
  },
  {
    info = "harmony repairs left gate",
    active = true,
    id = 455,
    coords = vector3(1182.307, 2644.167, 40.50731),
    model = -822900180,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
        job = {},
        business = {
            ["harmony_repairs"] = true
        }
    }
  },
  {
    info = "harmony repairs door",
    active = true,
    id = 456,
    coords = vector3(1187.203, 2644.95, 38.55177),
    model = 1335311341,
    lock = true,
    desc = "",
    access = {
        job = {},
        business = {
            ["harmony_repairs"] = true
        }
    }
  },
  {
    info = "Ace Industries Roof",
    active = true,
    id = 457,
    coords = vector3(1085.242, -2018.58, 41.66173),
    model = -1428622127,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["ace_industries"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Ace Industries Container",
    active = true,
    id = 458,
    coords = vector3(838.3782, -2882.322, 11.66133),
    model = -2125774984,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["ace_industries"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "lean house saab door",
    active = true,
    id = 459,
    coords = vector3(-1801.696, 435.0674, 132.4441),
    model = 1042741067,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house tony door",
    active = true,
    id = 460,
    coords = vector3(-1794.633, 436.414, 132.4413),
    model = 1042741067,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house buddha door",
    active = true,
    id = 461,
    coords = vector3(-1794.48, 428.2709, 133.1517),
    model = -1255706107,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house hidden door 2nd floor",
    active = true,
    id = 462,
    coords = vector3(-1799.852, 437.2056, 132.4011),
    model = -2133308674,
    lock = true,
    hidden = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house hidden door den",
    active = true,
    id = 463,
    coords = vector3(-1797.073, 441.1661, 129.0888),
    model = 655398764,
    lock = true,
    hidden = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house front door",
    active = true,
    id = 464,
    coords = vector3(-1805.098, 436.0744, 129.2558),
    model = -1527723153,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house back door",
    active = true,
    id = 465,
    coords = vector3(-1804.114, 429.082, 128.9164),
    model = -1527723153,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house front gate right",
    active = true,
    id = 466,
    coords = vector3(-1801.342, 474.8882, 134.5201),
    model = -1249591818,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house front gate left",
    active = true,
    id = 467,
    coords = vector3(-1799.039, 470.6359, 133.9505),
    model = 546378757,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house front gate side door",
    active = true,
    id = 468,
    coords = vector3(-1798.231, 468.8248, 133.7756),
    model = 724862427,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house balcony door 2nd floor",
    active = true,
    id = 469,
    coords = vector3(-1816.872, 428.6213, 132.5938),
    model = 656216807,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "Lean house discrete office exit door",
    active = true,
    id = 470,
    coords = vector3(-1813.318, 446.4231, 128.7794),
    model = -524036376,
    hidden = true,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house buddha balcony door",
    active = true,
    id = 471,
    coords = vector3(-1791.517, 419.0124, 132.5361),
    model = 2060651272,
    hidden = true,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house bottom walkway door",
    active = true,
    id = 472,
    coords = vector3(-1803.85, 402.6962, 114.2254),
    model = -1568354151,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house bottom driveway right gate",
    active = true,
    id = 473,
    coords = vector3(-1862.484, 351.442, 89.79803),
    model = -1249591818,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "lean house bottom driveway left gate",
    active = true,
    id = 474,
    coords = vector3(-1867.078, 349.4299, 90.0629),
    model = 546378757,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["clean_manor"] = true
      }
    }
  },
  {
    info = "yachtvault",
    active = true,
    id = 475,
    coords = vector3(-2071.79, -1019.254, 3.306306),
    model = -2050208642,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {}
    }
  },
  {
    info = "comic store back door 1",
    active = true,
    id = 476,
    coords = vector3(-138.995, 221.3845, 95.144),
    model = 1715961343,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["comic_store"] = true
      }
    }
  },
  {
    info = "comic store back door 2",
    active = true,
    id = 477,
    coords = vector3(-147.8129, 220.7639, 95.16154),
    model = -905400395,
    lock = true,
    desc = "",
    access = {
      cid = {
        [4109] = true,
        [3827] = true,
        [3835] = true,
        [3826] = true,
        [3905] = true,
        [4108] = true,
        [4702] = true,
        [3668] = true,
        [1180] = true,
      },
      job = {},
      business = {
        -- ["comic_store"] = true,
      },
    },
  },
  {
    info = "comic store front door 1",
    active = true,
    id = 478,
    coords = vector3(-142.47, 228.695, 95.13654),
    model = 1483722564,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["comic_store"] = true,
      },
    },
  },
  {
    info = "comic store front door 2",
    active = true,
    id = 479,
    coords = vector3(-145.0708, 228.685, 95.13654),
    model = -1508283750,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["comic_store"] = true,
      },
    },
  },
  {
    info = "prison yard gate",
    active = true,
    id = 480,
    coords = vector3(1777.072, 2526.244, 44.7),
    model = 741314661,
    lock = true,
    keyFob = true,
    desc = "",
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
  },
  {
    desc = "vu onlyfans",
    model = 390840000,
    lock = true,
    active = true,
    id = 481,
    coords = vector3(116.75, -1295.29, 29.27),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["vanilla_unicorn"] = true,
      },
    },
  },
  {
    desc = "vu dressing room",
    model = 390840000,
    lock = true,
    active = true,
    id = 482,
    coords = vector3(113.93, -1296.77, 29.27),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["vanilla_unicorn"] = true,
      },
    },
  },
  {
    desc = "vu office",
    model = 390840000,
    lock = true,
    active = true,
    id = 483,
    coords = vector3(99.69, -1293.36, 29.27),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["vanilla_unicorn"] = true,
      },
    },
  },
  {
    desc = "container stash left",
    model = -732110077,
    lock = true,
    active = true,
    id = 484,
    coords = vector3(1613.237, 3766.592, 35.07693),
    forceUnlocked = false,
    hidden = true,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "container stash right",
    model = 2063347779,
    lock = true,
    active = true,
    id = 485,
    coords = vector3(1615.339, 3768.108, 35.07693),
    forceUnlocked = false,
    hidden = true,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "afterlife tuning garage door",
    model = -190780785,
    lock = false,
    active = true,
    keyFob = true,
    id = 486,
    coords = vector3(1204.279, -3110.176, 5.954),
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ['afterlife_tuning'] = true,
      },
    },
  },
  {
    desc = "white widow barn",
    model = -419676332,
    lock = true,
    active = true,
    keyFob = true,
    id = 487,
    coords = vector3(2200.164, 5610.173, 54.20002),
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ['white_widow'] = true,
      },
    },
  },
  {
    desc = "white widow barn",
    model = -419676332,
    lock = true,
    active = true,
    keyFob = true,
    id = 488,
    coords = vector3(2193.882, 5611.749, 54.20002),
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ['white_widow'] = true,
      },
    },
  },
  {
    desc = "service hotel 1",
    model = -192278810,
    lock = true,
    active = true,
    id = 489,
    coords = vector3(900.5447, -65.38408, 21.15001),
    forceUnlocked = false,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "service hotel 2",
    model = -192278810,
    lock = true,
    active = true,
    id = 490,
    coords = vector3(901.5468, -63.7706, 21.15001),
    forceUnlocked = false,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "service hotel 3",
    model = -170420121,
    lock = true,
    active = true,
    id = 491,
    coords = vector3(883.7767, -50.52394, 21.14943),
    forceUnlocked = false,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "service hotel 4",
    model = 1090039464,
    lock = true,
    active = true,
    id = 492,
    coords = vector3(882.7746, -52.13742, 21.14943),
    forceUnlocked = false,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "container docks left",
    model = 432595310,
    lock = true,
    active = true,
    id = 493,
    coords = vector3(558.0349, -2965.121, 6.432801),
    forceUnlocked = false,
    hidden = true,
    access = {
      job = {},
      business = {},
      cid = {
        [1001] = true,
        [1006] = true,
        [3503] = true,
      },
    },
  },
  {
    desc = "container docks right",
    model = 713382487,
    lock = true,
    active = true,
    id = 494,
    coords = vector3(558.0347, -2967.713, 6.432801),
    forceUnlocked = false,
    hidden = true,
    access = {
      job = {},
      business = {},
      cid = {
        [1001] = true,
        [1006] = true,
        [3503] = true,
      },
    },
  },
  {
    desc = "container rex left",
    model = 211577459,
    lock = true,
    active = true,
    id = 495,
    coords = vector3(2523.638, 2607.401, 38.35254),
    forceUnlocked = false,
    hidden = true,
    access = {
      job = {},
      business = {},
      cid = {
        [1001] = true,
        [1006] = true,
        [3503] = true,
      },
    },
  },
  {
    desc = "container rex right",
    model = -915924581,
    lock = true,
    active = true,
    id = 496,
    coords = vector3(2521.971, 2605.415, 38.35254),
    forceUnlocked = false,
    hidden = true,
    access = {
      job = {},
      business = {},
      cid = {
        [1001] = true,
        [1006] = true,
        [3503] = true,
      },
    },
  },
  {
    desc = "mine reef left",
    model = 237621997,
    lock = true,
    active = true,
    id = 497,
    coords = vector3(-964.116, 4898.714, 175.2678),
    forceUnlocked = false,
    hidden = true,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "mine reef right",
    model = 237621997,
    lock = true,
    active = true,
    id = 498,
    coords = vector3(-964.3664, 4896.293, 175.2535),
    forceUnlocked = false,
    hidden = true,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "ottos warehouse",
    model = -96409171,
    lock = true,
    active = true,
    keyFob = true,
    id = 499,
    coords = vector3(844.4457, -894.2934, 24.69),
    forceUnlocked = false,
    hidden = false,
    access = {
      job = {},
      business = {
        ['hno_imports'] = true,
      },
    }
  },
  {
    desc = "hoa bench left",
    model = -732110077,
    lock = true,
    active = true,
    keyFob = false,
    id = 500,
    coords = vector3(2463.217, 3440.813, 50.31119),
    hidden = true,
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ["tavern"] = true,
      }
    }
  },
  {
    desc = "hoa bench right",
    model =2063347779,
    lock = true,
    active = true,
    keyFob = false,
    id = 501,
    coords = vector3(2465.798, 3441.039, 50.3119),
    hidden = true,
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ["tavern"] = true,
      }
    }
  },
  {
    info = "prcellmain",
    active = true,
    id = 502,
    coords = vector3(383.407, 798.2911, 187.611),
    model = 517369125,
    lock = true,
    desc = "park ranger cell main",
    access = {
      job = {
        ["PD"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    desc = "bean manor ped gate",
    model = -1568354151,
    lock = true,
    active = true,
    id = 503,
    coords = vector3(-849.27,178.61,69.82),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["bean_manor"] = true,
      },
    },
  },
  {
    desc = "bean manor car gate",
    model = -2125423493,
    lock = true,
    active = true,
    keyFob = true,
    id = 504,
    coords = vector3(-843.5,156.03,66.88),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["bean_manor"] = true,
      },
    },
  },  
  {
    desc = "bean manor front door left",
    model = 159994461,
    lock = true,
    active = true,
    id = 505,
    connected = 506,
    coords = vector3(-817.16,178.59,72.23),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["bean_manor"] = true,
      },
    },
  },
  {
    desc = "bean manor front door right",
    model = -1686014385,
    lock = true,
    active = true,
    id = 506,
    connected = 505,
    coords = vector3(-816.62,177.41,72.23),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["bean_manor"] = true,
      },
    },
  },
  {
    desc = "bean manor garage inside door",
    model = 2731327123,
    lock = true,
    active = true,
    id = 507,
    coords = vector3(-807.08,185.8,72.49),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["bean_manor"] = true,
      },
    },
  },
  {
    desc = "bean manor backdoor 1 left",
    model = 1245831483,
    lock = true,
    active = true,
    id = 508,
    connected = 509,
    coords = vector3(-794.33,181.95,72.84),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["bean_manor"] = true,
      },
    },
  },
  {
    desc = "bean manor backdoor 1 right",
    model = 2840207166,
    lock = true,
    active = true,
    id = 509,
    connected = 508,
    coords = vector3(-793.54,181.01,72.84),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["bean_manor"] = true,
      },
    },
  },
  {
    desc = "bean manor backdoor 2 left",
    model = 1245831483,
    lock = true,
    active = true,
    id = 510,
    connected = 511,
    coords = vector3(-795.02,178.04,72.84),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["bean_manor"] = true,
      }
    }
  },
  {
    desc = "bean manor backdoor 2 right",
    model = 2840207166,
    lock = true,
    active = true,
    id = 511,
    connected = 510,
    coords = vector3(-796.07,177.38,72.84),
    forceUnlocked = false,
    access = {
      job = {
        ["PD"] = true,
      },
      business = {
        ["bean_manor"] = true,
      }
    }
  },
  {
    desc = "fleeca pink cage",
    model = -1591004109,
    lock = false,
    active = true,
    keyFob = false,
    id = 512,
    coords = vector3(314.6238708496094,-285.9944763183594,54.46300888061523),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {}
    }
  },
  {
    desc = "fleeca hawick",
    model = -1591004109,
    lock = false,
    active = true,
    keyFob = false,
    id = 513,
    coords = vector3(-350.41436767578127,-56.79705429077148,49.33479690551758),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {}
    }
  },
  {
    desc = "fleeca lifeinvader",
    model = -1591004109,
    lock = false,
    active = true,
    keyFob = false,
    id = 514,
    coords = vector3(-1207.3282470703126,-335.1289367675781,38.07925415039062),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {}
    }
  },
  {
    desc = "fleeca great ocean",
    model = -1591004109,
    lock = false,
    active = true,
    keyFob = false,
    id = 515,
    coords = vector3(-2956.1162109375,485.42059326171877,15.99530887603759),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {}
    }
  },
  {
    desc = "fleeca harmony",
    model = -1591004109,
    lock = false,
    active = true,
    keyFob = false,
    id = 516,
    coords = vector3(1172.2911376953126,2713.146240234375,38.38625335693359),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {}
    }
  },
  {
    desc = "paleto bank inner",
    model = 1309269072,
    lock = true,
    active = true,
    keyFob = false,
    id = 517,
    coords = vector3(-106.0188, 6475.636, 31.71636),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {}
    }
  },
  {
    desc = "tuna garage 1",
    model = -456733639,
    lock = true,
    active = true,
    keyFob = true,
    id = 518,
    coords = vector3(154.8404, -3023.889, 8.649611),
    forceUnlocked = false,
    access = {
      job = {},
      business = {
	      ["tuner_shop"] = true,
	    },
    },
  },
  {
    desc = "tuna garage 2",
    model = -456733639,
    lock = true,
    active = true,
    keyFob = true,
    id = 519,
    coords = vector3(154.866, -3034.051, 9.118645),
    forceUnlocked = false,
    access = {
      job = {},
      business = {
	      ["tuner_shop"] = true,
	    },
    },
  },
  {
    desc = "tuna inside container door",
    model = -1229046235,
    lock = true,
    active = true,
    id = 520,
    coords = vector3(151.4668, -3011.705, 7.258367),
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ["tuner_shop"] = true,
      },
    },
  },
  {
    desc = "tuna garage side door",
    model = -2023754432,
    lock = true,
    active = true,
    id = 521,
    coords = vector3(154.9345, -3017.323, 7.190679),
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ["tuner_shop"] = true,
      },
    },
  },
  {
    desc = "iron hog office front",
    model = -1640268312,
    lock = true,
    active = true,
    keyFob = false,
    id = 522,
    coords = vector3(1775.87,3327.05,41.44),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {
        ["iron_hog"] = true,
      }
    }
  },
  {
    desc = "iron hog office side",
    model = 1342464176,
    lock = true,
    active = true,
    keyFob = false,
    id = 523,
    coords = vector3(1771.63,3325.99,41.44),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {
        ["iron_hog"] = true,
      }
    }
  },
  {
    desc = "iron hog back door",
    model = 190770132,
    lock = true,
    active = true,
    keyFob = false,
    id = 524,
    coords = vector3(1764.72,3320.56,41.44),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {
        ["iron_hog"] = true,
      }
    }
  },
  {
    desc = "iron hog back shutter",
    model = -477703476,
    lock = true,
    active = true,
    keyFob = true,
    id = 525,
    coords = vector3(1760.42,3327.86,41.43),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {
        ["iron_hog"] = true,
      }
    }
  },
  {
    desc = "iron hog back gate",
    model = -768731720,
    lock = true,
    active = true,
    keyFob = true,
    id = 526,
    coords = vector3(1756.19,3314.01,41.1),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {
        ["iron_hog"] = true,
      }
    }
  },
  {
    desc = "casino next to cashier",
    model = 401003935,
    lock = true,
    active = true,
    hidden = true,
    id = 527,
    coords = vector3(991.7479, 25.03326, 71.61443),
    forceUnlocked = false,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "casino bj room left",
    model = 680601509,
    lock = true,
    active = true,
    hidden = true,
    id = 528,
    coords = vector3(1026.787, 32.43253, 70.01295),
    forceUnlocked = false,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "casino bj room right",
    model = 680601509,
    lock = true,
    active = true,
    hidden = true,
    id = 529,
    coords = vector3(1025.09, 33.49028, 70.01295),
    forceUnlocked = false,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "casino office room",
    model = 401003935,
    lock = true,
    active = true,
    hidden = true,
    id = 530,
    coords = vector3(1013.781, 60.43001, 75.21561),
    forceUnlocked = false,
    access = {
      job = {},
      business = {},
    },
  },
  {
    desc = "toll tuner in",
    model = 1230099731,
    lock = true,
    active = false,
    id = 531,
    coords = vector3(186.0603, -2962.101, 6.138632),
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ["tollsrus"] = true,
      },
    },
  },
  {
    desc = "toll tuner out",
    model = 1230099731,
    lock = true,
    active = false,
    id = 532,
    coords = vector3(191.5592, -2963.146, 6.122454),
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ["tollsrus"] = true,
      },
    },
  },
  -- Public businesses
  {
    desc = "QF front door",
    model = 190770132,
    lock = false,
    active = true,
    keyFob = false,
    id = 533,
    coords = vector3(981.1505, -103.2552, 74.99358),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {
        ['PD'] = true,
      },
      business = {
        ["lostmc_orange"] = true,
      }
    }
  },
  {
    desc = "Tequi-la-la front door",
    model = 993120320,
    lock = false,
    active = true,
    keyFob = false,
    id = 534,
    coords = vector3(-564.8447, 276.5479, 83.40131),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ["teqilala_public"] = true,
      }
    }
  },
  {
    desc = "Tequi-la-la back door",
    model = 993120320,
    lock = false,
    active = true,
    keyFob = false,
    id = 535,
    coords = vector3(-561.6571, 293.587, 88.02165),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ["teqilala_public"] = true,
      }
    }
  },
  {
    desc = "Bahama Mamas front door",
    model = -131296141,
    lock = false,
    active = true,
    keyFob = false,
    id = 536,
    connected = 537,
    coords = vector3(-1389.206, -588.0374, 30.46426),
    hidden = false,
    forceUnlocked = false,
    access = {
      job = {},
      business = {
        ["bahamas_public"] = true,
      }
    }
  },
  {
    desc = "Bahama Mamas front door",
    model = -131296141,
    lock = false,
    active = true,
    keyFob = false,
    id = 537,
    connected = 536,
    coords = vector3(-1387.562, -586.9103, 30.63508),
    hidden = false,
    access = {
      job = {},
      business = {
        ["bahamas_public"] = true,
      }
    }
  },
  {
    desc = "paleto pet store",
    model = 1817008884,
    lock = true,
    active = true,
    keyFob = false,
    id = 538,
    coords = vector3(-291.39892578125,6293.63232421875,31.89246559143066),
    hidden = false,
    access = {
      job = {},
      business = {
        ["petstore"] = true,
      }
    }
  },
  {
    desc = "split sides office door",
    model = 1289778077,
    lock = true,
    active = true,
    keyFob = false,
    id = 539,
    coords =  vector3(-435.1729, 276.7924, 83.41138),
    hidden = false,
    access = {
      job = {},
      business = {
        ["split_sides"] = true,
      }
    }
  },
  {
    desc = "lsbb container left",
    model = -732110077,
    lock = true,
    active = true,
    keyFob = false,
    id = 540,
    connected = 541,
    coords =  vector3(448.49,-2555.48,6.39),
    hidden = false,
    access = {
      job = {},
      business = {
        ["hades"] = true,
      }
    },
    hidden = true,
  },
  {
    desc = "lsbb container right",
    model = 2063347779,
    lock = true,
    active = true,
    keyFob = false,
    id = 541,
    connected = 540,
    coords =  vector3(448.54,-2557.13,6.4),
    hidden = false,
    access = {
      job = {},
      business = {
        ["hades"] = true,
      }
    },
    hidden = true,
  },
  {
    desc = "tuner toll in",
    model = -1868050792,
    lock = false,
    active = true,
    id = 542,
    coords =  vector3(191.3846, -2957.634, 6.035212),
    hidden = true,
    access = {
      job = {},
      business = {}
    }
  },
  {
    desc = "tuner toll out",
    model = -1635161509,
    lock = false,
    active = true,
    id = 543,
    coords =  vector3(191.3824, -2957.635, 6.035177),
    hidden = true,
    access = {
      job = {},
      business = {}
    }
  },
  {
    desc = "comic store secret cave door",
    model = -1243663232,
    lock = true,
    active = true,
    id = 544,
    coords =  vector3(-141.642,227.93,86.93),
    hidden = true,
    access = {
      job = {},
      business = {
        ["comic_store"] = true
      }
    }
  },
  {
    desc = "comic store lower room door",
    model = -905400395,
    lock = true,
    active = true,
    id = 545,
    coords =  vector3(-151.60,228.62,89.25),
    access = {
      job = {},
      business = {
        ["comic_store"] = true
      }
    }
  },
  {
    info = "",
    active = true,
    id = 546,
    coords = vector3(-315.4244, 213.80397, 87.876106),
    model = -1989765534,
    lock = true,
    desc = "CIRCLESideDoor_R",
    access = {
      job = {},
      business = {
	      ["red_circle"] = true,
	    },
    },
  },
  {
    info = "",
    active = true,
    id = 547,
    coords = vector3(-316.2065, 215.14236, 87.876098),
    model = -1989765534,
    lock = true,
    desc = "CIRCLESideDoor_L",
    access = {
      job = {},
      business = {
	      ["red_circle"] = true,
	    },
    },
  },
  {
    info = "",
    active = true,
    id = 548,
    coords = vector3(-312.68569946289,197.05055236816,100.84106445312),
    model = -1989765534,
    lock = true,
    desc = "CIRCLESideDoorVIP_L",
    access = {
      job = {},
      business = {
	      ["red_circle"] = true,
	    },
    },
  },
  {
    info = "",
    active = true,
    id = 549,
    coords = vector3(-313.05493164062,199.87252807617,100.84106445312),
    model = -1555108147,
    lock = true,
    desc = "CIRCLESideDoorVIP_R",
    access = {
      job = {},
      business = {
	      ["red_circle"] = true,
	    },
    },
  },
  {
    info = "",
    active = true,
    id = 550,
    coords = vector3(-1387.556, -586.8829, 30.31958),
    model = -1119680854,
    lock = true,
    desc = "Bahama Mama Entrance Door",
    access = {
      job = {
        ["bahama_mammas"] = true,
      },
      business = {},
    },
  },
  {
    info = "",
    active = true,
    id = 551,
    coords = vector3(-1388.8160400391, -587.52008056641, 30.267360687256),
    model = -1119680854,
    lock = true,
    desc = "Bahama Mama Entrance Door",
    access = {
      job = {
        ["bahama_mammas"] = true,
      },
      business = {},
    },
  },
  {
    info = "",
    active = true,
    id = 552,
    coords = vector3(-1392.6319580078, -624.68896484375, 30.31923866272),
    model = 401003935,
    lock = true,
    desc = "Bahama Mama Entrance Door",
    access = {
      job = {
        ["bahama_mammas"] = true,
      },
      business = {},
    },
  },
  {
    info = "",
    active = true,
    id = 553,
    coords = vector3(-1392.6319580078, -624.68896484375, 30.31923866272),
    model = 401003935,
    lock = true,
    desc = "Bahama Mama Restricted Back Access",
    access = {
      job = {
        ["bahama_mammas"] = true,
      },
      business = {},
    },
  },
  {
    info = "",
    active = true,
    keyFob = true,
    id = 554,
    coords = vector3(-1395.2965087891, -633.20111083984, 28.695932388306),
    model = -822900180,
    lock = true,
    desc = "Bahama Mama Back Garage Door",
    access = {
      job = {
        ["bahama_mammas"] = true,
      },
      business = {},
    },
  },
  {
    info = "",
    active = true,
    id = 555,
    coords = vector3(-1391.8447265625, -639.83721923828, 28.695373535156),
    model = -2003105485,
    lock = true,
    desc = "Bahama Mama Back Garage Side Door",
    access = {
      job = {
        ["bahama_mammas"] = true,
      },
      business = {},
    },
  },
  {
    info = "",
    active = true,
    id = 556,
    coords = vector3(-1370.8941650391, -607.89190673828, 30.712879180908),
    model = 401003935,
    lock = true,
    desc = "Bahama Mama Boss Room",
    access = {
      job = {
        ["bahama_mammas"] = true,
      },
      business = {},
    },
  },
  {
    info = "Radical Coffee Front Door 1",
    active = true,
    id = 557,
    coords = vector3(-580.78680419922, -1070.0043945312, 22.320922851562),
    model = -69331849,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["uwu_cafe"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Radical Coffee Front Door 2",
    active = true,
    id = 558,
    coords = vector3(-581.18243408203,-1069.859375,22.320922851562),
    model = 526179188,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["uwu_cafe"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Radical Coffee Inside Door 1",
    active = true,
    id = 559,
    coords = vector3(-587.67034912109,-1052.8220214844,22.337768554688),
    model = -1283712428,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["uwu_cafe"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Radical Coffee Office Door",
    active = true,
    id = 560,
    coords = vector3(-594.10546875,-1050.5933837891,22.337768554688),
    model = 2089009131,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["uwu_cafe"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["uwu_cafe"] = true,
      },
      business = {
        ["uwu_cafe"] = true,
      },
    },
    desc = "Radical Coffee Back Gate",
    model = 522844070,
    lock = true,
    active = true,
    keyFob = true,
    id = 561,
    coords = vector3(-600.75164794922,-1059.1252441406,22.539916992188),
    forceUnlocked = false,
  },
  {
    info = "Radical Coffee Door Side Gate Fire Exit",
    active = true,
    id = 562,
    coords = vector3(-601.01538085938,-1055.7098388672,22.556762695312),
    model = 1099436502,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["uwu_cafe"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Radical Coffee Door Back Warehouse",
    active = true,
    id = 563,
    coords = vector3(-593.18243408203,-1055.8286132812,22.337768554688),
    model = -60871655,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["uwu_cafe"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Radical Coffee Door Into Kitchen",
    active = true,
    id = 564,
    coords = vector3(-589.31866455078,-1053.8901367188,22.337768554688),
    model = -60871655,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["uwu_cafe"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "Radical Coffee Upstairs Office 1",
    active = true,
    id = 565,
    coords = vector3(-575.10327148438,-1064.6241455078,26.617553710938),
    model = 2089009131,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {
        ["uwu_cafe"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    desc = "comic store hidden door circle room",
    model = 255485708,
    lock = true,
    active = true,
    hidden = true,
    id = 566,
    coords = vector3(-151.416,223.166,95.076),
    access = {
      job = {},
      business = {
        ["comic_store"] = true
      }
    }
  },
  {
    info = "Container 1",
    active = true,
    id = 567,
    coords = vector3(588.0872,-1876.63,25.26729),
    model = 432595310,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "Container 1",
    active = true,
    id = 568,
    coords = vector3(588.6789,-1875.488,25.26729),
    model = 713382487,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "Container 2",
    active = true,
    id = 569,
    coords = vector3(497.1260,-1959.397,25.26729),
    model = 713382487,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "Container 2",
    active = true,
    id = 570,
    coords = vector3(497.8260,-1960.56,25.00803),
    model = 432595310,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "Container 3",
    active = true,
    id = 571,
    coords = vector3(667.84143, 1286.2534, 360.46661),
    model = -915924581,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "Container 3",
    active = true,
    id = 572,
    coords = vector3(668.18066, 1287.6239, 360.47439),
    model = 211577459,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    info = "VAR Room Thermite Door",
    active = true,
    id = 573,
    coords = vector3(-209.2719, -303.2172, 74.485649),
    model = 749848321,
    lock = true,
    desc = "",
    access = {
      job = {},
      business = {},
    },
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Sandy PD",
    model = -712085785,
    lock = true,
    active = true,
    id = 574,
    coords = vector3(1850.0865, 3682.2006, 34.224658),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Sandy PD",
    model = 1900796983,
    lock = true,
    active = true,
    keyFob = true,
    id = 575,
    coords = vector3(1874.996, 3693.7641, 33.540901),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Sandy PD",
    model = 1900796983,
    lock = true,
    active = true,
    keyFob = true,
    id = 576,
    coords = vector3(1871.848, 3698.3764, 33.570407),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Sandy PD",
    model = -1297471157,
    lock = true,
    active = true,
    id = 577,
    coords = vector3(1849.3847, 3685.1557, 34.228546),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Sandy PD",
    model = -2063446532,
    lock = true,
    active = true,
    id = 578,
    coords = vector3(1856.7169, 3690.0576, 34.219417),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Sandy PD CELL 1",
    model = -1491332605,
    lock = true,
    active = true,
    id = 579,
    coords = vector3(1856.5228, 3696.2529, 34.219387),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Sandy PD CELL 2",
    model = -1491332605,
    lock = true,
    active = true,
    id = 580,
    coords = vector3(1852.3575, 3695.1296, 34.219379),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Sandy PD CELL 3",
    model = -1491332605,
    lock = true,
    active = true,
    id = 581,
    coords = vector3(1849.3736, 3693.6425, 34.219379),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Sandy PD",
    model = -2002725619,
    lock = true,
    active = true,
    id = 582,
    coords = vector3(1853.1873, 3699.9731, 34.264228),
    forceUnlocked = false,
  },
  {
    access = {
      job = {
        ["PD"] = true,
      },
      business = {},
    },
    desc = "Paleto Bank First Gate",
    model = 1622278560,
    lock = true,
    active = true,
    id = 583,
    coords = vector3(-105.1669, 6472.9477, 31.626733),
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 584,
    coords = vector3(200.86154174805,-238.06153869629,53.96484375),
    model = -1226987899,
    lock = true,
    desc = "CASSideDoorVIP_R",
    access = {
      job = {},
      business = {
        ["cosmic_cannabis"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 585,
    coords = vector3(202.06153869629,-240.48791503906,53.947998046875),
    model = -1226987899,
    lock = true,
    desc = "CASSideDoorVIP_L",
    access = {
      job = {},
      business = {
        ["cosmic_cannabis"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 586,
    coords = vector3(187.19999694824,-237.57362365723,54.06591796875),
    model = -2051651622,
    lock = true,
    desc = "CASSideDoorIN_L",
    access = {
      job = {},
      business = {
        ["cosmic_cannabis"] = true,
      },
    },
    forceUnlocked = false,
  },
  {
    info = "",
    active = true,
    id = 587,
    coords = vector3(186.19779968262,-244.06153869629,54.06591796875),
    model = -2051651622,
    lock = true,
    desc = "CASSideDoorIN_R",
    access = {
      job = {},
      business = {
        ["cosmic_cannabis"] = true,
      },
    },
    forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 588,
      coords = vector3(-716.5836, 271.36264, 84.702247),
      model = 1901183774,
      lock = true,
      desc = "Hydra Incorporation Back Door",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["hydra_incorporation"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 589,
      coords = vector3(-714.4052, 265.0986, 84.099876),
      model = 1901183774,
      lock = true,
      desc = "Hydra Incorporation Office",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["hydra_incorporation"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 590,
      coords = vector3(-699.0263, 270.49313, 83.147346),
      model = -1922281023,
      lock = true,
      desc = "Hydra Incorporation Front Left",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["hydra_incorporation"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 591,
      coords = vector3(794.25,-759.44,27.03),
      model = -49173194,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 592,
      coords = vector3(794.25,-757.06,27.03),
      model = 95403626,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 593,
      coords = vector3(810.41,-756.27,26.93),
      model = 1984391163,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 594,
      coords = vector3(805.26,-758.67,25.79),
      model = -357301147,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 595,
      coords = vector3(806.28,-765.81,26.93),
      model = 1984391163,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 596,
      coords = vector3(811.92,-762.43,26.93),
      model = 1984391163,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 597,
      coords = vector3(814.57,-762.82,27.05),
      model = -420112688,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 598,
      coords = vector3(804.49,-767.7,31.42),
      model = 1984391163,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 599,
      coords = vector3(806.89,-764.57,31.42),
      model = 1984391163,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 600,
      coords = vector3(797.4,-758.25,31.42),
      model = 1984391163,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 601,
      coords = vector3(798.68,-763.33,31.42),
      model = 1984391163,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 602,
      coords = vector3(805.66,-747.93,27.03),
      model = 95403626,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "maldinis",
      active = true,
      id = 603,
      coords = vector3(803.28,-747.93,27.03),
      model = -49173194,
      lock = true,
      desc = "",
      access = {
          job = {},
          business = {
              ["maldinis"] = true,
          },
      },
      forceUnlocked = false,
      hidden = false,
      keyFob = false,
    },
    {
      info = "",
      active = true,
      id = 605,
      coords = vector3(952.1832347, -1698.213238, 29.962207),
      model = -982531572,
      lock = true,
      desc = "antgarage",
      keyFob = true,
      access = {
        job = {},
        business = {
          ["maf_racing"] = true,
        },
      },
    },
    {
      info = "",
      active = true,
      id = 606,
      coords = vector3(-699.3745, 271.43505, 83.146766),
      model = -1922281023,
      lock = true,
      desc = "Hydra Incorporation Front Right",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["hydra_incorporation"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 607,
      coords = vector3(-1305.653, -820.1439, 17.148391),
      model = -222270721,
      lock = true,
      desc = "Bay City Door 1",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
    },
    {
      info = "",
      active = true,
      id = 608,
      coords = vector3(-1308.067, -813.9758, 17.14841),
      model = -1508355822,
      lock = true,
      desc = "Bay City Door 2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison Front Door",
      model = -684929024,
      lock = true,
      active = true,
      keyFob = true,
      id = 609,
      coords = vector3(1836.8676, 2592.3825, 46.014335),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison Front Door",
      model = -684929024,
      lock = true,
      active = true,
      keyFob = true,
      id = 610,
      coords = vector3(1831.6004, 2594.3176, 46.014331),
      forceUnlocked = false,
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 611,
      coords = vector3(-152.502, 287.00479, 93.763778),
      model = -1653288146,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 612,
      coords = vector3(-170.2834, 285.84417, 93.763786),
      model = -965106369,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 613,
      coords = vector3(-167.2954, 285.93917, 93.763488),
      model = -369464256,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 614,
      coords = vector3(-171.0516, 303.14376, 100.92312),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 615,
      coords = vector3(-164.9148, 299.71401, 98.892272),
      model = -1407669096,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 615,
      coords = vector3(-165.5571, 300.04196, 98.892356),
      model = -1407669096,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 616,
      coords = vector3(-171.2609, 303.58035, 97.45993),
      model = -2023754432,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 617,
      coords = vector3(-170.6183, 299.74612, 93.76213),
      model = -1089711493,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison Door",
      model = 2024969025,
      lock = true,
      active = true,
      keyFob = true,
      id = 618,
      coords = vector3(1843.6263, 2576.812, 46.014369),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison Door",
      model = 2024969025,
      lock = true,
      active = true,
      keyFob = true,
      id = 619,
      coords = vector3(1836.9606, 2577.1953, 46.014358),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison Door",
      model = -684929024,
      lock = true,
      active = true,
      keyFob = true,
      id = 620,
      coords = vector3(1831.2559, 2594.2543, 46.014354),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = 741314661,
      lock = true,
      active = true,
      keyFob = true,
      id = 621,
      coords = vector3(1663.1889, 2607.2719, 45.552848),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = 741314661,
      lock = true,
      active = true,
      keyFob = true,
      id = 622,
      coords = vector3(1794.6218, 2530.051, 45.55278),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = 741314661,
      lock = true,
      active = true,
      keyFob = true,
      id = 623,
      coords = vector3(1776.723, 2537.6992, 45.552822),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = 741314661,
      lock = true,
      active = true,
      keyFob = true,
      id = 624,
      coords = vector3(1622.0721, 2585.322, 45.552791),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 625,
      coords = vector3(1756.1719, 2492.8017, 45.819355),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 626,
      coords = vector3(1753.1291, 2490.915, 45.818313),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 627,
      coords = vector3(1750.1083, 2489.2009, 45.817348),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 628,
      coords = vector3(1747.1049, 2487.3698, 45.816349),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 629,
      coords = vector3(1744.0555, 2485.9916, 45.815467),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 630,
      coords = vector3(1762.1334, 2496.1074, 45.821254),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 631,
      coords = vector3(1765.1656, 2497.9396, 45.822269),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 632,
      coords = vector3(1771.7846, 2484.2385, 45.81837),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 633,
      coords = vector3(1768.8543, 2482.5195, 45.817405),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 634,
      coords = vector3(1765.6917, 2480.8271, 45.816429),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 635,
      coords = vector3(1762.7978, 2479.0725, 45.815456),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 636,
      coords = vector3(1759.8273, 2477.311, 45.814472),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 637,
      coords = vector3(1756.8933, 2475.601, 45.813514),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 638,
      coords = vector3(1753.8378, 2473.8217, 45.812511),
      forceUnlocked = false,
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "Prison",
      model = -1167410167,
      lock = true,
      active = true,
      keyFob = true,
      id = 639,
      coords = vector3(1750.8309, 2472.2258, 45.81158),
      forceUnlocked = false,
    },
    {
      info = "Bennys Big Gate",
      active = true,
      id = 640,
      coords = vector3(-203.0592, -1310.294, 31.296083),
      model = 1792343474,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["bennys"] = true
        }
      }
    },
    {
      info = "The High Table door",
      active = true,
      id = 641,
      coords = vector3(403.32467, -19.91562, 91.935386),
      model = -807362247,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["high_table"] = true
        }
      }
    },
    {
      info = "The High Table Secret Door",
      active = true,
      id = 642,
      coords = vector3(407.58084, -17.41724, 91.754005),
      model = -973354389,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["high_table"] = true
        }
      }
    },
    {
      info = "The High Table Front Door 1",
      active = true,
      id = 643,
      coords = vector3(390.47872, 0.3657052, 91.93534),
      model = 607720026,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["high_table"] = true
        }
      }
    },
    {
      info = "The High Table Front Door 2",
      active = true,
      id = 644,
      coords = vector3(391.19467, 1.7849518, 92.356727),
      model = 607720026,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["high_table"] = true
        }
      }
    },
    {
      info = "The High Table Office 1",
      active = true,
      id = 645,
      coords = vector3(425.27413, 11.464241, 91.935424),
      model = 389903619,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["high_table"] = true
        }
      }
    },
    {
      info = "The High Table Office 2",
      active = true,
      id = 646,
      coords = vector3(424.56256, 10.471941, 91.935409),
      model = 389903619,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["high_table"] = true
        }
      }
    },
    {
      info = "The High Table Garage Door",
      active = true,
      id = 647,
      coords = vector3(354.99017, 18.802984, 84.756172),
      model = -1140189596,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["high_table"] = true
        }
      },
    },
    {
      info = "The High Table Garage Door",
      active = true,
      id = 648,
      coords = vector3(406.84558, -16.93195, 91.82785),
      model = -973354389,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["high_table"] = true
        }
      },
    },
    {
      info = "Mandem Gate",
      active = true,
      id = 649,
      coords = vector3(-1555.086, -295.8652, 48.308673),
      model = -1603817716,
      lock = true,
      keyFob = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mandem"] = true
        }
      },
    },
    {
      info = "Mandem Door 1",
      active = true,
      id = 650,
      coords = vector3(-1591.44, -248.6838, 53.883487),
      model = -1156020871,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mandem"] = true
        }
      }
    },
    {
      info = "Mandem Door 2",
      active = true,
      id = 651,
      coords = vector3(-1592.158, -250.8962, 53.813953),
      model = -1156020871,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mandem"] = true
        }
      }
    },
    {
      info = "Mandem Door 3",
      active = true,
      id = 652,
      coords = vector3(-1538.011, -232.6831, 52.74195),
      model = -1156020871,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mandem"] = true
        }
      }
    },
    {
      info = "Mandem Door 4",
      active = true,
      id = 653,
      coords = vector3(-1536.942, -234.4416, 52.566539),
      model = -1156020871,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mandem"] = true
        }
      }
    },
    {
      info = "Bahama Door 1",
      active = true,
      id = 654,
      coords = vector3(-1388.897, -587.9653, 30.212306),
      model = -131296141,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["bahama_mama"] = true
        }
      }
    },
    {
      info = "Bahama Door 2",
      active = true,
      id = 655,
      coords = vector3(-1387.171, -586.71, 30.235483),
      model = -131296141,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["bahama_mama"] = true
        }
      }
    },
    {
      info = "Bahama Door 2",
      active = true,
      id = 656,
      coords = vector3(-1391.843, -592.9, 30.319559),
      model = -131296141,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["bahama_mama"] = true
        }
      }
    },
    {
      info = "Bahama Door 2",
      active = true,
      id = 657,
      coords = vector3(-1393.833, -591.4964, 30.319585),
      model = -131296141,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["bahama_mama"] = true
        }
      }
    },
    {
      info = "Cosmic Sliding thing",
      active = true,
      id = 658,
      coords = vector3(174.86578, -237.0949, 49.973064),
      model = 161378502,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["cosmic_cannabis"] = true
        }
      }
    },
    {
      info = "Cosmic Office 1",
      active = true,
      id = 659,
      coords = vector3(182.78153, -243.0897, 54.069778),
      model = -538477509,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["cosmic_cannabis"] = true
        }
      }
    },
    {
      info = "Skybar Door Top Left",
      active = true,
      id = 669,
      coords = vector3(299.4956, -934.8009, 52.813652),
      model = 1308911070,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["skybar"] = true
        }
      }
    },
    {
      info = "Skybar Door Top Right",
      active = true,
      id = 661,
      coords = vector3(299.37677, -933.2196, 52.813644),
      model = -403433025,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["skybar"] = true
        }
      }
    },
    {
      info = "Skybar Door Bottom Right",
      active = true,
      id = 662,
      coords = vector3(304.35696, -938.7468, 29.468168),
      model = 1308911070,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["skybar"] = true
        }
      }
    },
    {
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      desc = "state garage",
      model = 1286535678,
      lock = true,
      active = true,
      keyFob = true,
      id = 663,
      coords = vector3(401.32491, -1609.493448, 29.350799),
      forceUnlocked = false,
    },
    {
      info = "Skybar Door Bottom Left",
      active = true,
      id = 664,
      coords = vector3(302.6751, -938.742, 29.468238),
      model = -403433025,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["skybar"] = true
        }
      }
    },
    {
      info = "",
      active = true,
      id = 665,
      coords = vector3(369.59164428711, -1605.5462646484, 30.051351547241), 
      model = -674638964,
      lock = true,
      desc = "Davis Cell 1",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 666,
      coords = vector3(368.12371826172, -1604.2966308594, 30.05135345459),
      model = -674638964,
      lock = true,
      desc = "Davis Cell 2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 667,
      coords = vector3(370.17150878906, -1614.1611328125, 30.051359176636),
      model = 618295057,
      lock = true,
      desc = "Davis Back Door",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 668,
      coords = vector3(371.52600097656, -1615.1896972656, 30.051355361938),
      model = 1670919150,
      lock = true,
      desc = "Davis Back Door 2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 669,
      coords = vector3(374.27133178711, -1613.2333984375, 30.051355361938),
      model = -1335406364,
      lock = true,
      desc = "Davis Down Stairs Entrence",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 670,
      coords = vector3(383.9621887207, -1601.90234375, 30.051351547241),
      model = -1335406364, 
      lock = true,
      desc = "Davis Downstairs Entrence 2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 671,
      coords = vector3(375.51458740234, -1607.6271972656, 25.451553344727),
      model = -1335406364, 
      lock = true,
      desc = "Davis Observation ",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 672,
      coords = vector3(372.48934936523, -1605.1224365234, 25.451555252075),
      model = -728950481, 
      lock = true,
      desc = "Davis Interigation ",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 673,
      coords = vector3(378.67990112305, -1603.9171142578, 25.451553344727),
      model = -1335406364, 
      lock = true,
      desc = "Davis Mugshot ",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 674,
      coords = vector3(375.96557617188, -1599.7596435547, 25.451545715332),
      model = -674638964, 
      lock = true,
      desc = "Davis Lower Cells ",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 675,
      coords = vector3(374.13369750977, -1598.2724609375, 25.451545715332),
      model = -674638964, 
      lock = true,
      desc = "Davis Lower Cells2 ",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 676,
      coords = vector3(369.38220214844, -1602.5043945313, 25.451549530029),
      model = -1335406364, 
      lock = true,
      desc = "Davis Rest Room",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 677,
      coords = vector3(369.38732910156, -1600.4588623047, 25.451541900635),
      model = -1335406364, 
      lock = true,
      desc = "Davis Double Doors",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 678,
      coords = vector3(370.60369873047, -1599.0008544922, 25.451530456543),
      model = -1335406364, 
      lock = true,
      desc = "Davis Double Doors2",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 679,
      coords = vector3(367.28204345703, -1600.6687011719, 25.451538085938),
      model = -1335406364, 
      lock = true,
      desc = "Davis Armory",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 680,
      coords = vector3(364.35720825195, -1595.5452880859, 25.451557159424),
      model = -1335406364, 
      lock = true,
      desc = "Davis Lockers",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {},
      },
      forceUnlocked = false,
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 681,
      coords = vector3(-168.9729, 285.50805, 93.763771),
      model = 2012678195, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 682,
      coords = vector3(-169.0987, 300.43081, 93.762039),
      model = -1089711493, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "VagosMainDoor",
      active = true,
      id = 683,
      coords = vector3(313.30444, -2040.629, 20.935962),
      model = 872995129, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ESV"] = true
        }
      }
    },
    {
      info = "VagosBackDoor",
      active = true,
      id = 684,
      coords = vector3(306.62966, -2045.355, 20.912454),
      model = 872995129, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ESV"] = true
        }
      }
    },
    {
      info = "VagosDoorInside",
      active = true,
      id = 685,
      coords = vector3(315.90896, -2045.545, 20.976728),
      model = 1770281453, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ESV"] = true
        }
      }
    },
    {
      info = "VagosDoorInside2",
      active = true,
      id = 686,
      coords = vector3(318.85424, -2052.78, 20.976675),
      model = -1083130717, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ESV"] = true
        }
      }
    },
    {
      info = "VagosDoorInside3",
      active = true,
      id = 687,
      coords = vector3(316.6557, -2054.939, 20.976669),
      model = -122922994, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ESV"] = true
        }
      }
    },
    {
      info = "VagosDoorInside4",
      active = true,
      id = 687,
      coords = vector3(323.08551, -2052.466, 24.009424),
      model = -1083130717, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ESV"] = true
        }
      }
    },
    {
      info = "LS-13Door",
      active = true,
      id = 688,
      coords = vector3(-1541.372, 91.702713, 53.897399),
      model = -267022307, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ls13"] = true
        }
      }
    },
    {
      info = "LS-13Door",
      active = true,
      id = 689,
      coords = vector3(-1554.635, 88.123558, 53.874458),
      model = 913989592, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ls13"] = true
        }
      }
    },
    {
      info = "LS-13Door",
      active = true,
      id = 690,
      coords = vector3(-1500.81, 103.69216, 55.673545),
      model = 346577218, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ls13"] = true
        }
      }
    },
    {
      info = "LS-13Door",
      active = true,
      id = 691,
      coords = vector3(-1511.289, 121.01314, 55.64447),
      model = 53021951, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ls13"] = true
        }
      }
    },
    {
      info = "LS-13Door",
      active = true,
      id = 692,
      coords = vector3(-1510.62, 121.70469, 55.64447),
      model = 53021951, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ls13"] = true
        }
      }
    },
    {
      info = "LS-13Door",
      active = true,
      id = 693,
      coords = vector3(-1535.625, 108.79904, 56.778766),
      model = 39269536, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ls13"] = true
        }
      }
    },
    {
      info = "LS-13Door",
      active = true,
      id = 694,
      coords = vector3(-1522.741, 143.01431, 55.652656),
      model = 653721055, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["ls13"] = true
        }
      }
    },
    {
      info = "Cookies",
      active = true,
      id = 695,
      coords = vector3(-933.7551, -1173.367, 5.0426654),
      model = -543490328, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["cookies"] = true
        }
      }
    },
    {
      info = "Cookies",
      active = true,
      id = 696,
      coords = vector3(-931.2297, -1171.456, 5.0857458),
      model = -626684119, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["cookies"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 696,
      coords = vector3(-1465.476, -34.73871, 55.060329),
      model = -1017013428, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 697,
      coords = vector3(-1465.121, -47.3869, 54.639739),
      model = -1017013428, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 698,
      coords = vector3(-1469.122, -59.24728, 54.639694),
      model = -1017013428, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 699,
      coords = vector3(-1473.04, -58.18697, 54.639694),
      model = -1017013428, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 700,
      coords = vector3(-1471.999, -49.23677, 54.63972),
      model = -1017013428, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 701,
      coords = vector3(-1482.62, -49.22259, 54.640327),
      model = -1017013428, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 702,
      coords = vector3(-1480.105, -41.11573, 56.845149),
      model = -1017013428, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 703,
      coords = vector3(-1481, -40.19634, 56.845153),
      model = -1017013428, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 704,
      coords = vector3(-1486.343, -22.42362, 54.653953),
      model = -1017013428, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "Mali Boys",
      active = true,
      id = 705,
      coords = vector3(-1479.907, -37.1025, 54.581924),
      model = -1439683814, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["mali_boys"] = true
        }
      }
    },
    {
      info = "",
      active = true,
      id = 706,
      coords = vector3(-1030.871, -412.2257, 33.261482),
      model = 1880192839,
      keyFob = true,
      lock = true,
      desc = "Hydra Incorporation.",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["hydra_incorporation"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "",
      active = true,
      id = 707,
      coords = vector3(-1038.017, -416.0324, 33.260669),
      model = 1880192839,
      keyFob = true,
      lock = true,
      desc = "Hydra Incorporation.",
      access = {
        job = {
          ["PD"] = true,
        },
        business = {
          ["hydra_incorporation"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 708,
      coords = vector3(-1020.919, -416.8085, 39.616256),
      model = -293262935, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 709,
      coords = vector3(-1021.875, -417.4689, 39.629695),
      model = -293262935, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 710,
      coords = vector3(-1013.296, -434.3142, 39.615547),
      model = -293262935, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 711,
      coords = vector3(-1012.158, -433.4253, 39.626182),
      model = -293262935, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 712,
      coords = vector3(-1027.81, -409.8498, 33.411499),
      model = 1603891869, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 713,
      coords = vector3(-1022.17, -435.152, 77.369262),
      model = 604046929, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 714,
      coords = vector3(-1022.458, -434.0639, 77.369277),
      model = 604046929, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 715,
      coords = vector3(-1022.738, -428.8113, 75.461463),
      model = -340995495, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 716,
      coords = vector3(-1023.419, -427.6277, 75.461524),
      model = -1301991528, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 717,
      coords = vector3(-1008.44, -420.8273, 75.461524),
      model = -1145480675, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 718,
      coords = vector3(-1008.814, -421.1448, 64.065635),
      model = -1145480675, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Hydra Incorporation",
      active = true,
      id = 719,
      coords = vector3(-1008.146, -420.7827, 58.329654),
      model = -1145480675, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["hydra_incorporation"] = true
        }
      }
    },
    {
      info = "Crips.",
      active = true,
      id = 720,
      coords = vector3(1294.6455, -1740.199, 54.339366),
      model = -228773386, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["13"] = true
        }
      }
    },
    {
      info = "Crips.",
      active = true,
      id = 720,
      coords = vector3(1300.6499, -1752.165, 54.343055),
      model = -228773386, 
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["13"] = true
        }
      }
    },
    {
      info = "Art Gallery Underground",
      active = true,
      id = 721,
      coords = vector3(-470.47, 43.27, 46.23),
      model = -2066395222, 
      lock = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {
          [35] = true
        },
        business = {}
      }
    },
    {
      info = "Bullet Club",
      active = true,
      id = 722,
      coords = vector3(-841.72, -803.42, 19.26),
      model = 1119073428, 
      lock = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["the_bullet_club"] = true
        }
      }
    },
    {
      info = "Bullet Club",
      active = true,
      id = 723,
      coords = vector3(-841.3895, -803.9343, 19.491842),
      model = 1847266210, 
      lock = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["the_bullet_club"] = true
        }
      }
    },
    {
      info = "Bullet Club",
      active = true,
      id = 724,
      coords = vector3(-833.6414, -796.8081, 19.427587),
      model = 452874391, 
      lock = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["the_bullet_club"] = true
        }
      }
    },
    {
      info = "MTF",
      active = true,
      id = 725,
      coords = vector3(-1449.721, -642.4095, 29.787054),
      model = 1286535678, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["mtf"] = true
        }
      }
    },
    {
      info = "MTF",
      active = true,
      id = 726,
      coords = vector3(-1495.741, -678.2437, 28.01777),
      model = 1286535678, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["mtf"] = true
        }
      }
    },
    {
      info = "GSF1",
      active = true,
      id = 727,
      coords = vector3(-140.3349, -1599.604, 34.831371),
      model = 852775515, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["gsf"] = true
        }
      }
    },
    {
      info = "GSF2",
      active = true,
      id = 728,
      coords = vector3(-136.7926, -1603.217, 35.03021),
      model = 486670049, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["gsf"] = true
        }
      }
    },
    {
      info = "GSF3",
      active = true,
      id = 729,
      coords = vector3(-156.9888, -1596.187, 35.03021),
      model = 1150875108, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["gsf"] = true
        }
      }
    },
    {
      info = "GSF4",
      active = true,
      id = 730,
      coords = vector3(-152.6071, -1599.477, 35.0302),
      model = 1575804630, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["gsf"] = true
        }
      }
    },
    {
      info = "GSF5",
      active = true,
      id = 731,
      coords = vector3(-151.3901, -1596.493, 35.03021),
      model = 1770281453, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["gsf"] = true
        }
      }
    },
    {
      info = "jeweled_dragon frontdoor1",
      active = true,
      id = 732,
      coords = vector3(-708.3281, -887.6705, 23.816444),
      model = -266682831, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["JewelDragon"] = true
        }
      }
    },
    {
      info = "jeweled_dragon frontdoor2",
      active = true,
      id = 733,
      coords = vector3(-709.4989, -887.7143, 23.816429),
      model = 1674388876, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["JewelDragon"] = true
        }
      }
    },
    {
      info = "jeweled_dragon inside door 1",
      active = true,
      id = 734,
      coords = vector3(-702.66,-901.53,23.96),
      model = -717018680, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["JewelDragon"] = true
        }
      }
    },
    {
      info = "jeweled_dragon inside door 2",
      active = true,
      id = 735,
      coords = vector3(-697.46,-902.14,23.97),
      model = -670027930, 
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["JewelDragon"] = true
        }
      }
    },
    {
      info = "jeweled_dragon inside door 3",
      active = true,
      id = 736,
      coords = vector3(-698.22,-900.32,19.68),
      model = -717018680,
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["JewelDragon"] = true
        }
      }
    },
    {
      info = "jeweled_dragon insidesafe",
      active = true,
      id = 737,
      coords = vector3(-710.3964, -896.6571, 19.524682),
      model = 819960528,
      lock = true,
      keyFob = true,
      desc = "",
      hidden = true,
      access = {
        job = {},
        cid= {},
        business = {
          ["JewelDragon"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 738,
      coords = vector3(-152.0577, 294.8367, 98.895645),
      model = -726253128,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 739,
      coords = vector3(-151.1112, 295.1322, 98.900619),
      model = -1093560853,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Warriors Table Doors",
      active = true,
      id = 740,
      coords = vector3(-149.7837, 298.74758, 98.872413),
      model = -862441096,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["warriors_table"] = true
        }
      }
    },
    {
      info = "Little Seoul.",
      active = true,
      id = 741,
      coords = vector3(-695.4533, -940.0192, 20.012075),
      model = -1209505515,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["stk"] = true
        }
      }
    },
    {
      info = "",
      active = true,
      id = 742,
      coords = vector3(-667.137, -892.3379, 24.637693),
      model = -1603817716,
      lock = true,
      desc = "Little Seoul",
      keyFob = true,
      access = {
        job = {},
        business = {
          ["stk"] = true,
        },
      },
    },
    {
      info = "Little Seoul",
      active = true,
      id = 743,
      coords = vector3(-661.3793, -921.8771, 23.081972),
      model = -1209505515,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["stk"] = true
        }
      }
    },
    {
      info = "Little Seoul",
      active = true,
      id = 744,
      coords = vector3(-658.0357, -919.8301, 23.329782),
      model = -1209505515,
      lock = true,
      desc = "",
      access = {
        job = {},
        business = {
          ["stk"] = true
        }
      }
    },
    {
      info = "Beach house Garage",
      active = true,
      id = 745,
      coords = vector3(-1980.51, -495.76, 12.18),
      model = 2052512905,
      lock = true,
      keyFob = true,
      desc = "Beach house Garage",
      access = {
        job = {},
        business = {
          ["sea_side"] = true,
        },
      },
      forceUnlocked = false,
    },
    {
      info = "Back Entrence 1",
      active = true,
      id = 746,
      coords = vector3(-1993.54, -517.83, 12.18),
      model = -550386901,
      lock = true,
      desc = "Back Entrence 1",
      access = {
        job = {},
        business = {
          ["sea_side"] = true
        }
      }
    },
    {
      info = "Back Entrence 1",
      active = true,
      id = 747,
      coords = vector3(-1993.92, -517.3639, 12.12503),
      model = -550386901,
      lock = true,
      desc = "Back Entrence 1",
      access = {
        job = {},
        business = {
          ["sea_side"] = true
        }
      }
    },
    {
      info = "Main Entrence Door",
      active = true,
      id = 748,
      coords = vector3(-1987.664, -512.0578, 12.17824),
      model = 308207762,
      lock = true,
      desc = "Main Entrence Door",
      access = {
        job = {},
        business = {
          ["sea_side"] = true
        }
      }
    },
    {
      info = "Garage Entrence Door",
      active = true,
      id = 749,
      coords = vector3(-1987.04, -503.44, 12.18),
      model = 1980513646,
      lock = true,
      desc = "Garage Entrence Door",
      access = {
        job = {},
        business = {
          ["sea_side"] = true
        }
      }
    },
    {
      info = "",
      active = true,
      id = 750,
      keyFob = false,
      coords = vector3(-1991.891, -510.7813, 16.44788),
      model = -848580621,
      lock = true,
      automatic = {
        distance = 10.0,
        rate = 1.0
      },
      desc = "Middle Entrence Door",
      access = {
        job = {},
        business = {
          ["sea_side"] = true
      },
      forceUnlocked = false,
    },
  }
}
