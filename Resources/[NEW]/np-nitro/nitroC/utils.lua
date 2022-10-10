local ELECTRIC_VEHICLES = {
  [`AIRTUG`] = true,
  [`CYCLONE`] = true,
  [`CADDY`] = true,
  [`CADDY2`] = true,
  [`CADDY3`] = true,
  [`DILETTANTE`] = true,
  [`IMORGON`] = true,
  [`KHAMEL`] = true,
  [`NEON`] = true,
  [`RAIDEN`] = true,
  [`SURGE`] = true,
  [`VOLTIC`] = true,
  [`TEZERACT`] = true
}

-- TODO: Replace with `FLAG_IS_ELECTRIC` from vehicles.meta:
-- https://gtamods.com/wiki/Vehicles.meta
function IsVehicleElectric(vehicle)
  local model = GetEntityModel(vehicle)
  return ELECTRIC_VEHICLES[model] or false
end
