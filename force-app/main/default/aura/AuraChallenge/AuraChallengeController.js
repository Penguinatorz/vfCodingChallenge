({
    receiveEvent : function(component, event, helper) {
        helper.helperReceiveEvent(component, event);
    },
    clearText : function(component, event, helper){
        var childCmp = component.find("childComp")
        childCmp.removeParentText();
    },
    receiveClearText : function(component, event, helper){
        helper.helperReceiveEvent(component, event);
    }
})