/////////////MANACAT-MODS//////////////*

IncludeScript("manacat_meleedrop");
IncludeScript("manacat_delayheal");
IncludeScript("manacat_carriable");
IncludeScript("manacat_spitfix");
IncludeScript("manacat_lib/lib");
IncludeScript("admin_system");


////////////NESCIUS-MODS/////////////*


/////SMOKER-INSTA-CAP-FIX 
printl("Activating insta-grab fix");

::nes_instagrab_fix <- {
	function OnGameEvent_tongue_grab(p) {
	    local smoker = GetPlayerFromUserID(p.userid);
	    local victim = GetPlayerFromUserID(p.victim);
	    local standing_on = NetProps.GetPropEntity(victim, "m_hGroundEntity");

	    if(smoker.GetOrigin().z > victim.GetOrigin().z && standing_on && standing_on.GetClassname() != "worldspawn") {
	        NetProps.SetPropEntity(victim, "m_hGroundEntity", null);
	        victim.SetOrigin(victim.GetOrigin() + Vector(0,0,20));
	        victim.ApplyAbsVelocityImpulse(Vector(0,0,30));
	    }
	}
}

__CollectGameEventCallbacks(nes_instagrab_fix);


/////WITCH-LV-FIX
printl("Activating with low violence fix");

__CollectGameEventCallbacks(NesciusWitchLowViolenceFix.Events);

////DOOR-HOTEL

printl("Dead Center Intro Door")

DeadCenterDoors <-
{
function OnGameEvent_round_start( params )
{
    if(Director.GetMapName().slice(0,4) == "c1m1")
    {
        local door = SpawnEntityFromTable("prop_door_rotating", { targetname = "chch_introdoor", origin = Vector(398, 5664, 2848), angles = "0 180 0", model = "models/props_downtown/metal_door_112.mdl", fademindist = -1, fademaxdist = 0, disableshadows = 1, ajarangles = "0 0 0", distance = 129, dmg = 0, forceclosed = 0, speed = 150, spawnpos = 0, spawnflags = 24576, opendir = 0, rendercolor = "122 151 158", returndelay = -1 })
        local target = SpawnEntityFromTable("info_target", { targetname = "chch_doortarget", origin = Vector(352, 5632, 2896) })
        door.ValidateScriptScope()
        target.ValidateScriptScope()

        local IntroRelay = Entities.FindByName(null, "relay_intro_setup")

        EntityOutputs.AddOutput(IntroRelay, "OnTrigger", "chch_introdoor", "OpenAwayFrom", "chch_doortarget", 5.6, 1)
        EntityOutputs.AddOutput(IntroRelay, "OnTrigger", "chch_introdoor", "SetRotationDistance", "90", 7.0, 1)
        EntityOutputs.AddOutput(IntroRelay, "OnTrigger", "chch_introdoor", "SetSpeed", "200", 7.0, 1)
    }
}
}

__CollectEventCallbacks(DeadCenterDoors, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);


///////// SERVER-CONFIGS ////////*

//INTERP
Convars.SetValue("sv_client_min_interp_ratio", "0");
Convars.SetValue("sv_client_max_interp_ratio", "1");
Convars.SetValue("melee_range", "73");
Convars.SetValue("vs_defib_penalty", "30");
Convars.SetValue("sb_vomit_blind_time", "2");


//STUCK-TP
Convars.SetValue("sv_player_stuck_tolerance", "4");

//VOTES
Convars.SetValue("sv_vote_command_delay", "0");
Convars.SetValue("sv_vote_creation_timer", "0");
Convars.SetValue("sv_vote_plr_map_limit", "5");

//SPAWN-RANGE
Convars.SetValue("z_spawn_safety_range", "200");
Convars.SetValue("z_safe_spawn_range", "200");

//TIME-DAY
Convars.SetValue("sv_force_time_of_day", "0");

//SPRAY-DELAY
Convars.SetValue("decalfrequency", "0.3" );

//NO-CLOSE-SERVER
Convars.SetValue("sb_all_bot_game", "1");

//CHANGE-TEAMS
Convars.SetValue("vs_max_team_switches", "99");

//ALARM-DISTANCE
Convars.SetValue("car_alarm_distance", "99999");

/////SURVIVORS/////]
Convars.SetValue("survivor_friendly_fire_factor_easy", "0" );
Convars.SetValue("survivor_friendly_fire_factor_expert", "0" );
Convars.SetValue("survivor_friendly_fire_factor_hard", "0" );
Convars.SetValue("survivor_friendly_fire_factor_normal", "0" );


Convars.SetValue("survivor_burn_factor_easy", "0" );
Convars.SetValue("survivor_burn_factor_expert", "0" );
Convars.SetValue("survivor_burn_factor_hard", "0" );
Convars.SetValue("survivor_burn_factor_normal", "0" );

Convars.SetValue("z_gun_swing_vs_cooldown", "1.1");
Convars.SetValue("z_gun_stun_duration", "1.20");


Convars.SetValue("z_gun_survivor_friend_push", "0");

Convars.SetValue("sv_consistency", "0");

Convars.SetValue("sv_gravity", "780");


//ITEMS

Convars.SetValue("pipe_bomb_timer_duration", "4.3");
Convars.SetValue("vomitjar_duration_infected_bot", "10");
Convars.SetValue("vomitjar_duration_infected_pz", "13");
Convars.SetValue("inferno_flame_lifetime", "8.5");
Convars.SetValue("chainsaw_attack_distance", "55");
Convars.SetValue("grenadelauncher_damage", "260");

Convars.SetValue("ammo_grenadelauncher_max", "10");
Convars.SetValue("ammo_assaultrifle_max", "340");
Convars.SetValue("ammo_autoshotgun_max", "80");
Convars.SetValue("ammo_chainsaw_max", "5");
Convars.SetValue("ammo_sniperrifle_max", "150");
Convars.SetValue("ammo_shotgun_max", "82");

