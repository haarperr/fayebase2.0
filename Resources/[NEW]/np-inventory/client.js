let usedSlots = [];
let boundItems = {};
let boundItemsInfo = {};
let ammoTable = {};
let boundItemsAmmo = {};
let canOpen = true;
let dropName = 'none';
let DroppedInventories = [];
let NearInventories = [];
let DrawInventories = [];
let MyInventory = [];
let MyItemCount = 0;
let crafting = false;
let cash = 0;
let openedInv = false;
let cid = 0;
let personalWeight = 0;
let hadBrought = [];
let taxLevel = 0;

//0x49 = i
let objectDumps = [
    { objectID: 666561306, Description: 'Blue Dumpster' },
    { objectID: 218085040, Description: 'Light Blue Dumpster' },
    { objectID: -58485588, Description: 'Gray Dumpster' },
    { objectID: 682791951, Description: 'Big Blue Dumpster' },
    { objectID: -206690185, Description: 'Big Green Dumpster' },
    { objectID: 364445978, Description: 'Big Green Skip Bin' },
    { objectID: 143369, Description: 'Small Bin' },
];

let objectPermDumps = [
    { objectID: 344662182, Description: 'Jail Yellow Bin' },
    { objectID: 1923262137, Description: 'Jail Electrical Box' },
    { objectID: -686494084, Description: 'Jail Electrical Box 2' },
    { objectID: 1419852836, Description: 'Jail Electrical Box 3' },
    { objectID: -1149940374, Description: 'Small Bin Food Room' },
    { objectID: -41273338, Description: 'Small Bin Food Room' },
    { objectID: -686494084, Description: 'Small Bin Food Room' },
];

function ScanContainers() {
    let player = PlayerPedId();
    let startPosition = GetOffsetFromEntityInWorldCoords(player, 0, 0.1, 0);
    let endPosition = GetOffsetFromEntityInWorldCoords(player, 0, 1.8, -0.4);

    let rayhandle = StartShapeTestRay(
        startPosition[0],
        startPosition[1],
        startPosition[2],
        endPosition[0],
        endPosition[1],
        endPosition[2],
        16,
        player,
        0,
    );

    let vehicleInfo = GetShapeTestResult(rayhandle);

    let hitData = vehicleInfo[4];

    let model = 0;
    let entity = 0;
    if (hitData) {
        model = GetEntityModel(hitData);
    }
    if (model !== 0) {
        for (let x in objectDumps) {
            if (x) {
                if (objectDumps[x].objectID == model) {
                    return GetEntityCoords(hitData);
                }
            }
        }
    }
}

function ScanJailContainers() {
    let player = PlayerPedId();
    let startPosition = GetOffsetFromEntityInWorldCoords(player, 0, 0.1, 0);
    let endPosition = GetOffsetFromEntityInWorldCoords(player, 0, 1.8, -0.4);

    let rayhandle = StartShapeTestRay(
        startPosition[0],
        startPosition[1],
        startPosition[2],
        endPosition[0],
        endPosition[1],
        endPosition[2],
        16,
        player,
        0,
    );

    let vehicleInfo = GetShapeTestResult(rayhandle);

    let hitData = vehicleInfo[4];

    let model = 0;
    let entity = 0;
    if (hitData) {
        model = GetEntityModel(hitData);
    }
    if (model !== 0) {
        for (let x in objectPermDumps) {
            if (x) {
                if (objectPermDumps[x].objectID == model) {
                    return GetEntityCoords(hitData);
                }
            }
        }
    }
}

RegisterNetEvent('np-base:playerSpawned');
on('np-base:playerSpawned', async (broughtData) => {
    emitNet('server-request-update', cid);
    SendNuiMessage(JSON.stringify({ response: 'SendItemList', list: itemList }));
    //Send updated settings
    UpdateSettings();
});

RegisterNuiCallbackType('Weight');
on('__cfx_nui:Weight', (data, cb) => {
    personalWeight = data.weight;
});
RegisterNuiCallbackType('Close');
on('__cfx_nui:Close', (data, cb) => {
    CloseGui(data.isItemUsed);
});

RegisterNuiCallbackType('GiveItem');
on('__cfx_nui:GiveItem', (data, cb) => {
    if (!data[3]) {
        return;
    }

    let id = data[0];
    let amount = data[1];
    let generateInformation = data[2];
    let nonStacking = data[4];
    let itemdata = data[5];

    emit('hud-display-item', id, 'Received', amount);
    GiveItem(id, amount, generateInformation, nonStacking, itemdata, data[6]);
});

