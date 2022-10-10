local Entries = {}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "recycle_exchange",
            label = "Exchange recyclables",
            icon = "circle",
            event = "np-npcs:ped:exchangeRecycleMaterial",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"recycle_exchange"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "recycle_employer",
            label = "Sign in",
            icon = "circle",
            event = "signIntoJob",
            parameters = "recycle"
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"recycle_employer"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "cocaine_run",
            label = "Pay 150,000 for a run!",
            icon = "circle",
            event = "heists:cocaine_payment",
            parameters = "cocaine"
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"cocaine_run"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "ped_weed_plants",
            label = "Hand vouch copy",
            icon = "circle",
            event = "np-weed:vouchcopy",
            parameters = "weed"
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"ped_weed_plants"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "ped_weed_vouched",
            label = "Hand vouch copy",
            icon = "circle",
            event = "np-weed:vouched",
            parameters = "vouched"
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"ped_weed_vouched"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "car_impound",
            label = "View personal impounded vehicles",
            icon = "car",
            event = "np-jobs:impound",
            parameters = ""
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"car_impound"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isBankAccountManager' },
    data = {
        {
            id = "bank_paycheck_collect",
            label = "Collect paycheck",
            icon = "circle",
            event = "void-collect:paycheck",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isBankAccountManager' },
    data = {
        {
            id = "bank_receipt_collect",
            label = "trade in receipts",
            icon = "money-bill-wave",
            event = "np-npcs:ped:receiptTradeIn",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function()
            local isEmployedAtBurgerShot = exports["np-business"]:IsEmployedAt("burger_shot")
            local isEmployedAtRoosters = exports["np-business"]:IsEmployedAt("rooster")
            local publicTradeIn = exports["mizrp-config"]:GetMiscConfig("jobs.receipts.public")
            return isEmployedAtBurgerShot or isEmployedAtRoosters or publicTradeIn
        end
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isBankAccountManager' },
  data = {
      {
          id = "bank_receipt_m_collect",
          label = "Trade in Market Receipts",
          icon = "money-bill-wave",
          event = "np-npcs:ped:receiptTradeInMarket",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 },
      isEnabled = function()
          return exports["np-inventory"]:getQuantity("farmersmarketreceipt", true) > 0
      end
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isCommonJobProvider' },
    data = {
        {
            id = "common_job_signIn",
            label = "Sign in",
            icon = "circle",
            event = "np-npcs:ped:signInJob",
            parameters = {}
        },
        {
            id = "common_job_signOut",
            label = "Sign out",
            icon = "circle",
            event = "np-npcs:ped:signInJob",
            parameters = { "unemployed" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isJobEmployer' },
    data = {
        {
            id = "jobs_employer_checkIn",
            label = "Sign in",
            icon = "circle",
            event = "jobs:checkIn",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function()
            return CurrentJob == 'unemployed'
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "common_job_signIn_trucker",
            label = "Sign in",
            icon = "circle",
            event = "signIntoJob",
            parameters = "trucker"
        },
        {
            id = "common_job_paycheck_trucker",
            label = "Get paycheck",
            icon = "circle",
            event = "getPaycheck",
            parameters = "trucker"
        },
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"trucker_employer"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "common_job_signIn_fishing",
            label = "Sign in",
            icon = "circle",
            event = "signIntoJob",
            parameters = "fishing"
        },
        {
            id = "common_job_paycheck_fishing",
            label = "Get paycheck",
            icon = "circle",
            event = "getPaycheck",
            parameters = "fishing"
        },
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"fish_employer"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "common_job_signIn_waterandpower",
            label = "Sign in",
            icon = "circle",
            event = "signIntoJob",
            parameters = "waterandpower"
        },
        {
            id = "common_job_paycheck_waterandpower",
            label = "Get paycheck",
            icon = "circle",
            event = "getPaycheck",
            parameters = "waterandpower"
        },
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"waterpower_employer"}
    }
}

-- Entries[#Entries + 1] = {
--     type = 'flag',
--     group = { 'isJobEmployer' },
--     data = {
--         {
--             id = "fishing_borrow_boat",
--             label = "Borrow Fishing Boat",
--             icon = "circle",
--             event = "mizrp-fishing:rentBoat",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 2.5 },
--         isEnabled = function(pEntity, pContext)
--             return pContext.job.id == CurrentJob and not IsDisabled() and not IsPedInAnyVehicle(PlayerPedId()) and (pEntity and pContext.flags['isBoatRenter']) and (currentlyRentedBoat == nil or not DoesEntityExist(currentlyRentedBoat))
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = 'flag',
--     group = { 'isJobEmployer' },
--     data = {
--         {
--             id = "fishing_return_boat",
--             label = "Return Fishing Boat",
--             icon = "circle",
--             event = "mizrp-fishing:returnBoat",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 2.5 },
--         isEnabled = function(pEntity, pContext)
--             return pContext.job.id == CurrentJob and not IsDisabled() and not IsPedInAnyVehicle(PlayerPedId()) and (pEntity and pContext.flags['isBoatRenter']) and (currentlyRentedBoat ~= nil and DoesEntityExist(currentlyRentedBoat))
--         end
--     }
-- }

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isJobEmployer' },
    data = {
        {
            id = "jobs_employer_paycheck",
            label = "Get paycheck",
            icon = "circle",
            event = "jobs:getPaycheck",
            parameters = {}
        },
        {
            id = "jobs_employer_checkOut",
            label = "Sign Out",
            icon = "circle",
            event = "jobs:checkOut",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function(pEntity, pContext)
            return pContext.job.id == CurrentJob
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isJobEmployer' },
    data = {
        {
            id = "dodologistics_getpackage",
            label = "Get Packaging",
            icon = "circle",
            event = "np-business:dodoLogisticsDisplayPackaging",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function(pEntity, pContext)
            local isEmployedAtDodoLogistics = exports["np-business"]:IsEmployedAt("dodologistics")
            return isEmployedAtDodoLogistics
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isShopKeeper' },
    data = {
        {
            id = "shopkeeper_",
            label = "Purchase goods",
            icon = "shopping-basket",
            event = "np-npcs:ped:keeper",
            parameters = { "2" }
        }
    },
    options = {
        distance = { radius = 3.0 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "liqourkeeper",
          label = "Purchase alcohol",
          icon = "circle",
          event = "np-npcs:ped:keeperLiqour",
          parameters = { "42076" }
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"liqourkeeper_1", "liqourkeeper_2", "liqourkeeper_3", "liqourkeeper_4", "liqourkeeper_5", "liqourkeeper_6","liqourkeeper_7", "liqourkeeper_8", "liqourkeeper_9", "liqourkeeper_10", "liqourkeeper_11"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "getpaintballgun",
          label = "Pickup Paintball Gun",
          icon = "circle",
          event = "mizrp-paintball:getPaintballGun",
          parameters = {},
      },
      {
          id = "getpaintballsmoke",
          label = "Pickup Smoke Grenade",
          icon = "circle",
          event = "mizrp-paintball:getPaintballSmoke",
          parameters = {},
      },
      {
          id = "getpaintballammo",
          label = "Pickup Paintball Ammo",
          icon = "circle",
          event = "mizrp-paintball:getPaintballAmmo",
          parameters = {},
      },
      {
          id = "getpaintballmegaphone",
          label = "Pickup Megaphone",
          icon = "circle",
          event = "mizrp-paintball:getMegaphone",
          parameters = {},
      },
      {
          id = "getpaintballcaddy",
          label = "Pickup Caddy",
          icon = "circle",
          event = "mizrp-paintball:getCaddy",
          parameters = {},
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"paintball_vendor"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "arenawasteland",
          label = "Enable 'Wasteland'",
          icon = "circle",
          event = "mizrp-paintball:setArenaType",
          parameters = { "wasteland" },
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"paintball_arena_map"}
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "arenagotomain",
            label = "Take me to The Arena!",
            icon = "circle",
            event = "mizrp-paintball:swapLocations",
            parameters = {},
        },
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"paintball_arena_grass_swapper_1", "paintball_arena_grass_swapper_2"}
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "casinoswapinterior",
          label = "Enable Betting Stations",
          icon = "circle",
          event = "mizrp-casino:betting:interiorSwap",
          parameters = { "bets" },
      },
      {
          id = "casinoswapinteriorpoker",
          label = "Enable Poker Tables",
          icon = "circle",
          event = "mizrp-casino:betting:interiorSwap",
          parameters = { "poker" },
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"casino_interior_swap"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "galleryinteriorcars",
          label = "Enable Auction Stand",
          icon = "circle",
          event = "mizrp-gallery:interiorSwap",
          parameters = { "cars" },
      },
      {
          id = "galleryinteriorfights",
          label = "Enable Fight Ring",
          icon = "circle",
          event = "mizrp-gallery:interiorSwap",
          parameters = { "fights" },
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"gallery_interior_swap"}
  }
}



Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "golfclubseller",
          label = "Browse Goods",
          icon = "circle",
          event = "np-inventory:openGolfStore",
          parameters = {},
      },
      {
          id = "golfclubcaddyseller",
          label = "Get Caddy",
          icon = "circle",
          event = "mizrp-golf:spawnCaddy",
          parameters = {},
      },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"golfclubseller"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "licensekeeper",
          label = "Purchase License ($500.00)",
          icon = "id-card-alt",
          event = "np-npcs:ped:licenseKeeper",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"npc_license_keeper_1", "npc_license_keeper_2"}
  }
}



Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "gallery_exchange",
          label = "Sell Gems",
          icon = "hand-holding",
          event = "np-sellingmining",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"gallery_exchange"}
  }
}




Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
      {
          id = "laptopvendor2",
          label = "Check Availability",
          icon = "clock",
          event = "np-illegalactivities:check_availability",
      }
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"laptop_1"},
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "vehicle_rental_shit",
            label = "Open Rental Catalogue",
            icon = "circle",
            event = "ui_callbacks:rentals",
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"vehicle_rental"},
    }
  }

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "drugdealer",
            label = "Get List",
            icon = "circle",
            event = "np-drugsales:clockin",
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"druggy"},
    }
  }

  
Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isWeaponShopKeeper' },
    data = {
        {
            id = "weaponshop_keeper",
            label = "Purchase weapons",
            icon = "circle",
            event = "weapon:general",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isToolShopKeeper' },
    data = {
        {
            id = "toolshop_keeper",
            label = "Purchase tools",
            icon = "shopping-basket",
            event = "toolshop:general",
            parameters = { "4" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isSportShopKeeper' },
    data = {
        {
            id = "sportshop_keeper",
            label = "Purchase gear",
            icon = "circle",
            event = "np-npcs:ped:keeper",
            parameters = { "34" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isWeedShopKeeper' },
  data = {
      {
          id = "weedshop_keeper",
          label = "Purchase Weed",
          icon = "cannabis",
          event = "np-npcs:ped:weedSales",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isJobVehShopKeeper' },
  data = {
      {
          id = "jobveh_keeper",
          label = "Purchase Job Vehicle",
          icon = "car",
          event = "mizrp-showrooms:buyJobVehicles",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isWineryShopKeeper' },
  data = {
      {
          id = "winery_keeper",
          label = "Pick up Wine",
          icon = "wine-bottle",
          event = "np-business:buyWineryWine",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 2.5 }
  }
}



Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isCasinoChipSeller' },
    data = {
      {
          id = "casino_purchase_chips",
          label = "Purchase Chips",
          icon = "circle",
          event = "mizrp-casino:purchaseChipsAction",
          parameters = { "purchase" }
      },
      {
          id = "casino_withdraw_cash",
          label = "Cashout (Cash)",
          icon = "wallet",
          event = "mizrp-casino:purchaseChipsAction",
          parameters = { "withdraw:cash" }
      },
      {
          id = "casino_withdraw_bank",
          label = "Cashout (Bank)",
          icon = "university",
          event = "mizrp-casino:purchaseChipsAction",
          parameters = { "withdraw:bank" }
      },
      {
          id = "casino_transfer_chips",
          label = "Transfer Chips",
          icon = "circle",
          event = "mizrp-casino:purchaseChipsAction",
          parameters = { "transfer" }
      },
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isNPC' },
  data = {
    {
        id = "casino_wheel_spin_npc_toggle",
        label = "Toggle Wheel Enabled",
        icon = "circle",
        event = "mizrp-casino:wheel:toggleEnable",
    },
    {
        id = "casino_wheel_spin_npc_spin",
        label = "Spin Wheel! ($500)",
        icon = "dollar-sign",
        event = "mizrp-casino:wheel:spinWheel",
    },
    {
        id = "casino_wheel_spin_npc_turbo",
        label = "Turbo Spin! ($5,000)",
        icon = "dollar-sign",
        event = "mizrp-casino:wheel:spinWheelTurbo",
    },
    {
        id = "casino_wheel_spin_npc_omega",
        label = "Omega Spin! ($20,000)",
        icon = "dollar-sign",
        event = "mizrp-casino:wheel:spinWheelOmega",
    },
    {
        id = "casino_wheel_spin_npc_check",
        label = "Check Spent Amount",
        icon = "dollar-sign",
        event = "mizrp-casino:wheel:checkSpentAmount",
    },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"casino_wheel_spin_npc"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { '' },
  data = {
    {
        id = "cgchaincraft",
        label = "Craft Chainz",
        icon = "circle",
        event = "mizrp-clothing:openCGChainCrafting",
    },
    {
        id = "cgchaininfuse",
        label = "Infuse Chain",
        icon = "gem",
        event = "mizrp-clothing:infuseChainWithGems",
    },
  },
  options = {
      distance = { radius = 2.5 },
      npcIds = {"cgjvendor"}
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isCasinoMembershipGiver' },
  data = {
    {
        id = "casino_membership_giver",
        label = "Purchase Membership ($250)",
        icon = "circle",
        event = "mizrp-casino:purchaseMembershipCard",
        parameters = {}
    },
    {
        id = "casino_membership_giver_emp",
        label = "Get Membership Card",
        icon = "circle",
        event = "mizrp-casino:purchaseMembership",
        parameters = {}
    },
    {
        id = "casino_membership_loyalty",
        label = "Get Loyalty Card",
        icon = "circle",
        event = "mizrp-casino:getLoyaltyCard",
        parameters = {}
    },
  },
  options = {
      distance = { radius = 2.5 }
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "vehicleshoprenter",
            label = "Rent vehicle",
            icon = "circle",
            event = "mizrp-rentals:vehiclelist",
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"veh_rental"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isCasinoLuckyWheel' },
    data = {
      {
          id = "casino_adjust_spin",
          label = "Enable/Disable Wheel!",
          icon = "adjust",
          event = "attempt:change:spin",
          parameters = {}
      },
      {
          id = "casino_adjust_slots",
          label = "Enable/Disable Slots!",
          icon = "adjust",
          event = "attempt:change:slot",
          parameters = {}
      },
    },
    options = {
        business = {"casino"},
        distance = { radius = 4.0 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isCasinoLuckyWheel' },
    data = {
        {
            id = "casino_spin_wheel",
            label = "Spin Wheel ($500)",
            icon = "money-bill-wave",
            event = "attempt:spin-in",
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isBarry' },
    data = {
        {
            id = "barry",
            label = "View personal impounded vehicles",
            icon = "car",
            event = "impound:barry",
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "pd_purchase_vehicle",
            label = "Purchase Police Vehicle",
            icon = "car",
            event = "PDSpawnVeh",
        }
    },
    options = {
        job = {"police", "state", "sheriff"},
        distance = { radius = 2.5 },
        npcIds = {"pd_benny"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "pd_spawn_heli",
            label = "Police Air Garage",
            icon = "helicopter",
            event = "spawn:hei:pd",
        }
    },
    options = {
        job = {"police", "state", "sheriff"},
        distance = { radius = 2.5 },
        npcIds = {"pd_pilot"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "ems_spawn_vehicle",
            label = "EMS Vehicles",
            icon = "car",
            event = "EMSSpawnVeh",
        }
    },
    options = {
        job = {"ems"},
        distance = { radius = 2.5 },
        npcIds = {"ems_spawn"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "ems_heli",
            label = "EMS Air Garage",
            icon = "helicopter",
            event = "spawn:hei:ems",
        }
    },
    options = {
        job = {"ems"},
        distance = { radius = 2.5 },
        npcIds = {"ems_pilot"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "hunting_sell",
            label = "Sell Hunting Materials",
            icon = "money-bill-alt",
            event = "hunting:sell",
        }
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"hunting_seller"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "fcadrive_npc",
            label = "Speak to Shady Dude",
            icon = "upload",
            event = "dude-menu",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"fc_shady_dude"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "lappy_npc",
            label = "Speak to Shady Dude",
            icon = "laptop",
            event = "lap-menu",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"lappy_shady_dude"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "nug_strap_dude",
            label = "Speak to Nug Strap Dude",
            icon = "book-dead",
            event = "nug-menu",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"nug_strap"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "toe_guy_man",
            label = "Can I suck on them toes?",
            icon = "book-dead",
            event = "toe-menu",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"toe_dude"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "meth_guy_bro",
            label = "Hand something over...",
            icon = "hand-holding",
            event = "meth:sell",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"meth_dude"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "meth_guy_bro_2",
            label = "Hand something over...",
            icon = "hand-holding",
            event = "meth:sell",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"meth_dude_2"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "chop_shop_donny",
            label = "Clock In",
            icon = "circle",
            event = "np-chopshop:clock-in",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"chop_shop"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "chop_shop_donny_1",
            label = "Clock Out",
            icon = "circle",
            event = "np-chopshop:clock-out",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"chop_shop"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "void_house_robberies_ped",
            label = "Get A Job",
            icon = "circle",
            event = "np-houserobbery:getJob",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"void_house_robberies"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "voidrp_miningsell",
            label = "Sell Gems",
            icon = "circle",
            event = "np-sellingmining",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"voidrp_miningsell"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "void_house_robberies_ped_sales",
            label = "Sell Items",
            icon = "circle",
            event = "np-houserobberies:sell_goods",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"void_house_robberies_sell"}
    }
}


Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "void_fishing_start",
            label = "Start Fishing",
            icon = "circle",
            event = "np-civjobs-fishing:start",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"evan_fishing"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "void_fishing_stop",
            label = "Stop Fishing",
            icon = "circle",
            event = "np-fishing:stop",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"evan_fishing"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "evan_post_op_start",
            label = "Sign In",
            icon = "circle",
            event = "signIntoJob",
            parameters = "postop"
        },
        {
            id = "common_job_paycheck_postop",
            label = "Get paycheck",
            icon = "circle",
            event = "getPaycheck",
            parameters = "postop"
        },
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"evan_post_op"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "evan_hunting_shit",
            label = "Purchase Hunting Equipment",
            icon = "circle",
            event = "hunting:general",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"evan_hunting"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "evan_garbage_shit",
            label = "Sign In",
            icon = "trash-alt",
            event = "np-jobs:garbagestart:menu",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"evan_garbage"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "pd_heli_shit",
            label = "Get PD Heli",
            icon = "helicopter",
            event = "police:spawnshitheli",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"pd_heli"},
        job = {"police", "state", "sheriff"}
    }
}
Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "sheriff_heli_shit",
            label = "Get Sheriff Heli",
            icon = "helicopter",
            event = "sheriff:spawnshitheli",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"sheriff_heli"},
        job = {"police", "state", "sheriff"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "ems_heli_shit",
            label = "Get EMS Heli",
            icon = "helicopter",
            event = "ems:spawnshitheli",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"ems_heli"},
        job = {"ems"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "fishing_sales",
            label = "Sell Fish",
            icon = "circle",
            event = "np-npcs:ped:sellFish",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"fishing_sales"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "oxy_runs",
            label = "Sign In",
            icon = "circle",
            event = "np-oxy:start_run",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"oxy_runs"}
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "gang_ped",
            label = "Talk.",
            icon = "circle",
            event = "aspect-gangs:kewl_guy_innit",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"gang_ped"}
    }
}

RegisterNetEvent('aspect-gangs:kewl_guy_innit')
AddEventHandler('aspect-gangs:kewl_guy_innit', function()
    TriggerServerEvent('aspect-gangs:menu_shit')
end)

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isNPC' },
    data = {
        {
            id = "ped_prison",
            label = "Jail Jobs.",
            icon = "circle",
            event = "np-jobs:jail-jobs:menu",
        }
    },
    options = {
        distance = { radius = 1.5 },
        npcIds = {"ped_prison"}
    }
}

Entries[#Entries + 1] = {
	type = 'flag',
	group = { 'isNPC' },
	data = {
		{
			id = "package_collect",
			label = "Collect Package",
			icon = "box",
			event = "np-weed:grab_package",
		},
	},
	options = {
		distance = { radius = 2.5 },
		npcIds = {"ped_weed"},
		isEnabled = function()
			return exports['np-weed']:WeedPackaged()
		end,
	}
}


Entries[#Entries + 1] = {
	type = 'flag',
	group = { 'isNPC' },
	data = {
		{
			id = "package_goods",
			label = "Package Goods",
			icon = "box",
			event = "np-weed:package_smallbud",
		},
	},
	options = {
		distance = { radius = 2.5 },
		npcIds = {"ped_weed"},
		isEnabled = function()
			return not exports['np-weed']:WeedPackaged()
		end,
	}
}

Entries[#Entries + 1] = {
	type = 'flag',
	group = { 'isNPC' },
	data = {
		{
			id = "sign_in_weed",
			label = "Sign In",
			icon = "circle",
			event = "np-weed:get_delivery",
		},
	},
	options = {
		distance = { radius = 2.5 },
		npcIds = {"ped_weed"},
	}
}

Citizen.CreateThread(function()
    for _, entry in ipairs(Entries) do
        if entry.type == 'flag' then
            AddPeekEntryByFlag(entry.group, entry.data, entry.options)
        elseif entry.type == 'model' then
            AddPeekEntryByModel(entry.group, entry.data, entry.options)
        elseif entry.type == 'entity' then
            AddPeekEntryByEntityType(entry.group, entry.data, entry.options)
        elseif entry.type == 'polytarget' then
            AddPeekEntryByPolyTarget(entry.group, entry.data, entry.options)
        end
    end
end)