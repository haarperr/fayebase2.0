let DroppedInventories = [];
let InUseInventories = [];
let DataEntries = 1;
let hasBrought = [];
let CheckedDeginv = [];
const DROPPED_ITEM_KEEP_ALIVE = 1000 * 60 * 15;

function clean() {
    for (let Row in DroppedInventories) {
        if (new Date(DroppedInventories[Row].lastUpdated + DROPPED_ITEM_KEEP_ALIVE).getTime() < Date.now() && DroppedInventories[Row].used && !InUseInventories[DroppedInventories[Row].name]) {
            emitNet("Inventory-Dropped-Remove", -1, [DroppedInventories[Row].name])
            delete DroppedInventories[Row];
        }
    }
}

setInterval(clean, 20000)


function db(string) {
    exports.oxmysql.execute(string, {}, function(result) {});
}

RegisterServerEvent("server-update-item")
onNet("server-update-item", async(player, itemidsent, slot, data) => {
    let src = source
    let playerinvname = 'ply-' + player;
    let string = `UPDATE user_inventory2 SET information='${data}' WHERE item_id='${itemidsent}' and name='${playerinvname}' and slot='${slot}'`

    exports.oxmysql.execute(string, {}, function() {
        emit("server-request-update-src", player, src)

    });
});

RegisterServerEvent("request-dropped-items")
onNet("request-dropped-items", async(player) => {
    let src = source;
    emitNet("requested-dropped-items", src, JSON.stringify(Object.assign({}, DroppedInventories)));
});

RegisterServerEvent("server-request-update")
onNet("server-request-update", async(player) => {
    let src = source
    let playerinvname = 'ply-' + player
    let string = `SELECT count(item_id) as amount, item_id, id, name, information, slot, dropped, MIN(creationDate) as creationDate FROM user_inventory2 WHERE name = 'ply-${player}' group by item_id, slot`;
    exports.oxmysql.execute(string, {}, function(inventory) {
        emitNet("inventory-update-player", src, [inventory, 0, playerinvname]);
    });
});

RegisterServerEvent("inventory:degItem")
onNet("inventory:degItem", async(itemID, percent, item, cid) => {
    let amount = percent * 100000000 / 2 / 2;
    exports.oxmysql.execute(`UPDATE user_inventory2 set quality = quality - ${percent} WHERE id = ${itemID}`, {}, function() {});
    exports.oxmysql.execute(`UPDATE user_inventory2 set creationDate = creationDate - ${amount} WHERE id = ${itemID}`, {}, function() {});
});


RegisterServerEvent("server-request-update-src")
onNet("server-request-update-src", async(player, src) => {

    let playerinvname = 'ply-' + player
    let string = `SELECT count(item_id) as amount, item_id, id, name, information, slot, dropped, MIN(creationDate) as creationDate FROM user_inventory2 WHERE name = 'ply-${player}' group by item_id, slot`;
    exports.oxmysql.execute(string, {}, function(inventory) {
        emitNet("inventory-update-player", src, [inventory, 0, playerinvname]);
    });
});

RegisterServerEvent("server-frisk-player-inventory")
onNet("server-frisk-player-inventory", (searcher, cash, DirtyMoney, inventoryName) => {
    let weapons = 0
    let string = `SELECT count(item_id) as amount, item_id, id, name, information, slot, dropped FROM user_inventory2 WHERE name = '${inventoryName}' group by item_id, slot`;

    db(string, [], function(inventory) {
        for (let i = 0; i < inventory.length; i++) {
            var t = parseInt(inventory[i].item_id, 10)
            if (!isNaN(t)) {
                weapons++;
            }
        }

        if (cash >= 9000 || DirtyMoney >= 2000 || weapons >= 1) {
            emitNet('chatMessage', searcher, '', 3, "Frisk: Person seems to have large bulge.");
        } else {
            emitNet('chatMessage', searcher, '', 3, "Frisk: Cannot Seems to feel anything.");
        }

    });
});

let IllegalSearchString = `'weedoz', 'weed5oz', 'coke5g', 'coke50g', 'thermite', 'weedq', 'weed12oz', 'oxy', '1gcrack', '1gcocaine', 'joint'`;

RegisterServerEvent("sniffAccepted")
onNet("sniffAccepted", async(t) => {
    let src = source
    emitNet('SniffRequestCID', t, src);
});

RegisterServerEvent("SniffCID")
onNet("SniffCID", async(cid, src) => {
    let name = 'ply-' + cid;
    let string = `SELECT count(item_id) as amount, item_id, id, name, information, slot, dropped FROM user_inventory2 WHERE name='${name}' and item_id IN (${IllegalSearchString}) group by item_id`;

    db(string, [], function(items) {
        if (item.length > 0) {
            emitNet("k9:SniffConfirmed", src);
        } else {
            emitNet("k9:SniffConfirmedFail", src);
        }
    });
});

