Msg("[= Realistic revive with defibrillator ACTIVE =]\n");

defiblow <-
{

function OnGameEvent_defibrillator_used( params )
{
	if("userid" in params && "subject" in params)
	{
		local defibed = GetPlayerFromUserID(params.subject)
		local downs = Convars.GetFloat("survivor_max_incapacitated_count");
		defibed.SetReviveCount(downs)
		defibed.SetHealth(1);
		defibed.SetHealthBuffer(41);
		NetProps.SetPropInt(defibed, "m_isGoingToDie", 1)
	}
}

}

__CollectGameEventCallbacks(defiblow);