RegisterNuiCallbackType('UpdateSettings');
on('__cfx_nui:UpdateSettings', (data, cb) => {
    let holdToDrag = data.holdToDrag;
    let closeOnClick = data.closeOnClick;
    let ctrlMovesHalf = data.ctrlMovesHalf;
    let showTooltips = data.showTooltips;
    SetResourceKvpInt('inventorySettings-HoldToDrag', holdToDrag ? 0 : 1);
    SetResourceKvpInt('inventorySettings-CloseOnClick', closeOnClick ? 0 : 1);
    SetResourceKvpInt('inventorySettings-CtrlMovesHalf', ctrlMovesHalf ? 0 : 1);
    SetResourceKvpInt('inventorySettings-ShowTooltips', showTooltips ? 0 : 1);
});

RegisterNetEvent('Inventory-brought-update');
on('Inventory-brought-update', (broughtData) => {
    hadBrought = JSON.parse(broughtData);
});

RegisterNetEvent('player:receiveItem');
on('player:receiveItem', (id, amount, generateInformation, itemdata, returnData = '{}') => {
    if (!(id in itemList)) {
        //Try to hash the ID
        let hashed = GetHashKey(id);
        if (hashed in itemList) {
            id = hashed;
        } else {
            //If item is still not found, try to find by name
            Object.keys(itemList).forEach(function (key) {
                if (itemList[key].displayname.toLowerCase().trim().replace(' ', '') === id.toLowerCase().trim().replace(' ', '')) {
                    id = key;
                    return;
                }
            });
        }
    }

    let combined = parseFloat(itemList[id].weight) * parseFloat(amount);
    if (parseFloat(personalWeight) > 250 || parseFloat(personalWeight) + combined > 250) {
        emit('DoLongHudText', 'Failed to give ' + id + ' because you were overweight!', 2);
        //TODO: Drop item on ground?
        return;
    }
    SendNuiMessage(
        JSON.stringify({
            response: 'GiveItemChecks',
            id: id,
            amount: amount,
            generateInformation: generateInformation,
            data: Object.assign({}, itemdata),
            returnData: returnData,
        }),
    );
});

exports('itemListInfo', (item_id) => {
    return JSON.stringify(itemList[item_id]);
});

exports('getCurrentWeight', () => {
    return parseFloat(personalWeight);
});

RegisterNetEvent('hud-display-item');
on('hud-display-item', (itemid, text, amount) => {
    if (openedInv) {
        return;
    }
    SendNuiMessage(JSON.stringify({ response: 'UseBar', itemid: itemid, text: text, amount: amount }));
});

RegisterNetEvent('inventory-bar');
on('inventory-bar', (toggle) => {
    SendNuiMessage(JSON.stringify({ response: 'DisplayBar', toggle: toggle, boundItems: boundItems, boundItemsAmmo: boundItemsAmmo }));
});

RegisterNetEvent('inventory:removeItem');
on('inventory:removeItem', (id, amount) => {
    RemoveItem(id, amount);
    emit('hud-display-item', id, 'Removed', amount);
});

RegisterNetEvent('inventory:removeItemByMetaKV');
on('inventory:removeItemByMetaKV', (id, amount, metaKey, metaValue) => {
    RemoveItemKV(id, amount, metaKey, metaValue);
    emit('hud-display-item', id, 'Removed', amount);
});

function RemoveItem(id, amount) {
    cid = exports.isPed.isPed("cid");
    emitNet('server-remove-item', cid, id, amount, openedInv);
}

function RemoveItemKV(id, amount, metaKey, metaValue) {
    cid = exports.isPed.isPed("cid");
    emitNet('server-remove-item-kv', cid, id, amount, metaKey, metaValue);
}

function UpdateItem(id, slot, data) {
    cid = exports.isPed.isPed("cid");
    emitNet('server-update-item', cid, id, slot, data);
}

RegisterNetEvent('inventory:updateItem');
on('inventory:updateItem', (id, slot, data) => {
    UpdateItem(id, slot, data);
});

// this is used for giving a dropped item, not put into inventory
RegisterNetEvent('CreateCraftOption');
on('CreateCraftOption', (id, add, craft) => {
    CreateCraftOption(id, add, craft);
});

function CreateCraftOption(id, add, craft) {
    let itemArray = [{ itemid: id, amount: add }];
    if (craft === true) {
        emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '7', 'Craft', JSON.stringify(itemArray));
    } else {
        emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '7', 'Shop', JSON.stringify(itemArray));
    }
}

function removeNum(numbers) {
    return numbers != sql.Inventory[i].slot;
}

// remember to refresh player inventory if we give them an item and they are already inside it because ty dady

let slotsAvailable = [...Array(41).keys()].slice(1);

function ResetCache(fullReset) {
    CacheBinds(JSON.parse(MyInventory));

    slotsAvailable = [...Array(41).keys()].slice(1);
    if (fullReset) {
        usedSlots = [];
    }
}

let hasIncorrectItems = false;

RegisterNuiCallbackType('dropIncorrectItems');
on('__cfx_nui:dropIncorrectItems', (data, cb) => {
    hasIncorrectItems = true;
    if (!canOpen) {
        return;
    }
    canOpen = false;
    emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '13', 'Drop', data.slots);
    setTimeout(() => {
        canOpen = true;
    }, 2000);
});

