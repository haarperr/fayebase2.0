MC = {}
MC.Clothing = {}

let selectedTab = ".characterTab"
let lastCategory = "character"
let selectedCam = null;
let hasTracker = false;
let canChange = true;

let clothingCategorys = [];
let ShopPrice = 0;
let IsAdminMenu = false;
let changingCat = null;

function ChangeUp() {
    let clothingCategory = $(changingCat).parent().parent().data('type');
    let buttonType = $(changingCat).data('type');
    let inputVal = parseFloat($(changingCat).val());

    if (clothingCategory == "accessory" && inputVal + 1 == 13) {
        $(changingCat).val(14 - 1)
    }
}

function ChangeDown() {
    let clothingCategory = $(changingCat).parent().parent().data('type');
    let buttonType = $(changingCat).data('type');
    let inputVal = parseFloat($(changingCat).val());


    if (clothingCategory == "accessory" && inputVal - 1 == 13) {
        $(changingCat).val(12 + 1)
    }
}

$(document).on('click', '.clothing-menu-sidebar-btn', function(e) {
    let category = $(this).data('category');

    $(selectedTab).removeClass("selected");
    $(this).addClass("selected");
    $(".clothing-menu-" + lastCategory + "-container").css({ "display": "none" });

    lastCategory = category;
    selectedTab = this;

    $(".clothing-menu-" + category + "-container").css({ "display": "block" });
})


$(document).on('click', '.clothing-menu-option-item-right', function(e) {
    e.preventDefault();

    let clothingCategory = $(this).parent().parent().data('type');
    let buttonType = $(this).data('type');
    let inputElem = $(this).parent().find('input');
    let inputVal = $(inputElem).val();
    let newValue = parseFloat(inputVal) + 1;

    if (canChange) {
        if (hasTracker && clothingCategory == "accessory") {
            $.post(`https://${GetParentResourceName()}/TrackerError`);
            return
        } else {
            if (clothingCategory == "model") {
                $(inputElem).val(newValue);
                $.post(`https://${GetParentResourceName()}/setCurrentPed`, JSON.stringify({ ped: newValue }), function(model) {
                    $("#current-model").html("<p>" + model + "</p>")
                });
                canChange = true;
                MC.Clothing.ResetValues()
            } else if (clothingCategory == "hair") {
                $(inputElem).val(newValue);
                $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                    clothingType: clothingCategory,
                    articleNumber: newValue,
                    type: buttonType,
                }));
                if (buttonType == "item") {
                    MC.Clothing.ResetItemTexture(this, clothingCategory);
                }
            } else {
                if (buttonType == "item") {
                    let buttonMax = $(this).parent().find('[data-headertype="item-header"]').data('maxItem');
                    if (clothingCategory == "accessory" && newValue == 13) {
                        $(inputElem).val(14);
                        $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                            clothingType: clothingCategory,
                            articleNumber: 14,
                            type: buttonType,
                        }));
                    } else {
                        if (newValue <= parseInt(buttonMax)) {
                            $(inputElem).val(newValue);
                            $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: newValue,
                                type: buttonType,
                            }));
                        }
                    }
                    MC.Clothing.ResetItemTexture(this, clothingCategory);
                } else {
                    let buttonMax = $(this).parent().find('[data-headertype="texture-header"]').data('maxTexture');
                    if (newValue <= parseInt(buttonMax)) {
                        $(inputElem).val(newValue);
                        $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                            clothingType: clothingCategory,
                            articleNumber: newValue,
                            type: buttonType,
                        }));
                    }
                }
            }
        }
    }
});

