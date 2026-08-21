Msg("Activating Survivor Ragdolls (Defib-Mode)\n");

if ("survivorragdolls" in getroottable())
{
	delete survivorragdolls;
}

// CHANGELOG
// - Capped thinking function to 0.033

//local script_1 = "vscript_defib_ragdoll_ragremove";

local script_think = "vscript_defib_ragdoll_think";

// Thanks to Lux
local precache1 = SpawnEntityFromTable("env_ragdoll_boogie", {});
if (precache1 != null)
	DoEntFire("!self", "Kill", "0", 0, null, precache1);

local default_folder = "defib_ragdolls";
local info_path = default_folder+"/info.txt";
local settings_path = default_folder+"/settings.cfg";

local bodiesExclude = [];
local bodiesExcludeTime = -1;

defibragdolls <-
{
	Settings =
	{
		allowBurningCorpse = true,
		moreStableDefaultPoseSpawn = true
	}
	
	function ParseConfigFile()
	{
		local tData;

		local function SerializeSettings()
		{
			local sData = "{";
			foreach (key, val in Settings)
			{
				switch (typeof val)
				{
				case "string":
					sData = format("%s\n\t%s = \"%s\"", sData, key, val);
					break;
				
				case "float":
					sData = format("%s\n\t%s = %.2f", sData, key, val);
					break;
				
				case "integer":
				case "bool":
					sData = sData + "\n\t" + key + " = " + val;
					break;
				}
			}
			sData = sData + "\n}";
			StringToFile(settings_path, sData);
		}

		if (tData = FileToString(settings_path))
		{
			try {
				tData = compilestring("return " + tData)();
				local hasMissingKey = false;
				foreach (key, val in Settings)
				{
					if (key in tData)
					{
						Settings[key] = tData[key];
					}
					else if (!hasMissingKey)
					{ hasMissingKey = true; }
				}
				if (hasMissingKey)
				{ SerializeSettings(); }
			}
			catch (error) {
				SerializeSettings();
			}
		}
		else
		{
			SerializeSettings();
		}
	}
	
	function FixTilt(client)
	{
		DoEntFire("!self", "RunScriptCode", "local eye_angles = self.EyeAngles();self.SnapEyeAngles(QAngle(eye_angles.x,eye_angles.y,0));", 0, null, client);
	}
	
	function OnGameEvent_player_death( params )
	{
		if ("survivordeathanims" in getroottable()) return;
		
		local client = Event_GetClient( params, "userid" );
		if ( client == null || !client.IsSurvivor() || !client.IsDead() )
			return;
		
		local prev_ragdoll = NetProps.GetPropEntity(client, "m_hRagdoll");
		
		local cl_Origin = client.GetOrigin();
		local chosenBody = null;
		for (local body; body = Entities.FindByClassname( body, "survivor_death_model" );)
		{
			local time = Time();
			local createTime = NetProps.GetPropFloat(body, "m_flCreateTime");
			if (createTime != 0 && createTime != time) continue;
			NetProps.SetPropFloat(body, "m_flCreateTime", time);
			if (bodiesExcludeTime < time)
			{
				bodiesExclude.clear();
				bodiesExcludeTime = time;
			}
			if (bodiesExclude.find(body) != null) continue;
			bodiesExclude.append(body);
			
			chosenBody = body;
			break;
		}
		
		CreateDeathRagdoll(client, prev_ragdoll, chosenBody, params);
	}
	
	function CreateDeathRagdoll(client, prevRagdoll = null, body = null, params = null)
	{
		local isPlayer = client.IsPlayer();
		local clientScope = null;
		if (!isPlayer)
		{
			if (!client.ValidateScriptScope()) return;
			clientScope = client.GetScriptScope();
		}
		
		local isOnFire = false;
		if (Settings.allowBurningCorpse && "isOnFire" in params) isOnFire = params["isOnFire"];
		
		local cl_Origin = client.GetOrigin();
		
		local cl_Angles = null;
		if (isPlayer)
			cl_Angles = QAngle(0, client.EyeAngles().y, 0.0);
		else
			cl_Angles = client.GetAngles();
		
		local cl_model = NetProps.GetPropString(client, "m_ModelName");
		
		local cl_char = null;
		if (isPlayer)
		{ cl_char = NetProps.GetPropInt(client, "m_survivorCharacter"); }
		else
		{ cl_char = clientScope.TempChar; }
		
		if ( body == null )
		{
			/*local pelvis_Bone = client.LookupBone("ValveBiped.Bip01_Pelvis");
			if (pelvis_Bone >= 0)
			{
				cl_Origin = client.GetBoneOrigin(pelvis_Bone);
			}*/
			
			body = SpawnEntityFromTable("survivor_death_model", {});
			if (body == null) return;
			body.SetModel(cl_model);
			NetProps.SetPropInt(body, "m_nCharacterType", cl_char);
			NetProps.SetPropFloat(body, "m_flCreateTime", Time());
			if ("survManager" in getroottable() && body.ValidateScriptScope())
			{
				local bodyScope = body.GetScriptScope();
				if (isPlayer)
					bodyScope.VSSMId <- client.GetPlayerUserId();
				else if ("TempClient" in clientScope)
					bodyScope.VSSMId <- clientScope.TempClient;
			}
		}
		if (body == null)
			return;
		
		if (prevRagdoll != null)
			prevRagdoll.Kill();
		
		local clSlot = null;
		if (isPlayer)
			clSlot = client.GetSurvivorSlot();
		else
			clSlot = clientScope.TempSlot;
		
		local pose_str = "";
		if (!Settings.moreStableDefaultPoseSpawn)
		{
			cl_Angles = QAngle(0, 0, 0.0);
			
			/*local pose_ent = null;
			if (isPlayer)
				pose_ent = GetBoneListFromClient( client );
			else
				pose_ent = client;*/
			
			local pelvis_Bone = client.LookupBone("ValveBiped.Bip01_Pelvis");
			if (pelvis_Bone >= 0)
				cl_Origin = client.GetBoneOrigin(pelvis_Bone);
			pose_str = GetAnimatingPoseStringAlt(client);
			//pose_str = GetAnimatingPoseString(client);
		}
		
		//local cl_AltOrigin = client.EyePosition();
		
		local ragdoll = SpawnEntityFromTable("prop_ragdoll", {
			model = cl_model,
			spawnflags = 4,
			//targetname = "vscript_defib_ragdolls_rag",
			//gravity = 0,
			origin = cl_Origin.ToKVString(),
			angles = cl_Angles.ToKVString(),
			angleOverride = pose_str,
			vscripts = script_think,
			thinkfunction = "DefibRagdollThink",
			rendermode = 10,
		});
		if (ragdoll == null || !ragdoll.ValidateScriptScope()) return;
		
		local ragScope = ragdoll.GetScriptScope();
		ragScope.clSlot <- clSlot;
		ragScope.body <- body;
		
		//DoEntFire("!self", "SetParent", "!activator", 0, ragdoll, body);
		local pParent = NetProps.GetPropEntity(body, "m_pParent");
		if (pParent != null && pParent != ragdoll)
		{
			local previousMoveChild = null;
			for ( local moveChild = pParent.FirstMoveChild(); moveChild != null; moveChild = moveChild.NextMovePeer() )
			{
				if (moveChild == body)
				{
					local movePeer = moveChild.NextMovePeer();
					if (movePeer != null)
					{
						if (previousMoveChild != null)
							NetProps.SetPropEntity(previousMoveChild, "m_hMovePeer", movePeer);
						else
							NetProps.SetPropEntity(pParent, "m_hMoveChild", movePeer);
					}
					else if (previousMoveChild != null)
						NetProps.SetPropEntity(previousMoveChild, "m_hMovePeer", null);
					else
						NetProps.SetPropEntity(pParent, "m_hMoveChild", null);
					
					// UnlinkChild
					NetProps.SetPropEntity(moveChild, "m_pParent", null);
					NetProps.SetPropEntity(moveChild, "m_hMovePeer", null);
					NetProps.SetPropEntity(moveChild, "m_hMoveParent", null);
					NetProps.SetPropEntity(moveChild, "m_Network.m_hParent", null);
					pParent = null;
					break;
				}
				previousMoveChild = moveChild;
			}
		}
		
		if (pParent == null)
		{
			// LinkChild
			// DONT run this code if we're already parented or we're just gonna crash
			NetProps.SetPropEntity(body, "m_pParent", ragdoll);
			local moveChild = ragdoll.FirstMoveChild();
			if (moveChild != null)
				NetProps.SetPropEntity(body, "m_hMovePeer", moveChild);
			//body.__KeyValueFromString("parentname", ragdoll.GetName());
			NetProps.SetPropEntity(ragdoll, "m_hMoveChild", body);
			NetProps.SetPropEntity(body, "m_hMoveParent", ragdoll);
			NetProps.SetPropEntity(body, "m_Network.m_hParent", ragdoll);
		}
		
		//body.SetOrigin(cl_Origin);
		DoEntFire("!self", "CallScriptFunction", "InitiateRagdoll", 0, null, ragdoll);
		
		if (isOnFire)
			DoEntFire("!self", "IgniteLifeTime", "15", 0, null, body);
		
		local vel_Vec = null;
		if (isPlayer)
		{
			vel_Vec = Vector(NetProps.GetPropFloat(client, "m_vecVelocity[0]"),
				NetProps.GetPropFloat(client, "m_vecVelocity[1]"),
				NetProps.GetPropFloat(client, "m_vecVelocity[2]"));
		}
		else
			vel_Vec = client.GetVelocity();
		
		ragdoll.ApplyAbsVelocityImpulse(vel_Vec);
		NetProps.SetPropInt(ragdoll, "m_nForceBone", NetProps.GetPropInt(client, "m_nForceBone"));
		
		local attacker = null;
		if (params)
		{
			if ( ("attacker" in params) )
				attacker = GetPlayerFromUserID( params["attacker"] );
			else if ( ("attackerentid" in params) )
				attacker = EntIndexToHScript( params["attackerentid"] );
			//Msg("m_lastDamageAmount: "+NetProps.GetPropInt(client, "m_lastDamageAmount")+"\n");
		}
		local damageAm = 0;
		if (isPlayer)
		{ damageAm = NetProps.GetPropInt(client, "m_lastDamageAmount"); }
		else
		{ damageAm = clientScope.TempDamage; }
		
		DamageEntity(ragdoll, damageAm+100, attacker);
		
		if (!isPlayer) client = GetPlayerFromUserID(clientScope.TempClient);
		if (client == null || !client.IsPlayer()) return;
		
		if (!IsPlayerABot(client))
			ragScope.deadCamera <- client;
		
		try
		{
			Left4Bots.Deads[cl_char] <- { dmodel = body, player = client };
		}
		catch (error)
		{}
	}
	
	function OnGameEvent_player_spawn( params )
	{
		local client = Event_GetClient( params, "userid" );
		
		if ( client == null || !client.IsSurvivor() )
			return;
		if (NetProps.GetPropInt(client, "m_iTeamNum") == 4 && (NetProps.GetPropInt(client, "m_fFlags") & (1 << 8))) // FL_FAKECLIENT
			return;
		// I like to occasionally play as Team 4, so i did this check instead of IsPlayerABot lol sorry
		
		FixTilt(client);
	}
	
	/*function OnGameEvent_survivor_rescued( params )
	{
		local client = Event_GetClient( params, "userid" );
		
		if ( client == null || !client.IsSurvivor() ) return;
		
		local entity_Flags = NetProps.GetPropInt(client, "m_fFlags");
		if (entity_Flags & (1 << 8)) // FL_FAKECLIENT
			return;
		
		
	}*/
	
	/*function ConformToPose( client, ragdoll )
	{
		local pose_str = GetAnimatingPoseString(client);
		
		//Msg(pose_str+"\n");
		
		ragdoll.__KeyValueFromString("angleOverride", pose_str);
		
		//local pose_str = GetRagdollPoseString(ragdoll);
		//Msg(pose_str+"\n");
		//
		//local pose_str_2 = GetAnimatingPoseString(client);
		//Msg(pose_str_2+"\n");
	}*/
	
	/*function GetAnimatingPoseString(entity)
	{
		local pOut = "";
		local listCount = NetProps.GetPropInt(entity, "m_BoneFollowerManager.m_iNumBones");
		Msg("listCount: "+listCount+"\n");
		if (listCount <= 0) return "";
		
		for ( local i = 0; i < listCount; i++ )
		{
			if ( i != 0 )
			{
				pOut = pOut+",";
			}
			
			local m_ragAngles = entity.GetBoneAngles(i);
			Msg("m_ragAngles: "+m_ragAngles+"\n");
			local str = i+","+m_ragAngles.x.tointeger()+".2f "+m_ragAngles.y.tointeger()+".2f "+m_ragAngles.z.tointeger()+".2f";
			pOut = pOut+str;
		}
		Msg("pOut: "+pOut+"\n");
		return pOut;
	}*/
	
	function GetAnimatingPoseStringAlt(client)
	{
	//	local function NormalizeVector(vec)
	//	{
	//		return vec.Scale(1.0 / vec.Length());
	//	}
		
		local pOut = "";
		//local listCount = NetProps.GetPropInt(entity, "m_BoneFollowerManager.m_iNumBones");
		//Msg("listCount: "+listCount+"\n");
		//if (listCount <= 0) return "";
		
		//local cl_Angles = client.EyeAngles();
		
		//local oldOrig = null;
		//local oldAng = null;
		for ( local i = 0; i <= 18; i++ )
		{
			//printl("Ran "+i+" times");
			//local m_ragOrigin = client.GetBoneOrigin(i);
			local m_ragAngles = client.GetBoneAngles(i); //Msg("m_ragAngles: "+m_ragAngles+"\n");
			//m_ragAngles = Vector(cos(m_ragAngles.x), sin(m_ragAngles.y), m_ragAngles.z);
			//m_ragAngles = Vector(m_ragAngles.x, m_ragAngles.y, m_ragAngles.z);
			//NormalizeVector(m_ragAngles);
			//local m_ragAngles = NetProps.GetPropVectorArray(client, "m_ragAngles", i);
			//Msg(m_ragAngles+"\n");
			// break early if same angles and origin, indicative of no more bones
			/*if (oldAng != null && oldOrig != null && 
			m_ragAngles.x == oldAng.x && m_ragAngles.y == oldAng.y && m_ragAngles.z == oldAng.z && oldOrig != null && 
			m_ragOrigin.x == oldOrig.x && m_ragOrigin.y == oldOrig.y && m_ragOrigin.z == oldOrig.z)
				break;*/
			
			if ( i != 0 )
				pOut = pOut+",";
			
			local str = format("%d,%.2f %.2f %.2f", i, m_ragAngles.x, m_ragAngles.y, m_ragAngles.z);
			pOut = pOut+str;
			//oldOrig = m_ragOrigin;
			//oldAng = m_ragAngles;
		}
		return pOut;
	}
	
	function GetBoneListFromClient( client, typeBool = false )
	{
		local cl_Origin = client.GetOrigin();
		local cl_Angles = client.EyeAngles().y;
		
		local cl_model = NetProps.GetPropString(client, "m_ModelName");
		
		local keyValues =
		{
			model = cl_model,
			solid = 0,
			origin = cl_Origin.x+" "+cl_Origin.y+" "+cl_Origin.z,
			//angles = cl_Angles.x+" "+cl_Angles.y+" "+cl_Angles.z,
			angles = "0 "+cl_Angles+" 0",
			rendermode = 10
			//DisableBoneFollowers = 1,
			//solid = 0
			spawnflags = (1 << 7)
		}
		
		local pose_ent = "prop_dynamic";
		if (typeBool) pose_ent = "commentary_dummy";
		
		pose_ent = SpawnEntityFromTable(pose_ent, keyValues);
		if (pose_ent == null) return null;
		
		DoEntFire("!self", "Kill", "", 0, null, pose_ent);
		return pose_ent;
		
		/*local pose_str = GetAnimatingPoseString(client);
		return pose_str;*/
		
	//	//DoEntFire("!self", "DisableMotion", "", 0, null, ragdoll);
	//	DoEntFire("!self", "SetParent", "!activator", 0, pose_ent, ragdoll);
	//	//NetProps.SetPropEntity(ragdoll, "moveparent", pose_ent);
	//	NetProps.SetPropInt(ragdoll, "m_fEffects", 1|512); // EF_BONEMERGE|EF_PARENT_ANIMATES
	//	//NetProps.SetPropEntity(ragdoll, "moveparent", null);
	//	DoEntFire("!self", "ClearParent", "", 0.1, null, ragdoll);
	//	//DoEntFire("!self", "EnableMotion", "", 0, null, ragdoll);
	}
	
	function DamageEntity(ent_val, fl_dmg, attacker)
	{
		if (!fl_dmg)
		fl_dmg = 10.0;
		
		//Msg("Damage: "+fl_dmg+"\n");
		
		local ent_hurtOrig = ent_val;
		if (attacker != null)
			ent_hurtOrig = attacker;
		
		//Msg(attacker+"\n");
		//local ent_val_Origin = ent_val.GetOrigin();
		local ent_hurtOrig_Origin = ent_hurtOrig.GetOrigin();
		if (ent_hurtOrig.IsPlayer())
			ent_hurtOrig_Origin = ent_hurtOrig.EyePosition();
		
		local keyValues =
		{
			Damage = fl_dmg,
			DamageTarget = "!activator",
			//DamageType = 128, // DMG_CLUB
			DamageType = 64+128, // DMG_BLAST
			origin = ent_hurtOrig_Origin.x+" "+ent_hurtOrig_Origin.y+" "+ent_hurtOrig_Origin.z
		}
		
		local hurt = SpawnEntityFromTable("point_hurt", keyValues);
		DoEntFire("!self", "Hurt", "", 0, ent_val, hurt);
		DoEntFire("!self", "Kill", "", 0.1, null, hurt);
	}
	
	function Event_GetClient(params, id_str = "userid")
	{
		if ( !(id_str in params) )
		return null;
		local client = GetPlayerFromUserID( params[id_str] );
		
		return client;
	}
	
	/*function Event_GetEntity(params, id_str = "targetid")
	{
		if ( !(id_str in params) )
		return null;
		local entity = EntIndexToHScript( params[id_str] );
		
		return entity;
	}*/
	
	function OnGameEvent_round_start( params )
	{
		// This mod already comes with it's own velocity system
		// Death Model Physics will cause problems with the defib body's movetype
		// Best to just disable this
		// https://steamcommunity.com/sharedfiles/filedetails/?id=3425048422
		if ("DeathModelPhysics" in getroottable())
		{
			printl("Defib Ragdolls has disabled Death Model Physics due to it's incompatibility");
			delete ::DeathModelPhysics;
		}
	}
}

defibragdolls.ParseConfigFile();

//if (!FileToString(info_path))
//{
	/*StringToFile(info_path,"THIS IS ONLY AN INFO FILE IN CASE YOU DON'T KNOW WHAT THE SETTINGS DO.\n
	Don't edit this to change the settings.\n
	- allowBurningCorpse (Allow fire damage like Molotovs or Incendiary Ammo to set the body on fire)\n
	- moreStableDefaultPoseSpawn (Make ragdolls spawn in the default pose instead of crumpled up into a ball)");*/
	StringToFile(info_path,"THIS IS ONLY AN INFO FILE IN CASE YOU DON'T KNOW WHAT THE SETTINGS DO.\nDon't edit this to change the settings.\n- allowBurningCorpse (Allow fire damage like Molotovs or Incendiary Ammo to set the body on fire)\n- moreStableDefaultPoseSpawn (Make ragdolls spawn in the default pose instead of crumpled up into a ball)");
//}

__CollectEventCallbacks(defibragdolls, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);