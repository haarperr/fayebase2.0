local Entries = {}



Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_df",
            label = "Open/Close Left Front Door",
            icon = "door-open",
            event = "car:doors",
            parameters = 0
        }
    },
    options = {
        distance = { radius = 1.0, boneId = "door_dside_f" },
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_dr",
            label = "Open/Close Left Back Door",
            icon = "door-open",
            event = "car:doors",
            parameters = 2
        }
    },
    options = {
        distance = { radius = 1.0, boneId = "door_dside_r" },
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_pf",
            label = "Open/Close Right Front Door",
            icon = "door-open",
            event = "car:doors",
            parameters = 1
        }
    },
    options = {
        distance = { radius = 1.0, boneId = "door_pside_f" },
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_pr",
            label = "Open/Close Right Back Door",
            icon = "door-open",
            event = "car:doors",
            parameters = 3
        }
    },
    options = {
        distance = { radius = 1.0, boneId = "door_pside_r" },
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_backdoor",
            label = "Open/Close Trunk",
            icon = "door-open",
            event = "car:doors",
            parameters = 5
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return isCloseToBoot(pEntity, PlayerPedId(), 1.8, pContext.model)
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_engine",
            label = "Open/Close Hood",
            icon = "door-open",
            event = "car:doors",
            parameters = 4
        }
    },
    options = {
        distance = { radius = 2, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isCloseToEngine(pEntity, PlayerPedId(), 2, pContext.model)
        end
    }
}
-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_brake",
--             label = "Repair brakes",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "brake"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_axle",
--             label = "Repair axle",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "axle"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_radiator",
--             label = "Repair Radiator",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "radiator"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_clutch",
--             label = "Repair Clutch",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "clutch"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_transmission",
--             label = "Repair Transmission",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "transmission"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_electronics",
--             label = "Repair Electronics",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "electronics"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_injector",
--             label = "Repair Injectors",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "injector"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_tire",
--             label = "Repair Tires",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "tire"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_body",
--             label = "Repair Bodywork",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "body"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
--         end
--     }
-- }

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_repair_engine",
--             label = "Repair motor",
--             icon = "wrench",
--             event = "np-vehicles:repairVehicle",
--             parameters = "engine"
--         }
--     },
--     options = {
--         distance = { radius = 1.8, boneId = "engine" },
--         isEnabled = function(pEntity, pContext)
--             return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model
--         end
--     }
-- }
-----------------------------------------------------------
Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_flip",
            label = "Flip Vehicle",
            icon = "car-crash",
            event = "FlipVehicle",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return not IsVehicleOnAllWheels(pEntity)
        end
    }
}