//  $.post("http://np-inventory/SlotJustUsed", JSON.stringify({target: targetSlot, origin: originSlot, itemid: itemidsent }));
let recentused = [];
RegisterNuiCallbackType('SlotJustUsed');
on('__cfx_nui:SlotJustUsed', (data, cb) => {
    let target = data.targetslot;
    if (target < 5 && data.MyInvMove) {
        Rebind(target, data.itemid);
    }
    if (data.move) {
        boundItems[data.origin] = undefined;
    }
    recentused.push(data.origin);
    recentused.push(data.targetslot);
    usedSlots = [];
});

function doubleCheck(slotcheck) {
    let foundshit = recentused.find((x) => x == slotcheck);
    if (foundshit) {
        return false;
    } else {
        return true;
    }
}

function findSlot(ItemIdToCheck, amount, nonStacking) {
    let sqlInventory = JSON.parse(MyInventory);

    let itemCount = parseInt(MyItemCount);
    let foundslot = 0;

    for (let i = 0; i < itemCount; i++) {
        if (sqlInventory[i].item_id == ItemIdToCheck && nonStacking == false) {
            if (doubleCheck(sqlInventory[i].slot)) {
                foundslot = sqlInventory[i].slot;
            }
        }
    }

    if (usedSlots[ItemIdToCheck] && nonStacking == false) {
        foundslot = usedSlots[ItemIdToCheck];
        slotsAvailable = slotsAvailable.filter((x) => x != foundslot);
    }

    for (let i = 0; i < itemCount; i++) {
        slotsAvailable = slotsAvailable.filter((x) => x != sqlInventory[i].slot);
    }

    if (foundslot == 0 && slotsAvailable[0] != undefined && slotsAvailable.length > 0) {
        foundslot = slotsAvailable[0];
        usedSlots[ItemIdToCheck] = foundslot;
        slotsAvailable = slotsAvailable.filter((x) => x != foundslot);
    }

    if (foundslot == 0) {
        emit('DoLongHudText', 'Failed to give ' + ItemIdToCheck + ' because you were full!', 2);
    }

    return foundslot;
}

let isCuffed = false;
RegisterNetEvent('police:currentHandCuffedState');
on('police:currentHandCuffedState', (pIsHandcuffed, pIsHandcuffedAndWalking) => {
    isCuffed = pIsHandcuffed || pIsHandcuffedAndWalking;
});

