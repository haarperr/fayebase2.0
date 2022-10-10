;(function () {
    'use strict'
    var _0x126dd0 = {
        50: function (_0x3c6cc5, _0x15548c, _0x462300) {
          var _0x421cda
          _0x421cda = { value: true }
          const _0x1776f9 = _0x462300(615)
          let _0x15df07 = [],
            _0x597ea5 = [],
            _0xaf6e3d = [],
            _0x2302ec = [],
            _0x3d0faf = false,
            _0x1b71fb = false,
            _0x130f2e = false,
            _0x4414be = false,
            _0x572abd = undefined
          const _0x53b9e0 = [
            {
              optionName: 'toggleBlockEmotes',
              displayName: 'Block Emotes',
              optionType: 'toggle',
              data: false,
            },
            {
              optionName: 'toggleDefaultMenu',
              displayName: 'Large menu is default',
              optionType: 'toggle',
              data: true,
            },
            {
              optionName: 'expandedOnPass',
              displayName: "Large menu on 'Pass' menu is default",
              optionType: 'toggle',
              data: false,
            },
            {
              optionName: 'showTooltips',
              displayName: 'Show Tooltips',
              optionType: 'toggle',
              data: true,
            },
            {
              optionName: 'openDefaultMenu',
              displayName: 'Open Normal Menu with Bind',
              optionType: 'toggle',
              data: true,
            },
          ]
          let _0x2e69ae = [
            {
              parent: '',
              key: 'none',
            },
            {
              parent: '',
              key: 'adminBind_0',
            },
            {
              parent: '',
              key: 'adminBind_1',
            },
            {
              parent: '',
              key: 'adminBind_2',
            },
            {
              parent: '',
              key: 'adminBind_3',
            },
            {
              parent: '',
              key: 'adminBind_4',
            },
            {
              parent: '',
              key: 'adminBind_5',
            },
          ]
          const _0x4b3d84 = new Map()
          function _0x2f2da0(_0x3369da) {
            return _0x4b3d84.get(_0x3369da)
          }
          function _0x10479a(_0x1d86fe, _0x32f1ed) {
            _0x4b3d84.set(_0x1d86fe, _0x32f1ed)
            return
          }
          function _0x2277c5(_0x1067dd) {
            _0xaf6e3d = _0x1067dd
          }
          onNet('np-admin:becomeModel', (_0x4220d2) => {
            emit('raid_clothes:AdminSetModel', _0x4220d2)
            emit('np-admin:raid_clothes:model', _0x4220d2)
          })
          onNet('np-admin:giveItem', (_0x15cddb, _0x5878ca, _0x15174a) => {
            emitNet('np-admin:giveItem', _0x15cddb, _0x5878ca, _0x15174a)
          })
          onNet('np-admin:teleportMarker', async () => {
            const _0x4abb45 = GetFirstBlipInfoId(8)
            if (!DoesBlipExist(_0x4abb45)) {
              return (
                emit('DoLongHudText', 'Failed to find marker.', 2),
                'Failed to find marker'
              )
            }
            const _0x576043 = GetBlipInfoIdCoord(_0x4abb45),
              _0x319f74 = new _0x1776f9.formatCoords(
                _0x576043[0],
                _0x576043[1],
                _0x576043[2]
              ),
              _0x5ebf37 = PlayerPedId()
            for (let _0x40e5a6 = 1; _0x40e5a6 < 1000; _0x40e5a6++) {
              SetPedCoordsKeepVehicle(
                _0x5ebf37,
                _0x319f74.x,
                _0x319f74.y,
                _0x40e5a6 + 0
              )
              const _0x31f59e = GetGroundZFor_3dCoord(
                _0x319f74.x,
                _0x319f74.y,
                _0x40e5a6 + 0,
                false
              )
              if (_0x31f59e[0]) {
                SetPedCoordsKeepVehicle(
                  _0x5ebf37,
                  _0x319f74.x,
                  _0x319f74.y,
                  _0x40e5a6 + 0
                )
                break
              }
              await (0, _0x1776f9.Delay)(5)
            }
          })
          onNet(
            'np-admin:spawnVehicle',
            (_0x36e19b, _0x53184d, _0x39d26e, _0x25cd55) => {
              console.log(
                '[DEBUG] spawnVehicle',
                _0x36e19b,
                _0x53184d,
                _0x39d26e,
                _0x25cd55
              )
              if (
                _0x53184d === '' ||
                _0x53184d === undefined ||
                _0x53184d === null
              ) {
                _0x53184d = _0x39d26e
              }
              if (
                _0x53184d === '' ||
                _0x53184d === undefined ||
                _0x53184d === null
              ) {
                return emit('DoLongHudText', 'No vehicle entered.', 2)
              }
              setImmediate(async () => {
                let _0x1b0a4c = GetHashKey(_0x53184d)
                if (!IsModelAVehicle(_0x1b0a4c)) {
                  return
                }
                if (!IsModelInCdimage(_0x1b0a4c) || !IsModelValid(_0x1b0a4c)) {
                  return
                }
                RequestModel(_0x1b0a4c)
                while (!HasModelLoaded(_0x1b0a4c)) {
                  await (0, _0x1776f9.Delay)(0)
                }
                let _0x2f2ae6 = PlayerPedId(),
                  _0x54d0db = GetOffsetFromEntityInWorldCoords(
                    PlayerPedId(),
                    1.5,
                    5,
                    0
                  ),
                  _0x366c7f = GetEntityHeading(_0x2f2ae6),
                  _0x1e7ce6 = CreateVehicle(
                    _0x1b0a4c,
                    _0x54d0db[0],
                    _0x54d0db[1],
                    _0x54d0db[2],
                    _0x366c7f,
                    true,
                    false
                  ),
                  _0x3a050d = GetVehicleNumberPlateText(_0x1e7ce6)
                emit('keys:addNew', _0x1e7ce6, _0x3a050d)
                emit('vehicle:keys:addNew', _0x1e7ce6, _0x3a050d)
                SetModelAsNoLongerNeeded(_0x1b0a4c)
                TaskWarpPedIntoVehicle(_0x2f2ae6, _0x1e7ce6, -1)
                SetVehicleDirtLevel(_0x1e7ce6, 0)
                SetVehicleWindowTint(_0x1e7ce6, 0)
                _0x25cd55 &&
                  _0x462300.g.exports['np-vehicles'].SetVehicleMods(_0x1e7ce6, {
                    Spoilers: 1,
                    FrontBumper: 1,
                    RearBumper: 1,
                    SideSkirt: 1,
                    Exhaust: 1,
                    Frame: 1,
                    Grille: 1,
                    Hood: 1,
                    Fender: 1,
                    RightFender: 1,
                    Roof: 1,
                    Engine: 4,
                    Brakes: 3,
                    Transmission: 3,
                    Horns: 1,
                    Suspension: 3,
                    Armor: 1,
                    UNK17: 1,
                    Turbo: 1,
                    UNK19: 1,
                    TireSmoke: 1,
                    UNK21: 1,
                    XenonHeadlights: 1,
                    FrontWheels: 96,
                    BackWheels: -1,
                    PlateHolder: -1,
                    VanityPlates: -1,
                    InteriorTrim: -1,
                    Ornaments: -1,
                    Dashboard: -1,
                    Dials: -1,
                    DoorSpeakers: -1,
                    Seats: -1,
                    SteeringWheel: -1,
                    ShiftLeavers: -1,
                    Plaques: -1,
                    Speakers: -1,
                    Trunk: -1,
                    Hydraulics: -1,
                    EngineBlock: -1,
                    AirFilter: -1,
                    Struts: -1,
                    ArchCover: -1,
                    Aerials: -1,
                    ExteriorTrim: -1,
                    Tank: -1,
                    Windows: -1,
                    UNK47: -1,
                    Livery: -1,
                  })
              })
            }
          )
          let _0x5b3749 = undefined
          onNet('np-admin:runSpawnCommand', (_0x7cbe51, _0x78b010) => {
            setImmediate(async () => {
              let _0x382007 = GetHashKey(_0x7cbe51)
              if (!IsModelAVehicle(_0x382007)) {
                return
              }
              if (!IsModelInCdimage(_0x382007) || !IsModelValid(_0x382007)) {
                return
              }
              RequestModel(_0x382007)
              while (!HasModelLoaded(_0x382007)) {
                await (0, _0x1776f9.Delay)(0)
              }
              let _0x3a82f0 = PlayerPedId(),
                _0x1c39f9 = GetOffsetFromEntityInWorldCoords(
                  PlayerPedId(),
                  1.5,
                  5,
                  0
                ),
                _0x849a45 = GetEntityHeading(_0x3a82f0),
                _0x5126ef = CreateVehicle(
                  _0x382007,
                  _0x1c39f9[0],
                  _0x1c39f9[1],
                  _0x1c39f9[2],
                  _0x849a45,
                  true,
                  false
                )
              SetVehicleModKit(_0x5126ef, 0)
              SetVehicleMod(_0x5126ef, 11, 3, false)
              SetVehicleMod(_0x5126ef, 12, 2, false)
              SetVehicleMod(_0x5126ef, 13, 2, false)
              SetVehicleMod(_0x5126ef, 15, 3, false)
              SetVehicleMod(_0x5126ef, 16, 4, false)
              _0x7cbe51 === 'pol1' && SetVehicleExtra(_0x5126ef, 5, false)
              _0x7cbe51 === 'police' &&
                (SetVehicleWheelType(_0x5126ef, 2),
                SetVehicleMod(_0x5126ef, 23, 10, false),
                SetVehicleColours(_0x5126ef, 0, 0),
                SetVehicleExtraColours(_0x5126ef, 0, 0))
              if (_0x7cbe51 === 'pol7') {
                SetVehicleColours(_0x5126ef, 0, 0)
                SetVehicleExtraColours(_0x5126ef, 0, 0)
              }
              ;(_0x7cbe51 === 'pol5' || _0x7cbe51 === 'pol6') &&
                SetVehicleExtra(_0x5126ef, 1, false)
              let _0x458847 = GetVehicleNumberPlateText(_0x5126ef)
              emit('keys:addNew', _0x5126ef, _0x458847)
              emit('vehicle:keys:addNew', _0x5126ef, _0x458847)
              emitNet('garages:addJobPlate', _0x458847)
              SetModelAsNoLongerNeeded(_0x382007)
              TaskWarpPedIntoVehicle(_0x3a82f0, _0x5126ef, -1)
              SetVehicleDirtLevel(_0x5126ef, 0)
              SetVehicleWindowTint(_0x5126ef, 0)
              _0x78b010 !== undefined &&
                SetVehicleLivery(_0x5126ef, Number(_0x78b010))
              _0x5b3749 = _0x5126ef
            })
          })
          onNet('np-admin:fixVehicle', () => {
            const _0x4ae7c0 = PlayerPedId(),
              _0x1d0d39 = GetVehiclePedIsIn(_0x4ae7c0, false)
            if (!_0x1d0d39) {
              return ''
            }
            SetVehicleEngineHealth(_0x1d0d39, 1000)
            SetVehicleBodyHealth(_0x1d0d39, 1000)
            SetVehicleDeformationFixed(_0x1d0d39)
            SetVehicleFixed(_0x1d0d39)
          })
          onNet('np-admin:cSay', (_0x202e99) => {
            emitNet('np-admin:sendAnnoucement', _0x202e99)
          })
          onNet('np-admin:tSay', (_0x417c0f) => {
            emitNet('np-admin:sendTsay', _0x417c0f)
          })
          onNet('np-admin:teleportPlayer', (_0x34de69) => {
            if (_0x34de69 === undefined || _0x34de69 === 0) {
              return emit('DoLongHudText', 'Invalid target.', 2)
            }
            let _0x47dff2 = PlayerId(),
              _0x47f680 = GetPlayerServerId(_0x47dff2)
            emitNet('np-admin:teleportPlayer', _0x47f680, _0x34de69)
          })
          onNet('np-admin:teleportCoords', (_0x3ae703) => {
            if (_0x3ae703 === '' || _0x3ae703 === undefined) {
              return emit('DoLongHudText', 'Invalid coordinates.', 2)
            }
            let _0x42a652 = _0x3ae703.split(', ')
            SetEntityCoords(
              PlayerPedId(),
              Number(_0x42a652[0]),
              Number(_0x42a652[1]),
              Number(_0x42a652[2]),
              true,
              false,
              false,
              false
            )
          })
          onNet('np-admin:bringPlayer', (_0x2bde99) => {
            if (_0x2bde99 === undefined || _0x2bde99 === 0) {
              return emit('DoLongHudText', 'Invalid target.', 2)
            }
            let _0x253b00 = PlayerId(),
              _0x6854f1 = GetPlayerServerId(_0x253b00)
            emitNet('np-admin:bringPlayer', _0x6854f1, _0x2bde99)
          })
          onNet('np-admin:toggleGodmode', async (_0x5372a5) => {
            emitNet('np-admin:sendLog', 'godmode', _0x5372a5)
            let _0x27f05d = _0x5372a5
            emit('carandplayerhud:godCheck', _0x5372a5)
            while (_0x27f05d) {
              SetEntityInvincible(GetPlayerPed(-1), true)
              SetPlayerInvincible(PlayerId(), true)
              SetPedCanRagdoll(GetPlayerPed(-1), false)
              ClearPedBloodDamage(GetPlayerPed(-1))
              ResetPedVisibleDamage(GetPlayerPed(-1))
              ClearPedLastWeaponDamage(GetPlayerPed(-1))
              SetEntityProofs(
                GetPlayerPed(-1),
                true,
                true,
                true,
                true,
                true,
                true,
                true,
                true
              )
              SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
              SetEntityCanBeDamaged(GetPlayerPed(-1), false)
              await (0, _0x1776f9.Delay)(0)
            }
            while (!_0x27f05d) {
              SetEntityInvincible(GetPlayerPed(-1), false)
              SetPlayerInvincible(PlayerId(), false)
              SetPedCanRagdoll(GetPlayerPed(-1), true)
              ClearPedLastWeaponDamage(GetPlayerPed(-1))
              SetEntityProofs(
                GetPlayerPed(-1),
                false,
                false,
                false,
                false,
                false,
                false,
                false,
                false
              )
              SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), true)
              SetEntityCanBeDamaged(GetPlayerPed(-1), true)
              await (0, _0x1776f9.Delay)(0)
            }
          })
          onNet('np-admin:maxMyStats', (_0xa28202) => {
            emitNet('np-admin:maxMyStats', _0xa28202)
          })
          onNet('np-admin:removeStress', async (_0x1b650f, _0xc143e4) => {
            emitNet('np-admin:removeStress', _0x1b650f, _0xc143e4)
          })
          onNet('np-admin:clearStress', async (_0x746708) => {
            emitNet('server:alterStress', false, _0x746708)
          })
          onNet('np-admin:devSpawn', () => {
            emit("np-admin:client:devSpawn")
          })
          onNet('np-admin:toggleCloak', async (_0x567347) => {
            let _0x33228b = _0x567347
            while (_0x33228b) {
              SetLocalPlayerVisibleLocally(true)
              SetEntityAlpha(PlayerPedId(), 50, false)
              SetEntityVisible(PlayerPedId(), false, false)
              await (0, _0x1776f9.Delay)(0)
            }
            while (!_0x33228b) {
              ResetEntityAlpha(PlayerPedId())
              SetEntityVisible(PlayerPedId(), true, false)
              await (0, _0x1776f9.Delay)(0)
            }
          })
          onNet('np-admin:requestJob', (_0x2bb3c2, _0x2bacd1) => {
            emitNet('np-admin:requestJob', _0x2bb3c2, _0x2bacd1)
          })
          onNet('np-admin:requestedJob', (_0x210e8e) => {
            switch (_0x210e8e) {
              case 'police':
                emitNet('np-duty:AttemptDuty', 'police')
                break
              case 'sheriff':
                emitNet('np-duty:AttemptDuty', 'sheriff')
                break
              case 'state':
                emitNet('np-duty:AttemptDuty', 'state')
                break
              case 'doc':
                emitNet('np-duty:AttemptDuty', 'doc')
                break
              case 'dispatcher':
                emitNet('np-duty:AttemptDuty', 'dispatcher')
                break
              case 'ems':
                emitNet('np-duty:AttemptDutyEMS')
                break
              case 'judge':
                emitNet('np-duty:attempt_duty:judge')
                break
              case 'lawyer':
                emitNet('np-duty:attempt_duty:public_defender')
                break
              default:
                emitNet('jobssystem:jobs', _0x210e8e)
                break
            }
          })
          onNet('np-admin:requestBarber', (_0x546309) => {
            emitNet('np-admin:requestBarber', _0x546309)
          })
          onNet('np-admin:requestClothing', (_0x5e83df) => {
            emitNet('np-admin:requestClothing', _0x5e83df)
          })
          onNet('np-admin:requestBennys', (_0x2a4ffb) => {
            emitNet('np-admin:requestBennys', _0x2a4ffb)
          })
          onNet('np-admin:openBarber', () => {
            _0x462300.g.exports['np-adminUI'].hideMenu()
            emit('raid_clothes:admin:open', 'barber_shop')
          })
          onNet('np-admin:openClothing', () => {
            _0x462300.g.exports['np-adminUI'].hideMenu(),
              emit('raid_clothes:admin:open', 'clothing_shop')
          })
          onNet('np-admin:openBennys', () => {
            _0x462300.g.exports['np-adminUI'].hideMenu()
            _0x462300.g.exports['np-adminUI'].exitNUI()
          })
          onNet('np-admin:updateGarage', (_0x341318, _0x9fbb96) => {
            emitNet('np-admin:updateGarage', _0x341318, _0x9fbb96)
          })
          onNet('np-admin:giveLicense', (_0x316c4b, _0x87715f) => {
            emitNet('np-admin:giveLicense', _0x316c4b, _0x87715f)
          })
          onNet(
            'np-admin:giveJobWhitelist',
            (_0x3dd32e, _0x10412a, _0x41406c) => {
              emitNet(
                'np-admin:giveJobWhitelist',
                _0x3dd32e,
                _0x10412a,
                _0x41406c
              )
            }
          )
          onNet('np-admin:giveCash', (_0x47a5a4, _0x29d203) => {
            emitNet('np-admin:giveCash', _0x47a5a4, _0x29d203)
          })
          onNet('np-admin:kickPlayer', (_0x1c6c3a, _0x35d395) => {
            emitNet('np-admin:kickPlayer', _0x1c6c3a, _0x35d395)
          })
          onNet('np-admin:createBusiness', (_0x2ad078, _0x266838, _0x1cee3f) => {
            emitNet('np-admin:createBusiness', _0x2ad078, _0x266838, _0x1cee3f)
          })
          onNet('np-admin:searchPlayerInventory', (_0x4df8b3) => {
            emitNet('np-admin:searchPlayerInventory', _0x4df8b3)
          })
          function _0x2cbe78() {
            const _0x4c6288 = JSON.parse(
              GetResourceKvpString('Json_adminMenuFavCommands')
            )
            if (_0x4c6288 == null) {
              return []
            }
            return _0x4c6288
          }
          function _0x129d1e(_0x2a26c0) {
            let _0x520cdb = _0x2a26c0
            SetResourceKvp('Json_adminMenuFavCommands', JSON.stringify(_0x520cdb))
            _0x462300.g.exports['np-adminUI'].updateMenuData(_0x15df07)
          }
          function _0x1d24b0(_0x380921) {
            _0x597ea5 = _0x380921
            SetResourceKvp('Json_adminMenuOptions', JSON.stringify(_0x597ea5))
          }
          async function _0x4cc3c5(_0x587846) {
            _0x597ea5.length == 0 && (await _0x3848a6())
            const _0x4e524d = _0x597ea5.find(
              (_0x39a8e4) => _0x39a8e4.optionName === _0x587846
            )
            return _0x4e524d
          }
          async function _0x3848a6() {
            return new Promise((_0x2208a4) => {
              let _0x4a1626 = false
              const _0x5416a0 = JSON.parse(
                GetResourceKvpString('Json_adminMenuOptions')
              )
              if (!_0x1b71fb && _0x5416a0 != null) {
                for (const _0x15d198 in _0x53b9e0) {
                  const _0x37015c = _0x53b9e0[_0x15d198],
                    _0x3aff81 = _0x5416a0.find(
                      (_0x27ab33) => _0x27ab33.optionName === _0x37015c.optionName
                    )
                  _0x3aff81 == null &&
                    ((_0x4a1626 = true), _0x5416a0.push(_0x37015c))
                }
                _0x1b71fb = true
                if (_0x4a1626) {
                  _0x1d24b0(_0x5416a0)
                }
              }
              if (_0x5416a0 == null) {
                if (_0x597ea5.length == 0) {
                  _0x597ea5 = _0x53b9e0
                }
              } else {
                _0x597ea5 = _0x5416a0
              }
              return _0x2208a4(_0x597ea5)
            })
          }
          async function _0x41f612() {
            let _0x14b040 = await RPC.execute('arp:admin:getPlayerData')
            return _0x14b040
          }
          function _0x297ac7() {
            const _0x37429f = [],
              _0x5bde57 = JSON.parse(
                GetResourceKvpString('Json_adminKeyOptions_2')
              )
            if (!_0x130f2e && _0x5bde57 != null) {
              for (const _0x51c9aa in _0x2e69ae) {
                const _0x207d1b = _0x2e69ae[_0x51c9aa],
                  _0x90b1a9 = _0x5bde57.find(
                    (_0x20259b) => _0x20259b.key === _0x207d1b.key
                  )
                if (_0x90b1a9 == null) {
                  _0x5bde57.push(_0x207d1b)
                }
              }
              _0x130f2e = true
              _0x2e69ae = _0x5bde57
            }
            for (const _0x1da2f9 in _0x2e69ae) {
              const _0x33b2f4 = _0x2e69ae[_0x1da2f9],
                _0xef7311 = { text: _0x33b2f4.key }
              _0x37429f.push(_0xef7311)
            }
            for (const _0x28d0fa in _0xaf6e3d) {
              const _0x37c483 = _0xaf6e3d[_0x28d0fa]
              if (
                _0x37c483.adminMenu &&
                _0x37c483.adminMenu.options.bindKey &&
                _0x37c483.adminMenu.options.bindKey.options
              ) {
                const _0xde2683 = _0x37c483.adminMenu.command.title,
                  _0x5335ac = _0x2e69ae.find(
                    (_0x3f6ac4) => _0x3f6ac4.parent === _0xde2683
                  )
                _0x5335ac
                  ? (_0x37c483.adminMenu.options.bindKey.value = _0x5335ac.key)
                  : (_0x37c483.adminMenu.options.bindKey.value = null)
                _0x37c483.adminMenu.options.bindKey.options = _0x37429f
              }
            }
            return
          }
          function _0x1f3c09(_0x251fb3) {
            if (JSON.stringify(_0x2302ec) === JSON.stringify(_0x251fb3)) {
              return
            }
            _0x2302ec = _0x251fb3
            for (const _0x562231 in _0x251fb3) {
              const _0x59fcd2 = _0x251fb3[_0x562231]
              if (_0x59fcd2 == 'none') {
                const _0x13514c = _0x2e69ae.find(
                  (_0xb66d68) =>
                    _0xb66d68.parent.toLocaleLowerCase() ===
                    _0x562231.toLocaleLowerCase()
                )
                if (_0x13514c) {
                  _0x13514c.parent = ''
                }
                continue
              }
              if (_0x59fcd2 == null) {
                continue
              }
              const _0x3701b8 = _0x2e69ae.find(
                (_0x12ac94) => _0x12ac94.key === _0x59fcd2
              )
              if (_0x3701b8) {
                _0x3701b8.parent = _0x562231
              }
              for (const _0xd17f57 in _0x2e69ae) {
                const _0x5d84fb = _0x2e69ae[_0xd17f57]
                _0x5d84fb.parent == _0x562231 &&
                  _0x5d84fb.key != _0x59fcd2 &&
                  (_0x5d84fb.parent = '')
              }
            }
            SetResourceKvp('Json_adminKeyOptions_2', JSON.stringify(_0x2e69ae))
            _0x297ac7()
            const _0x362237 = []
            for (const _0x304f80 in _0xaf6e3d) {
              const _0x537c0d = _0xaf6e3d[_0x304f80]
              _0x362237.push(_0x537c0d.adminMenu)
            }
            _0x462300.g.exports['np-adminUI'].updateMenuData(_0x362237)
            return
          }
          function _0xe8d458() {
            if (_0x4414be) {
              return
            }
            _0x297ac7()
            for (const _0x11b07f in _0x2e69ae) {
              const _0x12130a = _0x2e69ae[_0x11b07f]
              if (_0x12130a.key != 'none') {
                RegisterCommand(
                  '+' + _0x12130a.key,
                  () => _0x228df3(_0x12130a.key),
                  false
                )
                RegisterCommand('-' + _0x12130a.key, () => {}, false)
                _0x462300.g.exports['np-binds'].registerKeyMapping(
                  '',
                  'zzAdmin',
                  _0x12130a.key,
                  '+' + _0x12130a.key,
                  '-' + _0x12130a.key,
                  ''
                )
              }
            }
            _0x4414be = true
          }
          async function _0x228df3(_0x4ff0e7) {
            if (!_0x3d0faf) {
              console.log('[Admin Menu] You are not in admin mode!')
              return
            }
            const _0x10104c = _0x2e69ae.find(
              (_0x54e291) => _0x54e291.key === _0x4ff0e7
            )
            if (_0x10104c) {
              console.log('[Admin Menu] Executing bind: ' + _0x10104c.parent)
              const _0x29ae89 = _0xaf6e3d.find(
                (_0x30d52e) =>
                  _0x30d52e.adminMenu != null &&
                  _0x30d52e.adminMenu.command.title.toLowerCase() ===
                    _0x10104c.parent.toLowerCase()
              )
              if (_0x29ae89 == null) {
                return
              }
              let _0x5a2e62 = _0x15df07.findIndex(
                (_0x4bd99) =>
                  _0x4bd99.command.action === _0x29ae89.adminMenu.command.action
              )
              _0x5a2e62 !== -1 &&
                (_0x15df07[_0x5a2e62].command.child =
                  !_0x15df07[_0x5a2e62].command.child)
              _0x15df07[_0x5a2e62].command.child !== undefined
                ? (console.log(
                    '[Admin Menu] Toggle: ' + _0x15df07[_0x5a2e62].command.child
                  ),
                  emit(
                    _0x29ae89.adminMenu.command.action,
                    _0x15df07[_0x5a2e62].command.child
                  ))
                : emit(_0x29ae89.adminMenu.command.action)
            }
          }
          function _0x25f08b(_0x50aded) {
            let _0x2310b8 = null
            if (_0x50aded == 'empty') {
              _0x2310b8 = null
              return
            }
            _0x2310b8 = _0x50aded
            const _0x5dcfd9 = [
              {
                source: 1,
                charName: 'Kevin Malagnaggi',
                charID: 1,
                disc: false,
                queueType: 'Regular',
              },
            ]
            _0x462300.g.exports['np-adminUI'].updateDefinedNames(_0x5dcfd9)
          }
          async function _0x356804(_0x286b4b) {
            const _0x3c9d87 = await RPC.execute(
              'arp:admin:getPlayerLogs',
              _0x286b4b
            )
            _0x462300.g.exports['np-adminUI'].updatePlayerLogs(_0x3c9d87)
          }
          RegisterNuiCallbackType('adminMenu')
          on('__cfx_nui:adminMenu', (_0xeaa81b, _0x5430b8) => {
            switch (_0xeaa81b.action) {
              case 'updatePlayerLogs':
                _0x356804(_0xeaa81b.searchParam)
                break
              case 'updateOptions':
                _0x1d24b0(_0xeaa81b.options)
                break
              case 'updateKeybinds':
                _0x1f3c09(_0xeaa81b.keyBinds)
                break
              case 'updateFavCommands':
                _0x129d1e(_0xeaa81b.favCommands)
                break
              case 'getDefinedNames':
                _0x25f08b(_0xeaa81b.playerList)
                break
              case 'updateCommandState':
                emit(_0xeaa81b.commandAction, _0xeaa81b.commandData.toggle)
                let _0x253acd = _0x15df07.findIndex(
                  (_0x3a6b63) =>
                    _0x3a6b63.command.action === _0xeaa81b.commandAction
                )
                if (_0x253acd !== -1) {
                  _0x15df07[_0x253acd].command.child =
                    _0xeaa81b.commandData.toggle
                }
                break
              case 'toggleAdminMode':
                ;(_0x3d0faf = !_0x3d0faf),
                  emit('np-admin:currentDevmode', _0x3d0faf),
                  _0x462300.g.exports['np-adminUI'].updateAdminMode(_0x3d0faf)
                break
              case 'runEvent':
                emit(_0xeaa81b.event)
                break
              case 'clearDefinedNames':
                break
            }
            _0x5430b8()
          })
          RegisterNuiCallbackType('runCommandMenu')
          on('__cfx_nui:runCommandMenu', (_0x417e58, _0x2bb5f2) => {
            console.log('runCommandMenu', _0x417e58)
            switch (_0x417e58.action) {
              case 'np-admin:becomeModel':
                emit(_0x417e58.action, _0x417e58.data.Model)
                break
              case 'np-admin:spawnVehicle':
                emit(
                  _0x417e58.action,
                  _0x417e58.data?.Target,
                  _0x417e58.data?.Vehicle,
                  _0x417e58?.data['Vehicle Overwrite'],
                  _0x417e58.data.Mods
                )
                break
              case 'np-admin:giveItem':
                emit(
                  _0x417e58.action,
                  _0x417e58.data.Target,
                  _0x417e58.data.Item,
                  _0x417e58.data.Amount
                )
                break
              case 'np-admin:revive':
                _0x417e58.data.Target === '' ||
                _0x417e58.data.Target === undefined ||
                !_0x417e58.data.Target
                  ? (emit('np-admin:ReviveInDistance'),
                    emitNet('np-admin:sendLog', 'reviveDistance'))
                  : (emitNet('np-death:reviveSV', Number(_0x417e58.data.Target)),
                    emitNet('reviveGranted', Number(_0x417e58.data.Target)),
                    emitNet('ems:healplayer', Number(_0x417e58.data.Target)),
                    emitNet(
                      'np-admin:sendLog',
                      'reviveTarget',
                      false,
                      _0x417e58.data.Target
                    ))
                break
              case 'np-admin:cSay':
                emit(_0x417e58.action, _0x417e58.data.Text)
                break
              case 'np-admin:tSay':
                emit(_0x417e58.action, _0x417e58.data.Text)
                break
              case 'np-admin:teleportCoords':
                emit(_0x417e58.action, _0x417e58.data.Coords)
                break
              case 'np-admin:teleportPlayer':
                emit(_0x417e58.action, _0x417e58.data.Target)
                break
              case 'np-admin:bringPlayer':
                emit(_0x417e58.action, _0x417e58.data.Target)
              case 'np-admin:maxMyStats':
                emit(_0x417e58.action, _0x417e58.data.Target)
                break
              case 'np-admin:removeStress':
                emit(
                  _0x417e58.action,
                  _0x417e58.data.Target,
                  _0x417e58.data.Amount
                )
                break
              case 'np-admin:requestJob':
                emit(_0x417e58.action, _0x417e58.data.Target, _0x417e58.data.Job)
                break
              case 'np-admin:updateGarage':
                emit(
                  _0x417e58.action,
                  _0x417e58.data.Plate,
                  _0x417e58.data.Garage
                )
                break
              case 'np-admin:giveLicense':
                emit(
                  _0x417e58.action,
                  _0x417e58.data.Target,
                  _0x417e58.data.License
                )
                break
              case 'np-admin:giveJobWhitelist':
                emit(
                  _0x417e58.action,
                  _0x417e58.data.Target,
                  _0x417e58.data.Job,
                  _0x417e58.data.Rank
                )
                break
              case 'np-admin:giveCash':
                emit(
                  _0x417e58.action,
                  _0x417e58.data.Target,
                  _0x417e58.data.Amount
                )
                break
              case 'np-admin:kickPlayer':
                emit(
                  _0x417e58.action,
                  _0x417e58.data.Target,
                  _0x417e58.data.Reason
                )
                break
              case 'np-admin:createBusiness':
                emit(
                  _0x417e58.action,
                  _0x417e58.data.ID,
                  _0x417e58.data.Name,
                  _0x417e58.data.Owner
                )
                break
              default:
                emit(_0x417e58.action, _0x417e58.data?.Target)
                break
            }
            _0x2bb5f2()
          })
          async function _0x25de81() {
            if (!_0x3d0faf) {
              return
            }
            _0x462300.g.exports['np-selector'].startSelecting(
              -1,
              PlayerPedId(),
              (_0x5c1090, _0x502269, _0xcb922c) =>
                _0x502269 === 1 || _0x502269 === 2 || _0x502269 === 3
            )
          }
          async function _0x4beebb() {
            if (!_0x3d0faf) {
              return
            }
            _0x572abd = _0x462300.g.exports['np-selector'].stopSelecting()
            if (_0x572abd.selectedEntity) {
              await _0x158d9a(_0x572abd.selectedEntity)
            } else {
              _0x462300.g.exports['np-selector'].deselect()
            }
          }
          async function _0x569289() {
            const _0x1f78cb = _0x572abd.selectedEntity
            if (_0x572abd.selectedEntity) {
              const _0x470d45 = GetEntityType(_0x1f78cb)
              _0x470d45 >= 1 &&
                !IsPedAPlayer(_0x1f78cb) &&
                DeleteEntity(_0x1f78cb)
            }
          }
          function _0x2c21d2(_0x27b928, _0x7dc1c2) {
            const _0x43fdec = []
            for (const _0x4de38a in _0xaf6e3d) {
              const _0x3a07ff = _0xaf6e3d[_0x4de38a].selection
              if (!_0x3a07ff) {
                continue
              }
              if (
                _0x3a07ff.entityType == _0x27b928 ||
                (_0x7dc1c2 != null && _0x3a07ff.entityType == _0x7dc1c2)
              ) {
                _0x43fdec.push(_0x3a07ff)
              }
            }
            return _0x43fdec
          }
          async function _0x158d9a(_0x4c0c01) {
            const _0x1c5170 = GetEntityType(_0x4c0c01)
            let _0x32c39e = [],
              _0x508d66 = {
                lastGarage: _0x5e15da.garage,
                plate: GetVehicleNumberPlateText(_0x4c0c01),
                cid: _0x5e15da.cid,
                vin: _0x5e15da.vin,
                size: _0x5e15da.size,
                mileage: _0x5e15da.metadata.mileage,
                fuel: _0x5e15da.metadata.fuel,
              }
            switch (_0x1c5170) {
              case 0:
                _0x32c39e = null
                break
              case 1:
                IsEntityAPed(_0x4c0c01) &&
                  ((_0x32c39e = _0x2c21d2(-1, null)),
                  (_0x508d66 = { name: 'Local' }))
                break
              case 2:
                ;(_0x32c39e = _0x2c21d2(2, -1)),
                  (_0x508d66 = {
                    name: GetLabelText(
                      GetDisplayNameFromVehicleModel(GetEntityModel(_0x4c0c01))
                    ),
                  })
                const _0x252ff8 =
                  _0x15548c['np-vehicles'].GetVehicleIdentifier(_0x4c0c01)
                let _0x5e15da = null
                if (_0x252ff8) {
                  _0x5e15da = []
                }
                if (_0x5e15da) {
                } else {
                  _0x508d66.size = GetVehicleModelNumberOfSeats(
                    GetEntityModel(_0x4c0c01)
                  )
                }
                break
              case 3:
                ;(_0x32c39e = _0x2c21d2(3, -1)),
                  (_0x508d66 = { name: '' + _0x4c0c01 })
                break
            }
          }
          async function _0x379c5d() {
            const _0x27b59e = await RPC.execute('arp:admin:isAdmin')
            if (_0x27b59e) {
              const _0x1df73b = await _0x4cc3c5('openDefaultMenu')
              if (_0xaf6e3d.length === 0) {
                _0xaf6e3d = await RPC.execute('arp:admin:getCommandUI')
                _0x2277c5(_0xaf6e3d)
                for (const _0x4d105b in _0xaf6e3d) {
                  const _0x26baef = _0xaf6e3d[_0x4d105b]
                  let _0x515460 = _0x26baef.adminMenu
                  if (
                    _0x515460 &&
                    _0x515460.command &&
                    (_0x515460.command.child == false ||
                      _0x515460.command.child == true)
                  ) {
                    const _0x4df77d = _0x2f2da0(_0x515460.command.action)
                    ;(_0x4df77d == null || !_0x4df77d) &&
                      _0x10479a(_0x515460.command.action, false)
                    _0xaf6e3d[_0x4d105b].adminMenu.command.child = _0x2f2da0(
                      _0x515460.command.action
                    )
                  }
                  _0x15df07.push(_0x26baef.adminMenu)
                }
                _0xe8d458()
              }
              _0x1df73b.data ? await _0x3577a7(2) : await _0x3577a7(3)
            }
          }
          async function _0x3577a7(_0x209c0f) {
            _0x297ac7()
            let _0x1ab346 = _0x462300.g.exports['np-inventory'].getItemListNames()
            const _0x3cc667 =
              _0x462300.g.exports['np-base'].getModule('JobManager').ValidJobs
            let _0x12919f = []
            for (const _0x1dc989 in _0x3cc667) {
              if (_0x3cc667) {
                const _0x1b0950 = _0x3cc667[_0x1dc989]
                _0x1b0950 &&
                  _0x12919f.push({
                    job: _0x1dc989,
                    name: _0x1b0950.name,
                  })
              }
            }
            // let _0x76700c = _0x462300.g.exports['np-vehicles'].GetGarageList()
            const _0x3e883a = {
              playerData: await _0x41f612(),
              options: await _0x3848a6(),
              menuData: _0x15df07,
              playerLogs: null,
              adminMode: _0x3d0faf,
              itemList: _0x1ab346,
              vehicleList: [],
            //   garageList: _0x76700c,
              jobList: _0x12919f,
              licenseList: [
                {
                  id: 'Drivers',
                  name: 'Drivers License',
                },
                {
                  id: 'Weapon',
                  name: 'Weapon License',
                },
                {
                  id: 'Fishing',
                  name: 'Fishing License',
                },
                {
                  id: 'Hunting',
                  name: 'Hunting License',
                },
                {
                  id: 'Pilot',
                  name: 'Pilot License',
                },
                {
                  id: 'Business',
                  name: 'Business License',
                },
                {
                  id: 'Bar',
                  name: 'Bar License',
                },
              ],
              favCommands: _0x2cbe78(),
              disconnectedPlayers: [],
              bannedList: [],
            }
            _0x462300.g.exports['np-adminUI'].setCommandUI(_0x3e883a, null, 2)
          }
          setImmediate(() => {
            RegisterCommand('+adminSelect', async () => await _0x25de81(), false)
            RegisterCommand('-adminSelect', async () => await _0x4beebb(), false)
            RegisterCommand(
              '+adminDeleteEntity',
              async () => await _0x569289(),
              false
            )
            RegisterCommand('-adminDeleteEntity', () => {}, false)
            RegisterCommand(
              '+openAdminMenu',
              async () => await _0x379c5d(),
              false
            )
            RegisterCommand('-openAdminMenu', () => {}, false)
            _0x462300.g.exports['np-binds'].registerKeyMapping(
              'general',
              'zzAdmin',
              'Delete Target',
              '+adminDeleteEntity',
              '-adminDeleteEntity',
              ''
            )
            _0x462300.g.exports['np-binds'].registerKeyMapping(
              'general',
              'zzAdmin',
              'Select Target',
              '+adminSelect',
              '-adminSelect',
              ''
            )
            _0x462300.g.exports['np-binds'].registerKeyMapping(
              'general',
              'zzAdmin',
              'Open Menu',
              '+openAdminMenu',
              '-openAdminMenu',
              ''
            )
          })
          RegisterCommand('menu', async () => await _0x379c5d(), false)
        },
        615: function (_0x309e59, _0x13cff0) {
          Object.defineProperty(_0x13cff0, '__esModule', { value: true })
          _0x13cff0.formatCoords =
            _0x13cff0.loadAnimDict =
            _0x13cff0.Delay =
              void 0
          let _0x285923 = (_0x528995) =>
            new Promise((_0x3e3c27) => setTimeout(_0x3e3c27, _0x528995))
          _0x13cff0.Delay = _0x285923
          async function _0x5acb4d(_0x21a554) {
            while (!HasAnimDictLoaded(_0x21a554)) {
              RequestAnimDict(_0x21a554)
              await (0, _0x13cff0.Delay)(5)
            }
          }
          _0x13cff0.loadAnimDict = _0x5acb4d
          class _0x1b8868 {
            constructor(_0x5d5816 = 0, _0x4b5335 = 0, _0x306105 = 0) {
              this.x = _0x5d5816
              this.y = _0x4b5335
              this.z = _0x306105
            }
            ['setFromArray'](_0x404c32) {
              return (
                (this.x = _0x404c32[0]),
                (this.y = _0x404c32[1]),
                (this.z = _0x404c32[2]),
                this
              )
            }
            ['getArray']() {
              return [this.x, this.y, this.z]
            }
            ['add'](_0x195e99) {
              return (
                (this.x += _0x195e99.x),
                (this.y += _0x195e99.y),
                (this.z += _0x195e99.z),
                this
              )
            }
            ['addScalar'](_0x2bf56b) {
              return (
                (this.x += _0x2bf56b),
                (this.y += _0x2bf56b),
                (this.z += _0x2bf56b),
                this
              )
            }
            ['sub'](_0x1f9dcd) {
              return (
                (this.x -= _0x1f9dcd.x),
                (this.y -= _0x1f9dcd.y),
                (this.z -= _0x1f9dcd.z),
                this
              )
            }
            ['addPlusScaler'](_0x1ffed0, _0x8e6124) {
              return (
                (this.x += _0x1ffed0.x * _0x8e6124),
                (this.y += _0x1ffed0.y * _0x8e6124),
                (this.z += _0x1ffed0.z * _0x8e6124),
                this
              )
            }
            ['subPlusScaler'](_0x3451a9, _0x123e2a) {
              return (
                (this.x -= _0x3451a9.x * _0x123e2a),
                (this.y -= _0x3451a9.y * _0x123e2a),
                (this.z -= _0x3451a9.z * _0x123e2a),
                this
              )
            }
            ['equals'](_0x2f53de) {
              return (
                this.x === _0x2f53de.x &&
                this.y === _0x2f53de.y &&
                this.z === _0x2f53de.z
              )
            }
            ['subScalar'](_0x2e8e84) {
              return (
                (this.x -= _0x2e8e84),
                (this.y -= _0x2e8e84),
                (this.z -= _0x2e8e84),
                this
              )
            }
            ['multiply'](_0x20ef19) {
              return (
                (this.x *= _0x20ef19.x),
                (this.y *= _0x20ef19.y),
                (this.z *= _0x20ef19.z),
                this
              )
            }
            ['multiplyScalar'](_0x253047) {
              return (
                (this.x *= _0x253047),
                (this.y *= _0x253047),
                (this.z *= _0x253047),
                this
              )
            }
            ['round']() {
              return (
                (this.x = Math.round(this.x)),
                (this.y = Math.round(this.y)),
                (this.z = Math.round(this.z)),
                this
              )
            }
            ['floor']() {
              return (
                (this.x = Math.floor(this.x)),
                (this.y = Math.floor(this.y)),
                (this.z = Math.floor(this.z)),
                this
              )
            }
            ['ceil']() {
              return (
                (this.x = Math.ceil(this.x)),
                (this.y = Math.ceil(this.y)),
                (this.z = Math.ceil(this.z)),
                this
              )
            }
            ['getDistance'](_0x436a2c) {
              const [_0x442dba, _0x4886f6, _0xbf44f5] = [
                this.x - _0x436a2c.x,
                this.y - _0x436a2c.y,
                this.z - _0x436a2c.z,
              ]
              return Math.sqrt(
                _0x442dba * _0x442dba +
                  _0x4886f6 * _0x4886f6 +
                  _0xbf44f5 * _0xbf44f5
              )
            }
            ['getDistanceFromArray'](_0x3ad5e3) {
              const [_0x5035df, _0x12aec4, _0x2a2295] = [
                this.x - _0x3ad5e3[0],
                this.y - _0x3ad5e3[1],
                this.z - _0x3ad5e3[2],
              ]
              return Math.sqrt(
                _0x5035df * _0x5035df +
                  _0x12aec4 * _0x12aec4 +
                  _0x2a2295 * _0x2a2295
              )
            }
            ['isCoordinateEqual'](_0x5394e1, _0x3b494f) {
              return _0x5394e1.equals(_0x3b494f)
            }
            static ['fromArray'](_0x33c0e4) {
              return new _0x1b8868(_0x33c0e4[0], _0x33c0e4[1], _0x33c0e4[2])
            }
          }
          _0x13cff0.formatCoords = _0x1b8868
        },
      },
      _0x3d0e5a = {}
    function _0x3e99bb(_0x7021ce) {
      var _0x3ffe78 = _0x3d0e5a[_0x7021ce]
      if (_0x3ffe78 !== undefined) {
        return _0x3ffe78.exports
      }
      var _0x74eb50 = (_0x3d0e5a[_0x7021ce] = { exports: {} })
      _0x126dd0[_0x7021ce](_0x74eb50, _0x74eb50.exports, _0x3e99bb)
      return _0x74eb50.exports
    }
    !(function () {
      _0x3e99bb.g = (function () {
        if (typeof globalThis === 'object') {
          return globalThis
        }
        try {
          return this || new Function('return this')()
        } catch (_0x2e8c4a) {
          if (typeof window === 'object') {
            return window
          }
        }
      })()
    })()
    var _0x4f5805 = _0x3e99bb(50)
  })()
  