-- Entries[#Entries + 1] = {
--     type = 'entity',
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_refuel_station",
--             label = "Refuel Vehicle",
--             icon = "fas fa-gas-pump",
--             event = "vehicle:refuel:menu",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 1.2, boneId = 'wheel_lr' },
--         isEnabled = function(pEntity, pContext)
--             return exports['np-interact']:NearGasFn()
--         end
--     }
-- }
Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isFuelPump' },
    data = {
        {
            id = 'gas_station',
            label = "Use Gas Pump",
            icon = "gas-pump",
            event = "np-fuel:SelectFuel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function(pEntity, pContext)
            return exports['np-fuel']:NearGasFn()
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_station",
            label = "Refuel Vehicle",
            icon = "gas-pump",
            event = "np-fuel:RefillVehicle",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 4.0 },
        isEnabled = function(pEntity, pContext)
            return exports['np-fuel']:NearGasFn() and exports['np-fuel']:hasNozle() and canRefuelHere(pEntity, exports['np-fuel']:gasZoneData())
           --return exports['np-fuel']:NearGasFn() and exports['np-fuel']:hasNozle()
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "carry_bike",
            label = "Carry Bike",
            icon = "spinner",
            event = "carryEntity",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return IsThisModelABicycle(pContext.model) and not IsEntityAttachedToAnyPed(pEntity) and not IsEntityAttachedToAnyPed(PlayerPedId())
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_getintrunk",
            label = "Enter trunk",
            icon = "user-secret",
            event = "ped:forceTrunkSelf",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 4.0 },
        isEnabled = function(pEntity, pContext)
            local lockStatus = GetVehicleDoorLockStatus(pEntity)
            return DoesVehicleHaveDoor(pEntity, 5) and isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model) and (lockStatus == 1 or lockStatus == 0 or lockStatus == 4)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_runplate",
            label = "Run Plate",
            icon = "money-check",
            event = "clientcheckLicensePlate",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 7.0 },
        isEnabled = function(pEntity, pContext)
            return isPolice and isState and isRanger and isSheriff and (isCloseToHood(pEntity, PlayerPedId(), 2.0) or isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model)) and not IsPedInAnyVehicle(PlayerPedId(), false)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_add_fakeplate",
            label = "Add Fakeplate",
            icon = "screwdriver",
            event = "vehicle:addFakePlate",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            plate = GetVehicleNumberPlateText(pEntity)
            -- hasKeys = exports["np-keys"]:hasKey(plate)
            return (isCloseToHood(pEntity, PlayerPedId(), 2.0) or isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model)) and not IsPedInAnyVehicle(PlayerPedId(), false)
             and exports["np-inventory"]:hasEnoughOfItem("fakeplate", 1, false)
            and not exports["np-vehicles"]:GetVehicleMetadata(pEntity, 'fakePlate')
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_remove_fakeplate",
            label = "Remove Fakeplate",
            icon = "ban",
            event = "vehicle:removeFakePlate",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            plate = GetVehicleNumberPlateText(pEntity)
            -- hasKeys = exports["np-keys"]:hasKey(plate)
            return isCloseToBoot(pEntity, PlayerPedId(), 1.8, pContext.model) and not IsPedInAnyVehicle(PlayerPedId(), false)
            and exports["np-vehicles"]:GetVehicleMetadata(pEntity, 'fakePlate')
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_examine",
            label = "Examine Vehicle",
            icon = "wrench",
            event = "np-vehicles:examineVehicle",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, getEngineDoor(pEntity, pContext.model)) and isCloseToEngine(pEntity, PlayerPedId(), 2, pContext.model)
        end
    }
}
 Entries[#Entries + 1] = {
     type = 'entity',
     group = { 2 },
     data = {
         {
             id = "vehicle_examine",
             label = "Examine Vehicle",
             icon = "wrench",
             event = "veh:requestUpdate",
             parameters = {}
         }
     },
     options = {
         distance = { radius = 2.0, boneId = "engine" },
         isEnabled = function(pEntity, pContext)
             return isCloseToEngine(pEntity, PlayerPedId(), 2.0, pContext.model)
         end
     }
 }

-- Entries[#Entries + 1] = {
--     type = 'flag',
--     group = { 'isFuelPump' },
--     data = {
--         {
--             id = 'gas_station',
--             label = "Purchase Jerry Can",
--             icon = "gas-pump",
--             event = "np-fuel:SelectFuel",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 1.5 },
--         isEnabled = function(pEntity, pContext)
--             return polyChecks.gasStation.isInside
--         end
--     }
-- }