$(document).on('click', '.clothing-menu-option-item-left', function(e) {
    e.preventDefault();

    let clothingCategory = $(this).parent().parent().data('type');
    let buttonType = $(this).data('type');
    let inputElem = $(this).parent().find('input');
    let inputVal = $(inputElem).val();
    let newValue = parseFloat(inputVal) - 1;

    if (canChange) {
        if (hasTracker && clothingCategory == "accessory") {
            $.post(`https://${GetParentResourceName()}/TrackerError`);
            return
        } else {
            if (clothingCategory == "model") {
                if (newValue != 0) {
                    $(inputElem).val(newValue);
                    $.post(`https://${GetParentResourceName()}/setCurrentPed`, JSON.stringify({ ped: newValue }), function(model) {
                        $("#current-model").html("<p>" + model + "</p>")
                    });
                    canChange = true;
                    MC.Clothing.ResetValues();
                }
            } else {
                if (buttonType == "item") {
                    if (newValue >= clothingCategorys[clothingCategory].defaultItem) {
                        if (clothingCategory == "accessory" && newValue == 13) {
                            $(inputElem).val(12);
                            $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: 12,
                                type: buttonType,
                            }));
                        } else {
                            $(inputElem).val(newValue);
                            $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: newValue,
                                type: buttonType,
                            }));
                        }
                    }
                    MC.Clothing.ResetItemTexture(this, clothingCategory);
                } else {
                    if (newValue >= clothingCategorys[clothingCategory].defaultTexture) {
                        if (clothingCategory == "accessory" && newValue == 13) {
                            $(inputElem).val(12);
                            $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: 12,
                                type: buttonType,
                            }));
                        } else {
                            $(inputElem).val(newValue);
                            $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: newValue,
                                type: buttonType,
                            }));
                        }
                    }
                }
            }
        }
    }
});

$(document).on('input', '.clothing-menu-option-item-slider', function(e) {

    let clothingCategory = $(this).parent().parent().data('type');
    let buttonType = $(this).data('type');
    let inputElem = $(this).parent().find('input');
    let inputVal = $(inputElem).val();
    let newValue = parseFloat(inputVal);

    if (canChange) {
        if (hasTracker && clothingCategory == "accessory") {
            $.post(`https://${GetParentResourceName()}/TrackerError`);
            return
        } else {
            if (clothingCategory == "model") {
                if (newValue != 0) {
                    $(inputElem).val(newValue);
                    $.post(`https://${GetParentResourceName()}/setCurrentPed`, JSON.stringify({ ped: newValue }), function(model) {
                        $("#current-model").html("<p>" + model + "</p>")
                    });
                    canChange = true;
                    MC.Clothing.ResetValues();
                }
            } else {
                if (buttonType == "item") {
                    if (newValue >= clothingCategorys[clothingCategory].defaultItem) {
                        if (clothingCategory == "accessory" && newValue == 13) {
                            $(inputElem).val(12);
                            $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: 12,
                                type: buttonType,
                            }));
                        } else {
                            $(inputElem).val(newValue);
                            $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: newValue,
                                type: buttonType,
                            }));
                        }
                    }
                    MC.Clothing.ResetItemTexture(this, clothingCategory);
                } else {
                    if (newValue >= clothingCategorys[clothingCategory].defaultTexture) {
                        if (clothingCategory == "accessory" && newValue == 13) {
                            $(inputElem).val(12);
                            $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: 12,
                                type: buttonType,
                            }));
                        } else {
                            $(inputElem).val(newValue);
                            $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: newValue,
                                type: buttonType,
                            }));
                        }
                    }
                }
            }
        }
    }
});

$(document).on('change', '.item-number', function() {
    let clothingCategory = $(this).parent().parent().data('type');
    let buttonType = $(this).data('type');
    let inputVal = $(this).val();
    changingCat = this;

    if ($(this).val().trim().length == 0) {
        $(this).val("0");
    }

    if (hasTracker && clothingCategory == "accessory") {
        $.post(`https://${GetParentResourceName()}/TrackerError`);
        $(this).val(13);
        return
    } else {
        if (clothingCategory == "accessory" && inputVal == 13) {
            $(this).val(12);
            return
        } else {
            $.post(`https://${GetParentResourceName()}/updateSkinOnInput`, JSON.stringify({
                clothingType: clothingCategory,
                articleNumber: parseFloat(inputVal),
                type: buttonType,
            }));
        }
    }
});

$(document).on('click', '.clothing-menu-sidebar-clothing-btn', function(e) {
    e.preventDefault();
    let toggleVariation = $(this).data('value');
    $.post(`https://${GetParentResourceName()}/toggleVariation`, JSON.stringify({
        variationId: toggleVariation,
    }));
});

$(document).on('click', "#save-menu", function(e) {
    e.preventDefault();
    $('.clothing-confirm-screen').fadeIn(450);
});

$(document).on('click', ".clothing-confirm-screen-button", function(e) {
    e.preventDefault();
    let Action = $(this).attr('data-Action');
    if (Action == 'Save') {
        $('.clothing-confirm-screen').hide();
        MC.Clothing.Close();
        $.post(`https://${GetParentResourceName()}/saveClothing`, JSON.stringify({
            IsAdmin: IsAdminMenu
        }));
        IsAdminMenu = false;
    } else if (Action == 'Discard') {
        $('.clothing-confirm-screen').hide();
        MC.Clothing.Close();
        $.post(`https://${GetParentResourceName()}/resetOutfit`);    
    } else if (Action == 'Back') {
        $('.clothing-confirm-screen').fadeOut(450);
    }
});