RegisterNetEvent('inventory-open-request')
on('inventory-open-request', () => {
    SendNuiMessage(JSON.stringify({ response: "SendItemList", list: itemList }))
    let player = PlayerPedId();
    let startPosition = GetOffsetFromEntityInWorldCoords(player, 0, 0.5, 0);
    let endPosition = GetOffsetFromEntityInWorldCoords(player, 0, 2.0, -0.4);

    let nearDrop = false;
    let nearSales = false;
    let nearTarget = false;
    let BinFound = ScanContainers();
    let JailBinFound = ScanJailContainers();
    let targetid = 0;
    cid = exports.isPed.isPed("cid")

    if (openedInv) {
        CloseGui()
    }
    emit("randPickupAnim")

    OpenGui()

    let rayhandle = StartShapeTestRay(startPosition[0], startPosition[1], startPosition[2], endPosition[0], endPosition[1], endPosition[2], 10, player, 0)
    let vehicleInfo = GetShapeTestResult(rayhandle)
    let vehicleFound = vehicleInfo[4]
    let jailDst = GetDistanceBetweenCoords(startPosition[0], startPosition[1], startPosition[2], 1700.2, 2536.8, 45.5)

    let tacoShopDst = GetDistanceBetweenCoords(startPosition[0], startPosition[1], startPosition[2], 15.47, -1598.78, 29.38)



    let isInVehicle = IsPedInAnyVehicle(PlayerPedId(), false);
    if (isInVehicle) {
        vehicleFound = GetVehiclePedIsIn(PlayerPedId(), false)
        let licensePlate = GetVehicleNumberPlateText(vehicleFound);
        emitNet("server-inventory-open", startPosition, cid, "1", "Glovebox-" + licensePlate);
    } else if (tacoShopDst < 2.0) {
        TriggerEvent("server-inventory-open", "18", "Craft");
    } else if (JailBinFound && jailDst < 80.0) {

        let x = parseInt(JailBinFound[0]);
        let y = parseInt(JailBinFound[1]);
        let container = "jail-container|" + x + "|" + y;
        emit("inventory-jail", startPosition, cid, container);

    } else if (BinFound) {
        let x = parseInt(BinFound[0]);
        let y = parseInt(BinFound[1]);
        let container = "hidden-container|" + x + "|" + y;
        emitNet("server-inventory-open", startPosition, cid, "1", container);
    } else if (vehicleFound != 0) {
        let vehModel = GetEntityModel(vehicleFound);
        let [trunkCoords, front] = GetEnginePosition(vehicleFound);
        let distanceRear = GetDistanceBetweenCoords(
            startPosition[0],
            startPosition[1],
            startPosition[2],
            trunkCoords[0],
            trunkCoords[1],
            trunkCoords[2],
        );

        let lockStatus = GetVehicleDoorLockStatus(vehicleFound)
        if (lockStatus != 1 && lockStatus != 0 && lockStatus != 4 && distanceRear < 1.5) {
            TriggerEvent('DoLongHudText', 'The vehicle is locked.', 2);
            CloseGui();
        } else {
            if (distanceRear > 1.5) {
                GroundInventoryScan();
            } else {
                let licensePlate = GetVehicleNumberPlateText(vehicleFound);
                if (licensePlate != null) {
                    if (vehModel === GetHashKey('npwheelchair')) {
                        TriggerEvent('DoLongHudText', 'This is a wheelchair, dummy.', 2);
                    } else {
                        if (!IsThisModelABicycle(vehModel) && vehModel !== GetHashKey('trash2')) {
                            const carInvName = "Trunk-" + licensePlate;

                            const vehClass = GetVehicleClass(vehicleFound);

                            //Vehicle weight calculations
                            const [[minX, minY, minZ], [maxX, maxY, maxZ]] = GetModelDimensions(vehModel);
                            const vehVolume = (maxX - minX) * (maxY - minY) * (maxZ - minZ);

                            const seats = GetVehicleModelNumberOfSeats(vehModel);

                            const classModifier = VehicleWeightModifiers[vehClass][0];
                            const classBaseWeight = VehicleWeightModifiers[vehClass][1];
                            const classMaxWeight = VehicleWeightModifiers[vehClass][2];

                            if (classBaseWeight === 0) {
                                //do something
                                return;
                            }

                            //Calculate seats / 3 (2 seats = 66% of base weight, 4 seats = 133% base weight)
                            let vehSeatMod = (classBaseWeight * seats) / 3;

                            //Calculate based on volume, then add the seat modifier
                            let vehWeightCalc = vehVolume * classModifier + vehSeatMod;

                            //Round to nearest 50
                            vehWeightCalc = Math.round(vehWeightCalc / 50) * 50;

                            //console.log("veh weight calc: " + vehWeightCalc);

                            if (vehWeightCalc > classMaxWeight) {
                                //Max weight
                                vehWeightCalc = classMaxWeight;
                            }

                            Object.keys(VehicleWeightOverrides).forEach((modelName) => {
                                if (vehModel === GetHashKey(modelName)) {
                                    vehWeightCalc = VehicleWeightOverrides[modelName];
                                }
                            });

                            emitNet('server-inventory-open', startPosition, cid, '1', carInvName, [], null, vehWeightCalc);
                            TaskTurnPedToFaceEntity(player, vehicleFound, 1.0);
                            emit('toggle-animation', true);
                        } else {
                            GroundInventoryScan();
                        }
                    }
                }
            }
        }
    } else {
        GroundInventoryScan();
    }
});

function GroundInventoryScan() {
    let row = DroppedInventories.find(ScanClose);
    if (row) {
        emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '1', row.name);
    } else {
        emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '3', 'create');
    }
}

function ScanClose(row) {
    let playerPos = GetEntityCoords(PlayerPedId());
    let targetPos = row.position;
    let distancec = GetDistanceBetweenCoords(playerPos[0], playerPos[1], playerPos[2], targetPos.x, targetPos.y, targetPos.z);
    return distancec < 1.5;
}

let debug = true;

function ClearCache(sentIndexName) {
    let foundIndex = -1;
    let i = 0;
    for (let Row in DroppedInventories) {
        if (DroppedInventories[Row].name == sentIndexName) {
            foundIndex = i;
            break;
        }
        i++;
    }
    if (foundIndex > -1) {
        DroppedInventories.splice(foundIndex, 1);
    }

    foundIndex = -1;
    i = 0;
    for (let Row in DrawInventories) {
        if (DrawInventories[Row].name == sentIndexName) {
            foundIndex = i;
            break;
        }
        i++;
    }
    if (foundIndex > -1) {
        DrawInventories.splice(foundIndex, 1);
    }

    foundIndex = -1;
    i = 0;
    for (let Row in NearInventories) {
        if (NearInventories[Row].name == sentIndexName) {
            foundIndex = i;
            break;
        }
        i++;
    }

    if (foundIndex > -1) {
        NearInventories.splice(foundIndex, 1);
    }
}

function drawMarkersUI() {
    for (let Row in DrawInventories) {
        DrawMarker(
            20,
            DrawInventories[Row].position.x,
            DrawInventories[Row].position.y,
            DrawInventories[Row].position.z - 0.8,
            0,
            0,
            0,
            0,
            0,
            0,
            0.35,
            0.5,
            0.15,
            252,
            255,
            255,
            91,
            0,
            0,
            0,
            0,
        );
    }
}

