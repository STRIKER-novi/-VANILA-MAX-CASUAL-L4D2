

/*
作者：洛琪希
url：https://steamcommunity.com/profiles/76561198812009299
*/


::WorldSpawn_Nudg <- Entities.FindByClassname(null, "worldspawn");
::Avoid_Nudg <- {
    Nudg_onoff = 0
    Events = {}
}


function Avoid_Nudg::MainLoopFunc()
{
    local ent = null;
    local flTime = Time();
    DoEntFire("!self", "RunScriptCode", "Avoid_Nudg.MainLoopFunc()", 1.0, WorldSpawn_Nudg, WorldSpawn_Nudg);

    if(Avoid_Nudg.Nudg_onoff == 1)
        return;
    
    while(ent = Entities.FindByClassname(ent, "player"))
    {
        if(ent.IsValid() && ent.IsSurvivor() && !ent.IsDead() && !ent.IsDying())
        {
            local flPropTime = NetProps.GetPropFloatArray(ent, "m_noAvoidanceTimer", 1);
            if(flPropTime > flTime + 2.0)
                continue;
            
            NetProps.SetPropFloatArray(ent, "m_noAvoidanceTimer", flTime + 2.0, 1);
        }
    }
}


function Avoid_Nudg::LoadAndSpawnConfig()
{
    local fileContents = FileToString("Avoid_Nudg/Nudg_Config.txt");
    if(fileContents == null || fileContents == "")
        StringToFile("Avoid_Nudg/Nudg_Config.txt", Avoid_Nudg.Nudg_onoff.tostring());
    
    fileContents = FileToString("Avoid_Nudg/Nudg_Config.txt");
    Avoid_Nudg.Nudg_onoff = fileContents.tointeger();
    Avoid_Nudg.MainLoopFunc()
}


::Avoid_Nudg.Events.OnGameEvent_player_say <-function(event) {
    if( event.text == "/nudg")
	{
		if(Avoid_Nudg.Nudg_onoff == 1)
        {
            Avoid_Nudg.Nudg_onoff = 0;  
            ClientPrint(null, 5, "Disable Nudg!");
        } 
        else 
        {
            Avoid_Nudg.Nudg_onoff = 1;  
            ClientPrint(null, 5, "Enable Nudg!");
        }
        StringToFile("Avoid_Nudg/Nudg_Config.txt", Avoid_Nudg.Nudg_onoff.tostring());
	}
}


Avoid_Nudg.LoadAndSpawnConfig()


__CollectEventCallbacks(::Avoid_Nudg.Events, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);