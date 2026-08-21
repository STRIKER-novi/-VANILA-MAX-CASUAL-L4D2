upgrade_car_alarm_geeb <-
{
	function OnGameEvent_bullet_impact(event)
	{
		local player = GetPlayerFromUserID(event.userid);
		local weapon = player.GetActiveWeapon();
		local upgrade_vec = NetProps.GetPropInt(weapon, "m_upgradeBitVec");
		if(upgrade_vec == 1 || upgrade_vec == 5 || upgrade_vec == 2 || upgrade_vec == 6)
		{	
			local x = (event.x)
			local y = (event.y)
			local z = (event.z)
			local origin = Vector(x,y,z)
			local ent = null
			while( ent = Entities.FindByClassnameWithin(ent, "prop_car_alarm", origin, 40))
			{
				ent.TakeDamage(50, 2, player)
			}
		}
	}
}

__CollectEventCallbacks(upgrade_car_alarm_geeb, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);