setTick(drawMarkersUI);

function CacheInventories() {
    DrawInventories = NearInventories.filter(DrawMarkers);
}

setInterval(CacheInventories, 1000);

function GetCloseInventories() {
    NearInventories = DroppedInventories.filter(Scan);
}
setInterval(GetCloseInventories, 15000);

function DrawMarkers(row) {
    let playerPos = GetEntityCoords(PlayerPedId());
    let targetPos = row.position;
    let distanceb = GetDistanceBetweenCoords(playerPos[0], playerPos[1], playerPos[2], targetPos.x, targetPos.y, targetPos.z);
    let checkDistance = 12;
    if (IsPedInAnyVehicle(PlayerPedId(), false)) {
        checkDistance = 25;
    }

    return distanceb < checkDistance;
}

function Scan(row) {
    let playerPos = GetEntityCoords(PlayerPedId());
    let targetPos = row.position;
    let distancea = GetDistanceBetweenCoords(playerPos[0], playerPos[1], playerPos[2], targetPos.x, targetPos.y, targetPos.z);

    let checkDistance = 300;
    if (IsPedInAnyVehicle(PlayerPedId(), false)) {
        checkDistance = 700;
    }

    return distancea < checkDistance;
}

RegisterNetEvent('np-items:SetAmmo');
on('np-items:SetAmmo', (sentammoTable) => {
    if (sentammoTable) {
        ammoTable = sentammoTable;
    }
    CacheBinds(JSON.parse(MyInventory));
});

function CacheBinds(sqlInventory) {
    boundItems = {};
    boundItemsInfo = {};
    let Ped = PlayerPedId();
    for (let i = 0; i < itemCount; i++) {
        let slot = sqlInventory[i].slot;
        if (slot < 5) {
            boundItems[slot] = sqlInventory[i].item_id;
            boundItemsInfo[slot] = sqlInventory[i].information;
            if (!isNaN(boundItems[slot])) {
                let ammoType = Citizen.invokeNative(
                    '0x7FEAD38B326B9F74',
                    PlayerPedId(),
                    parseInt(boundItems[slot]),
                    Citizen.returnResultAnyway(),
                    Citizen.resultAsInteger(),
                );

                if (ammoTable['' + ammoType + '']) {
                    boundItemsAmmo[slot] = ammoTable['' + ammoType + ''].ammo;
                } else {
                    boundItemsAmmo[slot] = 0;
                }
            } else {
                boundItemsAmmo[slot] = undefined;
            }
        }
    }
}

function Rebind(slot, itemid) {
    let Ped = PlayerPedId();
    boundItems[slot] = itemid;
    if (!isNaN(boundItems[slot])) {
        let ammoType = Citizen.invokeNative(
            '0x7FEAD38B326B9F74',
            PlayerPedId(),
            parseInt(boundItems[slot]),
            Citizen.returnResultAnyway(),
            Citizen.resultAsInteger(),
        );

        if (ammoTable['' + ammoType + '']) {
            boundItemsAmmo[slot] = ammoTable['' + ammoType + ''].ammo;
        } else {
            boundItemsAmmo[slot] = 0;
        }
    } else {
        boundItemsAmmo[slot] = undefined;
    }
}

RegisterNetEvent('nui-toggle');
on('nui-toggle', (toggle) => {
    SetCustomNuiFocus(toggle, toggle);
});

RegisterNetEvent('inventory-bind');
on('inventory-bind', (slot) => {
    if (exports.isPed.isPed('dead')) {
        return;
    }
    let cid = exports.isPed.isPed("cid");
    let inventoryUsedName = 'ply-' + cid;
    let itemid = boundItems[slot];
    let isWeapon = true;
    if (isNaN(itemid)) {
        isWeapon = false;
    }
    emit('RunUseItem', itemid, slot, inventoryUsedName, isWeapon, boundItemsInfo[slot]);
});

RegisterNetEvent('OpenInv');
on('OpenInv', () => {
    emit('inventory-open-request');
    //closegui
});

RegisterNetEvent('inventory:qualityUpdate');
on('inventory:qualityUpdate', (originSlot, originInventory, creationDate) => {
    SendNuiMessage(JSON.stringify({ response: 'updateQuality', slot: originSlot, inventory: originInventory, creationDate: creationDate }));
});

RegisterNetEvent('closeInventoryGui');
on('closeInventoryGui', () => {
    CloseGui();
    //closegui
});

RegisterNuiCallbackType('ServerCloseInventory');

on('__cfx_nui:ServerCloseInventory', (data, cb) => {
    let cid = exports.isPed.isPed("cid");
    if (data.name != 'none') {
        emitNet('server-inventory-close', cid, data.name);
    }
});

