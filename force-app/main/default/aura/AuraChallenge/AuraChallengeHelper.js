({
    helperReceiveEvent : function(component, event) {
        var valueFromChild = event.getParam("message");
        component.set("v.retrievedValue", valueFromChild);
    },
    receiveClearText : function(component, event){
        var valueFromChild = event.getParam("message");
        component.set("v.retrievedValue", valueFromChild);
    }
})