if(Director.GetGameMode() != "nesrealism") {
    local function init() {
        local ent = Entities.FindByName(null, "nescius_safedoor");
        if(ent) {
            ent.Kill();
        }
        NesciusSafeDoor <- SpawnEntityFromTable("logic_versus_random", {
            targetname = "nescius_safedoor",
            vscripts = "nescius_safedoor",
            OnRandom01 = ""
        }).GetScriptScope().weakref();
    }
    init();
}

//WITCH

printl("Initializing witch low violence fix script");

::NesciusWitchLowViolenceFix <- {
    WitchesPreTransition = []
    BrideWitchesPreTransition = []
    Events = {
        function OnGameEvent_witch_spawn(p) {
            local witch = EntIndexToHScript(p.witchid);

            switch(NetProps.GetPropInt(witch, "m_Gender")) {
                case 2:
                    WitchesPreTransition.append(witch.weakref());
                    break;
                case 19:
                    BrideWitchesPreTransition.append(witch.weakref());
            }

            printl("Changing witch gender to jimmy");
            NetProps.SetPropInt(witch, "m_Gender", 17);

            //in case someone is changing witch model in this event. Setting witch model changes gender
            DoEntFire("!self", "RunScriptCode", "NetProps.SetPropInt(self, \"m_Gender\", 17)", 0.5, null, witch);
        }

        function OnGameEvent_round_end(p) {
            WitchesPreTransition.clear();
            BrideWitchesPreTransition.clear();
        }
    }
}

NesciusWitchLowViolenceFix.Events.setdelegate(NesciusWitchLowViolenceFix);

//sketchy stuff to avoid breaking scripts that check for gender to determine if bride or not
CNetPropManager.GetPropIntOriginal <- CNetPropManager.GetPropInt;
CNetPropManager.GetPropIntArrayOriginal <- CNetPropManager.GetPropIntArray;
CNetPropManager.GetPropIntArray <- function(ehandle, netprop, index) {
    local actual_value =  GetPropIntArrayOriginal(ehandle, netprop, index);

    if(netprop == "m_Gender" && ehandle instanceof CBaseEntity && ehandle.IsValid() && ehandle.GetClassname() == "witch") {
        if(::NesciusWitchLowViolenceFix.WitchesPreTransition.find(ehandle) != null) {
            return 2;
        }
        else if(::NesciusWitchLowViolenceFix.BrideWitchesPreTransition.find(ehandle) != null) {
            return 19;
        }
    }

    return actual_value;
}
CNetPropManager.GetPropInt <- function(ehandle, netprop) {
    local actual_value = GetPropIntOriginal(ehandle, netprop); //unsure if it has any side effects

    if(netprop == "m_Gender" && ehandle instanceof CBaseEntity && ehandle.IsValid() && ehandle.GetClassname() == "witch") {
        if(::NesciusWitchLowViolenceFix.WitchesPreTransition.find(ehandle) != null) {
            return 2;
        }
        else if(::NesciusWitchLowViolenceFix.BrideWitchesPreTransition.find(ehandle) != null) {
            return 19;
        }
    }

    return actual_value;
}