$(document).on('click', "#cancel-menu", function(e) {
    e.preventDefault();
    $('.clothing-confirm-screen').fadeIn(450);
});

$(document).on('click', '.clothing-menu-outfit-option-button', function(e) {
    e.preventDefault();

    let oData = $(this).parent().data('outfitData');

    $.post(`https://${GetParentResourceName()}/selectOutfit`, JSON.stringify({
        outfitData: oData.outfitData,
        outfitName: oData.outfitLabel
    }))
});

// Menu Functions

MC.Clothing.ResetItemTexture = function(obj, category) {
    let itemTexture = $(obj).parent().parent().find('[data-type="texture"]');
    let defaultTextureValue = clothingCategorys[category].defaultTexture;
    $(itemTexture).val(defaultTextureValue);

    $.post(`https://${GetParentResourceName()}/updateSkin`, JSON.stringify({
        clothingType: category,
        articleNumber: defaultTextureValue,
        type: "texture",
    }));
}

MC.Clothing.ToggleChange = function(bool) {
    canChange = bool;
}

MC.Clothing.SetCurrentValues = function(clothingValues) {
    $.each(clothingValues, function(i, item) {
        let itemCats = $(".clothing-menu-container").find('[data-type="' + i + '"]');

        if (i == "facemix") { // Added for special case with range sliders
            $('#shapeMix').val(item.shapeMix);
            $('#skinMix').val(item.skinMix);
        } else {
            let input = $(itemCats).find('input[data-type="item"]');
            let texture = $(itemCats).find('input[data-type="texture"]');

            $(input).val(item.item);
            $(texture).val(item.texture);
        }
    });
}

MC.Clothing.Open = function(data) {
    clothingCategorys = data.currentClothing;
    IsAdminMenu = data.IsAdmin;
    ShopPrice = data.ShopPrice;

    // Detect Tracker
    if (data.hasTracker) { hasTracker = true; } else { hasTracker = false; }

    // Set Shop Price
    $('#shop-amount').html(ShopPrice);

    // Fade In Sidebar
    $(".clothing-menu-sidebar").fadeIn(150)
    $(".clothing-menu-sidebar-clothing").fadeIn(150);

    // Fade Out All Other Menus
    $(".clothing-menu-roomoutfits-container").css("display", "none");
    $(".clothing-menu-character-container").css("display", "none");
    $(".clothing-menu-clothing-container").css("display", "none");
    $(".clothing-menu-accessoires-container").css("display", "none");

    // Fade In Current Menu
    $(".container").css({ "display": "block" }).animate({ right: 0, }, 200);

    MC.Clothing.SetMaxValues(data.maxValues);
    MC.Clothing.SetCurrentValues(data.currentClothing);

    $(".clothing-menu-sidebar").html("");
    $(".clothing-menu-roomoutfits-container").html("");

    // Set Sidebar Logo
    $(".clothing-menu-sidebar").append('<div class="clothing-menu-sidebar-logo"><img src="./img/logo.png"></div>')

    $.each(data.menus, function(i, menu) {
        // If Sidebar Menu is selected on Open
        if (menu.selected) {
            let Icon = menu.menu == 'roomoutfits' ? '<i class="fa-solid fa-user-tie"></i>' : menu.menu == 'clothing' ? '<i class="fa-solid fa-shirt"></i>' : menu.menu == 'accessoires' ? '<i class="fa-solid fa-vest"></i>' : menu.menu == 'character' ? '<i class="fa-solid fa-people-arrows-left-right"></i>' : '';
            $(".clothing-menu-sidebar").append('<div class="clothing-menu-sidebar-btn ' + menu.menu + 'Tab selected" data-category="' + menu.menu + '">' + Icon + '</div>')
            $(".clothing-menu-" + menu.menu + "-container").css({ "display": "block" });

            if (menu.label == "Clothing") {
                $("#faceoption").css("display", "none");
            } else {
                $("#faceoption").css("display", "block");
            }

            selectedTab = "." + menu.menu + "Tab";
            lastCategory = menu.menu;
        } else {
            // If sidebar Menu is not selected on Open
            let Icon = menu.menu == 'roomoutfits' ? '<i class="fa-solid fa-user-tie"></i>' : menu.menu == 'clothing' ? '<i class="fa-solid fa-shirt"></i>' : menu.menu == 'accessoires' ? '<i class="fa-solid fa-vest"></i>' : menu.menu == 'character' ? '<i class="fa-solid fa-people-arrows-left-right"></i>' : '';
            $(".clothing-menu-sidebar").append('<div class="clothing-menu-sidebar-btn ' + menu.menu + 'Tab" data-category="' + menu.menu + '">' + Icon + '</div>')
        }

        // If Menu your opening is Roomoutfits
        if (menu.menu == "roomoutfits") {
            $.each(menu.outfits, function(index, outfit) {
                let elem = '<div class="clothing-menu-option" data-outfit="' + (index + 1) + '"> <div class="clothing-menu-option-header"><p>' + outfit.outfitLabel + '</p></div> <div class="clothing-menu-outfit-option-button one"><p>Select Outfit</p></div> </div>'
                $(".clothing-menu-roomoutfits-container").append(elem)

                $("[data-outfit='" + (index + 1) + "']").data('outfitData', outfit)
            });
        }
    });
}

