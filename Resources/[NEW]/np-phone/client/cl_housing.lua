RegisterNUICallback('getHousingData', function(_, cb)
    local characterId = exports["isPed"]:isPed("cid")
    local roomNumber, roomType, available, owned, access = RPC.execute("getHousingData", characterId)
    cb({
      roomNumber = roomNumber,
      roomType = roomType,
      available = available,
      owned = owned,
      access = access
    })
  end)
  
  RegisterNUICallback('checkLocation', function(data, cb)
    local success, data = exports["np-housing"]:currentLocation()
    if not success then 
      cb({foundHouse = false})
      return
    end
    cb({foundHouse = true, foundHouseName = data.housingName, foundHousePrice = data.housingPrice, foundHouseCategory = data.housingCat})
  end)
  
  RegisterNUICallback('purchaseHousing', function(data, cb)
    local complete, info = exports["np-housing"]:buyProperty()
    if not complete then 
      cb({success = false, owned = info})
      return
    end
    cb({success = true, owned = info})
  end)
  
  RegisterNUICallback('manageHousingLocks', function(data, cb)
    local characterId = exports["isPed"]:isPed("cid")
    if data.action == "lock" then
      local result, message = exports["np-housing"]:lock(data.id)
      if not result then
        exports['np-phone']:SendAlert('error', message, 3000)
      end
      local roomNumber, roomType, available, owned, access = RPC.execute("getHousingData", characterId)
      if result then
        cb({
          owned = owned,
          access = access
        })
      end
    else
      local result, message = exports["np-housing"]:unlock(data.id)
      if not result then
        exports['np-phone']:SendAlert('error', message, 3000)
      end
      local roomNumber, roomType, available, owned, access = RPC.execute("getHousingData", characterId)
      if result then
        cb({
          owned = owned,
          access = access
        })
      end
    end
  end)
  
  RegisterNUICallback("setHousingGps", function(data, cb)
    local result, message = exports["np-housing"]:setGps(data.id)
  end)