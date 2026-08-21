printl("=================================================");
printl("SURVIVORS STAGGER ON CHARGER MID-RELEASE by tomaz");
printl("=================================================");

SSOCMR <-
{
	function OnGameEvent_charger_carry_end(params)
	{
		if("userid" in params && "victim" in params)
		{
			//checking if the charger is dying returns false because this is called before the charger actually dying i guess
			//so we're delaying our main thing a teeny tiny bit
			
			local charger = GetPlayerFromUserID(params.userid);
			local o = charger.GetOrigin() - charger.GetVelocity() * 0.5;
			
			DoWait("SSOCMR.MainThingy(" + params.userid + ", " + params.victim + ", " + o.x + ", " + o.y + ", " + o.z + ")", 0.05); //i hate this
		}
	}
	
	function MainThingy(userid, victim, x, y, z)
	{
		local charger = GetPlayerFromUserID(userid);
		local survivor = GetPlayerFromUserID(victim);
		local origin = Vector(x, y, z);
		
		// local test = SpawnEntityFromTable("env_sprite", { origin = new_origin, model = "sprites/glow01.spr", rendermode = 9, spawnflags = 1 });
		// DoEntFire("!self", "Kill", "", 3, null, test);
		
		if( charger.IsDying() && (!survivor.IsDying() && !survivor.IsImmobilized()) ) survivor.Stagger(origin);
	}
	
	function DoWait(code, time)
	{
		try
		{
			EntFire("worldspawn", "RunScriptCode", code, time);
		}
		catch(error)
		{
			printl("[SSOCMR] Unable to execute DoWait function!!! " + error);
		}
	}
}

__CollectGameEventCallbacks(SSOCMR);