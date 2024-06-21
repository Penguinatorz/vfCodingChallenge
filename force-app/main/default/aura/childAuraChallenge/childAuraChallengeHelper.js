({
    handleClickHelper: function(component){
        var compEvent = component.getEvent("challengeComponentEvent");
        compEvent.setParams({
            "message" : component.get("v.enteredText") 
        });
        compEvent.fire();
    },
    handleClearParentText: function(component, event){
        var compEvent = component.getEvent("challengeComponentEvent");
        compEvent.setParams({
            "message" : component.get("")
        });
        compEvent.fire();
    }
})