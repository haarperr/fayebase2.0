local Entries = {}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isTrash' },
    data = {
        {
            id = 'trash',
            label = "Pickup trash",
            icon = "circle",
            event = "np-jobs:sanitationWorker:pickupTrash",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.7 },
        -- is enabled check here
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isTrash' },
    data = {
        {
            id = 'search',
            label = "Search Dumpster",
            icon = "circle",
            event = "np-dumpster",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.7 },
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isYogaMat' },
    data = {
        {
            id = 'yoga',
            label = "Yoga",
            icon = "circle",
            event = "mizrp-healthcare:yoga",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 },
        isEnabled = function(pEntity, pContext)
            return IsEntityTouchingEntity(PlayerPedId(), pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isExercise' },
    data = {
        {
            id = 'weights',
            label = "Weights",
            icon = "circle",
            event = "mizrp-healthcare:exercise",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.2 },
    }
}

-- Entries[#Entries + 1] = {
--     type = 'flag',
--     group = { 'isSmokeMachineTrigger' },
--     data = {
--         {
--             id = 'smoke_machine',
--             label = "Smoke Machine",
--             icon = "circle",
--             event = "mizrp-stripclub:smokemachine",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 1.2 },
--     }
-- }

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isFuelPump' },
    data = {
        {
            id = 'jerrycan_refill',
            label = "Refill Can",
            icon = "circle",
            event = "vehicle:refuel:showMenu",
            parameters = { isJerryCan = true }
        }
    },
    options = {
        distance = { radius = 1.5 },
        isEnabled = function(pEntity, pContext)
            return HasWeaponEquipped(GetHashKey('WEAPON_PetrolCan'))
        end
    }
}

-- Entries[#Entries + 1] = {
--     type = 'flag',
--     group = { 'isVendingMachine' },
--     data = {
--         {
--             id = 'vending_machine',
--             label = "Browse",
--             icon = "shopping-basket",
--             event = "shops:vendingMachine",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 1.5 }
--     }
-- }

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isChair' },
    data = {
        {
            id = 'sit_on_chair',
            label = "Sit",
            icon = "chair",
            event = "animation:Chair",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isChair' },
  data = {
      {
          id = 'sit_on_vr_gopro_chair_pd',
          label = "Enable GoPixel VR",
          icon = "chair",
          event = "mizrp-gopro:activateVRChair",
          parameters = { type = "pd" }
      }
  },
  options = {
      distance = { radius = 1.5 },
      isEnabled = function(pEntity, pContext)
          local coords = GetEntityCoords(PlayerPedId())
          if #(coords - vector3(444.6,-997.42,34.98)) > 5.0 then
            return false
          end
          local model = GetEntityModel(pEntity)
          return model == 538002882
      end
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isATM' },
    data = {
        {
            id = 'use_atm',
            label = "Use ATM",
            icon = "credit-card",
            event = "bank:openatm",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isGoProVRChair' },
  data = {
      {
          id = 'sit_on_vr_gopro_chair',
          label = "Enable GoPixel VR",
          icon = "chair",
          event = "mizrp-gopro:activateVRChair",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isWeedPlant' },
    data = {
        {
            id = 'weed',
            label = "Check",
            icon = "cannabis",
            event = "np-weed:checkPlant",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 7.0 }
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isLrgWeedPlant' },
    data = {
        {
            id = 'weed2',
            label = "Harvest",
            icon = "hand-paper",
            event = "np-weed:pickPlant",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 7.0 }
    }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isBeehive' },
  data = {
      {
          id = 'beehive1',
          label = "Check",
          icon = "archive",
          event = "mizrp-beekeeping:checkBeehive",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 7.0 }
  }
}

Entries[#Entries + 1] = {
  type = 'flag',
  group = { 'isBeehive' },
  data = {
      {
          id = 'beehive2',
          label = "Harvest",
          icon = "hand-holding-water",
          event = "mizrp-beekeeping:harvestHive",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 7.0 }
  }
}

Entries[#Entries + 1] = {
  type = 'model',
  group = { `ch_prop_ch_cash_trolly_01c` },
  data = {
      {
          id = 'trolleygrab',
          label = "Grab it!",
          icon = "hand-holding",
          event = "mizrp-heists:grabFromTrolley",
          parameters = { type = "cash" }
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}

Entries[#Entries + 1] = {
  type = 'model',
  group = { `ch_prop_gold_trolly_01c` },
  data = {
      {
          id = 'trolleygrabgold',
          label = "Grab it!",
          icon = "hand-holding",
          event = "np-paletogold",
          parameters = {}
      }
  },
  options = {
      distance = { radius = 1.5 }
  }
}


Entries[#Entries + 1] = {
    type = 'model',
    group = { -654402915, -1034034125 },
    data = {
        {
            id = 'vending_food',
            label = "Buy your self a nice snack!",
            icon = "cookie-bite",
            event = "shops:food",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { 690372739, -1318035530, -2015792788 },
    data = {
        {
            id = 'vending_coffee',
            label = "Make a nice cup of Coffee!",
            icon = "mug-hot",
            event = "shops:coffee",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { 1099892058 },
    data = {
        {
            id = 'vending_water',
            label = "Drink a Refreshing Bottle Of Water!",
            icon = "water",
            event = "shops:water",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { 1114264700, -504687826, 992069095, -1741437518, -1317235795 },
    data = {
        {
            id = 'vending_soda',
            label = "Drink a Refreshing Can of Soda!",
            icon = "wine-bottle",
            event = "shops:soda",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { 1211559620, -1186769817, -756152956, 720581693, -838860344},
    data = {
        {
            id = 'newsstand',
            label = "Read The News!",
            icon = "newspaper",
            event = "NewsStandCheck",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { 307287994 },
    data = {
        {
            id = 'hunting_shibiz',
            label = "Skin Animal",
            icon = "circle",
            event = "np-hunting:skinAnimal",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { -832573324 },
    data = {
        {
            id = 'hunting_shibiz',
            label = "Skin Animal",
            icon = "circle",
            event = "np-hunting:skinAnimal",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { -664053099 },
    data = {
        {
            id = 'hunting_shibiz',
            label = "Skin Animal",
            icon = "circle",
            event = "np-hunting:skinAnimal",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { 1682622302 },
    data = {
        {
            id = 'hunting_shibiz',
            label = "Skin Animal",
            icon = "circle",
            event = "np-hunting:skinAnimal",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { 269934519 },
    data = {
        {
            id = 'fleeca_heist',
            label = "Grab it",
            icon = "circle",
            event = "np-loot_fleeca",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 }
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

  Entries[#Entries + 1] = {
    type = 'model',
    group = { -874338148 },
    data = {
        {
            id = 'pick_up_spikes',
            label = "Pick Up Spikes",
            icon = "circle",
            event = "removespikes",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 },
    }
}

-- Entries[#Entries + 1] = {
--     type = 'model',
--     group = { -1404353274 },
--     data = {
--         {
--             id = 'zombie_loot',
--             label = "Whats is THIS?",
--             icon = "circle",
--             event = "np-zombies:LootTable",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 1.5 }
--     }
-- }

Entries[#Entries + 1] = {
    type = 'model',
    group = { 193469166 },
    data = {
        {
            id = 'diving_start123',
            label = "Begin Diving !",
            icon = "circle",
            event = "BeginDivingjob",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 },
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { 1494272245 },
    data = {
        {
            id = 'craft_bench',
            label = "Open Bench",
            icon = "wrench",
            event = "evan-craftbench:open",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 },
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { -1920001264 },
    data = {
        {
            id = 'loot_var',
            label = "Loot!",
            icon = "circle",
            event = "np-heists:svclientloot",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.5 },
    }
}