/////COMMONS////
Convars.SetValue("z_throttle_hit_interval_easy", "0.21");
Convars.SetValue("z_throttle_hit_interval_normal", "0.21");
Convars.SetValue("z_throttle_hit_interval_hard", "0.21");
Convars.SetValue("z_throttle_hit_interval_expert", "0.21");
//Convars.SetValue("z_common_limit", "30");
Convars.SetValue("z_health", "47");
Convars.SetValue("z_pushaway_force", "0");
Convars.SetValue("z_respawn_interval", "3");


/////SMOKER/////

Convars.SetValue("tongue_drag_damage_amount", "1");
Convars.SetValue("tongue_choke_damage_amount", "1");
Convars.SetValue("tongue_choke_damage_interval", "0.25");
Convars.SetValue("tongue_break_from_damage_amount", "300");
Convars.SetValue("tongue_start_pull_delay", "0");
Convars.SetValue("tongue_range", "850");
Convars.SetValue("smoker_tongue_delay", "0");
Convars.SetValue("tongue_victim_max_speed", "183");
Convars.SetValue("tongue_miss_delay", "2.8");
//Convars.SetValue("tongue_no_progress_choke_time", "0");
//Convars.SetValue("tongue_no_progress_damage_interval", "0");


/////JOCKEY/////

Convars.SetValue("z_jockey_ride_damage_interval", "0.25");
Convars.SetValue("z_jockey_ride_damage", "1");
Convars.SetValue("z_jockey_control_max", "1");
Convars.SetValue("z_jockey_control_min", "1");

/////HUNTER/////

//Convars.SetValue("hunter_committed_attack_range", "20");
//Convars.SetValue("hunter_leap_away_give_up_range", "1000");
//Convars.SetValue("hunter_pounce_loft_rate", ".050");
//Convars.SetValue("hunter_pounce_max_loft_angle", "25");
//Convars.SetValue("hunter_pounce_ready_range", "2000");
Convars.SetValue("z_pounce_damage_delay", "0");
Convars.SetValue("z_pounce_damage", "3");
Convars.SetValue("z_pounce_damage_interval", "0.3");
Convars.SetValue("z_pounce_door_damage", "5000");
Convars.SetValue("hunter_committed_attack_range", "5000");

/////CHARGER////

Convars.SetValue("z_charge_impact_radius", "190");


/////BOOMER/////

Convars.SetValue("boomer_vomit_delay", "0");
Convars.SetValue("z_vomit_interval", "25");
Convars.SetValue("z_vomit_range", "350");
Convars.SetValue("z_vomit_fatigue", "2000");
Convars.SetValue("z_exploding_splat", "60");
Convars.SetValue("z_exploding_splat_radius", "260");

/////SPITTER////

Convars.SetValue("z_spit_interval", "18");
Convars.SetValue("z_spit_velocity", "1100");
Convars.SetValue("z_spit_spread_delay", "0.04");

///// TANK /////

Convars.SetValue("tank_run_spawn_delay", "2");
Convars.SetValue("z_tank_attack_interval", "0");
Convars.SetValue("tank_visibility_tolerance_suicide", "80");
Convars.SetValue("tank_throw_min_interval", "8");
Convars.SetValue("versus_tank_chance", "1");
Convars.SetValue("z_tank_speed_vs", "206");
Convars.SetValue("tank_burn_duration", "112");
Convars.SetValue("versus_tank_chance_intro", "1");
Convars.SetValue("versus_tank_chance_finale", "1");
Convars.SetValue("z_frustration_spawn_delay", "18");
Convars.SetValue("z_frustration_lifetime", "25");
Convars.SetValue("z_tank_damage_slow_min_range", "0");
Convars.SetValue("z_tank_damage_slow_max_range", "0");
Convars.SetValue("z_tank_autoshotgun_dmg_scale", "0.80");
Convars.SetValue("z_max_stagger_duration", "1.1");
Convars.SetValue("versus_tank_chance", "1");
Convars.SetValue("tank_ground_pound_duration", "0.97");
Convars.SetValue("z_tank_throw_interval", "4.3");
Convars.SetValue("tank_swing_range", "59");

///// WITCH ////

Convars.SetValue("z_witch_personal_space", "430");
Convars.SetValue("z_witch_flashlight_range", "900");
Convars.SetValue("z_witch_threat_normal_range", "420");
Convars.SetValue("versus_witch_chance", "1");
Convars.SetValue("z_witch_damage_per_kill_hit", "15");
Convars.SetValue("z_witch_burn_time", "19");
Convars.SetValue("z_witch_speed", "306");
Convars.SetValue("z_witch_speed_inured", "260");
Convars.SetValue("z_witch_relax_rate", "0.085");


/////COMANDS-INFEC

Convars.SetValue("z_hunter_limit", "1");
Convars.SetValue("z_smoker_limit", "1");
Convars.SetValue("z_ghost_delay_max", "17");
Convars.SetValue("z_ghost_delay_min", "17");
Convars.SetValue("z_ghost_special_spawn_interval", "17");
Convars.SetValue("z_ghost_finale_special_spawn_interval", "17");
Convars.SetValue("versus_special_respawn_interval", "17");
Convars.SetValue("z_special_spawn_interval", "16");
Convars.SetValue("l4d_obey_boss_spawn_except_static", "1");
Convars.SetValue("l4d_obey_boss_spawn_cvars", "1");
Convars.SetValue("z_door_reopen_interval", "0.65");
Convars.SetValue("z_door_pound_damage", "190");


////////////OTHER-SCRIPTS//////////////*

//REVIVE-BLACK-WHITE
IncludeScript("defiblow");

//NO-PUSH-SURVIVOR//
IncludeScript("avoid_sb_nudg");

//RAGDOLL-SURVIVOR-DEFIB-REVIVE//
IncludeScript( "vscript_defib_ragdoll", getroottable() );

//CHARGER-RESISTANCE-DELETE//
printl("chargers no damage res")

