QBClothing = {}

var selected = ".character"
var lastCategory = "character"
var selectedCam = null;
var hasTracker = false;
var canChange = true;

var clothingCategorys = [];

$(document).on('click', '.clothing-menu', function (e) {
    var category = $(this).data('category');
    $(selected).removeClass("selected");
    $(this).addClass("selected");
    $(".clothing-menu-" + lastCategory + "-container").css({ "display": "none" });
    lastCategory = category;
    selected = this;

    $(".clothing-menu-" + category + "-container").css({ "display": "block" });
})

QBClothing.ResetItemTexture = function (obj, category) {
    var itemTexture = $(obj).parent().parent().find('[data-type="texture"]');
    var defaultTextureValue = clothingCategorys[category].defaultTexture;
    $(itemTexture).val(defaultTextureValue);

    $.post('https://qb-clothing/updateSkin', JSON.stringify({
        clothingType: category,
        articleNumber: defaultTextureValue,
        type: "texture",
    }));
}
QBClothing.CheckFilter = function(gender, BlackList) {
    $(document).off('click', '.clothing-menu-option-item-right'); // حذف event handler قبلی
    $(document).on('click', '.clothing-menu-option-item-right', function(e) {
        e.preventDefault();

        var clothingCategory = $(this).parent().parent().data('type');
        // console.log("clothingcatgory : " + clothingCategory);
        var buttonType = $(this).data('type');
        var buttonType2 = $(this).data('type');

        var inputElem = $(this).parent().find('input');
        var inputElemTexture = $(this).parent().find('input');
        var buttonMax = $(this).parent().find('[data-headertype="item-header"]').data('maxItem');
        var buttonMaxTexure = $(this).parent().find('[data-headertype="texture-header"]').data('maxTexture');
        var inputVal = parseInt($(inputElem).val());
        var inputVal2 = parseInt($(inputElemTexture).val());
        // console.log("inputElemTexture : " + JSON.stringify(inputElemTexture));
       // console.log("inputVal : " + inputVal);
        //console.log("inputVal2 : " + inputVal2);
        //console.log("buttonMaxTexure : " + buttonMaxTexure)
        // مانیتور کردن تغییرات در data-headertype
        // var elements = document.querySelectorAll('[data-headertype]');
        // elements.forEach(function(element) {
        //     var observer = new MutationObserver(function(mutations) {
        //         mutations.forEach(function(mutation) {
        //             if (mutation.type === 'attributes' && mutation.attributeName === 'data-headertype') {
        //                 console.log('data-headertype changed to:', element.getAttribute('data-headertype'));
        //             }
        //         });
        //     });
        //     observer.observe(element, { attributes: true });
        // });

        var newValue = inputVal;
        var newValuee = inputVal2;

        for (let [key, value] of Object.entries(BlackList)) {
            if (value.category == clothingCategory) {
                let blacknumber = value.items;
                let found = false;
                for (let i = inputVal + 1; i <= buttonMax; i++) {
                    if (!blacknumber.includes(i)) {
                    //    console.log("check value right: " + i);
                        newValue = i;
                        found = true;
                        break;
                    }
                }
                if (found) break;
            }
        }
        for (let [key2, value2] of Object.entries(BlackList)) {
            if (value2.category == clothingCategory) {
                let blacknumber = value2.items;
                let found = false;
                for (let i = inputVal2 + 1; i <= buttonMaxTexure; i++) {
                    if (!blacknumber.includes(i)) {
                        //console.log("check value2 right: " + i);
                        newValuee = i;
                        found = true;
                        break;
                    }
                }
                if (found) break;
            }
        }


        $(inputElem).val(newValue);
        $(inputElemTexture).val(newValuee);

        if (canChange) {
            if (hasTracker && clothingCategory == "accessory") {
                $.post('https://qb-clothing/TrackerError');
                return;
            } else {
                if (clothingCategory == "model") {
                    $.post('https://qb-clothing/setCurrentPed', JSON.stringify({ ped: newValue }), function(model) {
                        $("#current-model").html("<p>" + model + "</p>")
                    });
                    canChange = true;
                    // QBClothing.ResetValues();
                // } else if (clothingCategory == "hair") {
                //     console.log("newValue Hair : " + newValue)
                //     $.post('https://qb-clothing/updateSkin', JSON.stringify({
                //         clothingType: clothingCategory,
                //         articleNumber: newValue,
                //         type: buttonType,
                //     }));
                //     if (buttonType == "item") {
                //         QBClothing.ResetItemTexture(this, clothingCategory);
                //     }
                } else {
                    if (buttonType == "item") {
                        var buttonMax = $(this).parent().find('[data-headertype="item-header"]').data('maxItem');
                        if (clothingCategory == "accessory" && newValue == 13) {
                            $(inputElem).val(14);
                            $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: 14,
                                type: buttonType,
                            }));
                        } else {
                            if (newValue <= parseInt(buttonMax)) {
                                $(inputElem).val(newValue);
                                $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                    clothingType: clothingCategory,
                                    articleNumber: newValue,
                                    type: buttonType,
                                }));
                            }
                        }
                        QBClothing.ResetItemTexture(this, clothingCategory);
                    } else {
                        var buttonMaxTexure = $(this).parent().find('[data-headertype="texture-header"]').data('maxTexture');
                        if (newValuee <= parseInt(buttonMaxTexure)) {
                            //console.log("newValuee : " + newValuee);
                            $(inputElemTexture).val(newValuee);
                            $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: newValuee,
                                type: buttonType2,
                            }));
                        }
                    }
                }
            }
        }
    });
}

