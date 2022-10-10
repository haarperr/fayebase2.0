;(function () {
    'use strict'
    var _0x3cf6c0 = {
        50: function (_0x5120b9, _0x5aa957, _0x275f08) {
          var _0x15f35d
          _0x15f35d = { value: true }
          console.log('[APX] Loaded!')
          const _0x3a3729 = GetCurrentResourceName(),
            _0x1c5726 = new Map(),
            _0x39d140 = new Set(),
            _0x3f6b4d = new Map()
          let _0x226a8b = new Date().getTime()
          const _0xcb7fd9 = (_0x10483c, ..._0x1188e5) => {
              switch (_0x10483c) {
                case 'coord': {
                  const [_0x237755, _0x364721, _0x3f7860] = _0x1188e5
                  return AddBlipForCoord(_0x237755, _0x364721, _0x3f7860)
                }
                case 'area': {
                  const [_0x4ae402, _0x4a686c, _0x4997cd, _0x220d9b, _0x2b003e] =
                    _0x1188e5
                  return AddBlipForArea(
                    _0x4ae402,
                    _0x4a686c,
                    _0x4997cd,
                    _0x220d9b,
                    _0x2b003e
                  )
                }
                case 'radius': {
                  const [_0x1f898b, _0x5f47c5, _0x258595, _0x54bc6e] = _0x1188e5
                  return AddBlipForRadius(
                    _0x1f898b,
                    _0x5f47c5,
                    _0x258595,
                    _0x54bc6e
                  )
                }
                case 'pickup': {
                  const [_0x282603] = _0x1188e5
                  return AddBlipForPickup(_0x282603)
                }
                case 'entity': {
                  const [_0x54a6d1] = _0x1188e5
                  return AddBlipForEntity(_0x54a6d1)
                }
                default: {
                  return console.error(new Error('Invalid Blip Type')), 0
                }
              }
            },
            _0x4d7ef9 = (
              _0x4fce0a,
              _0x38dea5,
              _0x5c563a,
              _0x5185ea,
              _0x3a65bb,
              _0x50dbe0,
              _0x1801b3,
              _0x50ee27
            ) => {
              if (typeof _0x5c563a === 'number') {
                SetBlipSprite(_0x4fce0a, _0x5c563a)
              }
              if (typeof _0x5185ea === 'number') {
                SetBlipColour(_0x4fce0a, _0x5185ea)
              }
              if (typeof _0x3a65bb === 'number') {
                SetBlipAlpha(_0x4fce0a, _0x3a65bb)
              }
              if (typeof _0x50dbe0 === 'number') {
                SetBlipScale(_0x4fce0a, _0x50dbe0)
              }
              if (typeof _0x1801b3 === 'boolean') {
                SetBlipRoute(_0x4fce0a, _0x1801b3)
              }
              if (typeof _0x50ee27 === 'boolean') {
                SetBlipAsShortRange(_0x4fce0a, _0x50ee27)
              }
              typeof _0x38dea5 === 'string' &&
                (BeginTextCommandSetBlipName('STRING'),
                AddTextComponentString(_0x38dea5),
                EndTextCommandSetBlipName(_0x4fce0a))
            }
          let _0x340c9c = { applyBlipSettings: _0x4d7ef9 }
          _0x340c9c.createBlip = _0xcb7fd9
          const _0x41a21e = _0x340c9c,
            _0x4c18ab = (_0x52d6f6, _0x324c39, _0x1ec3b6) => {
              return (
                _0x324c39[0] +
                ((_0x1ec3b6 - _0x52d6f6[0]) * (_0x324c39[1] - _0x324c39[0])) /
                  (_0x52d6f6[1] - _0x52d6f6[0])
              )
            },
            _0x28714e = (
              [_0x39378f, _0x32310e, _0x55b741],
              [_0x23c222, _0x3feb97, _0x6afdeb]
            ) => {
              const [_0x577da6, _0xda21b8, _0x1a70c0] = [
                _0x39378f - _0x23c222,
                _0x32310e - _0x3feb97,
                _0x55b741 - _0x6afdeb,
              ]
              return Math.sqrt(
                _0x577da6 * _0x577da6 +
                  _0xda21b8 * _0xda21b8 +
                  _0x1a70c0 * _0x1a70c0
              )
            },
            _0x1d8a62 = (_0x5e8248, _0x5061cb) => {
              return Math.floor(
                _0x5061cb
                  ? Math.random() * (_0x5061cb - _0x5e8248) + _0x5e8248
                  : Math.random() * _0x5e8248
              )
            }
          let _0x3bc379 = {}
          _0x3bc379.getMapRange = _0x4c18ab
          _0x3bc379.getDistance = _0x28714e
          _0x3bc379.getRandomNumber = _0x1d8a62
          const _0x43f869 = _0x3bc379
          function _0x35c29(_0x25dc87, _0x2bc9f1) {
            const _0x51dde3 = _0x3cb617((_0x710da9, _0x136da, ..._0x215b34) => {
              return _0x407c33.XHcpF(_0x25dc87, _0x710da9, ..._0x215b34)
            }, _0x2bc9f1)
            var _0x2f7059 = {}
            return (
              (_0x2f7059.get = function (..._0x13375a) {
                return _0x51dde3.get('_', ..._0x13375a)
              }),
              (_0x2f7059.reset = function () {
                _0x51dde3.reset('_')
              }),
              _0x2f7059
            )
          }
          function _0x3cb617(_0x26e462, _0x41c67e) {
            const _0x7a35d1 = _0x41c67e.timeToLive || 60000,
              _0x421b81 = { _0x56a4c7: _0x508545 }
            async function _0x3863a5(_0x56a4c7, ..._0x1a9613) {
              let _0x508545 = _0x421b81[_0x56a4c7]
              if (!_0x508545) {
                _0x26d123.lastUpdated = 0
                _0x508545 = _0x26d123
              }
              const _0x5bf56a = Date.now()
              if (
                _0x508545.lastUpdated === 0 ||
                _0x5bf56a - _0x508545.lastUpdated > _0x7a35d1
              ) {
                const [_0x2acec4, _0x1af877] = await _0x26e462(
                  _0x508545,
                  _0x56a4c7,
                  ..._0x1a9613
                )
                return (
                  _0x2acec4 &&
                    ((_0x508545.lastUpdated = _0x5bf56a),
                    (_0x508545.value = _0x1af877)),
                  _0x1af877
                )
              }
              return await new Promise((_0x202b9e) =>
                setTimeout(() => _0x202b9e(_0x508545.value), 0)
              )
            }
            var _0x56e73c = {}
            return (
              (_0x56e73c.get = async function (_0x1cc29c, ..._0x458ec6) {
                return await _0x3863a5(_0x1cc29c, ..._0x458ec6)
              }),
              (_0x56e73c.reset = function (_0x3cba4c) {
                var _0x8c040d = _0x421b81[_0x3cba4c]
                if (_0x8c040d) {
                  _0x8c040d.lastUpdated = 0
                }
              }),
              _0x56e73c
            )
          }
          function _0x493ae5(_0x37e443, _0x2b83ad) {
            return new Promise((_0x1c6ba8) => {
              const _0x1e0013 = Date.now(),
                _0x96b720 = setTick(() => {
                  const _0x21fb6f = Date.now() - _0x1e0013 > _0x2b83ad
                  if (_0x37e443() || _0x21fb6f) {
                    return clearTick(_0x96b720), _0x1c6ba8(_0x21fb6f)
                  }
                })
            })
          }
          let _0x187122 = { cache: _0x35c29 }
          _0x187122.cacheableMap = _0x3cb617
          _0x187122.waitForCondition = _0x493ae5
          const _0x4a8617 = Object.assign(_0x187122, _0x43f869)
          on('np-polyzone:enter', (_0x4ec29d, _0x2eea7e) => {
            _0x39d140.add(_0x4ec29d)
            if (
              _0x2eea7e === null || _0x2eea7e === void 0 ? void 0 : _0x2eea7e.id
            ) {
              _0x39d140.add(_0x4ec29d + '-' + _0x2eea7e.id)
            }
            const _0x374fff = _0x3f6b4d.get(_0x4ec29d + '-enter')
            if (_0x374fff === undefined) {
              return
            }
            for (const _0x44f9e5 of _0x374fff) {
              try {
                _0x44f9e5(_0x2eea7e)
              } catch (_0x209c49) {
                console.log(_0x209c49)
              }
            }
          })
          on('np-polyzone:exit', (_0x33632b, _0x102e5f) => {
            _0x39d140.delete(_0x33632b)
            if (
              _0x102e5f === null || _0x102e5f === void 0 ? void 0 : _0x102e5f.id
            ) {
              _0x39d140.delete(_0x33632b + '-' + _0x102e5f.id)
            }
            const _0x32bb83 = _0x3f6b4d.get(_0x33632b + '-exit')
            if (_0x32bb83 === undefined) {
              return
            }
            for (const _0x278898 of _0x32bb83) {
              try {
                _0x278898(_0x102e5f)
              } catch (_0x35e5b7) {
                console.log(_0x35e5b7)
              }
            }
          })
          const _0x1440ac = (_0x394bd2, _0x15745a) => {
              return _0x39d140.has(
                _0x15745a ? _0x394bd2 + '-' + _0x15745a : _0x394bd2
              )
            },
            _0x4019ab = (_0xb8b5b2, _0x199cc9) => {
              var _0x58b1ff
              const _0x2a3639 = _0xb8b5b2 + '-enter',
                _0x113611 =
                  (_0x58b1ff = _0x3f6b4d.get(_0x2a3639)) !== null &&
                  _0x58b1ff !== void 0
                    ? _0x58b1ff
                    : []
              if (!_0x3f6b4d.has(_0x2a3639)) {
                _0x3f6b4d.set(_0x2a3639, _0x113611)
              }
              _0x113611.push(_0x199cc9)
            },
            _0x47e217 = (_0x4547eb, _0xb24991) => {
              var _0xd48437
              const _0x5c7d4c = _0x4547eb + '-exit',
                _0x4a5452 =
                  (_0xd48437 = _0x3f6b4d.get(_0x5c7d4c)) !== null &&
                  _0xd48437 !== void 0
                    ? _0xd48437
                    : []
              if (!_0x3f6b4d.has(_0x5c7d4c)) {
                _0x3f6b4d.set(_0x5c7d4c, _0x4a5452)
              }
              _0x4a5452.push(_0xb24991)
            },
            _0x5b5a0e = (
              _0xfdb732,
              _0x422ffa,
              _0xcdcf57,
              _0x1cc990,
              _0xfd38ce,
              _0x2e0f1e,
              _0x1dfcec = {}
            ) => {
              var _0x36bf3c = {}
              _0x36bf3c.data =
                _0x1dfcec !== null && _0x1dfcec !== void 0 ? _0x1dfcec : {}
              const _0x50898b = Object.assign(
                Object.assign({}, _0x2e0f1e),
                _0x36bf3c
              )
              _0x50898b.data.id = _0xfdb732
              _0x5aa957['np-polyzone'].AddBoxZone(
                _0x422ffa,
                _0xcdcf57,
                _0x1cc990,
                _0xfd38ce,
                _0x50898b
              )
            },
            _0x27796b = (
              _0x78afab,
              _0x327df5,
              _0x3f032c,
              _0x9e3b9b,
              _0x2aa4e3,
              _0x1d733d,
              _0x5d145a = {}
            ) => {
              var _0x521832 = { data: _0x5d145a }
              const _0x42cce6 = Object.assign(
                Object.assign({}, _0x1d733d),
                _0x521832
              )
              _0x42cce6.data.id = _0x78afab
              _0x5aa957['np-polytarget'].AddBoxZone(
                _0x327df5,
                _0x3f032c,
                _0x9e3b9b,
                _0x2aa4e3,
                _0x42cce6
              )
            }
          let _0x39a214 = {
            isActive: _0x1440ac,
            onExit: _0x47e217,
          }
          _0x39a214.onEnter = _0x4019ab
          _0x39a214.addBoxZone = _0x5b5a0e
          _0x39a214.addBoxTarget = _0x27796b
          const _0x26a504 = _0x39a214,
            _0x27a69d = (_0x242878) => {
              try {
                return JSON.stringify(_0x242878)
              } catch (_0x56cfc9) {
                console.error('Failed to encode payload')
              }
            },
            _0x54160e = (_0x179ba8) => {
              try {
                return JSON.parse(_0x179ba8)
              } catch (_0x4f0ecb) {
                console.error('Failed to decode payload')
              }
            }
          let _0x22ce9b = {}
          _0x22ce9b.encodePayload = _0x27a69d
          _0x22ce9b.decodePayload = _0x54160e
          const _0x5541b0 = _0x22ce9b,
            _0x2aa4b3 = (_0x2752e1, _0x3df352) => {
              return on(_0x2752e1, _0x3df352)
            },
            _0x5386e6 = (_0x2d01ad, _0x27a47a) => {
              return onNet(_0x2d01ad, _0x27a47a)
            },
            _0x312068 = (_0x15ccc3, _0x77c62f) => {
              removeEventListener(_0x15ccc3, _0x77c62f)
            },
            _0x3781dc = (_0x41efec, ..._0x1d1379) => {
              emit(_0x41efec, ..._0x1d1379)
            },
            _0x2025d0 = (_0x617114, ..._0x304dc0) => {
              const _0x4f431f = _0x617114,
                _0x48e62f = msgpack_pack(_0x304dc0)
              _0x48e62f.length < 16000
                ? TriggerServerEventInternal(
                    _0x4f431f,
                    _0x48e62f,
                    _0x48e62f.length
                  )
                : TriggerLatentServerEventInternal(
                    _0x4f431f,
                    _0x48e62f,
                    _0x48e62f.length,
                    128000
                  )
            }
          let _0x21a3e2 = {
            on: _0x2aa4b3,
            onNet: _0x5386e6,
            remove: _0x312068,
          }
          _0x21a3e2.emit = _0x3781dc
          _0x21a3e2.emitNet = _0x2025d0
          const _0xc244e0 = _0x21a3e2,
            _0x268c32 = async (_0x2912ea) => {
              const _0xbce503 =
                typeof _0x2912ea === 'number' ? _0x2912ea : GetHashKey(_0x2912ea)
              if (HasModelLoaded(_0xbce503)) {
                return true
              }
              RequestModel(_0xbce503)
              const _0x1ca671 = await _0x4a8617.waitForCondition(
                () => HasModelLoaded(_0xbce503),
                30000
              )
              return !_0x1ca671
            },
            _0x382022 = async (_0x4ccf65) => {
              if (HasAnimDictLoaded(_0x4ccf65)) {
                return true
              }
              RequestAnimDict(_0x4ccf65)
              const _0x3ae3e1 = await _0x4a8617.waitForCondition(
                () => HasAnimDictLoaded(_0x4ccf65),
                30000
              )
              return !_0x3ae3e1
            },
            _0x5cdb19 = async (_0x316a0d) => {
              if (HasClipSetLoaded(_0x316a0d)) {
                return true
              }
              RequestClipSet(_0x316a0d)
              const _0x4e269a = await _0x4a8617.waitForCondition(
                () => HasClipSetLoaded(_0x316a0d),
                30000
              )
              return !_0x4e269a
            },
            _0x45927a = async (_0x2959f3) => {
              if (HasStreamedTextureDictLoaded(_0x2959f3)) {
                return true
              }
              RequestStreamedTextureDict(_0x2959f3, true)
              const _0x4f4809 = await _0x4a8617.waitForCondition(
                () => HasStreamedTextureDictLoaded(_0x2959f3),
                30000
              )
              return !_0x4f4809
            },
            _0x20a2cb = async (_0x193985, _0x3985a1, _0x30ba0d) => {
              const _0x44b0ee =
                typeof _0x193985 === 'number' ? _0x193985 : GetHashKey(_0x193985)
              if (HasWeaponAssetLoaded(_0x44b0ee)) {
                return true
              }
              RequestWeaponAsset(_0x44b0ee, _0x3985a1, _0x30ba0d)
              const _0x4d932b = await _0x4a8617.waitForCondition(
                () => HasWeaponAssetLoaded(_0x44b0ee),
                30000
              )
              return !_0x4d932b
            },
            _0x3a0fd8 = async (_0x451263) => {
              if (HasNamedPtfxAssetLoaded(_0x451263)) {
                return true
              }
              RequestNamedPtfxAsset(_0x451263)
              const _0x154e2a = await _0x4a8617.waitForCondition(
                () => HasNamedPtfxAssetLoaded(_0x451263),
                30000
              )
              return !_0x154e2a
            }
          let _0xb3dd3c = {
            loadModel: _0x268c32,
            loadTexture: _0x45927a,
            loadClipSet: _0x5cdb19,
          }
          _0xb3dd3c.loadAnim = _0x382022
          _0xb3dd3c.loadWeaponAsset = _0x20a2cb
          _0xb3dd3c.loadNamedPtfxAsset = _0x3a0fd8
          const _0x4bb8f9 = _0xb3dd3c,
            _0x90c618 = (_0x38aeba, _0x5332b9) => {
              _0xc244e0.onNet(
                '__apx_req:' + _0x38aeba,
                async (_0x3debe2, _0xcde153) => {
                  let _0x259275, _0x2f4986
                  const _0x3c66a6 = _0x5541b0.decodePayload(_0x3debe2)
                  if (_0x3c66a6 === undefined) {
                    return console.log(
                      '[RPC] Received malformed packet:',
                      _0x3debe2
                    )
                  }
                  try {
                    _0x259275 = await _0x3f516e.Xlzdy(_0x5332b9, ..._0xcde153)
                    _0x2f4986 = true
                  } catch (_0x20c742) {
                    _0x259275 = _0x20c742
                    _0x2f4986 = false
                  }
                  if (_0x3c66a6.type === 'remote') {
                    _0xc244e0.emitNet(
                      '__apx_res:' + _0x3c66a6.origin,
                      _0x3c66a6.id,
                      [_0x2f4986, _0x259275]
                    )
                  } else {
                    _0x3c66a6.type === 'local' &&
                      _0xc244e0.emit(
                        '__apx_res:' + _0x3c66a6.origin,
                        _0x3c66a6.id,
                        [_0x2f4986, _0x259275]
                      )
                  }
                }
              )
            },
            _0x386d3a = (_0x557402, ..._0x2c6686) => {
              console.log('[RPC] Executing procedure:', _0x557402, _0x2c6686)
              const _0x4cb5d1 = GetPlayerServerId(PlayerId())
              var _0x280715 = {
                id: ++_0x226a8b,
                origin: _0x3a3729,
              }
              _0x280715.type = 'remote'
              _0x280715.src = _0x4cb5d1
              const _0x3ee178 = _0x280715,
                _0x4df86e = new Promise((_0x5d39e7, _0x5c2c14) => {
                  const _0x5896cc = +setTimeout(
                    () =>
                      _0x5c2c14(
                        new Error('Remote call timed out | ' + _0x557402)
                      ),
                    60000
                  )
                  var _0x34144b = { resolve: _0x5d39e7 }
                  _0x34144b.reject = _0x5c2c14
                  _0x34144b.timeout = _0x5896cc
                  _0x1c5726.set(_0x3ee178.id, _0x34144b)
                })
              return (
                _0xc244e0.emitNet(
                  '__apx_req:' + _0x557402,
                  _0x5541b0.encodePayload(_0x3ee178),
                  _0x2c6686
                ),
                _0x4df86e.finally(() => _0x1c5726.delete(_0x3ee178.id)),
                _0x4df86e
              )
            }
          _0xc244e0.onNet('__apx_res:' + _0x3a3729, (_0x194c82, _0xca1786) => {
            const _0x502fb0 = _0x1c5726.get(_0x194c82)
            if (_0x502fb0 === undefined) {
              return
            }
            clearTimeout(_0x502fb0.timeout)
            const [_0x43fd0b, _0x9f0cff] = _0xca1786
            if (_0x43fd0b) {
              _0x502fb0.resolve(_0x9f0cff)
            } else {
              _0x502fb0.reject(new Error(_0x9f0cff))
            }
          })
          let _0x3dc8fb = {}
          _0x3dc8fb.register = _0x90c618
          _0x3dc8fb.execute = _0x386d3a
          const _0x4edf8e = _0x3dc8fb,
            _0x3cf216 = (_0x11a163, _0x5f34b2, _0xd4218e) => {
              _0x275f08.g.exports['np-interact'].AddPeekEntryByModel(
                _0x11a163,
                _0x5f34b2,
                _0xd4218e
              )
            },
            _0x5b630b = (_0xe4c28e, _0x54d120, _0x3541c9) => {
              _0x275f08.g.exports['np-interact'].AddPeekEntryByPolyTarget(
                _0xe4c28e,
                _0x54d120,
                _0x3541c9
              )
            },
            _0x33ce29 = (_0x2d490e, _0x1a6d16, _0x2aab6c) => {
              _0x275f08.g.exports['np-interact'].AddPeekEntryByFlag(
                _0x2d490e,
                _0x1a6d16,
                _0x2aab6c
              )
            },
            _0xb0d4e4 = (
              _0x5e9fb2,
              _0xfbb0b3,
              _0x3731b2 = false,
              _0x934359 = null
            ) => {
              return new Promise((_0x1d3534) => {
                _0x275f08.g.exports['np-taskbar'].taskBar(
                  _0x5e9fb2,
                  _0xfbb0b3,
                  _0x3731b2,
                  true,
                  null,
                  false,
                  _0x1d3534,
                  _0x934359 === null || _0x934359 === void 0
                    ? void 0
                    : _0x934359.distance,
                  _0x934359 === null || _0x934359 === void 0
                    ? void 0
                    : _0x934359.entity
                )
              })
            },
            _0x33c940 = (_0x40755a, _0x13c32b, _0x4abf51) => {
              return new Promise((_0x123dd6) => {
                _0x275f08.g.exports['np-phone'].DoPhoneConfirmation(
                  _0x40755a,
                  _0x13c32b,
                  _0x4abf51,
                  _0x123dd6
                )
              })
            },
            _0x1b3545 = (_0x56d3f6, _0x596be5, _0x38b35d, _0x54ab9 = true) => {
              _0x275f08.g.exports['np-phone'].DoPhoneNotification(
                _0x56d3f6,
                _0x596be5,
                _0x38b35d,
                _0x54ab9
              )
            }
          let _0x4dc139 = {
            addPeekEntryByModel: _0x3cf216,
            phoneConfirmation: _0x33c940,
          }
          _0x4dc139.addPeekEntryByTarget = _0x5b630b
          _0x4dc139.addPeekEntryByFlag = _0x33ce29
          _0x4dc139.taskBar = _0xb0d4e4
          _0x4dc139.phoneNotification = _0x1b3545
          const _0x21bc4 = _0x4dc139
          let _0x55b19a = {
            Zones: _0x26a504,
            Hud: _0x41a21e,
          }
          _0x55b19a.Events = _0xc244e0
          _0x55b19a.Procedures = _0x4edf8e
          _0x55b19a.Streaming = _0x4bb8f9
          _0x55b19a.Utils = _0x4a8617
          _0x55b19a.Interface = _0x21bc4
          const _0x52c3d8 = _0x55b19a
          _0x275f08.g.APX = _0x52c3d8
          setImmediate(() => {
            _0x275f08.g.exports('GetLibrary', () => {
              return _0x52c3d8
            })
          })
        },
      },
      _0x58d4bd = {
        g: (function () {
          if (typeof globalThis === 'object') {
            return globalThis
          }
          try {
            return this || new Function('return this')()
          } catch (_0x308f50) {
            if (typeof window === 'object') {
              return window
            }
          }
        })(),
      }
    !(function () {})()
    var _0x4bae2c = {}
    _0x3cf6c0[50](0, _0x4bae2c, _0x58d4bd)
  })()
  