ChCh_ChargerDamageRes <-
{
    function OnGameEvent_charger_charge_start( params )
    {
        if("userid" in params)
        {
            if(params.userid)
            {
                local charger = GetPlayerFromUserID(params.userid)
                if(IsPlayerABot(charger))
                {
                    charger.SetHealth(charger.GetHealth() / 3)
                }
            }
        }
    }
    
    function OnGameEvent_charger_charge_end( params )
    {
        if("userid" in params)
        {
            if(params.userid)
            {
                local charger = GetPlayerFromUserID(params.userid)
                if(IsPlayerABot(charger) && charger.GetHealth() != 0)
                {
                    charger.SetHealth(charger.GetHealth() * 3)
                }
            }
        }
    }
}
__CollectGameEventCallbacks(ChCh_ChargerDamageRes)

//CHARGER-STUN//
IncludeScript("ssocmr", getroottable());

//SURVIVOR-SCREAM//
if (!("L4D2Lxc_SDL" in getroottable()))
	IncludeScript("survivor_death_lines");

__CollectEventCallbacks(::L4D2Lxc_SDL, "OnGameEvent_", "GameEventCallbacks", ::RegisterScriptGameEventListener);
::L4D2Lxc_SDL.OnScriptLoad();

//ALARM-ENABLE-PIPEBOM
carpipesgeeb <-
{
	function OnGameEvent_grenade_bounce(event)
	{
		local player = GetPlayerFromUserID(event.userid);
		local balls = player.GetOrigin()
		local ent2 = null
		while( ent2 = Entities.FindByClassnameWithin(ent2, "pipe_bomb_projectile", balls, 10000))
		{
			local nuts = ent2.GetOrigin()
			local ent = null
			while( ent = Entities.FindByClassnameWithin(ent, "prop_car_alarm", nuts, 5))
			{
				ent.TakeDamage(50, 2, player)
			}		
		}
	}

}

__CollectGameEventCallbacks(carpipesgeeb);

//ALARM-UPGRADE-AMMO
IncludeScript("upgrade_car_alarm_geeb");


//BARNS-C2M4-CARNIVAL-ADD//
ChCh_SpawnBarnsStuff <-
{
function OnGameEvent_round_start_post_nav( params )
{
    if(Director.GetMapName() == "c2m4_barns" && Director.GetGameModeBase() != "survival")
    {
        SpawnEntityFromTable("prop_dynamic", { origin = Vector(-1760, 1708, -256), angles = "0 270 0", model = "models/props_interiors/table_kitchen.mdl", fademindist = 2000, fademaxdist = 2300, solid = 6 })
        SpawnEntityFromTable("prop_dynamic", { origin = Vector(-1796, 1728, -256), angles = "0 180 0", model = "models/deadbodies/default/corner_a.mdl", fademindist = 2000, fademaxdist = 2300, solid = 0 })

        SpawnEntityFromTable("weapon_melee_spawn", { origin = Vector(-1760, 1716, -216), angles = "0 285 90", count = 1, spawnflags = 1, melee_weapon = "any", solid = 6, disableshadows = 1 })

        SpawnEntityFromTable("weapon_pipe_bomb", { origin = Vector(-1739, 1701, -220), angles = "0 225 90", count = 1, solid = 6, glowrange = 0, body = 0, disableshadows = 1, skin = 0, weaponskin = -1, modelscale = 1.0 })
        if(RandomInt(0, 3) == 3) //to simulate randomness as using _spawn entities made them look invisible in game for whatever reason, except the melee cuz source engine
        {
        SpawnEntityFromTable("weapon_pipe_bomb", { origin = Vector(-1739, 1695, -220), angles = "0 270 90", count = 1, solid = 6, glowrange = 0, body = 0, disableshadows = 1, skin = 0, weaponskin = -1, modelscale = 1.0 })
        }

        SpawnEntityFromTable("weapon_adrenaline", { origin = Vector(-1752, 1696.36, -221), angles = "0 45 0", solid = 6, glowrange = 0, body = 0, disableshadows = 1, skin = 0, weaponskin = -1, modelscale = 1.0 })
        if(RandomInt(0, 3) == 3) 
        {
        SpawnEntityFromTable("weapon_adrenaline", { origin = Vector(-1749, 1702, -221), angles = "0 345 0", solid = 6, glowrange = 0, body = 0, disableshadows = 1, skin = 0, weaponskin = -1, modelscale = 1.0 })
        }
        if(RandomInt(0, 7) == 7 && Director.GetGameModeBase() != "versus") 
        {
        SpawnEntityFromTable("weapon_vomitjar", { origin = Vector(-1741.96, 1708.97, -216), angles = "0 285 0", count = 1, solid = 6, glowrange = 0, body = 0, disableshadows = 1, skin = 0, weaponskin = -1, modelscale = 1.0 })
        }
    }
}
}

