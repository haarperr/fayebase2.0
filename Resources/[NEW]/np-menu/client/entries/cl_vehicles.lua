local VehicleEntries = MenuEntries['vehicles']

VehicleEntries[#VehicleEntries+1] = {
    data = {
        id = "247goods",
        title = "Grab goods",
        icon = "#obj-box",
        event = "np-jobs:247delivery:takeGoods"
    },
    isEnabled = function(pEntity, pContext)
      return not IsDisabled() and GetEntityModel(pEntity) == `benson` and isCloseToTrunk(pEntity, PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), false)
    end
}

VehicleEntries[#VehicleEntries+1] = {
  data = {
      id = "vehicle-parkvehicle",
      title = "Park Vehicle",
      icon = "#vehicle-parkvehicle",
      event = "np-garages:store"
  },
  isEnabled = function(pEntity, pContext)
    return (isAtGarage == true and exports["np-vehicles"]:NearVehicle("Distance") and not exports['np-death']:GetDeathStatus())
  end
}