// QBClothing.CheckFilter = function(gender, BlackList) {
//     $(document).off('click', '.clothing-menu-option-item-right'); // حذف event handler قبلی
//     $(document).on('click', '.clothing-menu-option-item-right', function(e) {
//         e.preventDefault();

//         var clothingCategory = $(this).parent().parent().data('type');
//         console.log("clothingcatgory : " + clothingCategory)
//         var buttonType = $(this).data('type');
//         var inputElem = $(this).parent().find('input');
//         var buttonMax = $(this).parent().find('[data-headertype="item-header"]').data('maxItem');
//         var inputVal = parseInt($(inputElem).val());

//         console.log("inputVal : " + inputVal);

//         var newValue = inputVal;
//         for (let [key, value] of Object.entries(BlackList)) {
//             if (value.category === clothingCategory) {
//                 let blacknumber = value.items;
//                 let found = false;
//                 for (let i = inputVal + 1; i <= buttonMax; i++) {
//                     if (!blacknumber.includes(i)) {
//                         console.log("check value right: " + i);
//                         newValue = i;
//                         found = true;
//                         break;
//                     }
//                 }
//                 if (found) break;
//             }
//         }

//         $(inputElem).val(newValue);

//         // The rest of your code that updates the clothing item
//         if (canChange) {
//             if (hasTracker && clothingCategory == "accessory") {
//                 $.post('https://qb-clothing/TrackerError');
//                 return;
//             } else {
//                 if (clothingCategory == "model") {
//                     $.post('https://qb-clothing/setCurrentPed', JSON.stringify({ ped: newValue }), function(model) {
//                         $("#current-model").html("<p>" + model + "</p>")
//                     });
//                     canChange = true;
//                     QBClothing.ResetValues();
//                 } else if (clothingCategory == "hair") {
//                     $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                         clothingType: clothingCategory,
//                         articleNumber: newValue,
//                         type: buttonType,
//                     }));
//                     if (buttonType == "item") {
//                         QBClothing.ResetItemTexture(this, clothingCategory);
//                     }
//                 } else {
//                     if (buttonType == "item") {
//                         var buttonMax = $(this).parent().find('[data-headertype="item-header"]').data('maxItem');
//                         if (clothingCategory == "accessory" && newValue == 13) {
//                             $(inputElem).val(14);
//                             $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                                 clothingType: clothingCategory,
//                                 articleNumber: 14,
//                                 type: buttonType,
//                             }));
//                         } else {
//                             if (newValue <= parseInt(buttonMax)) {
//                                 $(inputElem).val(newValue);
//                                 $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                                     clothingType: clothingCategory,
//                                     articleNumber: newValue,
//                                     type: buttonType,
//                                 }));
//                             }
//                         }
//                         QBClothing.ResetItemTexture(this, clothingCategory);
//                     } else {
//                         var buttonMax = $(this).parent().find('[data-headertype="texture-header"]').data('maxTexture');
//                         if (newValue <= parseInt(buttonMax)) {
//                             $(inputElem).val(newValue);
//                             $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                                 clothingType: clothingCategory,
//                                 articleNumber: newValue,
//                                 type: buttonType,
//                             }));
//                         }
//                     }
//                 }
//             }
//         }
//     });
// }

// $(document).on('click', '.clothing-menu-option-item-right', function (e) { ///// in item icon right miyad 1 add be value lebas ezafe mikone
//     e.preventDefault();  ///// (sarenakh)
//     // console.log("type e : " + typeof(e))

//     var clothingCategory = $(this).parent().parent().data('type'); //// no e lebas ro migire 
//     var buttonType = $(this).data('type');
//     var inputElem = $(this).parent().find('input');
//     var inputVal = $(inputElem).val();
//     // console.log("inputVal right button : " + inputVal) //noope
//     var newValue = parseFloat(inputVal) + 1;
//     console.log("newValue right button : " + newValue) //noope