RegisterNetEvent('np-gas:buy_can')
AddEventHandler('np-gas:buy_can', function()
    TriggerServerEvent('np-hud:buy_can')
end)

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_station_plane",
            label = "Refuel Vehicle",
            icon = "gas-pump",
            event = "np-fuel:SelectFuel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.0 },
        isEnabled = function(pEntity, pContext)
            local vehicleClass = GetVehicleClass(pEntity)
            if vehicleClass ~= 16 then return false end
            return exports['np-fuel']:NearGasFn()
        end
    }
  }

  Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_station_boat",
            label = "Refuel Vehicle",
            icon = "gas-pump",
            event = "np-fuel:SelectFuel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 5.0 },
        isEnabled = function(pEntity, pContext)
            local vehicleClass = GetVehicleClass(pEntity)
            if vehicleClass ~= 14 then return false end
            return exports['np-fuel']:NearGasFn()
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_station_chopter",
            label = "Refuel Vehicle",
            icon = "gas-pump",
            event = "np-fuel:SelectFuel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 5.0 },
        isEnabled = function(pEntity, pContext)
            local vehicleClass = GetVehicleClass(pEntity)
            if vehicleClass ~= 15 then return false end
            return exports['np-fuel']:NearGasFn()
        end
    }
  }

  Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_jerrycan",
            label = "Refuel Vehicle",
            icon = "gas-pump",
            event = "np-hud:jerry_can:refuel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.2, boneId = 'wheel_lr' },
        isEnabled = function(pEntity, pContext)
            return HasWeaponEquipped(883325847) -- WEAPON_PetrolCan
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_putinvehicle",
            label = "seat in vehicle",
            icon = "chevron-circle-left",
            event = "police:forceEnter",
            parameters = {}
        },
        {
            id = "vehicle_unseatnearest",
            label = "unseat from vehicle",
            icon = "chevron-circle-right",
            event = "unseatPlayer",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 4.0 },
        isEnabled = function(pEntity, pContext)
            return (not (isCloseToHood(pEntity, PlayerPedId()) or isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model))
              or pContext.model == GetHashKey("emsnspeedo"))
              and not IsPedInAnyVehicle(PlayerPedId(), false)
              and NetworkGetEntityIsNetworked(pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_keysgive",
            label = "give key",
            icon = "key",
            event = "vehicle:keys:give",
        }
    },
    options = {
        distance = { radius = 1.8 },
        isEnabled = function(pEntity, pContext)
            return hasKeys(pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_vinscratch",
            label = "scratch vin",
            icon = "eye-slash",
            event = "mizrp-boosting:scratchVehicleVin",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 4 },
        isEnabled = function(pEntity, pContext)
            return pContext.meta ~= nil and pContext.meta.boostingInfo ~= nil and pContext.meta.boostingInfo.vinScratch
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_methdisturbdrop",
            label = "Intercept goods",
            icon = "eye-slash",
            event = "mizrp-meth:dropoff:cancelDropOff",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 4 },
        isEnabled = function(pEntity, pContext)
            return isCloseToTrunk(pEntity, PlayerPedId(), 1.1, false) and pContext.meta ~= nil and pContext.meta.dropoffInfo and pContext.meta.dropoffInfo.uuid and isPolice
        end
    }
}

Entries[#Entries + 1] = {
    type = 'entity',
    group = { 2 },
    data = {
        {
            id = "vehicle_methdrop",
            label = "Drop off goods",
            icon = "cubes",
            event = "mizrp-meth:dropoff:doDropoff",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 4 },
        isEnabled = function(pEntity, pContext)
            return isCloseToTrunk(pEntity, PlayerPedId(), 1.1, false) and pContext.meta ~= nil and pContext.meta.dropoffInfo and pContext.meta.dropoffInfo.uuid
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isWheelchair' },
    data = {
        {
            id = "wheelchair",
            label = "toggle wheelchair",
            icon = "wheelchair",
            event = "voidrp:vehicle:wheelchair:control",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 0.9, boneId = 'misc_a' }
    }
}


Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isTowTruck' },
    data = {
        {
            id = "towtruck_tow",
            label = "tow vehicle",
            icon = "trailer",
            event = "jobs:towVehicle",
            parameters = {}
        }
    },
    options = {
        job = { 'impound', 'pd_impound' },
        distance = { radius = 2.5, boneId = 'wheel_lr' },
        isEnabled = function (pEntity, pContext)
            return not pContext.flags['isTowingVehicle']
        end
    }
}