MC.Clothing.Close = function() {
    $.post(`https://${GetParentResourceName()}/Close`);
    $(".clothing-menu-sidebar").fadeOut(150)
    $(".clothing-menu-sidebar-clothing").fadeOut(150);
    $(".clothing-menu-roomoutfits-container").css("display", "none");
    $(".clothing-menu-character-container").css("display", "none");
    $(".clothing-menu-clothing-container").css("display", "none");
    $(".clothing-menu-accessoires-container").css("display", "none");
    $(".clothing-menu-sidebar").html("");

    $(selectedCam).removeClass('selected-cam');
    $(selectedTab).removeClass("selected");
    selectedCam = null;
    selectedTab = null;
    lastCategory = null;
    $(".container").css({ "display": "block" }).animate({ right: "-35vw", }, 200, function() {
        $(".container").css({ "display": "none" });
    });
}

MC.Clothing.SetMaxValues = function(maxValues) {
    $.each(maxValues, function(i, cat) {
        if (cat.type == "character") {
            let containers = $(".clothing-menu-character-container").find('[data-type="' + i + '"]');
            let itemMax = $(containers).find('[data-headertype="item-header"]');
            let headerMax = $(containers).find('[data-headertype="texture-header"]');

            $(itemMax).data('maxItem', maxValues[containers.data('type')].item)
            $(headerMax).data('maxTexture', maxValues[containers.data('type')].texture)

            $(itemMax).html("<p>Item: " + maxValues[containers.data('type')].item + "</p>")
            $(headerMax).html("<p>Texture: " + maxValues[containers.data('type')].texture + "</p>")
        } else if (cat.type == "hair") {
            let containers = $(".clothing-menu-clothing-container").find('[data-type="' + i + '"]');
            let itemMax = $(containers).find('[data-headertype="item-header"]');
            let headerMax = $(containers).find('[data-headertype="texture-header"]');

            $(itemMax).data('maxItem', maxValues[containers.data('type')].item)
            $(headerMax).data('maxTexture', maxValues[containers.data('type')].texture)

            $(itemMax).html("<p>Item: " + maxValues[containers.data('type')].item + "</p>")
            $(headerMax).html("<p>Texture: " + maxValues[containers.data('type')].texture + "</p>")
        } else if (cat.type == "accessoires") {
            let containers = $(".clothing-menu-accessoires-container").find('[data-type="' + i + '"]');
            let itemMax = $(containers).find('[data-headertype="item-header"]');
            let headerMax = $(containers).find('[data-headertype="texture-header"]');

            $(itemMax).data('maxItem', maxValues[containers.data('type')].item)
            $(headerMax).data('maxTexture', maxValues[containers.data('type')].texture)

            $(itemMax).html("<p>Item: " + maxValues[containers.data('type')].item + "</p>")
            $(headerMax).html("<p>Texture: " + maxValues[containers.data('type')].texture + "</p>")
        }
    })
}

MC.Clothing.ResetValues = function() {
    $.each(clothingCategorys, function(i, cat) {
        let itemCats = $(".clothing-menu-container").find('[data-type="' + i + '"]');
        let input = $(itemCats).find('input[data-type="item"]');
        let texture = $(itemCats).find('input[data-type="texture"]');

        $(input).val(cat.defaultItem);
        $(texture).val(cat.defaultTexture);
    })
}