//     if (canChange) {
//         if (hasTracker && clothingCategory == "accessory") {
//             $.post('https://qb-clothing/TrackerError');
//             return
//         } else {
//             if (clothingCategory == "model") {
//                 $(inputElem).val(newValue);
//                 $.post('https://qb-clothing/setCurrentPed', JSON.stringify({ ped: newValue }), function (model) {
//                     $("#current-model").html("<p>" + model + "</p>")
//                 });
//                 canChange = true;
//                 QBClothing.ResetValues()   //// 
//             } else if (clothingCategory == "hair") {
//                 $(inputElem).val(newValue);
//                 $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                     clothingType: clothingCategory,
//                     articleNumber: newValue,
//                     type: buttonType,
//                 }));
//                 if (buttonType == "item") {
//                     QBClothing.ResetItemTexture(this, clothingCategory);
//                 }
//             } else {
//                 if (buttonType == "item") {
//                     var buttonMax = $(this).parent().find('[data-headertype="item-header"]').data('maxItem');
//                     if (clothingCategory == "accessory" && newValue == 13) {
//                         $(inputElem).val(14);
//                         $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                             clothingType: clothingCategory,
//                             articleNumber: 14,
//                             type: buttonType,
//                         }));
//                     } else {
//                         if (newValue <= parseInt(buttonMax)) {
//                             $(inputElem).val(newValue);
//                             $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                                 clothingType: clothingCategory,
//                                 articleNumber: newValue,
//                                 type: buttonType,
//                             }));
//                         }
//                     }
//                     QBClothing.ResetItemTexture(this, clothingCategory);
//                 } else {
//                     var buttonMax = $(this).parent().find('[data-headertype="texture-header"]').data('maxTexture');
//                     if (newValue <= parseInt(buttonMax)) {
//                         $(inputElem).val(newValue);
//                         $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                             clothingType: clothingCategory,
//                             articleNumber: newValue,
//                             type: buttonType,
//                         }));
//                     }
//                 }
//             }
//         }
//     }
// });
QBClothing.CheckFilter2 = function(gender,BlackList){ /// (sarenakh) (nokte amozeshi) (moheeem)
    $(document).off('click', '.clothing-menu-option-item-left'); // حذف event handler قبلی
    $(document).on('click', '.clothing-menu-option-item-left', function (e) { ///// in item icon right miyad 1  be value lebas kam mikone
        e.preventDefault();             ///// (sarenakh)
    
        var newValue
        var clothingCategory = $(this).parent().parent().data('type'); //// no e lebas ro migire (torso2)
        var buttonType = $(this).data('type');
        var buttonType2 = $(this).data('type');

        var inputElem = $(this).parent().find('input');
        var inputElemTexture = $(this).parent().find('input');
        var buttonMax = $(this).parent().find('[data-headertype="item-header"]').data('maxItem');
        var buttonMaxTexure = $(this).parent().find('[data-headertype="texture-header"]').data('maxTexture');
        var inputVal = parseInt($(inputElem).val());
        var inputVal2 = parseInt($(inputElemTexture).val());
        var startValue = parseInt(inputVal);
        var newValue = inputVal;
        var newValuee = inputVal2;
        for (let [key, value] of Object.entries(BlackList)) {
            if (value.category === clothingCategory) {
                let blacknumber = value.items;
                let found = false; // Flag to indicate if a suitable value is found
                for (let i = startValue - 1; i <= buttonMax; i--) {
                    if (blacknumber.includes(i) == false) {
                        // console.log("check value left : " + i);
                        newValue = i;
                        found = true; // Set the flag to true
                        break;
                    }
                }
                if (found) break; // Exit the outer loop if a suitable value is found
            }
        }
        for (let [key2, value2] of Object.entries(BlackList)) {
            if (value2.category === clothingCategory) {
                let blacknumber = value2.items;
                let found = false;
                for (let i = inputVal2 - 1; i <= buttonMaxTexure; i--) {
                    if (blacknumber.includes(i) == false) {
                        // console.log("check value2 right: " + i);
                        newValuee = i;
                        found = true;
                        break;
                    }
                }
                if (found) break;
            }
        }
        $(inputElem).val(newValue);
        $(inputElemTexture).val(newValuee);
        if (canChange) {
            if (hasTracker && clothingCategory == "accessory") {
                $.post('https://qb-clothing/TrackerError');
                return
            } else {
                if (clothingCategory == "model") {
                    if (newValue != 0) {
                        $(inputElem).val(newValue);
                        $.post('https://qb-clothing/setCurrentPed', JSON.stringify({ ped: newValue }), function (model) {
                            $("#current-model").html("<p>" + model + "</p>")
                        });
                        canChange = true;
                        QBClothing.ResetValues();
                    }
                } else {
                    if (buttonType == "item") {
                        if (newValue >= clothingCategorys[clothingCategory].defaultItem) {
                            if (clothingCategory == "accessory" && newValue == 13) {
                                $(inputElem).val(12);
                                $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                    clothingType: clothingCategory,
                                    articleNumber: 12,
                                    type: buttonType,
                                }));
                            } else {
                                $(inputElem).val(newValue);
                                $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                    clothingType: clothingCategory,
                                    articleNumber: newValue,
                                    type: buttonType,
                                }));
                            }
                        }
                        QBClothing.ResetItemTexture(this, clothingCategory);
                    } else {
                        if (newValue >= clothingCategorys[clothingCategory].defaultTexture) {
                            if (clothingCategory == "accessory" && newValue == 13) {
                                $(inputElem).val(12);
                                $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                    clothingType: clothingCategory,
                                    articleNumber: 12,
                                    type: buttonType,
                                }));
                            } else {
                                $(inputElemTexture).val(newValuee);
                                $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                    clothingType: clothingCategory,
                                    articleNumber: newValuee,
                                    type: buttonType2,
                                }));
                            }
                        }
                    }
                }
            }
        }
    });    
}