RegisterServerEvent("sniffLicensePlateCheck")
onNet("sniffLicensePlateCheck", async(plate) => {
    let src = source
    let car = 'Truck-' + plate
    let glovebox = 'Glovebox-' + plate
    let string = `SELECT count(item_id) as amount, item_id, id, name, information, slot, dropped FROM user_inventory2 WHERE (name='${car}' OR name='${glovebox}') and item_id IN (${IllegalSearchString}) group by item_id, slot`;
    db(string, [], function(items) {
        if (items.length > 0) {
            emitNet("K9:SniffConfirmed", src);
        } else {
            emitNet("K9:SniffConfirmedFail", src);
        }
    });
});

function makeid(length) {
    var result = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghikjlmnopqrstuvwxyz'; //abcdef
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

function GenerateInformation(src, player, itemid, itemdata, returnData = '{}') {
    // console.log("PLAYER: " + player + "ITEMID: " + itemid + "ITEMDATA:" + itemdata)
    let data = Object.assign({}, itemdata); // Make sure data is assigned if null
    let returnInfo = returnData;

    return new Promise((resolve, reject) => {
        if (itemid == '') return resolve(returninfo); // No item id so return default

        let timeout = 0;
        if (!isNaN(itemid)) {
            // this is a gun so we are giving it some information.
            var identifier = player.toString()
            if (itemdata && itemdata.fakeWeaponData) {
                identifier = Math.floor((Math.random() * 99999) + 1)
                identifier = identifier.toString()
            }

            // console.log(itemdata)
            if (itemList[itemid].weapon === true) {
                let cartridgeCreated = player + "-" + makeid(3) + "-" + Math.floor(Math.random() * 999 + 1);
                returnInfo = JSON.stringify({
                    cartridge: cartridgeCreated,
                    serial: identifier,
                    quality: "Good"
                })
            }


            timeout = 1;
            clearTimeout(timeout)
            return resolve(returnInfo);
        } else if (Object.prototype.toString.call(itemid) === '[object String]') { // Check if itemid is a string
            switch (
                itemid.toLowerCase() // item names
            ) {
                case "rentalpapers":
                    returnInfo = JSON.stringify({
                        Plate: itemdata.Plate,
                        Vehicle: itemdata.Vehicle,
                        Rentee: itemdata.Rentee,
                    })
                    timeout = 1
                    clearTimeout(timeout)
                    return resolve(returnInfo);					
                
                    timeout = 1;
                    clearTimeout(timeout)
                    return resolve(returnInfo);
                case "idcard":
                    if (itemdata == itemdata.fake) {
                        returnInfo = JSON.stringify({
                            identifier: itemdata,
                            charID,
                            Name: itemdata.first.replace(/[^\w\s]/gi, ''),
                            Surname: itemdata.last.replace(/[^\w\s]/gi, ''),
                            Sex: itemdata.sex,
                            DOB: itemdata.dob
                        })
                        timeout = 1
                        clearTimeout(timeout)
                        return resolve(returnInfo);
                    } else {
                        let string = `SELECT first_name,last_name,gender,dob FROM characters WHERE id = '${player}'`;
                        exports.oxmysql.execute(string, {}, function(result) {
                            returnInfo = JSON.stringify({
                                identifier: player.toString(),
                                Name: result[0].first_name.replace(/[^\w\s]/gi, ''),
                                Surname: result[0].last_name.replace(/[^\w\s]/gi, ''),
                                Sex: result[0].gender,
                                DOB: result[0].dob
                            })
                            timeout = 1
                            clearTimeout(timeout)
                            return resolve(returnInfo);
                        });
                    }
                    break;
                case "casing":
                    returnInfo = JSON.stringify({
                        Identifier: itemdata.identifier,
                        type: itemdata.eType,
                        other: itemdata.other
                    })
                    timeout = 1
                    clearTimeout(timeout)
                    return resolve(returnInfo);
                case "evidence":
                    returnInfo = JSON.stringify({
                        Identifier: itemdata.identifier,
                        type: itemdata.eType,
                        other: itemdata.other
                    })
                    timeout = 1;
                    clearTimeout(timeout)
                    return resolve(returnInfo);
                case "ownerreceipt":
                    returnInfo = JSON.stringify({
                        Price: itemdata.Price,
                        Creator: itemdata.Creator,
                        Comment: itemdata.Comment
                    })
                    timeout = 1;
                    clearTimeout(timeout)
                    return resolve(returnInfo);
                case "receipt":
                    returnInfo = JSON.stringify({
                        Price: itemdata.Price,
                        Creator: itemdata.Creator,
                        Comment: itemdata.Comment
                    })
                    timeout = 1;
                    clearTimeout(timeout)
                    return resolve(returnInfo);
                case "fakeid":
                    returnInfo = JSON.stringify({
                        FirstName: itemdata.FirstName,
                        Surname: itemdata.Surname,
                        DOB: itemdata.dob,
                        Sex: itemdata.sex,
                    })
                    timeout = 1
                    clearTimeout(timeout)
                    return resolve(returnInfo);					

                    timeout = 1;
                    clearTimeout(timeout)
                    return resolve(returnInfo);
                case "casing":
                    returnInfo = JSON.stringify({
                        Identifier: itemdata.identifier,
                        type: itemdata.eType,
                        other: itemdata.other
                    })
                    timeout = 1
                    clearTimeout(timeout)
                    return resolve(returnInfo);
                case "np_evidence_marker_yellow":
                case "np_evidence_marker_red":
                case "np_evidence_marker_white":
                case "np_marker_evidence_marker_orange":
                case "np_marker_evidence_marker_light_blue":
                case "np_marker_evidence_marker_light_purple":
                case "evidence":
                    returnInfo = JSON.stringify({
                        Identifier: itemdata.identifier,
                        type: itemdata.eType,
                        other: itemdata.other
                    })
                    timeout = 1;
                    clearTimeout(timeout)
                    return resolve(returnInfo);
                case 'burnerphone':
                    burnernumber = GenerateBurnerPhoneNumber();
                    returnInfo = JSON.stringify({
                        Number: burnernumber
                    });
                    timeout = 1;
                    clearTimeout(timeout);
                    return resolve(returnInfo)
                case "heistlaptop1":
                case "heistlaptop2":
                case "heistlaptop3":
                case "heistlaptop4":
                    const randomId = Math.floor(Math.random() * 9999999) + 100000;
                    returnInfo = JSON.stringify({
                        id: randomId,
                        _hideKeys: ['id'],
                    });
                    timeout = 1;
                    clearTimeout(timeout);
                    return resolve(returnInfo)
                case "drivingtest":
                    if (data.id) {
                        let string = `SELECT * FROM driving_tests WHERE id = '${data.id}'`;
                        exports.oxmysql.execute(string, {}, function(result) {
                            if (result[0]) {
                                let ts = new Date(parseInt(result[0].timestamp) * 1000);
                                let testDate =
                                    ts.getFullYear() + "-" + ("0" + (ts.getMonth() + 1)).slice(-2) + "-" + ("0" + ts.getDate()).slice(-2);
                                returninfo = JSON.stringify({
                                    ID: result[0].id,
                                    CID: result[0].cid,
                                    Instructor: result[0].instructor,
                                    Date: testDate,
                                });
                                timeout = 1;
                                clearTimeout(timeout)
                            }
                            return resolve(returninfo);
                        });
                    } else {
                        timeout = 1;
                        clearTimeout(timeout)
                        return resolve(returnInfo);
                    }
                    break;
                default:
                    // Item has no pre set information gathering, so return default object
                    timeout = 1
                    clearTimeout(timeout)
                    return resolve(returnInfo);
            }
        } else {
            // Item has no pre set information gathering, so return default object right away
            return resolve(returnInfo);
        }

        setTimeout(() => {
            if (timeout == 0) {
                // If we timedout while right after filling returnInfo somehow, this will return the proper data instead of defaulting
                return resolve(returnInfo);
            }
        }, 500)
    });
}

RegisterServerEvent("server-inventory-give")
onNet("server-inventory-give", async(player, itemid, slot, amount, generateInformation, itemdata, openedInv) => {
    // console.log(player, itemid, itemdata);


    let src = source
    let playerinvname = 'ply-' + player
    let information = "{}"
    let creationDate = Date.now()
    information = JSON.stringify(itemdata || {});

    if (itemid == "idcard") {
        information = await GenerateInformation(src, player, itemid, itemdata)
    }

    if (itemid == "fakeid") {
        information = await GenerateInformation(src, player, itemid, itemdata)
    }

    if (itemid == "evidence") {
        information = await GenerateInformation(src, player, itemid, itemdata)
    }    

    if (itemid == "ownerreceipt") {
        information = await GenerateInformation(src, player, itemid, itemdata)
    }

    if (itemid == "receipt") {
        information = await GenerateInformation(src, player, itemid, itemdata)
    }

     if (itemid == "burgerReceipt") {
     information = await GenerateInformation(src, player, itemid, itemdata)
     }

     if (itemid == "receipt") {
         information = await GenerateInformation(src, player, itemid, itemdata)
     }

     if (itemid == "pdbadge") {
        var hidekeys = ["name", "badge", "rank", "department", "image", "callsign"];
        information = JSON.stringify({ _hideKeys: hidekeys, name: itemdata.name, badge: itemdata.badge, rank: itemdata.rank, department: itemdata.department, image: itemdata.image, callsign: itemdata.callsign})
    }

    let values = `('${playerinvname}','${itemid}','${information}','${slot}','${creationDate}')`
    if (amount > 1) {
        for (let i = 2; i <= amount; i++) {
            values = values + `,('${playerinvname}','${itemid}','${information}','${slot}','${creationDate}')`

        }
    }

    let query = `INSERT INTO user_inventory2 (name,item_id,information,slot,creationDate) VALUES ${values};`
    exports.oxmysql.execute(query, {}, function() {
        emit("server-request-update-src", player, src)
    });

});

RegisterServerEvent("server-item-quality-update")
onNet("server-item-quality-update", async(cid, data) => {

});


// RegisterServerEvent("server-inventory-refresh")
// onNet("server-inventory-refresh", async(player, sauce) => {
//     console.log("HERE")
//     let src = source
//     if (!src) {
//         src = sauce
//     }

//     let string = `SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, quality, creationDate FROM user_inventory2 where name= 'ply-${player}' group by slot`;
//     exports.oxmysql.execute(string, {}, function(inventory) {
//         if (!inventory) {} else {
//             var invArray = inventory;
//             var arrayCount = 0;
//             var playerinvname = player
//             emitNet("inventory-update-player", src, [invArray, arrayCount, playerinvname]);
//             emitNet('current-items', src, invArray)
//         }
//     })
// })

RegisterServerEvent("server-inventory-open")
onNet("server-inventory-open", async (coords, player, secondInventory, targetName, itemToDropArray, sauce, vehWeightCalc) => {

    let src = source

    if (!src) {
        src = sauce
    }

    let playerinvname = 'ply-' + player

    if (InUseInventories[targetName] || InUseInventories[playerinvname]) {

        if (InUseInventories[playerinvname]) {
            if ((InUseInventories[playerinvname] != player)) {
                return
            } else {

            }
        }
        if (InUseInventories[targetName]) {
            if (InUseInventories[targetName] == player) {

            } else {
                secondInventory = "69"
            }
        }
    }
    let string = `SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM user_inventory2 where name= 'ply-${player}'  group by slot`;

    exports.oxmysql.execute(string, {}, function(inventory) {

        var invArray = inventory;
        var i;
        var arrayCount = 0;

        InUseInventories[playerinvname] = player;

        if (secondInventory == "1") {

            var targetinvname = targetName

            let string = `SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM user_inventory2 WHERE name = '${targetinvname}' group by slot`;
            exports.oxmysql.execute(string, {}, function(inventory2) {
                emitNet("inventory-open-target", src, [invArray, arrayCount, playerinvname, inventory2, 0, targetinvname, 500, true]);

                InUseInventories[targetinvname] = player
            });
        } else if (secondInventory == "3") {

            let Key = "" + DataEntries + "";
            let NewDroppedName = 'Drop-' + Key;

            DataEntries = DataEntries + 1
            var invArrayTarget = [];
            DroppedInventories[NewDroppedName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: NewDroppedName,
                used: false,
                lastUpdated: Date.now()
            }


            InUseInventories[NewDroppedName] = player;

            invArrayTarget = JSON.stringify(invArrayTarget)
            emitNet("inventory-open-target", src, [invArray, arrayCount, playerinvname, invArrayTarget, 0, NewDroppedName, 500, false]);

        } else if (secondInventory == "13") {

            let Key = "" + DataEntries + "";
            let NewDroppedName = 'Drop-' + Key;
            DataEntries = DataEntries + 1
            for (let Key in itemToDropArray) {
                for (let i = 0; i < itemToDropArray[Key].length; i++) {
                    let objectToDrop = itemToDropArray[Key][i];
                    db(`UPDATE user_inventory2 SET slot='${i+1}', name='${NewDroppedName}', dropped='1' WHERE name='${Key}' and slot='${objectToDrop.faultySlot}' and item_id='${objectToDrop.faultyItem}' `);
                }
            }

            DroppedInventories[NewDroppedName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: NewDroppedName,
                used: false,
                lastUpdated: Date.now()
            }
            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[NewDroppedName])

        } else if (secondInventory == "42069") {
            console.log(itemToDropArray)
            let creationDate = Date.now()
            let Key = "" + DataEntries + "";
            let NewDroppedName = 'Drop-Overweight' + Key;
            DataEntries = DataEntries + 1
            for (let Key in itemToDropArray) {
                for (let i = 0; i < itemToDropArray[Key].length; i++) {
                    let objectToDrop = itemToDropArray[Key][i];
                    let amount = Number(objectToDrop.amount)
                    for (let step = 0; step < amount; step++){
                    db(`INSERT INTO user_inventory2 (item_id, name, slot, dropped, creationDate) VALUES ('${objectToDrop.itemid}','${NewDroppedName}','${objectToDrop.slot}','1','${creationDate}' );`);
                    }
                }
            }

            DroppedInventories[NewDroppedName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: NewDroppedName,
                used: false,
                lastUpdated: Date.now()
            }
            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[NewDroppedName])

        } else if(secondInventory == "2") {
                        
                var targetinvname = targetName;
                var shopArray = ConvenienceStore();
                var shopAmount = 10;
                emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);

        } else if(secondInventory == "4")
        {
            var targetinvname = targetName;
            var shopArray = HardwareStore();
            var shopAmount = 11;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);

        } else if(secondInventory == "5")
            {
                var targetinvname = targetName;
                var shopArray = GunStore();
                var shopAmount = 10;
                emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);

        } else if(secondInventory == "6")
            {
            var targetinvname = targetName;
            var shopArray = NonGunStore();
            var shopAmount = 7;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
            
        } else if(secondInventory == "60")
            {
            var targetinvname = targetName;
            var shopArray = RacingThingy();
            var shopAmount = 4;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
            }

        else if(secondInventory == "33")
            {
            var targetinvname = targetName;
            var shopArray = TunerCrafting();
            var shopAmount = 3;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }

        else if(secondInventory == "45")
        {
            var targetinvname = targetName;
            var shopArray = BurgerShotStore();
            var shopAmount = 12;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }

        else if(secondInventory == "46")
        {
            var targetinvname = targetName;
            var shopArray = PearlsStore();
            var shopAmount = 15;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }

        else if(secondInventory == "50")
        {
            var targetinvname = targetName;
            var shopArray = RedCircle();
            var shopAmount = 8;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }

        else if(secondInventory == "54")
        {
            var targetinvname = targetName;
            var shopArray = UwUCafeFridge();
            var shopAmount = 11;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }

        else if(secondInventory == "48")
        {
            var targetinvname = targetName;
            var shopArray = WineryStore();
            var shopAmount = 3;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
            else if(secondInventory == "10")
        {
            var targetinvname = targetName;
            var shopArray = PoliceArmory();
            var shopAmount = 33;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }    

        else if(secondInventory == "0002")
        {
            var targetinvname = targetName;
            var shopArray = SushiRETARD();
            var shopAmount = 15;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        } 

        else if(secondInventory == "17")
        {
            var targetinvname = targetName;
            var shopArray = DOCArmory();
            var shopAmount = 11;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }    

        else if(secondInventory == "198")
        {
            var targetinvname = targetName;
            var shopArray = HuntingShop();
            var shopAmount = 4;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "989")
        {
            var targetinvname = targetName;
            var shopArray = AspectGangBench1();
            var shopAmount = 4;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }    
        else if(secondInventory == "988")
        {
            var targetinvname = targetName;
            var shopArray = AspectGangBench2();
            var shopAmount = 8;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  
        else if(secondInventory == "987")
        {
            var targetinvname = targetName;
            var shopArray = AspectGangBench3();
            var shopAmount = 11;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }    
        else if(secondInventory == "986")
        {
            var targetinvname = targetName;
            var shopArray = AspectGangBench4();
            var shopAmount = 15;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }    
        else if(secondInventory == "985")
        {
            var targetinvname = targetName;
            var shopArray = AspectGangBench5();
            var shopAmount = 19;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }    
        else if(secondInventory == "222")
        {
            var targetinvname = targetName;
            var shopArray = MaldiniFridge();
            var shopAmount = 6;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }    

        else if(secondInventory == "47")
        {
            var targetinvname = targetName;
            var shopArray = EMT();
            var shopAmount = 21;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }    
        else if(secondInventory == "14")
        {
            var targetinvname = targetName;
            var shopArray = courthouse();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  
        // else if(secondInventory == "18")
        // {
        //     var targetinvname = targetName;
        //     var shopArray = TacoTruck();
        //     var shopAmount = 14;
        //     emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        // }  
        else if(secondInventory == "22")
        {
            var targetinvname = targetName;
            var shopArray = JailFood();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  
        else if(secondInventory == "25")
        {
            var targetinvname = targetName;
            var shopArray = JailMeth();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  
        else if(secondInventory == "12")
        {
            var targetinvname = targetName;
            var shopArray = burgiestore();
            var shopAmount = 8;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }   
            else if(secondInventory == "600")
        {
            var targetinvname = targetName;
            var shopArray = policeveding();
            var shopAmount = 9;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  
        else if(secondInventory == "27")
        {
            var targetinvname = targetName;
            var shopArray = Mechanic();
            var shopAmount = 4;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "0001")
        {
            var targetinvname = targetName;
            var shopArray = PistolProgression();
            var shopAmount = 2;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "0003")
        {
            var targetinvname = targetName;
            var shopArray = SMGProgression();
            var shopAmount = 2;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "0010")
        {
            var targetinvname = targetName;
            var shopArray = AyoPuto();
            var shopAmount = 2;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "0011")
        {
            var targetinvname = targetName;
            var shopArray = Prisoncraft();
            var shopAmount = 3;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "0004")
        {
            var targetinvname = targetName;
            var shopArray = KatanaCraft();
            var shopAmount = 3;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "0005")
        {
            var targetinvname = targetName;
            var shopArray = HeistCraft();
            var shopAmount = 4;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "28")
        {
            var targetinvname = targetName;
            var shopArray = WeaponBenchRedCircle();
            var shopAmount = 9;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "29")
        {
            var targetinvname = targetName;
            var shopArray = GalleryRings();
            var shopAmount = 4;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "1313")
        {
            var targetinvname = targetName;
            var shopArray = DragonJewel();
            var shopAmount = 7;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "30")
        {
            var targetinvname = targetName;
            var shopArray = WeaponBenchLostMC();
            var shopAmount = 4;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "32")
        {
            var targetinvname = targetName;
            var shopArray = WeaponBenchMPG();
            var shopAmount = 7;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "606")
        {
            var targetinvname = targetName;
            var shopArray = SecretPrison();
            var shopAmount = 3;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "141")
        {
            var targetinvname = targetName;
            var shopArray = recycle();
            var shopAmount = 8;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }

            else if(secondInventory == "31")
        {
            var targetinvname = targetName;
            var shopArray = Blackmarket();
            var shopAmount = 5;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "998")
        {
            var targetinvname = targetName;
            var shopArray = slushy();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  


        else if(secondInventory == "921")
        {
            var targetinvname = targetName;
            var shopArray = asslockpick();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  

        else if(secondInventory == "0909")
        {
            var targetinvname = targetName;
            var shopArray = SkyBar();
            var shopAmount = 3;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  

        else if(secondInventory == "26")
        {
            var targetinvname = targetName;
            var shopArray = assphone();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  
        else if(secondInventory == "1032")
        {
            var targetinvname = targetName;
            var shopArray = HarmonyCraft();
            var shopAmount = 7;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "213")
        {
            var targetinvname = targetName;
            var shopArray = CosmicStore();
            var shopAmount = 9;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "714")
        {
            var targetinvname = targetName;
            var shopArray = smelter();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else if(secondInventory == "9775")
        {
            var targetinvname = targetName;
            var shopArray = FishingShopMillers();
            var shopAmount = 4;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  
        else if(secondInventory == "42073")
        {
            var targetinvname = targetName;
            var shopArray = DigitelDenShop();
            var shopAmount = 2;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  
        else if(secondInventory == "422")
        {
            var targetinvname = targetName;
            var shopArray = coffeevend();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  

        else if(secondInventory == "4242")
        {
            var targetinvname = targetName;
            var shopArray = foodvend();
            var shopAmount = 2;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  

        
        else if(secondInventory == "421")
        {
            var targetinvname = targetName;
            var shopArray = watervend();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  

        else if(secondInventory == "4292")
        {
            var targetinvname = targetName;
            var shopArray = sodavending();
            var shopAmount = 1;
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }  
        

        else if(secondInventory == "7")
        {
            var targetinvname = targetName;
            var shopArray = DroppedItem(itemToDropArray);
            
            itemToDropArray = JSON.parse(itemToDropArray)
            var shopAmount = itemToDropArray.length;
            
            emitNet("inventory-open-target", src, [invArray,arrayCount,playerinvname,shopArray,shopAmount,targetinvname,500,false]);
        }
        else {
            emitNet("inventory-update-player", src, [invArray,arrayCount,playerinvname]);
        }
    });
});

RegisterServerEvent("server-remove-item")
onNet("server-remove-item", async(player, itemidsent, amount, openedInv) => {
    functionRemoveAny(player, itemidsent, amount, openedInv)
});

RegisterServerEvent("server-remove-item-kv")
onNet("server-remove-item-kv", async(player, itemidsent, metaKey, metaValue, amount, openedInv) => {
    functionRemoveKV(player, itemidsent, metaKey, metaValue, amount, openedInv)
});

function functionRemoveAny(player, itemidsent, amount, openedInv) {
    let src = source
    let playerinvname = 'ply-' + player
    let string = `DELETE FROM user_inventory2 WHERE name='${playerinvname}' and item_id='${itemidsent}' LIMIT ${amount}`

    exports.oxmysql.execute(string, {}, function() {
        emit("server-request-update-src", player, src)
    });
}

function functionRemoveKV(player, itemidsent, amount, metaKey, metaValue, openedInv) {
    let src = source
    let playerinvname = 'ply-' + player
    let string = `DELETE FROM user_inventory2 WHERE name='${playerinvname}' and item_id='${itemidsent}' LIMIT ${amount}`
    let string2 = `DELETE FROM user_inventory2 WHERE name='${playerinvname}' and item_id='${itemidsent}' AND information LIKE '${metaKey}' OR information LIKE '${metaValue}' LIMIT ${amount}`;

    exports.oxmysql.execute(string, {}, function() {
        emit("server-request-update-src", player, src)
    });
}

RegisterServerEvent("server-inventory-close")
onNet("server-inventory-close", async(player, targetInventoryName) => {
    let src = source

    //line 647
    if (targetInventoryName.startsWith("Trunk"))
        emitNet("toggle-animation", src, false);
    InUseInventories = InUseInventories.filter(item => item != player);
    if (targetInventoryName.indexOf("Drop") > -1 && DroppedInventories[targetInventoryName]) {
        if (DroppedInventories[targetInventoryName].used === false) {
            delete DroppedInventories[targetInventoryName];
        } else {
            let string = `SELECT count(item_id) as amount, item_id, name, information, slot, dropped FROM user_inventory2 WHERE name='${targetInventoryName}' group by item_id `;
            exports.oxmysql.execute(string, {}, function(result) {
                if (result.length == 0 && DroppedInventories[targetInventoryName]) {
                    delete DroppedInventories[targetInventoryName];
                    emitNet("Inventory-Dropped-Remove", -1, [targetInventoryName])
                }
            });
        }
    }
    emit("server-request-update-src", player, source)
    sendClientItemList(src)
});


RegisterServerEvent("server-inventory-remove")
onNet("server-inventory-remove-slot", async(player, itemidsent, amount, slot) => {
    var playerinvname = 'ply-' + player
    db(`DELETE FROM user_inventory2 WHERE name='${playerinvname}' and item_id='${itemidsent}' and slot='${slot}' LIMIT ${amount}`);
});

RegisterServerEvent("server-ragdoll-items")
onNet("server-ragdoll-items", async(player) => {
    let currInventoryName = `ply-${player}`;
    let newInventoryName = `wait-${player}`;

    db(`UPDATE user_inventory2 SET name='${newInventoryName}', WHERE name='${currInventoryName}' and dropped = 0 and item_id="mobilephone" `);
    db(`UPDATE user_inventory2 SET name='${newInventoryName}', WHERE name='${currInventoryName}' and dropped = 0 and item_id="idcard" `);

    await db(`DELETE FROM user_inventory2 WHERE name='${currInventoryName}'`);

    db(`UPDATE user_inventory2 SET name='${currInventoryName}', WHERE name='${newInventoryName}' and dropped = 0`);
});

RegisterServerEvent('server-jail-items')
onNet("server-jail-item", async(player, isSentToJail) => {
    let currInventoryName = `ply-${player}`;
    let newInventoryName = `ply-${player}`;

    if (!isSentToJail) {
        currInventoryName = `ply-${player}`;
        newInventoryName = `jail-ply-${player}`;
    } else {
        currInventoryName = `jail-ply-${player}`;
        newInventoryName = `ply-${player}`;
    }

    db(`UPDATE user_inventory2 SET name='${currInventoryName}' WHERE name='${newInventoryName}' and dropped = 0`);
});

function removecash(pSrc, amount) {
    emit('cash:remove', pSrc, amount)
}


setTimeout(CleanDroppedInventory, 5)

function sendClientItemList(src) {
    emitNet('inv:sendItemList', src, itemList)
}

function DroppedItem(itemArray) {
    itemArray = JSON.parse(itemArray)
    var shopItems = [];

    shopItems[0] = {
        item_id: itemArray[0].itemid,
        id: 0,
        name: "shop",
        information: "{}",
        slot: 1,
        amount: itemArray[0].amount
    };

    return JSON.stringify(shopItems);
}

function BuildInventory(Inventory) {
    let buildInv = Inventory
    let invArray = {};
    itemCount = 0;
    for (let i = 0; i < buildInv.length; i++) {
        invArray[itemCount] = {
            item_id: buildInv[i].item_id,
            id: buildInv[i].id,
            name: buildInv[i].name,
            information: buildInv[i],
            slot: buildInv[i].slot
        };
        itemCount = itemCount + 1
    }
    return [JSON.stringify(invArray), itemCount]
}

function mathrandom(min, max) {
    return Math.floor(Math.random() * (max + 1 - min)) + min;
}


const DEGREDATION_INVENTORY_CHECK = 1000 * 60 * 60;
const DEGREDATION_TIME_BROKEN = 1000 * 60 * 40320;
const DEGREDATION_TIME_WORN = 1000 * 60 * 201000;



RegisterServerEvent("server-inventory-move")
onNet("server-inventory-move", async(player, data, coords) => {
    let src = source
    let targetslot = data[0]
    let startslot = data[1]
    let targetName = data[2].replace(/"/g, "");
    let startname = data[3].replace(/"/g, "");
    let purchase = data[4]
    let itemCosts = data[5]
    let itemidsent = data[6]
    let amount = data[7]
    let crafting = data[8]
    let isWeapon = data[9]
    let PlayerStore = data[10]
    let creationDate = Date.now()

    if ((targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) && DroppedInventories[targetName]) {

        if (DroppedInventories[targetName].used === false) {

            DroppedInventories[targetName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: targetName,
                used: true,
                lastUpdated: Date.now()
            }
            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[targetName])
        }
    }

    let info = "{}"
    
    if (purchase) {
        info = await GenerateInformation(src, player, itemidsent);
        if (isWeapon) {
            console.log("gothere", player)
            hadBrought[player] = true;
            let serialJson = JSON.parse(info);
            let meta = {
                "itemid": itemidsent,
                "cartridge": serialJson.cartridge
            };
            db(
                `INSERT INTO _character_events (character_id, type, meta) VALUES ('${player}', 'purchase_weapons', '${JSON.stringify(meta)}');`,
            );
            emitNet("Inventory-brought-update", -1, JSON.stringify(Object.assign({}, hadBrought)));
        }
        info = await GenerateInformation(src, player, itemidsent)
        removecash(src, itemCosts)

        if (!PlayerStore) {
            for (let i = 0; i < parseInt(amount); i++) {

                db(`INSERT INTO user_inventory2 (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);
            }
        } else if (crafting) {

            info - await GenerateInformation(src, player, itemidsent)
            for (let i = 0; i < parseInt(amount); i++) {
                db(`INSERT INTO user_inventory2 (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);
            }
        } else {
            if (targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) {

                db(`INSERT INTO user_inventory2 SET slot='${targetslot}', name='${targetName}', dropped = 1 WHERE slot='${startslot}' AND name='${startname}'`);

            } else {
                db(`UPDATE user_inventory2 SET slot='${targetslot}', name='${targetName}', dropped = 0 WHERE slot='${startslot}' and name='${startname}'`);

            }
        }
    } else {

        if (crafting == true) {
            info - await GenerateInformation(src, player, itemidsent)
            for (let i = 0; i < parseInt(amount); i++) {
                db(`INSERT INTO user_inventory2 (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);
            }
        }

        db(`UPDATE user_inventory2 SET slot='${targetslot}', name='${targetName}', dropped = 0 WHERE slot='${startslot}' and name='${startname}'`);

    }
});


function CleanDroppedInventory() {
    onNet("server-ragdoll-items", async(player) => {
        let currInventoryName = `ply-${player}`
        let newInventoryName = player
        db(`UPDATE user_inventory2 SET name='${newInventoryName}', WHERE name='${currInventoryName}' and dropped =0 and item_id="mobilephone" `);
        db(`UPDATE user_inventory2 SET name='${newInventoryName}', WHERE name='${currInventoryName}' and dropped =0 and item_id="idcard" `);
        db(`UPDATE user_inventory2 SET name='${currInventoryName}', WHERE name='${newInventoryName}' and dropped =0`);
    })
};

RegisterServerEvent("server-inventory-stack")
onNet("server-inventory-stack", async(player, data, coords) => {
    let targetslot = data[0]
    let moveAmount = data[1]
    let targetName = data[2].replace(/"/g, "");
    let src = source
    let originSlot = data[3]
    let originInventory = data[4].replace(/"/g, "");
    let purchase = data[5]
    let itemCosts = data[6]
    let itemidsent = data[7]
    let amount = data[8]
    let crafting = data[9]
    let isWeapon = data[10]
    let PlayerStore = data[11]
    let amountRemaining = data[12]
    let creationDate = Date.now()
    if ((targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) && DroppedInventories[targetName]) {

        if (DroppedInventories[targetName].used === false) {
            DroppedInventories[targetName] = {
                position: {
                    x: coords[0],
                    y: coords[1],
                    z: coords[2]
                },
                name: targetName,
                used: true,
                lastUpdated: Date.now()
            }
            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[targetName])
        }
    }

    let info = "{}"

    if (purchase) {

        if (isWeapon) {
            db(`INSERT INTO user_inventory2 (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);

        }
        info = await GenerateInformation(src, player, itemidsent)
        removecash(src, itemCosts)

        if (!PlayerStore) {
            for (let i = 0; i < parseInt(amount); i++) {

                db(`INSERT INTO user_inventory2 (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);


            }
        }

        if (PlayerStore) {

            db(`UPDATE user_inventory2 SET slot='${targetslot}', name='${targetname}', dropped = '0' WHERE slot='${startslot}' AND name='${startname}'`);
        }


    } else if (crafting) {
        info = await GenerateInformation(src, player, itemidsent)
        for (let i = 0; i < parseInt(amount); i++) {

            db(`INSERT INTO user_inventory2 (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}' );`);
        }
    } else {
        let string = `SELECT item_id, id FROM user_inventory2 WHERE slot='${originSlot}' and name='${originInventory}' LIMIT ${moveAmount}`;

        exports.oxmysql.execute(string, {}, function(result) {

            var itemids = "0"
            for (let i = 0; i < result.length; i++) {
                itemids = itemids + "," + result[i].id
            }

            if (targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) {
                db(`UPDATE user_inventory2 SET slot='${targetslot}', name='${targetName}', dropped = 1 WHERE id IN (${itemids})`);

            } else {
                db(`UPDATE user_inventory2 SET slot='${targetslot}', name='${targetName}', dropped = 0 WHERE id IN (${itemids})`);
            }
        });
    }
});

RegisterServerEvent("server-inventory-swap")
onNet("server-inventory-swap", (player, data, coords) => {
    let targetslot = data[0]
    let targetname = data[1].replace(/"/g, "");
    let startslot = data[2]
    let startname = data[3].replace(/"/g, "");

    let string = `SELECT id FROM user_inventory2 WHERE slot='${targetslot}' AND name='${targetname}'`;

    exports.oxmysql.execute(string, {}, function(startid) {
        var itemids = "0"
        for (let i = 0; i < startid.length; i++) {
            itemids = itemids + "," + startid[i].id

        }

        let string = false;
        if (targetname.indexOf("Drop") > -1 || targetname.indexOf("hidden") > -1) {
            string = `UPDATE user_inventory2 SET slot='${targetslot}', name ='${targetname}', dropped = 1 WHERE slot='${startslot}' AND name='${startname}'`;
        } else {
            string = `UPDATE user_inventory2 SET slot='${targetslot}', name ='${targetname}', dropped = 0 WHERE slot='${startslot}' AND name='${startname}'`;
        }

        exports.oxmysql.execute(string, {}, function(inventory) {
            if (startname.indexOf("Drop") > -1 || startname.indexOf("hidden") > -1) {
                db(`UPDATE user_inventory2 SET slot='${startslot}', name='${startname}', dropped = 1 WHERE id IN (${itemids})`);
            } else {
                db(`UPDATE user_inventory2 SET slot='${startslot}', name='${startname}', dropped = 0 WHERE id IN (${itemids})`);
            }
        });
    });
});

function deleteHidden() {
    db(`DELETE FROM user_inventory2 WHERE name like '%Hidden%' OR name like '%trash%'`)
}

function deleteHiddenHandler() {
    setTimeout(250000, deleteHidden())
}