Entries[#Entries + 1] = {
    type = 'flag',
    group = { 'isTowTruck' },
    data = {
        {
            id = "towtruck_untow",
            label = "untow vehicle",
            icon = "trailer",
            event = "jobs:untowVehicle",
            parameters = {}
        }
    },
    options = {
        job = { 'impound', 'pd_impound' },
        distance = { radius = 2.5, boneId = 'wheel_lr' },
        isEnabled = function (pEntity, pContext)
            return pContext.flags['isTowingVehicle']
        end
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { GetHashKey('trash2') },
    data = {
        {
            id = "sanitation_worker_throw_trash",
            label = "throw in trash",
            icon = "trash-restore-alt",
            event = "np-jobs:sanitationWorker:vehicleTrash",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.8, boneId = 'wheel_lr' },
        isEnabled = function (pEntity, pContext)
            return isCloseToTrunk(pEntity, PlayerPedId(), 1.1, true)
        end
    }
}

Entries[#Entries + 1] = {
    type = 'model',
    group = { GetHashKey('benson') },
    data = {
        {
            id = "247_deliveries_take_goods",
            label = "Grab goods",
            icon = "box",
            event = "np-jobs:247delivery:takeGoods",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.0, boneId = 'boot' },
        isEnabled = function (pEntity, pContext)
            return isCloseToTrunk(pEntity, PlayerPedId())
        end
    }
}

Entries[#Entries + 1] = {
  type = 'entity',
  group = { 2 },
  data = {
      {
          id = "vehicle_buy_vehicle",
          label = "sell vehicle",
          icon = "money-check-alt",
          event = "mizrp-ottosauto:vehicle:transaction",
          parameters = {
            action = "sell"
          }
      }
  },
  options = {
      distance = { radius = 1.8 },
      isEnabled = function(pEntity, pContext)
          return polyChecks.ottosAuto.isInside and hasJobPermission("ottos_auto") and CanSellOrBuyCar(pEntity, true)
      end
  }
}

Entries[#Entries + 1] = {
  type = 'entity',
  group = { 2 },
  data = {
      {
          id = "vehicle_sell_vehicle",
          label = "buy vehicle",
          icon = "shopping-cart",
          event = "mizrp-ottosauto:vehicle:transaction",
          parameters = {
            action = "buy"
          }
      }
  },
  options = {
      distance = { radius = 1.8 },
      isEnabled = function(pEntity, pContext)
          return polyChecks.ottosAuto.isInside and hasJobPermission("ottos_auto", "buy_car") and CanSellOrBuyCar(pEntity, false)
      end
  }
}

-- local stockadeHash = `STOCKADE`
-- Entries[#Entries + 1] = {
--   type = 'entity',
--   group = { 2 },
--   data = {
--       {
--           id = "moneytruckthermite",
--           label = "Use Thermite",
--           icon = "circle",
--           event = "mizrp-heists:bobcatThermiteMoneyTruckDoor",
--           parameters = {}
--       }
--   },
--   options = {
--       distance = { radius = 8.0 },
--       isEnabled = function(pEntity, pContext)
--           return pContext.model == stockadeHash
--             and isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model)
--             and not DecorGetBool(pEntity, "BobcatMoneyTruck")
--             and exports["np-inventory"]:hasEnoughOfItem("thermitecharge", 1, false, true)
--       end
--   }
-- }

-- Entries[#Entries + 1] = {
--   type = 'entity',
--   group = { 2 },
--   data = {
--       {
--           id = "moneytruckloot",
--           label = "Take Goods",
--           icon = "circle",
--           event = "mizrp-heists:bobcatMoneyTruckTakeGoods",
--           parameters = {}
--       }
--   },
--   options = {
--       distance = { radius = 8.0 },
--       isEnabled = function(pEntity, pContext)
--           return pContext.model == stockadeHash
--             and isCloseToBoot(pEntity, PlayerPedId(), 2.0, pContext.model)
--             and DecorGetBool(pEntity, "BobcatMoneyTruck")
--       end
--   }
-- }

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