///var buttonMaxTexure = $(this).parent().find('[data-headertype="texture-header"]').data('maxTexture');
// if (newValuee <= parseInt(buttonMaxTexure)) {
//     console.log("newValuee : " + newValuee);
//     $(inputElemTexture).val(newValuee);
//     $.post('https://qb-clothing/updateSkin', JSON.stringify({
//         clothingType: clothingCategory,
//         articleNumber: newValuee,
//         type: buttonType2,
//     }));
// }
// $(document).on('click', '.clothing-menu-option-item-left', function (e) { ///// in item icon right miyad 1  be value lebas kam mikone
//     e.preventDefault();             ///// (sarenakh)

//     var clothingCategory = $(this).parent().parent().data('type');
//     var buttonType = $(this).data('type');
//     var inputElem = $(this).parent().find('input');
//     var inputVal = $(inputElem).val();
//     // console.log("inputVal left button : " + inputVal) // noooop
//     var newValue = parseFloat(inputVal) - 1;
//     console.log("newValue left button : " + newValue) // noooop
//     if (canChange) {
//         if (hasTracker && clothingCategory == "accessory") {
//             $.post('https://qb-clothing/TrackerError');
//             return
//         } else {
//             if (clothingCategory == "model") {
//                 if (newValue != 0) {
//                     $(inputElem).val(newValue);
//                     $.post('https://qb-clothing/setCurrentPed', JSON.stringify({ ped: newValue }), function (model) {
//                         $("#current-model").html("<p>" + model + "</p>")
//                     });
//                     canChange = true;
//                     QBClothing.ResetValues();
//                 }
//             } else {
//                 if (buttonType == "item") {
//                     if (newValue >= clothingCategorys[clothingCategory].defaultItem) {
//                         if (clothingCategory == "accessory" && newValue == 13) {
//                             $(inputElem).val(12);
//                             $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                                 clothingType: clothingCategory,
//                                 articleNumber: 12,
//                                 type: buttonType,
//                             }));
//                         } else {
//                             $(inputElem).val(newValue);
//                             $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                                 clothingType: clothingCategory,
//                                 articleNumber: newValue,
//                                 type: buttonType,
//                             }));
//                         }
//                     }
//                     QBClothing.ResetItemTexture(this, clothingCategory);
//                 } else {
//                     if (newValue >= clothingCategorys[clothingCategory].defaultTexture) {
//                         if (clothingCategory == "accessory" && newValue == 13) {
//                             $(inputElem).val(12);
//                             $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                                 clothingType: clothingCategory,
//                                 articleNumber: 12,
//                                 type: buttonType,
//                             }));
//                         } else {
//                             $(inputElem).val(newValue);
//                             $.post('https://qb-clothing/updateSkin', JSON.stringify({
//                                 clothingType: clothingCategory,
//                                 articleNumber: newValue,
//                                 type: buttonType,
//                             }));
//                         }
//                     }
//                 }
//             }
//         }
//     }
// });

