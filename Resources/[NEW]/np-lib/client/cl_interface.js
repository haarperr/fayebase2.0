const regged = [];

function RegisterInterfaceCallback(name, cb) {
    AddEventHandler(`_vpx_uiReq:${name}`, cb);

    if (GetResourceState('np-interface') === 'started') exports['np-interface'].RegisterIntefaceEvent(name);

    regged.push(name);
}

function SendInterfaceMessage(data) {
    exports['np-interface'].SendInterfaceMessage(data);
}

function SetInterfaceFocus(hasFocus, hasCursor) {
    exports['np-interface'].SetInterfaceFocus(hasFocus, hasCursor);
}

function GetInterfaceFocus() {
    return exports['np-interface'].GetInterfaceFocus();
}

AddEventHandler('_vpx_uiReady', () => {
    regged.forEach((eventName) => exports['np-interface'].RegisterIntefaceEvent(eventName));
});