RegisterNuiCallbackType('removeCraftItems');
on('__cfx_nui:removeCraftItems', (data, cb) => {
    let requirements = data[0];
    let amountCrafted = data[1];

    for (let xx = 0; xx < requirements.length; xx++) {
        RemoveItem(requirements[xx].itemid, Math.ceil(requirements[xx].amount * amountCrafted));
    }
});

RegisterNuiCallbackType('stack');
on('__cfx_nui:stack', (data, cb) => {
    emitNet('server-inventory-stack', cid, data, GetEntityCoords(PlayerPedId()));
});

RegisterNuiCallbackType('move');
on('__cfx_nui:move', (data, cb) => {
    emitNet('server-inventory-move', cid, data, GetEntityCoords(PlayerPedId()));
});

RegisterNuiCallbackType('swap');
on('__cfx_nui:swap', (data, cb) => {
    emitNet('server-inventory-swap', cid, data, GetEntityCoords(PlayerPedId()));
});

RegisterNetEvent('server-inventory-open');
on('server-inventory-open', (target, name) => {
    cid = exports.isPed.isPed("cid");
    emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, target, name);
});

RegisterNetEvent('client-inventory-remove-any');
on('client-inventory-remove-any', (itemidsent, amount) => {
    emitNet('server-inventory-remove-any', itemidsent, amount);
});

RegisterNetEvent('client-inventory-remove-slot');
on('client-inventory-remove-slot', (itemidsent, amount, slot) => {
    emitNet('server-inventory-remove-slot', itemidsent, amount, slot);
});

RegisterNetEvent('Inventory-Dropped-Remove');
on('Inventory-Dropped-Remove', (sentIndexName) => {
    ClearCache(sentIndexName);
});

RegisterNetEvent('Inventory-Dropped-Addition');
on('Inventory-Dropped-Addition', (object) => {
    DroppedInventories.push(object);
    NearInventories.push(object);
    DrawInventories.push(object);
});

RegisterNetEvent('requested-dropped-items');
on('requested-dropped-items', (object) => {
    DroppedInventories = [];
    object2 = JSON.parse(object);
    for (let key in object2) {
        DroppedInventories.push(object2[key]);
    }

    //DroppedInventories = object;
    //no idea why no work

    // i am tired and retarded
});

RegisterNetEvent('inventory-update-player');
on('inventory-update-player', (information) => {
    let returnInv = BuildInventory(information[0]);
    let playerinventory = returnInv[0];
    let itemCount = returnInv[1];

    let invName = information[2];

    MyInventory = playerinventory;
    MyItemCount = itemCount;

    ResetCache(false);
    PopulateGuiSingle(playerinventory, itemCount, invName);
    if (openedInv) {
        SendNuiMessage(JSON.stringify({ response: 'EnableMouse' }));
    }
    emit('current-items', JSON.parse(MyInventory));
    //misc.UpdateInventory(playerinventory, itemCount, "inv update player");
});

RegisterNetEvent('inventory-open-target');
on('inventory-open-target', (information) => {
    //misc.UpdateInventory(playerinventory, itemCount, "inv target player");
    
    let returnInv = BuildInventory(information[0]);

    let playerinventory = returnInv[0];

    let invName = information[2];
    let targetinventory;
    let targetitemCount;

    let itemCount2 = 0;

    if (information[7] == true) {
        let returnInv2 = BuildInventory(information[3]);
        targetinventory = returnInv2[0];
        targetitemCount = returnInv2[1];
    } else {
        targetinventory = information[3];
        targetitemCount = information[4];
    }
    let targetinvName = information[5];

    if (canOpen === true) {
        MyInventory = playerinventory;
        MyItemCount = information[0].length;
        if (!openedInv) OpenGui();

        let targetInvWeight = information[8];
        if (!targetInvWeight) targetInvWeight = 0;

        PopulateGui(playerinventory, returnInv[1], invName, targetinventory, targetitemCount, targetinvName, cash, targetInvWeight);
        SendNuiMessage(JSON.stringify({ response: 'EnableMouse' }));
        ResetCache(true);
    }
});

let timer = 0;
let timeFunction = false;

function GiveItem(itemid, amount, generateInformation, nonStacking, itemdata, returnData = '{}') {
    let slot = findSlot(itemid, amount, nonStacking);
    if (!isNaN(itemid)) {
        generateInformation = true;
    }
    if (slot != 0) {
        cid = exports.isPed.isPed("cid");
        emitNet(
            'server-inventory-give',
            cid,
            itemid,
            slot,
            amount,
            generateInformation,
            Object.assign({}, itemdata),
            openedInv,
            returnData,
        );
        SendNuiMessage(JSON.stringify({ response: 'DisableMouse' }));
    }
}

async function CloseGui(pIsItemUsed = false) {
    if (!pIsItemUsed) {
        emit('randPickupAnim');
    }
    SendNuiMessage(JSON.stringify({ response: 'closeGui' }));
    SetCustomNuiFocus(false, false);

    openedInv = false;
    recentused = [];
    emit('np-inventory:shitlord-check')
}