__CollectEventCallbacks(ChCh_SpawnBarnsStuff, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

//GAS-C8M3-MERCY-ADD//
if(Director.GetMapName() == "c8m3_sewers")
{
    ChCh_MercyGasser <-
    {
        function OnGameEvent_round_start( params )
        {
            EntityOutputs.AddOutput(Entities.FindByName(null, "gasstation_explosion_relay"), "OnTrigger", "Director", "PanicEvent", "", 3, 1)
        }
    }
    
    __CollectGameEventCallbacks(ChCh_MercyGasser);
}

//MORE-SPEACE//
Witch_RemoveClips <-
{
    function OnGameEvent_round_start( params )
    {
       for (local ent; ent = Entities.FindByClassname(ent, "func_playerinfected_clip"); )
       {
            ent.Kill()
       }
    }
}
__CollectGameEventCallbacks(Witch_RemoveClips);

//RNG-MODEL-SPECIALS//
Msg("RNG L4D1 SI Model script by RF\n");

local Smokers = ["models/infected/smoker.mdl","models/infected/smoker_l4d1.mdl"];
local Hunters = ["models/infected/hunter.mdl","models/infected/hunter_l4d1.mdl"];
local Boomers = ["models/infected/boomer.mdl","models/infected/boomer_l4d1.mdl","models/infected/boomette.mdl"];
if(!IsModelPrecached(Smokers[0]))
	PrecacheModel(Smokers[0])
if(!IsModelPrecached(Smokers[1]))
	PrecacheModel(Smokers[1])
if(!IsModelPrecached(Hunters[0]))
	PrecacheModel(Hunters[0])
if(!IsModelPrecached(Hunters[1]))
	PrecacheModel(Hunters[1])
if(!IsModelPrecached(Boomers[0]))
	PrecacheModel(Boomers[0])
if(!IsModelPrecached(Boomers[1]))
	PrecacheModel(Boomers[1])
if(!IsModelPrecached(Boomers[2]))
	PrecacheModel(Boomers[2])
if(!IsModelPrecached("models/infected/limbs/exploded_boomer.mdl"))
	PrecacheModel("models/infected/limbs/exploded_boomer.mdl")
if(!IsModelPrecached("models/infected/limbs/exploded_boomette.mdl"))
	PrecacheModel("models/infected/limbs/exploded_boomette.mdl")

SIOnSpawnRF <-
{
	OnGameEvent_player_spawn = function(event)
	{
		local SI = GetPlayerFromUserID(event.userid)
		if(SI.IsValid() && !SI.IsSurvivor() && !SI.IsDead())
		{
			if(SI.GetZombieType() == 1)
			{
				local modelnimi = NetProps.GetPropString(SI, "m_ModelName");
				if(modelnimi == Smokers[0] || modelnimi == Smokers[1])
					SI.SetModel(Smokers[RandomInt(0,1)]);
			}
			else if(SI.GetZombieType() == 2)
			{
				local modelnimi = NetProps.GetPropString(SI, "m_ModelName");
				if(modelnimi == Boomers[0] || modelnimi == Boomers[1] || modelnimi == Boomers[2])
				{
					if(Convars.GetFloat("z_female_boomer_spawn_chance") == 100)
						SI.SetModel(Boomers[RandomInt(0,1)]);
					else
						SI.SetModel(Boomers[RandomInt(0,2)]);
				}
			}
			else if(SI.GetZombieType() == 3)
			{
				local modelnimi = NetProps.GetPropString(SI, "m_ModelName");
				if(modelnimi == Hunters[0] || modelnimi == Hunters[1])
					SI.SetModel(Hunters[RandomInt(0,1)]);
			}
		}
	}
}

__CollectEventCallbacks(SIOnSpawnRF, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);


//RNG-MODEL-TANKS//
Msg("RNG Tank model script by RF\n");

local RNGModel = ["models/infected/hulk.mdl","models/infected/hulk_dlc3.mdl","models/infected/hulk_l4d1.mdl"];
if(!IsModelPrecached(RNGModel[0]))
	PrecacheModel(RNGModel[0])
if(!IsModelPrecached(RNGModel[1]))
	PrecacheModel(RNGModel[1])
if(!IsModelPrecached(RNGModel[2]))
	PrecacheModel(RNGModel[2])

TankOnSpawnRF <-
{
	OnGameEvent_spawned_as_tank = function(event)
	{
		local Tankki = GetPlayerFromUserID(event.userid)
		if(Tankki.IsValid() && !Tankki.IsSurvivor() && !Tankki.IsDead())
		{
			local modelnimi = NetProps.GetPropString(Tankki, "m_ModelName");
			if(modelnimi == RNGModel[0] || modelnimi == RNGModel[1] || modelnimi == RNGModel[2])
				Tankki.SetModel(RNGModel[RandomInt(0,2)]);
		}
	}
}

__CollectEventCallbacks(TankOnSpawnRF, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);


//RNG-MODEL-WITCHS//
Msg("RNG Witch model script by RF\n");

local Witches = ["models/infected/witch.mdl","models/infected/witch_bride.mdl"];
if(!IsModelPrecached(Witches[0]))
	PrecacheModel(Witches[0])
if(!IsModelPrecached(Witches[1]))
	PrecacheModel(Witches[1])

WitchOnSpawnRF <-
{
	OnGameEvent_witch_spawn = function(event)
	{
		local Noita = EntIndexToHScript(event["witchid"]);
		if(Noita.IsValid())
		{
			local modelnimi = NetProps.GetPropString(Noita, "m_ModelName");
			if(modelnimi == Witches[0] || modelnimi == Witches[1])
				Noita.SetModel(Witches[RandomInt(0,1)]);
		}
	}
}

__CollectEventCallbacks(WitchOnSpawnRF, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

//RNG-FINALE-ITEMS-POS//

printl("finale items everywhere moment")

NewFinalePos <-
{
function OnGameEvent_round_start_post_nav( params )
{
    local WhatMap = Director.GetMapName()

    if(Director.GetGameModeBase() == "coop" || Director.GetGameModeBase() == "versus" || Director.GetGameModeBase() == "realism")
    {
    if(WhatMap == "c1m4_atrium")
    {
        if(RandomInt(0, 1) == 1)
        {
        RemoveKitsWithin(Vector(-4478, -4059, 46), 64.0)
        RemoveWeaponsWithin(Vector(-4446, -3868, 45), 96.0)

        SpawnFinProp(Vector(-4080, -3560, 0), "0 270 0", "models/props_mall/mall_display_11.mdl", 1600, 1900, 0, 6)
        SpawnFinProp(Vector(-4130, -3562, 36), "0 315 0", "models/props_unique/spawn_apartment/lantern.mdl", 1000, 1200, 1, 0)
        SpawnFinProp(Vector(-4144, -3582, 36), "0 285 0", "models/props_unique/spawn_apartment/survivalmanual02.mdl", 600, 800, 1, 0)
//        SpawnFinProp(Vector(-4036, -3540, 36), "0 330 0", "models/deadbodies/default/pose_a.mdl", 1600, 1900, 1, 0)

        SpawnFinLight(Vector(-4130, -3562, 61), "0 0 0", "245 233 194", 3)

        SpawnFinKit(Vector(-4114, -3564, 38), "90 150 0")
        SpawnFinKit(Vector(-4108, -3574, 38), "90 135 0")
        SpawnFinKit(Vector(-4118, -3578, 38), "90 180 0")
        SpawnFinKit(Vector(-4128, -3572, 38), "90 210 0")

        SpawnFinWep(Vector(-4098, -3562, 40), "0 315 -90", "any_rifle", 0)
        SpawnFinWep(Vector(-4060, -3582, 40), "0 15 -90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(-4076, -3560, 40), "0 345 -90", "tier2_shotgun", 0)

        SpawnFinAmmo(Vector(-4021, -3557, 36), "0 45 0", "models/props/terror/ammo_stack.mdl")
        }
    }
    else if(WhatMap == "c6m3_port")
    {
        if(RandomInt(0, 1) == 1)
        {
        RemoveKitsWithin(Vector(-291, -814, 39), 64.0)
        RemoveWeaponsWithin(Vector(-673, -710, 38), 64.0)
        RemoveWeaponsWithin(Vector(-288, -368, 1), 64.0) 

        SpawnFinProp(Vector(240, -284, 0), "0 0 0", "models/props_interiors/table_end.mdl", 1800, 2000, 0, 6)
        SpawnFinProp(Vector(724, -492, 44), "0 0 0", "models/props_unique/spawn_apartment/lantern.mdl", 1000, 1200, 1, 0)

        SpawnFinLight(Vector(724, -492, 69), "0 0 0", "245 233 194", 3)

        SpawnFinKit(Vector(693, -500, 46), "90 0 0")
        SpawnFinKit(Vector(708, -499, 46), "90 15 0")
        SpawnFinKit(Vector(711, -487, 46), "90 75 0")
        SpawnFinKit(Vector(696, -485, 46), "90 315 0")

        SpawnFinWep(Vector(660, -494, 46), "0 345 90", "any_rifle", 0)
        SpawnFinWep(Vector(626, -494, 46), "0 30 90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(608, -500, 46), "0 135 90", "tier2_shotgun", 0)

        SpawnFinAmmo(Vector(240, -284, 30), "0 180 0", "models/props/terror/ammo_stack.mdl")
        }
    }
    else if(WhatMap == "c7m3_port")
    {
        if(RandomInt(0, 1) == 1)
        {
        RemoveKitsWithin(Vector(-291, -814, 39), 64.0)
        RemoveWeaponsWithin(Vector(-291, -814, 39), 64.0) 
        RemoveWeaponsWithin(Vector(-673, -710, 38), 64.0)

        SpawnFinProp(Vector(240, -284, 0), "0 0 0", "models/props_interiors/table_end.mdl", 1800, 2000, 0, 6)
        SpawnFinProp(Vector(724, -492, 44), "0 0 0", "models/props_unique/spawn_apartment/lantern.mdl", 1000, 1200, 1, 0)

        SpawnFinLight(Vector(724, -492, 69), "0 0 0", "245 233 194", 3)

        SpawnFinKit(Vector(693, -500, 46), "90 0 0")
        SpawnFinKit(Vector(708, -499, 46), "90 15 0")
        SpawnFinKit(Vector(711, -487, 46), "90 75 0")
        SpawnFinKit(Vector(696, -485, 46), "90 315 0")

        SpawnFinWep(Vector(660, -494, 46), "0 345 90", "any_rifle", 0)
        SpawnFinWep(Vector(626, -494, 46), "0 30 90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(608, -500, 46), "0 135 90", "tier2_shotgun", 0)

        SpawnFinAmmo(Vector(240, -284, 30), "0 180 0", "models/props/terror/ammo_stack.mdl")

        local items = null

        while( items = Entities.FindByClassnameWithin(items, "weapon_*", Vector(530, -556, 49), 32.0))
        {
            NetProps.SetPropInt(items, "m_spawnflags", 2)
        }
        }
    }
    else if(WhatMap == "c8m5_rooftop")
    {
        local WhichOne = RandomInt(0, 2)
        if(WhichOne == 1) //front
        {
        RemoveKitsWithin(Vector(5670, 8457, 6082), 64.0)
        RemoveWeaponsWithin(Vector(5686, 8507, 6082), 96.0) 

        SpawnFinProp(Vector(6141, 8398, 5920), "0 15 0", "models/props_crates/static_crate_40.mdl", 2000, 2200, 0, 6)
        SpawnFinProp(Vector(6136, 8444, 5920), "0 0 0", "models/props_crates/static_crate_40.mdl", 2000, 2200, 0, 6)
        SpawnFinProp(Vector(6136, 8480, 5920), "0 90 0", "models/deadbodies/dead_male_civilian_01.mdl", 2000, 2200, 1, 0)

        SpawnFinKit(Vector(6132, 8400, 5962), "87 88 0")
        SpawnFinKit(Vector(6134, 8396, 5962), "87 298 0")
        SpawnFinKit(Vector(6144, 8389, 5962), "87 358 0")
        SpawnFinKit(Vector(6144, 8404, 5962), "87 58 0")

        SpawnFinWep(Vector(6184, 8432, 5921), "0 117 -90", "any_rifle", 0)
        SpawnFinWep(Vector(6186, 8405, 5921), "0 57.5 -90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(6192, 8448, 5921), "0 312 -90", "tier2_shotgun", 0)
        SpawnFinWep(Vector(6152, 8490, 5921), "0 49 90", "weapon_pistol_magnum", 0)

        SpawnFinAmmo(Vector(6128, 8448, 5960), "0 90 0", "models/props_unique/spawn_apartment/coffeeammo.mdl")
        }
        else if(WhichOne == 2) //helipad
        {
        RemoveKitsWithin(Vector(5670, 8457, 6082), 64.0)
        RemoveWeaponsWithin(Vector(5686, 8507, 6082), 96.0) 
//        RemoveMinigunWithin(Vector(5971, 8411, 6080), 16.0, "prop_minigun_l4d1")

//        SpawnFinProp(Vector(7232, 8562, 6056), "0 180 0", "models/props_fortifications/fortification_indoor_01.mdl", -1, 0, 0, 6)

        SpawnFinKit(Vector(7150, 8408, 6098), "87 103 0")
        SpawnFinKit(Vector(7153, 8404, 6098), "87 313 0")
        SpawnFinKit(Vector(7160, 8415, 6098), "87 73 0")
        SpawnFinKit(Vector(7164, 8400, 6098), "87 13 0")

        SpawnFinWep(Vector(7217. 8693. 6058), "0 327 -90", "any_rifle", 0)
        SpawnFinWep(Vector(7244, 8695, 6058), "0 27 -90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(7190, 8428, 6058), "0 132 -90", "tier2_shotgun", 0)
        SpawnFinWep(Vector(7244, 8732, 6099), "0 49 90", "weapon_pistol_magnum", 0)

        SpawnFinAmmo(Vector(7208, 8726, 6096), "0 29 0", "models/props/terror/ammo_stack.mdl")

//        SpawnFinMinigun(Vector(7240, 8560, 6056), "0 180 0", "models/w_models/weapons/w_minigun.mdl", 1, 6, "prop_minigun_l4d1")
        }
    }
    else if(WhatMap == "c9m2_lots")
    {
        local WhichOne = RandomInt(0, 2)
        if(WhichOne == 1) //miniroof
        {
        RemoveKitsWithin(Vector(7096, 6480, 49), 64.0)
        RemoveWeaponsWithin(Vector(7148, 6476, 49), 96.0) 

        SpawnFinProp(Vector(8494, 6276, 192), "0 0 0", "models/props_interiors/table_kitchen.mdl", 1200, 1300, 0, 6)
        SpawnFinProp(Vector(8394, 6586, 238), "0 270 0", "models/props_unique/spawn_apartment/lantern.mdl", 1000, 1200, 1, 0)
        SpawnFinProp(Vector(8498, 6300, 226), "0 270 0", "models/props_unique/spawn_apartment/lantern.mdl", 1000, 1200, 1, 0)

        SpawnFinLight(Vector(8394, 6586, 263), "0 0 0", "245 233 194", 3)
        SpawnFinLight(Vector(8498, 6300, 251), "0 0 0", "245 233 194", 3)

        SpawnFinKit(Vector(8374, 6578, 240), "90 30 0")
        SpawnFinKit(Vector(8360, 6578, 240), "90 0 0")
        SpawnFinKit(Vector(8376, 6592, 240), "90 150 0")
        SpawnFinKit(Vector(8360, 6596, 240), "90 225 0")

        SpawnFinWep(Vector(8488, 6250, 228), "0 105 90", "any_rifle", 0)
        SpawnFinWep(Vector(8500, 6256, 228), "0 90 90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(8462, 6254, 194), "0 75 90", "tier2_shotgun", 0)

        SpawnFinAmmo(Vector(8378, 6556, 192), "0 270 0", "models/props/terror/ammo_stack.mdl")
        }
        if(WhichOne == 2) //outroof
        {
        RemoveKitsWithin(Vector(7096, 6480, 49), 64.0)
        RemoveWeaponsWithin(Vector(7148, 6476, 49), 96.0) 
        RemoveMinigunWithin(Vector(8272, 6160, 192), 16.0, "prop_minigun_l4d1")

        SpawnFinProp(Vector(7534, 5968, 216), "0 0 0", "models/props_interiors/table_kitchen.mdl", 2200, 2300, 0, 6)
        SpawnFinProp(Vector(7538, 5992, 250), "0 270 0", "models/props_unique/spawn_apartment/lantern.mdl", 2000, 2200, 1, 0)
        SpawnFinProp(Vector(7348. 5888, 262), "0 90 0", "models/props_unique/spawn_apartment/lantern.mdl", 2000, 2200, 1, 0)

        SpawnFinLight(Vector(7538, 5992, 275), "0 0 0", "245 233 194", 3)
        SpawnFinLight(Vector(7348, 5888, 287), "0 0 0", "245 233 194", 3)

        SpawnFinKit(Vector(7366, 5882, 264), "90 330 0")
        SpawnFinKit(Vector(7382, 5878, 264), "90 75 0")
        SpawnFinKit(Vector(7368, 5896, 264), "90 210 0")
        SpawnFinKit(Vector(7382, 5896, 264), "90 180 0")

        SpawnFinWep(Vector(7528, 5942, 252), "0 105 90", "any_rifle", 0)
        SpawnFinWep(Vector(7540, 5948, 252), "0 90 90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(7502, 5946, 218), "0 75 90", "tier2_shotgun", 0)

        SpawnFinAmmo(Vector(7364, 5918, 216), "0 90 0", "models/props/terror/ammo_stack.mdl")

        SpawnFinMinigun(Vector(7196, 6116, 216), "0 135 0", "models/w_models/weapons/w_minigun.mdl", 1, 6, "prop_minigun_l4d1")
        }
    }
    else if(WhatMap == "c10m5_houseboat")
    {
        local WhichOne = RandomInt(0, 2)
        if(WhichOne == 1) //docks
        {
        RemoveKitsWithin(Vector(3802, -4650, -149), 64.0)
        RemoveWeaponsWithin(Vector(3916, -4646, -150), 96.0) 

        SpawnFinProp(Vector(2516, -4952, -220), "0 225 0", "models/props_crates/static_crate_40.mdl", 2000, 2200, 0, 6)

        SpawnFinKit(Vector(2576, -4938, -180), "90 210 0")
        SpawnFinKit(Vector(2570, -4947, -180), "90 195 0")
        SpawnFinKit(Vector(2558, -4956, -178), "45 180 90")
        SpawnFinKit(Vector(2548, -4952, -180), "90 0 0")

        SpawnFinWep(Vector(2568, -4980, -218), "0 210 90", "any_rifle", 0)
        SpawnFinWep(Vector(2504, -4982, -218), "0 345 -90", "tier2_shotgun", 0)

        SpawnFinAmmo(Vector(2522, -4947, -180), "0 270 0", "models/props_unique/spawn_apartment/coffeeammo.mdl")
        }
        if(WhichOne == 2) //shack
        {
        RemoveKitsWithin(Vector(3802, -4650, -149), 64.0)
        RemoveWeaponsWithin(Vector(3916, -4646, -150), 96.0) 
        RemoveMinigunWithin(Vector(4076, -3945, -24), 16.0, "prop_minigun_l4d1")

        SpawnFinProp(Vector(3328, -2960, -88), "0 270 0", "models/props_fortifications/fortification_indoor_01.mdl", -1, 0, 0, 6)
        SpawnFinProp(Vector(3138, -2770, -84), "0 0 0", "models/props_crates/static_crate_40.mdl", 2200, 2300, 0, 6)
        SpawnFinProp(Vector(3384, -2622, -65), "0 0 0", "models/props_unique/spawn_apartment/lantern.mdl", 2000, 2200, 1, 0)
        SpawnFinProp(Vector(3267, -2627, -49), "0 135 0", "models/props_unique/spawn_apartment/lantern.mdl", 2000, 2200, 1, 0)

        SpawnFinLight(Vector(3384, -2622, -80), "0 0 0", "245 233 194", 3)
        SpawnFinLight(Vector(3267, -2627, -64), "0 0 0", "245 233 194", 3)

        SpawnFinKit(Vector(3404, -2622, -62), "90 300 0")
        SpawnFinKit(Vector(3418, -2616, -62), "90 300 0")
        SpawnFinKit(Vector(3420, -2628, -62), "90 270 0")
        SpawnFinKit(Vector(3418, -2639, -62), "90 240 0")

        SpawnFinWep(Vector(3238, -2622, -48), "0 0 -90", "any_rifle", 0)
        SpawnFinWep(Vector(3144, -2736, -84), "0 150 -90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(3236, -2642, -48), "0 30 90", "tier2_shotgun", 0)

        SpawnFinAmmo(Vector(3132, -2765.5, -44), "0 79 0", "models/props_unique/spawn_apartment/coffeeammo.mdl")

        SpawnFinMinigun(Vector(3328, -2952, -84), "0 270 0", "models/w_models/weapons/w_minigun.mdl", 1, 6, "prop_minigun_l4d1")
        }
    }
    else if(WhatMap == "c11m5_runway")
    {
        if(RandomInt(0, 1) == 1)
        {
        RemoveKitsWithin(Vector(-5208, 9232, -188), 64.0)
        RemoveWeaponsWithin(Vector(-4854, 9165, -152), 64.0) 
        RemoveMinigunWithin(Vector(-5113, 9292, -192), 16.0, "prop_minigun_l4d1")

        SpawnFinProp(Vector(-4080, 10032, -192), "0 60 0", "models/props_crates/static_crate_40.mdl", 2000, 2200, 0, 6)
        SpawnFinProp(Vector(-4056, 9984, -192), "0 15 0", "models/props_crates/static_crate_40.mdl", 2000, 2200, 0, 6)
        SpawnFinProp(Vector(-4248, 10000, -192), "0 30 0", "models/props_fortifications/sandbags_corner3.mdl", -1, 0, 1, 6)
        SpawnFinProp(Vector(-4192, 10144, -192), "0 30 0", "models/deadbodies/bodies128_a.mdl", 2000, 2200, 0, 0)

        SpawnFinKit(Vector(-4045, 9974, -150), "90 165 0")
        SpawnFinKit(Vector(-4056, 9978, -150), "90 135 0")
        SpawnFinKit(Vector(-4066, 9988, -150), "90 45 0")
        SpawnFinKit(Vector(-4056, 9994, -150), "90 30 0")

        SpawnFinWep(Vector(-4094, 9992, -190), "0 137 90", "any_rifle", 0)
        SpawnFinWep(Vector(-4116, 9980, -190), "0 320 90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(-4084, 9952, -190), "0 90 90", "tier2_shotgun", 0)
        SpawnFinWep(Vector(-4212, 10000, -190), "0 0 90", "weapon_pistol_magnum", 0)

        SpawnFinAmmo(Vector(-4082, 10032, -152), "0 44 0", "models/props/terror/ammo_stack.mdl")

        SpawnFinMinigun(Vector(-4224, 10024, -192), "0 210 0", "models/w_models/weapons/w_minigun.mdl", 1, 6, "prop_minigun_l4d1")
        }
    }
    else if(WhatMap == "c12m5_cornfield")
    {
        local WhichOne = RandomInt(0, 2)
        if(WhichOne == 1) //yard
        {
        RemoveKitsWithin(Vector(6965, 1340, 276), 64.0)
        RemoveWeaponsWithin(Vector(6988, 1251, 264), 96.0) 

        SpawnFinProp(Vector(6424 - 160, 2024 - 160, 200 + 8), "0 15 0", "models/props_crates/static_crate_40.mdl", 2000, 2200, 0, 6)
        SpawnFinProp(Vector(6448 - 160, 1984 - 160, 200 + 8), "0 0 0", "models/props_crates/static_crate_40.mdl", 2000, 2200, 0, 6)
        SpawnFinProp(Vector(6368 - 160, 1952 - 160, 208 + 8), "0 15 0", "models/props_vehicles/hmmwv_supply.mdl", -1, 0, 0, 6)
        SpawnFinProp(Vector(6368 - 160, 1952 - 160, 208 + 8), "0 15 0", "models/props_vehicles/hmmwv_supply_glass.mdl", -1, 0, 0, 6)
        SpawnFinProp(Vector(6424 - 160, 2024 - 160, 240 + 8), "0 0 0", "models/props_unique/spawn_apartment/lantern.mdl", 2000, 2200, 0, 0)
        SpawnFinProp(Vector(6452 - 160, 1900 - 160, 204 + 8), "0 15 0", "models/deadbodies/dead_male_civilian_body.mdl", 2000, 2200, 0, 0)

        SpawnFinLight(Vector(6424 - 160, 2024 - 160, 265 + 8), "0 0 0", "245 233 194", 3)

        SpawnFinKit(Vector(6454 - 160, 1982 - 160, 242 + 8), "90 280 0")
        SpawnFinKit(Vector(6446 - 160, 1976 - 160, 242 + 8), "90 220 0")
        SpawnFinKit(Vector(6443 - 160, 1990 - 160, 242 + 8), "90 265 0")
        SpawnFinKit(Vector(6452 - 160, 1999 - 160, 242 + 8), "90 250 0")

        SpawnFinWep(Vector(6406 - 160, 1840 - 160, 248 + 8), "0 195 -90", "any_rifle", 0)
        SpawnFinWep(Vector(6390 - 160, 1852 - 160, 248 + 8), "0 30 -90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(6422 - 160, 1822 - 160, 212 + 8), "0 210 -90", "tier2_shotgun", 0)

        SpawnFinAmmo(Vector(6469 - 160, 2025 - 160, 199 + 8), "2.9 90 0", "models/props/terror/ammo_stack.mdl")
        }
        if(WhichOne == 2) //metal place
        {
        RemoveKitsWithin(Vector(6965, 1340, 276), 64.0)
        RemoveWeaponsWithin(Vector(6988, 1251, 264), 96.0) 

        SpawnFinProp(Vector(7308, 1856, 199), "0 270 0", "models/props/cs_italy/it_mkt_table2.mdl", 2000, 2200, 0, 6)
        SpawnFinProp(Vector(7384, 1856, 204), "0 75 0", "models/props_crates/static_crate_40.mdl", 2000, 2200, 0, 6)
        SpawnFinProp(Vector(7268, 1844, 235), "0 30 0", "models/props_unique/spawn_apartment/lantern.mdl", 2000, 2200, 0, 0)

        SpawnFinLight(Vector(7268, 1844, 260), "0 0 0", "245 233 194", 3)

        SpawnFinKit(Vector(7292, 1847, 238), "90 265 0")
        SpawnFinKit(Vector(7280, 1855, 238), "90 310 0")
        SpawnFinKit(Vector(7294, 1857, 238), "90 325 0")
        SpawnFinKit(Vector(7280, 1868, 238), "90 295 0")

        SpawnFinWep(Vector(7338, 1848, 238), "0 195 -90", "any_rifle", 0)
        SpawnFinWep(Vector(7314, 1854, 238), "0 30 -90", "any_sniper_rifle", 1)
        SpawnFinWep(Vector(7320, 1896, 206), "0 330 90", "tier2_shotgun", 0)

        SpawnFinAmmo(Vector(7384, 1857, 244), "0 255 0", "models/props/terror/ammo_stack.mdl")
        }
    }
}
}

function RemoveKitsWithin(where, radius)
{
    local kit = null

    while( kit = Entities.FindByClassnameWithin(kit, "weapon_first_aid_kit_spawn", where, radius))
    {
        kit.Kill()
//        printl("Removing OG Kit")
    }
}

function RemoveWeaponsWithin(where, radius)
{
    local weps = null

    while( weps = Entities.FindByClassnameWithin(weps, "weapon_*", where, radius))
    {
        weps.Kill()
//        printl("Removing OG Weps")
    }
}

function RemoveMinigunWithin(where, radius, type)
{
    local mini = null

    while( mini = Entities.FindByClassnameWithin(mini, type, where, radius))
    {
        mini.Kill()
//        printl("Removing OG Minigun")
    }
}

function SpawnFinProp(where, ang, what, fademin, fademax, shadow, hard)
{
    SpawnEntityFromTable("prop_dynamic", { origin = where, angles = ang, model = what, fademindist = fademin, fademaxdist = fademax, solid = hard, disableshadows = shadow })
//    printl("Spawning Finale Prop")
}

function SpawnFinKit(where, ang)
{
    SpawnEntityFromTable("weapon_first_aid_kit_spawn", { origin = where, angles = ang, count = 1, solid = 6, glowrange = 0, body = 0, disableshadows = 1, skin = 0, weaponskin = -1, modelscale = 1.0, spawnflags = 2 })
//    printl("Spawning Finale Kit")
}

function SpawnFinWep(where, ang, which, cs)
{
    SpawnEntityFromTable("weapon_spawn", { origin = where, angles = ang, weapon_selection = which, count = 5, solid = 6, glowrange = 0, body = 0, disableshadows = 1, skin = 0, weaponskin = -1, modelscale = 1.0, spawnflags = 10, no_cs_weapons = cs, spawn_without_director = 1 })
//    printl("Spawning Finale Weapon")
}

function SpawnFinAmmo(where, ang, what)
{
    SpawnEntityFromTable("weapon_ammo_spawn", { origin = where, angles = ang, count = 5, solid = 6, glowrange = 0, body = 0, disableshadows = 1, model = what, skin = 0, weaponskin = -1, modelscale = 1.0, spawnflags = 10 })
//    printl("Spawning Finale Ammo")
}

function SpawnFinLight(where, ang, colour, bright)
{
    SpawnEntityFromTable("light_dynamic", { origin = where, angles = ang, _cone = 0, _inner_cone = 0, _light = colour, brightness = bright, distance = 128, pitch = 0, spotlight_radius = 80, spawnflags = 0, style = 0 })
//    printl("Spawning Finale Light")
}

function SpawnFinMinigun(where, ang, what, shadow, hard, type)
{
    SpawnEntityFromTable(type, { origin = where, angles = ang, solid = hard, model = what, fademindist = -1, fademaxdist = 0, disableshadows = shadow, MinPitch = -30, MaxPitch = 40, MaxYaw = 90, startdisabled = 0, MinAnimTime = 5, MaxAnimTime = 10 })
//    printl("Spawning Finale Minigun")
}
}

__CollectEventCallbacks(NewFinalePos, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

///////////

IncludeScript("VSLib");
//IncludeScript("miniscript/customFunction.nut");
//IncludeScript("miniscript/NPcvars.nut");
IncludeScript("miniscript/TankAllChapter.nut");
//IncludeScript("miniscript/SIBotControl.nut");
IncludeScript("miniscript/SILadderSpeed.nut");
//IncludeScript("miniscript/SISpawnManager.nut");
//IncludeScript("miniscript/SIStuckSolver.nut");