$(document).on('input', '.clothing-menu-option-item-slider', function (e) { ///// (sarenakh)

    var clothingCategory = $(this).parent().parent().data('type');
    var buttonType = $(this).data('type');
    var inputElem = $(this).parent().find('input');
    var inputVal = $(inputElem).val();
    //console.log("inputVal 2 : " + inputVal)
    var newValue = parseFloat(inputVal);

    if (canChange) {
        if (hasTracker && clothingCategory == "accessory") {
            $.post('https://qb-clothing/TrackerError');
            return
        } else {
            if (clothingCategory == "model") {
                if (newValue != 0) {
                    $(inputElem).val(newValue);
                    $.post('https://qb-clothing/setCurrentPed', JSON.stringify({ ped: newValue }), function (model) {
                        $("#current-model").html("<p>" + model + "</p>")
                    });
                    canChange = true;
                    QBClothing.ResetValues();
                }
            } else {
                if (buttonType == "item") {
                    if (newValue >= clothingCategorys[clothingCategory].defaultItem) {
                        if (clothingCategory == "accessory" && newValue == 13) {
                            $(inputElem).val(12);
                            $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: 12,
                                type: buttonType,
                            }));
                        } else {
                            $(inputElem).val(newValue);
                            $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: newValue,
                                type: buttonType,
                            }));
                        }
                    }
                    QBClothing.ResetItemTexture(this, clothingCategory);
                } else {
                    if (newValue >= clothingCategorys[clothingCategory].defaultTexture) {
                        if (clothingCategory == "accessory" && newValue == 13) {
                            $(inputElem).val(12);
                            $.post('https://qb-clothing/updateSkin', JSON.stringify({
                                clothingType: clothingCategory,
                                articleNumber: 12,
                                type: buttonType,
                            }));
                        } else {
                            $(inputElemTexture).val(newValuee);
                            $.post('https://qb-clothing/updateSkin', JSON.stringify({
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

var changingCat = null;

function ChangeUp() {
    var clothingCategory = $(changingCat).parent().parent().data('type');
    var buttonType = $(changingCat).data('type');
    var inputVal = parseFloat($(changingCat).val());

    if (clothingCategory == "accessory" && inputVal + 1 == 13) {
        $(changingCat).val(14 - 1)
    }
}

function ChangeDown() {
    var clothingCategory = $(changingCat).parent().parent().data('type');
    var buttonType = $(changingCat).data('type');
    var inputVal = parseFloat($(changingCat).val());


    if (clothingCategory == "accessory" && inputVal - 1 == 13) {
        $(changingCat).val(12 + 1)
    }
}
/// 
// $(document).on('change', '.item-number', function() {
//     var clothingCategory = $(this).parent().parent().data('type');
//     var buttonType = $(this).data('type');
//     var inputVal = $(this).val();
//     console.log("inputval : " + inputVal)
//     changingCat = this;

//     var blacknumber = new Set([3, 4, 7, 10]); // لیست بلک نامبرها

//     if (hasTracker && clothingCategory == "accessory") {
//         $.post('https://qb-clothing/TrackerError');
//         $(this).val(13);
//         return;
//     } else {
//         if (clothingCategory == "accessory" && inputVal == 13) {
//             $(this).val(12);
//             return;
//         } else {
//             if (blacknumber.has(parseInt(inputVal))) {
//                 // نمایش نوتیفیکیشن
//                 $('#notification').fadeIn().delay(4000).fadeOut();
//                 $(this).val(''); // مقدار ورودی را پاک می‌کند یا می‌توانید به مقدار قبلی برگردانید
//             } else {
//                 $.post('https://qb-clothing/updateSkinOnInput', JSON.stringify({
//                     clothingType: clothingCategory,
//                     articleNumber: parseFloat(inputVal),
//                     type: buttonType,
//                 }));
//             }
//         }
//     }
// });
QBClothing.CheckFilterinput = function(gender, BlackList) {
    $(document).on('change', '.item-number', function() {
        var clothingCategory = $(this).parent().parent().data('type');
        var buttonType = $(this).data('type');
        var inputVal = $(this).val();
        console.log("inputval : " + inputVal);
        changingCat = this;

        // جستجوی آیتم‌ها و مقادیر بلک لیست بر اساس دسته‌بندی لباس
        var blacknumber = new Set();
        for (let [key, value] of Object.entries(BlackList)) {
            if (value.category == clothingCategory) {
                blacknumber = new Set(value.items);
                break;
            }
        }

        if (hasTracker && clothingCategory == "accessory") {
            $.post('https://qb-clothing/TrackerError');
            $(this).val(13);
            return;
        } else {
            if (clothingCategory == "accessory" && inputVal == 13) {
                $(this).val(12);
                return;
            } else {
                if (blacknumber.has(parseInt(inputVal))) {
                    // نمایش نوتیفیکیشن اگر عدد در بلک لیست بود
                    $('#notification').text('Sorry this Clothes is blacklist!').fadeIn().delay(4000).fadeOut();
                    $(this).val(''); // مقدار ورودی را پاک می‌کند یا می‌توانید به مقدار قبلی برگردانید
                } else {
                    $.post('https://qb-clothing/updateSkinOnInput', JSON.stringify({
                        clothingType: clothingCategory,
                        articleNumber: parseFloat(inputVal),
                        type: buttonType,
                    }));
                }
            }
        }
    });
}

$(document).on('click', '.clothing-menu-header-camera-btn', function (e) {
    e.preventDefault();

    var camValue = parseFloat($(this).data('value'));

    if (selectedCam == null) {
        $(this).addClass("selected-cam");
        $.post('https://qb-clothing/setupCam', JSON.stringify({
            value: camValue
        }));
        selectedCam = this;
    } else {
        if (selectedCam == this) {
            $(selectedCam).removeClass("selected-cam");
            $.post('https://qb-clothing/setupCam', JSON.stringify({
                value: 0
            }));

            selectedCam = null;
        } else {
            $(selectedCam).removeClass("selected-cam");
            $(this).addClass("selected-cam");
            $.post('https://qb-clothing/setupCam', JSON.stringify({
                value: camValue
            }));

            selectedCam = this;
        }
    }
});

$(document).on('keydown', function () {
    switch (event.keyCode) {
        case 68: // D
            $.post('https://qb-clothing/rotateRight');
            break;
        case 65: // A
            $.post('https://qb-clothing/rotateLeft');
            break;
        case 38: // UP
            ChangeUp();
            break;
        case 40: // DOWN
            ChangeDown();
            break;
    }
});

QBClothing.ToggleChange = function (bool) {
    canChange = bool;
}

$(document).ready(function () {        ////// in dade hast ke dare ersal mikone
    window.addEventListener('message', function (event) {
        switch (event.data.action) {
            case "open":
                QBClothing.Open(event.data);
                break;
            case "close":
                QBClothing.Close();
                break;
            case "updateMax":
                QBClothing.SetMaxValues(event.data.maxValues);
                break;
            case "reloadMyOutfits":
                QBClothing.ReloadOutfits(event.data.outfits);
                break;
            case "toggleChange":
                QBClothing.ToggleChange(event.data.allow);
                break;
            case "ResetValues":
                QBClothing.ResetValues();
                break;
        }
    })
});

QBClothing.ReloadOutfits = function (outfits) {
    $(".clothing-menu-myOutfits-container").html("");
    $.each(outfits, function (index, outfit) {
        var elem = '<div class="clothing-menu-option" data-myOutfit="' + (index + 1) + '"> <div class="clothing-menu-option-header"><p>' + outfit.outfitname + '</p></div><div class="clothing-menu-myOutfit-option-button"><p>Select</p></div><div class="clothing-menu-myOutfit-option-button-remove"><p>Delete</p></div></div>'
        $(".clothing-menu-myOutfits-container").append(elem)

        $("[data-myOutfit='" + (index + 1) + "']").data('myOutfitData', outfit)
    });
}

$(document).on('click', "#save-menu", function (e) {
    e.preventDefault();
    QBClothing.Close();
    $.post('https://qb-clothing/saveClothing');
});

$(document).on('click', "#cancel-menu", function (e) {
    e.preventDefault();
    QBClothing.Close();
    $.post('https://qb-clothing/resetOutfit');
});

QBClothing.SetCurrentValues = function (clothingValues) { /// (sarenakh)
    $.each(clothingValues, function (i, item) {
        var itemCats = $(".clothing-menu-container").find('[data-type="' + i + '"]');

        if (i == "facemix") { //Added for special case with range sliders
            $('#shapeMix').val(item.shapeMix);
            $('#skinMix').val(item.skinMix);
        } else {
            var input = $(itemCats).find('input[data-type="item"]');
            var texture = $(itemCats).find('input[data-type="texture"]');

            $(input).val(item.item);
            $(texture).val(item.texture);
        }
    });
}
// QBClothing.CheckFilter = function(gender){ /// (sarenakh)
//     console.log("gender : " + gender)
// }

QBClothing.Open = function (data) {
    clothingCategorys = data.currentClothing;

    if (data.hasTracker) {
        hasTracker = true;
    } else {
        hasTracker = false;
    }
    QBClothing.CheckFilter(data.Gender,data.List_BlackList)
    QBClothing.CheckFilter2(data.Gender,data.List_BlackList)
    QBClothing.CheckFilterinput(data.Gender,data.List_BlackList)

    $(".change-camera-buttons").fadeIn(150);
    $('#show-bg').css('display', 'radial-gradient(closest-side, rgba(63, 135, 166, 0), rgba(0, 0, 0, 0), rgb(0 0 0 / 53%))')
    $('.bg-image').css('display', 'block')
    $('.sidebar-new').css('display', 'block')
    $('.clothing-menu-option-buttons').css('display', 'block')
    $(".clothing-menu-roomOutfits-container").css("display", "none");
    $(".clothing-menu-myOutfits-container").css("display", "none");
    $(".clothing-menu-character-container").css("display", "none");
    $(".clothing-menu-clothing-container").css("display", "none");
    $(".clothing-menu-accessoires-container").css("display", "none");
    $(".clothing-menu-container").css({ "display": "block" }).animate({ left: '12.9vh', }, 200);
    QBClothing.SetMaxValues(data.maxValues);
    $(".clothing-menu-new").html("");
    QBClothing.SetCurrentValues(data.currentClothing);
    $(".clothing-menu-roomOutfits-container").html("");
    $(".clothing-menu-myOutfits-container").html("");
    $.each(data.menus, function (i, menu) {
        if (menu.selected) {
            $(".clothing-menu-new").append(`'<div class="clothing-menu ${menu.menu} selected" data-category="${menu.menu}">${menu.menu == 'myOutfits' ? '<i class="fa fa-male" aria-hidden="true"></i>' : ''}${menu.menu == 'clothing' ? '<i class="fa fa-tshirt" aria-hidden="true"></i>' : ''}${menu.menu == 'character' ? '<i class="fa fa-male" aria-hidden="true"></i>' : ''}${menu.menu == 'accessoires' ? '<i class="fa fa-headphones" aria-hidden="true"></i>' : ''}${menu.menu == 'roomOutfits' ? '<i class="fa fa-universal-access" aria-hidden="true"></i>' : ''}</div>`)
            $(".clothing-menu-" + menu.menu + "-container").css({ "display": "block" });

            if (menu.label == "Clothing") {
                $("#faceoption").css("display", "none");
                $('div[data-type="face"]').css("display", "none");
                $('div[data-type="face2"]').css("display", "none");
                $('div[data-type="facemix"]').css("display", "none");
                $('div[data-type="model"]').css("display", "none");
            } else {
                $("#faceoption").css("display", "block");
            }

            selected = "." + menu.menu + "";
            lastCategory = menu.menu;

        } else {
            $(".clothing-menu-new").append(`'<div class="clothing-menu ${menu.menu}" data-category="${menu.menu}">${menu.menu == 'myOutfits' ? '<i class="fa fa-male" aria-hidden="true"></i>' : ''}${menu.menu == 'clothing' ? '<i class="fa fa-tshirt" aria-hidden="true"></i>' : ''}${menu.menu == 'character' ? '<i class="fa fa-male" aria-hidden="true"></i>' : ''}${menu.menu == 'accessoires' ? '<i class="fa fa-headphones" aria-hidden="true"></i>' : ''}${menu.menu == 'roomOutfits' ? '<i class="fa fa-universal-access" aria-hidden="true"></i>' : ''}</div>`)
        }

        if (menu.menu == "roomOutfits") {
            $.each(menu.outfits, function (index, outfit) {
                var elem = '<div class="clothing-menu-option" data-outfit="' + (index + 1) + '"> <div class="clothing-menu-option-header"><p>' + outfit.outfitLabel + '</p></div> <div class="clothing-menu-outfit-option-button"><p>Select Outfit</p></div> </div>'
                $(".clothing-menu-roomOutfits-container").append(elem)

                $("[data-outfit='" + (index + 1) + "']").data('outfitData', outfit)
            });
        }

        if (menu.menu == "myOutfits") {
            $.each(menu.outfits, function (index, outfit) {
                var elem = '<div class="clothing-menu-option" data-myOutfit="' + (index + 1) + '"> <div class="clothing-menu-option-header"><p>' + outfit.outfitname + '</p></div><div class="clothing-menu-myOutfit-option-button"><p>Select</p></div><div class="clothing-menu-myOutfit-option-button-remove"><p>Delete</p></div></div>'
                $(".clothing-menu-myOutfits-container").append(elem)

                $("[data-myOutfit='" + (index + 1) + "']").data('myOutfitData', outfit)
            });
        }
    });
}

$(document).on('click', '.clothing-menu-outfit-option-button', function (e) {
    e.preventDefault();

    var oData = $(this).parent().data('outfitData');

    $.post('https://qb-clothing/selectOutfit', JSON.stringify({
        outfitData: oData.outfitData,
        outfitName: oData.outfitLabel
    }))
});

$(document).on('click', '.clothing-menu-myOutfit-option-button', function (e) {
    e.preventDefault();

    var outfitData = $(this).parent().data('myOutfitData');

    $.post('https://qb-clothing/selectOutfit', JSON.stringify({
        outfitData: outfitData.skin,
        outfitName: outfitData.outfitname,
        outfitId: outfitData.outfitId,
    }))
});

$(document).on('click', '.clothing-menu-myOutfit-option-button-remove', function (e) {
    e.preventDefault();

    var outfitData = $(this).parent().data('myOutfitData');

    $.post('https://qb-clothing/removeOutfit', JSON.stringify({
        outfitData: outfitData.skin,
        outfitName: outfitData.outfitname,
        outfitId: outfitData.outfitId,
    }));
});

QBClothing.Close = function () {
    $.post('https://qb-clothing/close');
    $(".change-camera-buttons").fadeOut(150);
    $('body').css('background', 'transparent')
    $('.bg-image').css('display', 'none')
    $('.sidebar-new').css('display', 'none')
    $('.clothing-menu-option-buttons').css('display', 'none')
    $(".clothing-menu-roomOutfits-container").css("display", "none");
    $(".clothing-menu-myOutfits-container").css("display", "none");
    $(".clothing-menu-character-container").css("display", "none");
    $(".clothing-menu-clothing-container").css("display", "none");
    $(".clothing-menu-accessoires-container").css("display", "none");
    $(".clothing-menu-new").html("");

    $(selectedCam).removeClass('selected-cam');
    $(selected).removeClass("selected");
    selectedCam = null;
    selected = null;
    lastCategory = null;
    $(".clothing-menu-container").css({ "display": "block" }).animate({ left: "-500px", }, 200, function () {
        $(".clothing-menu-container").css({ "display": "none" });
    });
}

QBClothing.SetMaxValues = function (maxValues) {
    $.each(maxValues, function (i, cat) {
        if (cat.type == "character") {
            var containers = $(".clothing-menu-character-container").find('[data-type="' + i + '"]');
            var itemMax = $(containers).find('[data-headertype="item-header"]');
            var headerMax = $(containers).find('[data-headertype="texture-header"]');

            $(itemMax).data('maxItem', maxValues[containers.data('type')].item)
            $(headerMax).data('maxTexture', maxValues[containers.data('type')].texture)

            $(itemMax).html("<p>Item: " + maxValues[containers.data('type')].item + "</p>")
            $(headerMax).html("<p>Texture: " + maxValues[containers.data('type')].texture + "</p>")
        } else if (cat.type == "hair") {
            var containers = $(".clothing-menu-clothing-container").find('[data-type="' + i + '"]');
            var itemMax = $(containers).find('[data-headertype="item-header"]');
            var headerMax = $(containers).find('[data-headertype="texture-header"]');

            $(itemMax).data('maxItem', maxValues[containers.data('type')].item)
            $(headerMax).data('maxTexture', maxValues[containers.data('type')].texture)

            $(itemMax).html("<p>Item: " + maxValues[containers.data('type')].item + "</p>")
            $(headerMax).html("<p>Texture: " + maxValues[containers.data('type')].texture + "</p>")
        } else if (cat.type == "accessoires") {
            var containers = $(".clothing-menu-accessoires-container").find('[data-type="' + i + '"]');
            var itemMax = $(containers).find('[data-headertype="item-header"]');
            var headerMax = $(containers).find('[data-headertype="texture-header"]');

            $(itemMax).data('maxItem', maxValues[containers.data('type')].item)
            $(headerMax).data('maxTexture', maxValues[containers.data('type')].texture)

            $(itemMax).html("<p>Item: " + maxValues[containers.data('type')].item + "</p>")
            $(headerMax).html("<p>Texture: " + maxValues[containers.data('type')].texture + "</p>")
        }
    })
}

QBClothing.ResetValues = function () {
    $.each(clothingCategorys, function (i, cat) {
        var itemCats = $(".clothing-menu-container").find('[data-type="' + i + '"]');
        var input = $(itemCats).find('input[data-type="item"]');
        var texture = $(itemCats).find('input[data-type="texture"]');

        $(input).val(cat.defaultItem);
        $(texture).val(cat.defaultTexture);
    })
}

$(document).on('click', '#save-outfit', function (e) {
    e.preventDefault();

    $(".clothing-menu-container").css({ "display": "block" }).animate({ left: "-500px", }, 200, function () {
        $(".clothing-menu-container").css({ "display": "none" });
    });

    $(".clothing-menu-save-outfit-name").fadeIn(150);
});

$(document).on('click', '#save-outfit-save', function (e) {
    e.preventDefault();

    $(".clothing-menu-container").css({ "display": "block" }).animate({ left: '12.9vh', }, 200);
    $(".clothing-menu-save-outfit-name").fadeOut(150);

    $.post('https://qb-clothing/saveOutfit', JSON.stringify({
        outfitName: $("#outfit-name").val()
    }));
});

$(document).on('click', '#cancel-outfit-save', function (e) {
    e.preventDefault();

    $(".clothing-menu-container").css({ "display": "block" }).animate({ left: '12.9vh', }, 200);
    $(".clothing-menu-save-outfit-name").fadeOut(150);
});

$(document).on('click', '.change-camera-button', function (e) {
    e.preventDefault();

    var rotationType = $(this).data('rotation');

    $.post('https://qb-clothing/rotateCam', JSON.stringify({
        type: rotationType
    }))
});

// QBClothing.Open()