async function OpenGui() {
    if (openedInv) {
        return;
    }
    openedInv = true;
    SendNuiMessage(JSON.stringify({ response: 'openGui' }));
    SetCustomNuiFocus(true, true);

    //Center cursor
    SetCursorLocation(0.5, 0.5);

	cash = exports.isPed.isPed("mycash")
	weaponsLicence = exports.isPed.isPed("weaponslicence")
    let brought = hadBrought[cid];
    let cop = false;
    if (exports.isPed.isPed('myjob') == 'police' || exports.isPed.isPed('myjob') == 'state' || exports.isPed.isPed('myjob') == 'ranger' || exports.isPed.isPed('myjob') == 'sheriff' || exports.isPed.isPed('myjob') == 'doc') {
       cop = true;
       weaponsLicence = true;
    }
    await Delay(250);

    SendNuiMessage(JSON.stringify({ response: 'cashUpdate', amount: cash, weaponlicence: weaponsLicence, brought: brought, cop: cop }));
}

function PopulateGuiSingle(playerinventory, itemCount, invName) {
    SendNuiMessage(
        JSON.stringify({ response: 'PopulateSingle', playerinventory: playerinventory, itemCount: itemCount, invName: invName }),
    );
}

let TrapOwner = false;
function PopulateGui(playerinventory, itemCount, invName, targetinventory, targetitemCount, targetinvName, cash, targetInvWeight = 0) {
    let cid = exports.isPed.isPed("cid");
    let StoreOwner = false;

    if (targetinvName.indexOf('PlayerStore') > -1) {
        if (targetinvName.indexOf('TrapHouse') > -1) {
            SendNuiMessage(
                JSON.stringify({
                    response: 'Populate',
                    playerinventory: playerinventory,
                    itemCount: itemCount,
                    invName: invName,
                    targetinventory: targetinventory,
                    targetitemCount: targetitemCount,
                    targetinvName: targetinvName,
                    cash: cash,
                    StoreOwner: TrapOwner,
                    targetInvWeight: targetInvWeight,
                }),
            );
        } else {
            let targetCid = targetinvName.split('|');
            targetCid = targetCid[0].split('-');

            if (targetCid[1] == cid) {
                StoreOwner = true;
            }
            setTimeout(() => {
                SendNuiMessage(
                    JSON.stringify({
                        response: 'Populate',
                        playerinventory: playerinventory,
                        itemCount: itemCount,
                        invName: invName,
                        targetinventory: targetinventory,
                        targetitemCount: targetitemCount,
                        targetinvName: targetinvName,
                        cash: cash,
                        StoreOwner: StoreOwner,
                        targetInvWeight: targetInvWeight,
                    }),
                );
            }, 250);
        }
    } else {
        SendNuiMessage(
            JSON.stringify({
                response: 'Populate',
                playerinventory: playerinventory,
                itemCount: itemCount,
                invName: invName,
                targetinventory: targetinventory,
                targetitemCount: targetitemCount,
                targetinvName: targetinvName,
                cash: cash,
                StoreOwner: StoreOwner,
                targetInvWeight: targetInvWeight,
            }),
        );
    }
}

RegisterNetEvent('inventory-open-trap');
on('inventory-open-trap', (Owner) => {
    TrapOwner = Owner;
});

RegisterNetEvent('inventory-open-target-NoInject');
on('inventory-open-target-NoInject', (playerinventory, itemCount, invName) => {
    //misc.UpdateInventory(playerinventory, itemCount, "inv target player");
    if (canOpen === true) {
        let returnInv = BuildInventory(information[0]);
        playerinventory = returnInv[0];
        itemCount = returnInv[1];

        MyInventory = playerinventory;
        MyItemCount = itemCount;
        emitNet('server-inventory-close', cid, invName);
    }
});

RegisterNetEvent('inventory-util-canOpen');
on('inventory-util-canOpen', (openStatus) => {
    canOpen = openStatus;
});

function BuildInventory(Inventory) {
    let buildInv = Inventory;
    let invArray = {};
    let weight = 0.0;
    itemCount = 0;
    for (let i = 0; i < buildInv.length; i++) {
        if (itemList[buildInv[i].item_id] !== undefined) {
            let quality = ConvertQuality(buildInv[i].item_id, buildInv[i].creationDate);
            weight = weight + itemList[buildInv[i].item_id].weight * buildInv[i].amount;
            invArray[itemCount] = {
                quality: quality,
                creationDate: buildInv[i].creationDate,
                amount: buildInv[i].amount,
                item_id: buildInv[i].item_id,
                id: buildInv[i].id,
                name: buildInv[i].name,
                information: buildInv[i].information,
                slot: buildInv[i].slot,
            };
            itemCount = itemCount + 1;
        }
    }
    personalWeight = weight;
    return [JSON.stringify(invArray), itemCount];
}