// Listener
let ScreenPosition = null;
let mousePos;
let ScrollTimeout = false;
let mouseIsDown = false;

let direction = "", oldx = 0

// Essential Functions
function getMouseWheelDirection(e) {
    let delta = null, direction = false;
    if (!e) { e = window.event; }
    if ( e.wheelDelta ) {
        delta = e.wheelDelta / 60;
    } else if ( e.detail ) {
        delta = -e.detail / 2;
    }
    if (delta !== null) {
        direction = delta > 0 ? 'up' : 'down';
    }
    return direction;
}

function getMouseMovement(e) {
    if (mouseIsDown) {
        if(e.clientY <= 50 || e.clientX <= 50 || (e.clientX >= window.innerWidth || e.clientY >= window.innerHeight)) {
            mouseIsDown = false;
        }
        if (e.pageX < oldx) {
            $.post(`https://${GetParentResourceName()}/rotatePedLeft`);
        } else if (e.pageX > oldx) {
            $.post(`https://${GetParentResourceName()}/rotatePedRight`);
        }    
        oldx = e.pageX;
    }
}

$(document).ready(function() {
    // Character Zoom
    document.onmousewheel = function(e) {
        let Direction = getMouseWheelDirection(e);
        if (Direction) {
            if (Direction == "up") {
                if ($('#rotate-box').is(":hover")) {
                    $.post(`https://${GetParentResourceName()}/zoomIn`, JSON.stringify({
                        position: ScreenPosition
                    }));
                }
            } else if (Direction == "down") {
                if ($('#rotate-box').is(":hover")) {
                    $.post(`https://${GetParentResourceName()}/zoomOut`, JSON.stringify({
                        position: ScreenPosition
                    }));
                }
            }
        }
    };

    $('.clothing-character-rotate').on('mouseleave', (e) => {
        mouseIsDown = false;
    });

    $('.clothing-character-rotate').on('mousedown', (e) => {
        mouseIsDown = true;
    });

    $('.clothing-character-rotate').on('mouseup', (e) => {
        mouseIsDown = false;
    });

    $('.clothing-character-rotate').on('mousemove', getMouseMovement);

    document.onmousemove = handleMouseMove;
    setInterval(getMousePosition, 100); // setInterval repeats every X ms

    function handleMouseMove(event) {
        let eventDoc, doc, body;
        event = event || window.event; // IE-ism
        if (event.pageX == null && event.clientX != null) {
            eventDoc = (event.target && event.target.ownerDocument) || document;
            doc = eventDoc.documentElement;
            body = eventDoc.body;

            event.pageX = event.clientX +
              (doc && doc.scrollLeft || body && body.scrollLeft || 0) -
              (doc && doc.clientLeft || body && body.clientLeft || 0);
            event.pageY = event.clientY +
              (doc && doc.scrollTop  || body && body.scrollTop  || 0) -
              (doc && doc.clientTop  || body && body.clientTop  || 0 );
        }
        mousePos = {
            x: event.pageX,
            y: event.pageY
        };
    }

    function getMousePosition() {
        var pos = mousePos;
        if (!pos) { return;}
        else {
            if (pos.y > 0 && pos.y < 400) {
                ScreenPosition = "top";
            } else if (pos.y > 400 && pos.y < 700) {
                ScreenPosition = "middle";
            } else if (pos.y > 700 && pos.y < 1000) {
                ScreenPosition = "bottom";
            }
        }
    }

    window.addEventListener('message', function(event) {
        switch (event.data.action) {
            case "Open":
                MC.Clothing.Open(event.data);
                break;
            case "Close":
                MC.Clothing.Close();
                break;
            case "updateMax":
                MC.Clothing.SetMaxValues(event.data.maxValues);
                break;
            case "toggleChange":
                MC.Clothing.ToggleChange(event.data.allow);
                break;
            case "ResetValues":
                MC.Clothing.ResetValues();
                break;
        }
    })
});

$(document).on('keydown', function(e) {
    switch (e.keyCode) {
        case 38: // UP
            ChangeUp();
            break;
        case 40: // DOWN
            ChangeDown();
            break;
    }
    switch (e.key) {
        case "Escape":
            if (!$('.clothing-confirm-screen').is(':visible')) {
                $('.clothing-confirm-screen').fadeIn(450);
            } else {
                $('.clothing-confirm-screen').hide();
                MC.Clothing.Close();
                $.post(`https://${GetParentResourceName()}/resetOutfit`);    
            }
            break;
    }
});