const TimeAllowed = 1000 * 60 * 40320; // 28 days,
function ConvertQuality(itemID, creationDate) {
    let StartDate = new Date(creationDate).getTime();
    let DecayRate = itemList[itemID].decayrate;
    let TimeExtra = TimeAllowed * DecayRate;
    let percentDone = 100 - Math.ceil(((Date.now() - StartDate) / TimeExtra) * 100);

    if (DecayRate == 0.0) {
        percentDone = 100;
    }
    if (percentDone < 0) {
        percentDone = 0;
    }
    return percentDone;
}

RegisterNuiCallbackType('invuse');
on('__cfx_nui:invuse', (data) => {
    let inventoryUsedName = data[0];
    let itemid = data[1];
    let slotusing = data[2];
    let isWeapon = data[3];
    let iteminfo = data[4];

    emit('RunUseItem', itemid, slotusing, inventoryUsedName, isWeapon, iteminfo);
});

RegisterNetEvent('toggle-animation');
on('toggle-animation', (toggleAnimation) => {
    let lPed = PlayerPedId();
    if (toggleAnimation) {
        TriggerEvent('animation:load');
        if (!IsEntityPlayingAnim(lPed, 'mini@repair', 'fixing_a_player', 3))
            TaskPlayAnim(lPed, 'mini@repair', 'fixing_a_player', 8.0, -8, -1, 16, 0, 0, 0, 0);
    } else {
        StopAnimTask(lPed, 'mini@repair', 'fixing_a_player', -4.0);
    }
});

function UpdateSettings() {
    let holdInt = GetResourceKvpInt('inventorySettings-HoldToDrag');
    let closeInt = GetResourceKvpInt('inventorySettings-CloseOnClick');
    let ctrlInt = GetResourceKvpInt('inventorySettings-CtrlMovesHalf');
    let tooltipsInt = GetResourceKvpInt('inventorySettings-ShowTooltips');
    let holdToDrag = holdInt === 1 ? false : true; //default true
    let closeOnClick = closeInt === 1 ? false : true;
    let ctrlMovesHalf = ctrlInt === 1 ? false : true; //default false
    let showTooltips = tooltipsInt === 1 ? false : true;
    SendNuiMessage(
        JSON.stringify({
            response: 'UpdateSettings',
            holdToDrag: holdToDrag,
            closeOnClick: closeOnClick,
            ctrlMovesHalf: ctrlMovesHalf,
            showTooltips: showTooltips
        }),
    );
}

function GetEnginePosition(pVehicle) {
    const [minDim, maxDim] = GetModelDimensions(GetEntityModel(pVehicle));

    const frontCoords = GetOffsetFromEntityInWorldCoords(pVehicle, maxDim[0] / 2, maxDim[1], 0.0);
    const engineCoords = GetWorldPositionOfEntityBone(pVehicle, GetEntityBoneIndexByName(pVehicle, 'engine'));
    const overheatCoords = GetWorldPositionOfEntityBone(pVehicle, GetEntityBoneIndexByName(pVehicle, 'overheat'));

    const frontDist = distanceBetweenCoords(frontCoords, engineCoords);
    const overHeatDist = distanceBetweenCoords(frontCoords, overheatCoords);

    const halfCar = Math.abs(maxDim[1] - minDim[1]) / 2;
    if (frontDist <= halfCar || overHeatDist <= halfCar) {
        return [GetOffsetFromEntityInWorldCoords(pVehicle, 0.0, minDim[1] - 0.5, 0.0), false];
    }

    return [GetOffsetFromEntityInWorldCoords(pVehicle, 0.0, maxDim[1] + 0.5, 0.0), true];
}

function distanceBetweenCoords(coords1, coords2) {
    return Math.sqrt(Math.pow(coords1[0] - coords2[0], 2) + Math.pow(coords1[1] - coords2[1], 2) + Math.pow(coords1[2] - coords2[2], 2));
}

let HasNuiFocus = false;
let EndingFocus = false;
let ControlThread;

function SetCustomNuiFocus(hasKeyboard, hasMouse) {
    // HasNuiFocus = hasKeyboard || hasMouse;

    SetNuiFocus(hasKeyboard, hasMouse);
    // SetNuiFocusKeepInput(HasNuiFocus);

    //   if (HasNuiFocus === true) {
    //   	emit("np-voice:focus:set", HasNuiFocus, hasKeyboard, hasMouse);
    //   } else {
    // 	  setTimeout(() => {if (HasNuiFocus !== true) emit("np-voice:focus:set", false, false, false);}, 1000)
    //   }
}

//like Citizen.Wait, usage: await Delay(<amount>);
const Delay = (ms) => new Promise((res) => setTimeout(res, ms));

exports('getItemListNames', () => {
    let itemListSend = []
    for (const key in itemList) {
        const item = itemList[key];
        itemListSend.push({ id: key, name: item.displayname })
    }

    return itemListSend
});

exports('getFullItemList', () => {
    return itemList;
});