//------------------------------------------------------
//     Author: 4512369781
//     Steam: https://steamcommunity.com/profiles/76561198052420500/myworkshopfiles/?appid=550
//------------------------------------------------------


::L4D2Lxc_SDL <-
{
	EMSFolder = "survivor_death_lines/"
	LinesFolder = "survivor_death_lines/voicelines/"
	CustomFolder = "survivor_death_lines/voicelines/custom_survivors/"
	InfoFilePath = "survivor_death_lines/info.txt"
	AddNewFilePath = "survivor_death_lines/addnew.txt"
	SettingsFilePath = "survivor_death_lines/settings.txt"
	
	LastOneAnnouncer = { Enable = 0, SoundFile = "", Volume = 1.0, Delay = 0 }
	AnnouncerTimeStamp = 0
	
	FirstLoad = true
	Initialized = false
	TestScream = null
	TestScreamTimeStamp = 0
	Default =
	{
		Mute = { bill = 0, zoey = 0, francis = 0, louis = 0, nick = 0, rochelle = 0, coach = 0, ellis = 0 }
		MuteNameSort = [ "", "bill", "zoey", "francis", "louis", "nick", "rochelle", "coach", "ellis" ]
		ActorList = { NamVet = "bill", TeenGirl = "zoey", Biker = "francis", Manager = "louis", Gambler = "nick", Producer = "rochelle", Coach = "coach", Mechanic = "ellis" }
	}
	Mute = {}
	MuteNameSort = []
	ActorList = {}
	CustomSurvivorsActorList = {}
	//talker: GCFScape open "..\pak01_dir.vpk" -> scripts\talker\coach.txt
	//vcd: scenes\coach\deathscream01.vcd
	//wav: sound\player\survivor\voice\coach\deathscream01.wav
	//script: \scripts\game_sounds_coach.txt
	Scenes =
	{
		//Actor Name
		//L4D
		NamVet =	//Bill
		{
			DeathScream = ["01", "02", "03", "04", "05", "06", "07", "08"]
			//HurtCritical = ["01", "02", "03", "04", "05", "06", "07", "08", "09"]
		}
		TeenGirl =	//Zoey
		{
			DeathScream = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11"]
			//HurtCritical = ["01", "02", "03", "04", "05", "06", "07"]
		}
		Biker =		//Francis
		{
			DeathScream = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"]
			//HurtCritical = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11"]
		}
		Manager =	//Louis
		{
			DeathScream = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10"]
			//HurtCritical = ["01", "02", "03", "04", "05"]
		}
		
		//L4D2
		Gambler =	//Nick
		{
			DeathScream = ["01", "02", "03", "04", "05", "06", "07"]
			//HurtCritical = ["01", "02", "03", "04", "05", "06", "07"]
		}
		Producer =	//Rochelle
		{
			DeathScream = ["01", "02"]
			//HurtCritical = ["01", "02", "03", "04"]
		}
		Coach =		//Coach
		{
			DeathScream = ["01", "02", "03", "04", "05", "06", "07", "08", "09"]
			//HurtCritical = ["01", "02", "03", "04", "05", "06", "07", "08"]
		}
		Mechanic =	//Ellis
		{
			DeathScream = ["01", "02", "03", "04", "05", "06"]
			//HurtCritical = ["01", "02", "03", "04", "05", "06"]
			//EllisStories = ["A01", "A02", "B01", "B02", "C01", "D01", "E01", "F01", "G01", "H01", "I01", "J01", "K01", "L01", "M01", "N01", "P01", "Q01", "R01", "S01", "T01", "U01", "V01"]
		}
	}
	NewAddContent = []
	TempAddContent = {}
	TempList = {}
	LastSoundFile = {}
	//https://developer.valvesoftware.com/wiki/Damage_types
	DamageTypes = { DMG_GENERIC = 0, DMG_CRUSH = 1, DMG_BULLET = 2, DMG_SLASH = 4, DMG_BURN = 8, DMG_VEHICLE = 16, DMG_FALL = 32, DMG_BLAST = 64, DMG_CLUB = 128, DMG_SHOCK = 256, DMG_SONIC = 512, DMG_ENERGYBEAM = 1024, DMG_PREVENT_PHYSICS_FORCE = 2048, DMG_BLAMELESS_FRIENDLY_FIRE = 2048, DMG_NEVERGIB = 4096, DMG_ALWAYSGIB = 8192, DMG_DROWN = 16384, DMG_PARALYZE = 32768, DMG_FORCE_INCAPACITATE = 32768, DMG_NERVEGAS = 65536, DMG_POISON = 131072, DMG_RADIATION = 262144, DMG_DROWNRECOVER = 524288, DMG_ACID = 1048576, DMG_CHOKE = 1048576, DMG_SLOWBURN = 2097152, DMG_MELEE = 2097152, DMG_REMOVENORAGDOLL = 4194304, DMG_PHYSGUN = 8388608, DMG_PLASMA = 16777216, DMG_AIRBOAT = 33554432, DMG_STUMBLE = 33554432, DMG_DISSOLVE = 67108864, DMG_BLAST_SURFACE = 134217728, DMG_DIRECT = 268435456, DMG_BUCKSHOT = 536870912, DMG_HEADSHOT = 1073741824, DMG_LASTGENERICFLAG = -2147483648, DMG_DISMEMBER = -2147483648 }
	//has higher priority, empty by default.
	ScenesDeathReason =
	{
		//Actor Name
		//L4D
		NamVet = {}		//Bill
		TeenGirl = {}	//Zoey
		Biker = {}		//Francis
		Manager = {}	//Louis
		
		//L4D2
		Gambler = {}	//Nick
		Producer = {}	//Rochelle
		Coach = {}		//Coach
		Mechanic = {}	//Ellis
	}
	//scenes with a tag will only be used for Death Reason
	ScenesDeathReasonOnly =
	{
		//Actor Name
		//L4D
		NamVet = {}		//Bill
		TeenGirl = {}	//Zoey
		Biker = {}		//Francis
		Manager = {}	//Louis
		
		//L4D2
		Gambler = {}	//Nick
		Producer = {}	//Rochelle
		Coach = {}		//Coach
		Mechanic = {}	//Ellis
	}
	//ClientPrint https://developer.valvesoftware.com/wiki/Left_4_Dead_2/Script_Functions/ClientPrint
	//HUD_PRINTNOTIFY = 1
	//HUD_PRINTCONSOLE = 2
	//HUD_PRINTTALK = 3
	//HUD_PRINTCENTER = 4
	//HUD_UNKNOWN = 5
	//COLOR_BEIGE = "\x01"
	//COLOR_BRIGHTGREEN = "\x03"
	//COLOR_ORANGE = "\x04"
	//COLOR_OLIVEGREEN = "\x05"
	ErrorInfo = {}
	ErrorInfoFunc =
	{
		add = function(name, filepath)
		{
			if (!(name in this))
				this[name] <- {};
			local filename = filepath.slice(21);
			local errtext = ("\x03" + name + "\x01" + "'s file broken, pls check: " + "\x04" + "left4dead2/ems/survivor_death_lines/" + "\x03" + filename + "\n");
			this[name][filename] <- errtext;
		}
		
		print = function(host, name = null)
		{
			if (name == null)
			{
				foreach (logs in this)
				{
					foreach (msg in logs)
					{
						if (host)
							ClientPrint(host, 3, msg);
						else
							error(msg);
					}
				}
				this.clear();
			}
			else if (name in this)
			{
				foreach (msg in delete this[name])
				{
					if (host)
						ClientPrint(host, 3, msg);
					else
						error(msg);
				}
			}
			else
			{
				Log("Unknown name: " + name);
			}
		}
	}
	
	function Log(text)
	{
		if (text == null)
		{
			printl("[LXC]  " + text);
			return;
		}
		
		local txt = null;
		while ((txt = text.tostring().find("\n")) != null)
		{
			if (txt == 0)
			{
				printl("");
				//Log(text.slice(txt, txt + 1));
			}
			else
			{
				printl("[LXC]  " + text.slice(0, txt));
				if (txt + 1 == text.len()) //if "\n" is the last character, print a blank line
					printl("");
				//Log(text.slice(txt, txt + 1));
			}
			
			text = text.slice(txt + 1);
		}
		
		if (text != null && text != "")
			printl("[LXC]  " + text);
	}
	
	function ErrorLog(text)
	{
		if (text == null)
		{
			error("[LXC]  " + text + "\n");
			return;
		}
		
		local txt = null;
		while ((txt = text.tostring().find("\n")) != null)
		{
			if (txt == 0)
			{
				printl("");
			}
			else
			{
				error("[LXC]  " + text.slice(0, txt) + "\n");
				if (txt + 1 == text.len()) //if "\n" is the last character, print a blank line
					printl("");
			}
			
			text = text.slice(txt + 1);
		}
		
		if (text != null && text != "")
			error("[LXC]  " + text + "\n");
	}
	
	function PrintException(exception, func)
	{
		local funcinfo = func.getinfos();
		error("AN ERROR HAS OCCURED [" + exception + "]\n*FUNCTION [" + funcinfo.name + "()] " + funcinfo.src + "\n");
	}
	
	function GetHostPlayer()
	{
		return GetListenServerHost();
	}
	
	function IsAdmin(player)
	{
		return player && player.IsValid() && player == GetHostPlayer();
	}
	
	function RemoveRegisteredGameEvent(scopeRemove, eventName, globalTableName)
	{
		local GameEventTable = (globalTableName in getroottable()) ? getroottable()[globalTableName] : (typeof(globalTableName) == "table" ? globalTableName : null);
		if (!GameEventTable)
			return;
		
		if (eventName in GameEventTable)
		{
			local list = GameEventTable[eventName];
			foreach (idx, scope in list)
			{
				if (scope == scopeRemove)
				{
					list.remove(idx);
					break;
				}
			}
		}
	}
	
	function GetActorFromSurvivor(survivor, SURIVORSET_L4D1 = 1, SURIVORSET_L4D2 = 2)
	{
		//local actor = survivor.GetContext("who"); //ResponseCriteria.GetValue(survivor, "who");
		//if (actor in Scenes)
		//	return actor;
		
		local survivorset = Director.GetSurvivorSet();
		local characterid = NetProps.GetPropInt(survivor, "m_survivorCharacter");
		switch (characterid)
		{
			case 0:											//Nick		//Bill
				return (survivorset == SURIVORSET_L4D2) ? "Gambler" : "NamVet";
			case 1:											//Rochelle	//Zoey
				return (survivorset == SURIVORSET_L4D2) ? "Producer" : "TeenGirl";
			case 2:											//Coach		//Louis
				return (survivorset == SURIVORSET_L4D2) ? "Coach" : "Manager";
			case 3:											//Ellis		//Francis
				return (survivorset == SURIVORSET_L4D2) ? "Mechanic" : "Biker";
			
			case 4:											//Nick		//Bill
				return (survivorset == SURIVORSET_L4D1) ? "Gambler" : "NamVet";
			case 5:											//Rochelle	//Zoey
				return (survivorset == SURIVORSET_L4D1) ? "Producer" : "TeenGirl";
			case 6:											//Ellis		//Francis
				return (survivorset == SURIVORSET_L4D1) ? "Mechanic" : "Biker";
			case 7:											//Coach		//Louis
				return (survivorset == SURIVORSET_L4D1) ? "Coach" : "Manager";
		}
		
		// support [VScript] Custom Survivor Takeover (CST)
		local CustomActor = survivor.GetContext("who");
		if (typeof(CustomActor) == "string" && CustomActor != "")
		{
			//Log("Custom Survivor: " + CustomActor);
			return CustomActor;
		}
		
		return "Unknown";
		
		//if use "VScript Survivor Manager" spawn bots，should not use "rr_GetResponseTargets()" in l4d1 map，will get wrong actor name.
		//2024.02.16 Shadowysn fixed it, but still has problem if duplicate survivor in team.
		//foreach (name, handle in rr_GetResponseTargets())
		//{
		//	if (handle == survivor)
		//		return name;
		//}
	}
	
	function GetDeathReasonLines(Actor, damagetype)
	{
		foreach (type, lines in ScenesDeathReason[Actor])
		{
			if ((damagetype & type) == type)
				return lines;
		}
		return null;
	}
	
	function GetRandomLinesFromScenesTable(actor, scenesTable)
	{
		//default
		local lines = "/Blank.vcd";
		
		local list = scenesTable[actor];
		local rand = RandomInt(0, list.len());
		local idx = 1;
		foreach (scene, index in list)
		{
			if (idx >= rand)
			{
				if (index.len() > 0)
					lines = "/" + scene + index[RandomInt(0, index.len() - 1)] + ".vcd";
				break;
			}
			idx++;
		}
		
		return "scenes/" + actor + lines;
	}
	
	function GetRandomLines(player, damagetype)
	{
		local Actor = GetActorFromSurvivor(player);
		if (!(Actor in Scenes) || Mute[ActorList[Actor]])
			return null;
		
		if (damagetype != null && ScenesDeathReason[Actor].len() > 0)
		{
			local list = GetDeathReasonLines(Actor, damagetype)
			if (list)
			{
				if (list.len() <= 0) //no lines, mute
					return null;
				local randline = list[RandomInt(0, list.len() - 1)];
				local scenes = randline in ScenesDeathReasonOnly[Actor] ? ScenesDeathReasonOnly[Actor][randline] : (randline in Scenes[Actor] ? Scenes[Actor][randline] : 0);
				if (scenes) //if its an exists scene
				{
					randline = scenes.len() > 0 ? randline + scenes[RandomInt(0, scenes.len() - 1)] : "Blank";
				}
				local vcd = "scenes/" + Actor + "/" + randline + ".vcd";
				//printl("damage type: " + damagetype + " --- vcd: " + vcd);
				return vcd;
			}
		}
		
		if (Scenes[Actor].len() <= 0)
			return null;
		
		local vcd = GetRandomLinesFromScenesTable(Actor, Scenes);
		//printl(vcd);
		return vcd;
	}
	
	function GetCustomSoundParams(player)
	{
		local actor = GetActorFromSurvivor(player);
		if (actor in CustomSurvivorsActorList)
		{
			try
			{
				local sound_cfg = FileToString("custom_talker/" + actor.tolower() + "/settings.cfg");
				if (sound_cfg)
				{
					local cfg = compilestring("return " + sound_cfg)();
					
					local volume = RandomFloat(cfg.volume_min, cfg.volume_max);
					local soundlevel = cfg.soundlevel;
					local pitch = RandomInt(cfg.pitch_min, cfg.pitch_max);
					
					if (cfg.pitch_offsets_models.len() > 0)
					{
						local survmodel = player.GetModelName().tolower();
						foreach (id, model in cfg.pitch_offsets_models)
						{
							if (survmodel == model.tolower())
							{
								if (id <= cfg.pitch_offsets.len() - 1)
									pitch += cfg.pitch_offsets[id];
								break;
							}
						}
					}
					
					local settings = ::Yeoh_Custom_Talker.Settings;
					if (settings.pitch_offsets_names.len() > 0)
					{
						local survname = player.GetPlayerName();
						foreach (id, name in settings.pitch_offsets_names)
						{
							if (survname == name)
							{
								if (id <= settings.pitch_offsets.len() - 1)
									pitch += settings.pitch_offsets[id];
								break;
							}
						}
					}
					
					return { volume = volume, soundlevel = soundlevel, pitch = pitch };
				}
			}
			catch(exception)
			{
				//
			}
		}
		
		return { volume = 1, soundlevel = 80, pitch = 100 };
	}
	
	function GetWaveFromSceneFile(sceneFile, rexp = regexp(@"scenes/(.+)\.vcd"))
	{
		local soundFile = "";
		local results = rexp.capture(sceneFile);
		if (results)
		{
			soundFile = "player/survivor/voice/" + sceneFile.slice(results[1].begin, results[1].end) + ".wav";
			if (!IsSoundPrecached(soundFile))
			{
				PrecacheSound(soundFile);
				if (!IsSoundPrecached(soundFile))
					soundFile = "";
			}
		}
		return soundFile;
	}
	
	function PlaySoundOn(player, sound)
	{
		if (sound != "")
		{
			if (!IsSoundPrecached(sound))
				PrecacheSound(sound);
			
			local time = GetSoundDuration(sound, null);
			if (time != 0)
			{
				//EmitAmbientSoundOn(string soundName, float volume, int soundlevel, int pitch, handle entity)
				EmitAmbientSoundOn(sound, LastOneAnnouncer.Volume, 55, 100, player);
				LastSoundFile[player.GetPlayerUserId()] <- { file = sound, time = Time() + time };
				
				return time;
			}
		}
		return 0.0;
	}
	
	function PlaySoundFromSceneFile(player, sceneFile)
	{
		local wav = GetWaveFromSceneFile(sceneFile);
		if (wav != "")
		{
			local time = GetSoundDuration(wav, null);
			if (time != 0)
			{
				local p = GetCustomSoundParams(player);
				EmitAmbientSoundOn(wav, p.volume, p.soundlevel, p.pitch, player);
				LastSoundFile[player.GetPlayerUserId()] <- { file = wav, time = Time() + time };
				
				return time;
			}
		}
		return 0.0;
	}
	
	function SurvivorDeathScream(player, damagetype = null)
	{
		local vcd = GetRandomLines(player, damagetype);
		if (vcd == null)
			return 0.0;
		
		//https://steamcommunity.com/app/211/discussions/1/3127164056426070221/
		//Looking at the code, the deley parameter is a post delay to prevent the character from speaking this long after the scene.
		local time = player.PlayScene(vcd, 0.0);
		
		//0 means that the scene file probably does not exist, we try to play the audio file
		//L4D2 survivors only has the "fall" audio file, no scene file, but why?
		if (time == 0)
			time = PlaySoundFromSceneFile(player, vcd);
		
		return time;
	}
	/*
	//after they died, i could still hear some noises, i must be hallucinating...
	function DelayScream(player, vcd)
	{
		local state = NetProps.GetPropInt(player, "m_lifeState");
		if (state != 0)
		{
			NetProps.SetPropInt(player, "m_lifeState", 0);
			if (vcd.find(".vcd"))
				player.PlayScene(vcd, 0.0);
			else
				SurvivorDeathScream(player);
			NetProps.SetPropInt(player, "m_lifeState", state);
		}
	}
	function SurvivorDeathScreamDelay(player, vcd = "", delay = 0.0)
	{
		DoEntFire("!self", "RunScriptCode", @"::L4D2Lxc_SDL.DelayScream(self, """ + vcd + @""");", delay, null, player);
	}
	*/
	
	function ResumeTestScream()
	{
		if (typeof(TestScream) == "generator" && Time() >= TestScreamTimeStamp)
			resume TestScream;
	}
	
	function SetTimer(duration)
	{
		local type = typeof(duration);
		if (type != "integer" && type != "float")
			duration = 1;
		
		if (duration > 5)
			duration = 5;
		
		TestScreamTimeStamp = Time() + duration;
		DoEntFire("worldspawn", "RunScriptCode", "::L4D2Lxc_SDL.ResumeTestScream();", duration, null, null);
	}
	
	function TestSurvivorScream(who, testlist)
	{
		local actor = "";
		while (who = Entities.FindByClassname(who, "player"))
		{
			if (who.IsValid() && who.IsSurvivor() && (actor = GetActorFromSurvivor(who)) in testlist)
			{
				local state = NetProps.GetPropInt(who, "m_lifeState");
				NetProps.SetPropInt(who, "m_lifeState", 0);
				local name = ActorList[actor];
				local mutestate = Mute[name];
				Mute[name] = 0;
				StopAmbientSoundOnPlayer(who.GetPlayerUserId());
				local delay = SurvivorDeathScream(who);
				if (delay == 0)
				{
					local vcd = GetRandomLinesFromScenesTable(actor, ScenesDeathReasonOnly);
					delay = who.PlayScene(vcd, 0.0);
					if (delay == 0)
						delay = PlaySoundFromSceneFile(who, vcd);
				}
				Mute[name] = mutestate;
				NetProps.SetPropInt(who, "m_lifeState", state);
				delete testlist[actor];
				
				yield SetTimer(delay);
			}
		}
		TestScream = null;
		return;
	}
	
	// play a sound file by EmitAmbientSoundOn() can not auto stop last one, so we do it self. 
	function StopAmbientSoundOnPlayer(playerID)
	{
		if (!(playerID in LastSoundFile))
			return;
		
		local sound = delete LastSoundFile[playerID];
		//if (sound.time >= Time())
			StopAmbientSoundOn(sound.file, GetPlayerFromUserID(playerID));
	}
	
	function Announcer()
	{
		if (AnnouncerTimeStamp == 0 || Time() < AnnouncerTimeStamp)
			return;
		
		local alive = null;
		local who = null;
		while (who = Entities.FindByClassname(who, "player"))
		{
			if (who.IsValid() && who.IsSurvivor() && !who.IsDying() && !who.IsDead())
			{
				if (!alive)
					alive = who;
				else // not alone
				{
					StopAnnouncer();
					AnnouncerTimeStamp = 0;
					return;
				}
			}
		}
		if (!alive || IsPlayerABot(alive))
			return;
		
		StopAmbientSoundOnPlayer(alive.GetPlayerUserId());
		PlaySoundOn(alive, LastOneAnnouncer.SoundFile);
	}
	
	function StopAnnouncer()
	{
		foreach (id, val in clone LastSoundFile)
		{
			if (val.file == LastOneAnnouncer.SoundFile)
				StopAmbientSoundOnPlayer(id);
		}
	}
	
	function TriggerAnnouncer()
	{
		if (!LastOneAnnouncer.Enable || LastOneAnnouncer.SoundFile == "")
			return;
		
		AnnouncerTimeStamp = Time() + LastOneAnnouncer.Delay;
		DoEntFire("worldspawn", "RunScriptCode", "::L4D2Lxc_SDL.Announcer();", LastOneAnnouncer.Delay, null, null);
	}
	
	function OnGameEvent_player_death(params)
	{
		//it seems that when a survivor dies, the value is always empty
		//printl("victimname = " + params["victimname"]);
		if (params["victimname"] == "" && "userid" in params)
		{
			TriggerAnnouncer();
			
			local damagetype = "type" in params ? params["type"] : null;
			local player = GetPlayerFromUserID(params["userid"]);
			
			//death survivor can not speak, but...
			local state = NetProps.GetPropInt(player, "m_lifeState");
			NetProps.SetPropInt(player, "m_lifeState", 0);
			
			StopAmbientSoundOnPlayer(params["userid"]);
			SurvivorDeathScream(player, damagetype);
			
			//rest in peace...
			NetProps.SetPropInt(player, "m_lifeState", state);
		}
	}
	
	function OnGameEvent_player_spawn(params)
	{
		StopAmbientSoundOnPlayer(params["userid"]);
	}
	
	function OnGameEvent_player_team(params)
	{
		StopAmbientSoundOnPlayer(params["userid"]);
	}
	
	function OnGameEvent_player_disconnect(params)
	{
		StopAmbientSoundOnPlayer(params["userid"]);
	}
///////
	function AddToTempList(actor, key, val = "")
	{
		local linesTable = TempList[actor];
		if (!(key in linesTable))
			linesTable[key] <- [val];
		else if (linesTable[key].find(val) == null)
			linesTable[key].append(val);
	}
	
	function SplitKeyVal(index, OrigStr, Actor, String, rexp = regexp(@"(?:World\d|World\a+0[1-9]|[A-Z]*[A-Z]?[a-zA-Z]?)?(?:C\d(?:M\d[A-Z]?)?|_M60|_Phase\d|Break\d|Gen\d)?([A-Z]?\d+\a?$)"), rexp2 = regexp(@"^\a+$"))
	{
		local results = rexp.capture(String);
		if (results)
		{
			local begin = results[1].begin;
			AddToTempList(Actor, String.slice(0, begin), String.slice(begin));
		}
		else if (rexp2.match(String))
		{
			AddToTempList(Actor, String);
		}
		else
			return;
		
		if (TempAddContent[Actor].find(OrigStr) == null)
			TempAddContent[Actor].append(OrigStr);
		NewAddContent[index] = "";
	}
	
	function HandleString(index, OrigStr, rexp = regexp(@"(?:scenes|voice)[/\\](\a+)[/\\](.+)\.(?:vcd|wav)")) //support vcd & wav
	{
		local results = rexp.capture(OrigStr);
		if (results)
		{
			local actor = OrigStr.slice(results[1].begin, results[1].end);
			if (actor in TempList)
			{
				SplitKeyVal(index, OrigStr, actor, OrigStr.slice(results[2].begin, results[2].end));
			}
		}
	}
	
	function SplitGenerator(string, separator, len)
	{
		local index = 0;
		local idx = null;
		while ((idx = string.find(separator)) != null)
		{
			index += idx + len;
			yield { str = string.slice(0, idx), index = index };
			string = string.slice(idx + len);
		}
		if ((string = rstrip(string)) != "")
			yield { str = string, index = index + string.len() };
		
		return;
	}
	
	//return lines key, and check is it commented out, also check the key is duplicated.
	function GetLinesKey(str, idx, tableContent, rexp = regexp(@"([a-zA-Z0-9_]+)\s*=.*"))
	{
		local results = rexp.capture(str);
		if (results)
		{
			local c = str.find("//");
			local begin = results[1].begin;
			local end = results[1].end;
			local lines = str.slice(begin, end);
			
			if (c == null || c > begin)
				return [1, lines, str.slice(0, begin), str.slice(str.find("]"))];
			else if (tableContent.find(lines, idx) == null)
				return [2, lines];
		}
		return [0];
	}
	
	function MergeToMain(Temp, Main)
	{
		local host = GetHostPlayer();
		
		foreach (actor, tmplinesTbl in Temp)
		{
			local name = ActorList[actor];
			local filepath = GetFilePathFromActor(actor, name);
			local FileString = LoadActorLinesFromFile(actor, name, filepath);
			if (typeof(FileString) != "table")
			{
				if (!FileString)
				{
					FileString = ReleaseDefaultFile(actor, name, true);
				}
				else
				{
					ErrorLog(name + "'s file has problem, can not add new lines, please check it first");
					if (Initialized)
						ErrorInfo.print(host, name);
					
					NewAddContent.extend(TempAddContent[actor]);
					
					continue;
				}
			}
			
			local newCount = tmplinesTbl.len();
			if (newCount <= 0)
				continue;
			
			if (!(actor in Main))
				Main[actor] <- {};
			
			local MainTable = Main[actor];
			
			local commentCount = 0;
			local partMiddle = "";
			
			local tableContent = FileString.table.slice(1, FileString.table.len() - 1);
			foreach (row in SplitGenerator(tableContent, "\n", 1))
			{
				local str = row.str;
				local lineskey = GetLinesKey(str, row.index, tableContent);
				switch (lineskey[0])
				{
					case 0: //not find
					{
						partMiddle += str + "\n";
						break;
					}
					case 1: //find key
					{
						local key = lineskey[1];
						local old = MainTable[key];
						if (key in tmplinesTbl)
						{
							local tmparray = delete tmplinesTbl[key];
							local newArray = tmparray.filter(function(index, value) { return (old.find(value) == null); });
							old.extend(newArray);
						}
						old.sort();
						partMiddle += lineskey[2] + key + (old.len() > 0 ? " = [\"" + old.reduce(@(a, b) a + "\", \"" + b) + "\"" : " = [") + lineskey[3] + "\n";
						break;
					}
					case 2: //find unused key
					{
						local key = lineskey[1];
						if (key in tmplinesTbl)
						{
							commentCount++;
							local tmparray = delete tmplinesTbl[key];
							tmparray.sort();
							MainTable[key] <- tmparray;
							partMiddle += str + "\n\t" + key + " = [\"" + tmparray.reduce(@(a, b) a + "\", \"" + b) + "\"]\n";
						}
						else
							partMiddle += str + "\n";
						break;
					}
				}
			}
			
			local count = 0;
			local newAdded = array(tmplinesTbl.len() + 1, "");
			foreach (key, val in tmplinesTbl)
			{
				val.sort();
				MainTable[key] <- val;
				newAdded[++count] = key;
			}
			newAdded.sort();
			partMiddle += newAdded.reduce(@(str, key) str + "\t" + key + " = [\"" + MainTable[key].reduce(@(a, b) a + "\", \"" + b) + "\"]\n");
			newAdded.clear();
			
			local partBegin = RStripEachLine(FileString.begin);
			local partEnd = RStripEachLine(FileString.end);
			
			Log(name + "'s file has " + (newCount - count - commentCount) + " exists lines updated and " + (count + commentCount) + " new lines added");
			
			StringToFile(filepath, partBegin + partMiddle + partEnd);
		}
	}
	
	function AutoImportData(string)
	{
		foreach (actor, name in ActorList)
		{
			TempList[actor] <- {};
			TempAddContent[actor] <- [];
		}
		
		NewAddContent = split(string, "\", \t\r\n");
		foreach (index, val in NewAddContent)
			HandleString(index, val);
		
		MergeToMain(TempList, Scenes);
		
		//clear and save added failed or unqualified string
		local left = NewAddContent.filter(@(index, value) value != "");
		if (left.len() > 0)
			Log("Not all content added, pls check \"left4dead2/ems/survivor_death_lines/addnew.txt\"");
		left.sort();
		left.insert(0, "");
		StringToFile(AddNewFilePath, left.reduce(@(a, b) a + "\"" + b + "\"\n"));
		
		TempList.clear();
		NewAddContent.clear();
		TempAddContent.clear();
	}
///////
	//https://developer.electricimp.com/squirrel/regexp/regexp
	function doMatch(rexp, compString, fixedString, rexpClear = regexp(@"[,""\]\s]+"))
	{
		if (compString == "")
			return compString;
		
		// Try to match
		local firstMatch = rexp.search(compString);
		
		// Run through the matches if there are any, ie. results != null
		if (firstMatch != null)
		{
			// firstMatch is a table with two keys: 'begin' and 'end'
			// Get the sub-string from the test string using these indices
			local subString = compString.slice(firstMatch.begin, firstMatch.end);
			
			// Print the results
			//printl("Match: " + subString);
			if (fixedString == "")
				fixedString += "[\"" + subString;
			else
				fixedString += "\", \"" + subString;
			
			local cutString = compString.slice(firstMatch.end);
			if (cutString == "") //end of string
				return fixedString + "\"]";
			return doMatch(rexp, cutString, fixedString);
		}
		else
		{
			//printl("No match");
			if (fixedString == "")
				return compString;
			
			local clrString = rexpClear.search(compString);
			if (clrString != null)
				compString = compString.slice(clrString.end);
			
			return fixedString + "\"]" + (compString != "" ? " //" + compString : "");
		}
	}
	
	function FormatString(errString, rexpKey = regexp(@"([a-zA-Z0-9_]+)\s*=(.*)"), rexpVal = regexp(@"\a*\d+\a?"), rexpNotspace = regexp(@"\S+"))
	{
		if (errString == "")
			return errString;
		
		local key = "";
		local val = "";
		
		local results = rexpKey.capture(errString);
		if (results)
		{
			local begin = results[1].begin;
			if (begin == 0 || rexpNotspace.search(errString.slice(0, begin)) == null)
			{
				key = "\t" + errString.slice(begin, results[1].end) + " = ";
				val = strip(errString.slice(results[2].begin, results[2].end));
			}
		}
		if (key == "" || val == "")
			return errString;
		
		val = doMatch(rexpVal, val, "");
		
		return key + val;
	}
	
	function SplitStringGenerator(string, separator, len)
	{
		local index;
		while ((index = string.find(separator)) != null)
		{
			yield string.slice(0, index);
			string = string.slice(index + len);
		}
		if ((string = rstrip(string)) != "")
			yield string;
		
		return;
	}
	
	function GetTable(string, rexpTable = regexp(@"{}|{.*}")) //yeah，"{.*}" not catch "{}"  :/
	{
		if (string == "")
			return string;
		
		local tbl = "";
		local findtbl = rexpTable.search(string);
		if (findtbl != null)
			tbl = string.slice(findtbl.begin, findtbl.end);
		return tbl;
	}
	
	// return the table after key name
	function GetTableFromKeyName(key, string, rexpTable = regexp(@"{}|{.*}"))
	{
		if (key == "" || string == "")
			return "";
		
		// only search the first match place
		local tbl = "";
		local index = string.find(key);
		if (index != null)
		{
			local findtbl = rexpTable.search(string.slice(index));
			if (findtbl != null)
				tbl = string.slice(index + findtbl.begin, index + findtbl.end);
		}
		return tbl;
	}
	
	// return the table after key name and the rest
	function SplitTableFromKeyName(key, string, rexpTable = regexp(@"{}|{.*}"))
	{
		if (key == "" || string == "")
			return null;
		
		// only search the first match place
		local ret = null;
		local index = string.find(key);
		if (index != null)
		{
			local findtbl = rexpTable.search(string.slice(index));
			if (findtbl != null)
			{
				local begin = index + findtbl.begin;
				local end = index + findtbl.end;
				local tbl = string.slice(begin, end);
				
				// begin = ".*{", table = "{.*}", end = "}.*"
				ret = { begin = string.slice(0, begin + 1), table = tbl, end = string.slice(end - 1) };
			}
		}
		return ret;
	}
	
	function RStripEachLine(string)
	{
		local ret = "";
		local idx = null;
		while ((idx = string.find("\n")) != null)
		{
			ret += rstrip(string.slice(0, idx)) + "\n";
			string = string.slice(idx + 1);
		}
		ret += rstrip(string);
		
		return ret;
	}
	
	function TryToFixFileContent(actor, name, filepath, filecontent, rexpComment = regexp(@"\s*//.*"))
	{
		local fixedString = "";
		
		local partTable = filecontent.table.slice(1, filecontent.table.len() - 1);
		local idx = 0;
		foreach (row in SplitStringGenerator(partTable, "\n", 1))
		{
			//find comment and cut it
			local strings = rstrip(row);
			local results = rexpComment.capture(strings);
			if (results)
			{
				local begin = results[0].begin;
				if (begin == 0)
					fixedString += strings + "\n";
				else
				{
					local str = strings.slice(0, begin);
					fixedString += FormatString(str) + " " + strings.slice(begin) + "\n";
				}
			}
			else
			{
				if (idx == 0 && strings != "")
					fixedString += "\n";
				fixedString += FormatString(strings) + "\n";
			}
			idx++
		}
		
		//printl("fixedString = \n" + fixedString);
		try
		{
			local fixedTable = "{" + fixedString + "}";
			local tbl = compilestring("return " + fixedTable)();
			if (tbl.len() <= 0)
			{
				if (actor in Scenes)
					Scenes[actor].clear();
				Log(name + "'s \"VoiceLines\" fix successful and is empty");
			}
			else
			{
				Scenes[actor] <- tbl;
				Log(name + "'s \"VoiceLines\" fix successful and loaded");
			}
			
			local partBegin = RStripEachLine(filecontent.begin);
			local partEnd = RStripEachLine(filecontent.end);
			fixedString = partBegin + fixedString + partEnd;
			
			StringToFile(filepath, fixedString);
			return { begin = partBegin, table = fixedTable, end = partEnd };
		}
		catch(exception)
		{
			ErrorLog(name + "'s \"VoiceLines\" fix failed, use default lines");
			PrintException(exception, TryToFixFileContent);
			ErrorInfo.add(name, filepath);
		}
		
		return true;
	}
	
	function GetFilePathFromActor(actor, name)
	{
		return (actor in CustomSurvivorsActorList ? CustomFolder : LinesFolder) + name + ".txt"
	}
	
	function LoadActorLinesFromFile(actor, name, filepath, fileContents = null)
	{
		if (!fileContents && !(fileContents = FileToString(filepath)))
			return false;
		
		local linesData = SplitTableFromKeyName("\"VoiceLines\"", fileContents);
		if (!linesData)
		{
			ErrorLog(name + "'s \"VoiceLines\" loading error and can not be fixed, use default lines");
			ErrorInfo.add(name, filepath);
			return true;
		}
		
		try
		{
			local tbl = compilestring("return " + linesData.table)();
			if (tbl.len() <= 0)
			{
				if (actor in Scenes)
					Scenes[actor].clear();
				Log(name + "'s \"VoiceLines\" is empty");
			}
			else
			{
				Scenes[actor] <- tbl;
				Log(name + "'s \"VoiceLines\" loaded");
			}
			
			return linesData;
		}
		catch(exception)
		{
			ErrorLog(name + "'s \"VoiceLines\" loading error");
			PrintException(exception, LoadActorLinesFromFile);
			return TryToFixFileContent(actor, name, filepath, linesData);
		}
		
		return true;
	}
	
	function ReleaseDefaultFile(actor, name, needContent = false)
	{
		local linesdata = BuildDefaultVoiceLinesCFG(actor, name);
		local deathreasondata = BuildDefaultDeathReasonCFG(actor, name);
		
		local FileContent = linesdata + deathreasondata + "\n";
		
		StringToFile(GetFilePathFromActor(actor, name), FileContent);
		Log(name + "'s file has been recreated");
		
		if (needContent)
			return SplitTableFromKeyName("\"VoiceLines\"", FileContent);
	}
	
	function BuildDefaultVoiceLinesCFG(actor, name)
	{
		local defaultContent = 
		[
			"",
			"\"VoiceLines\"",
			"{",
				"\tDeathScream = [\"01\", \"02\"]",
				"\t//HurtCritical = [\"01\", \"02\", \"03\", \"04\"]",
			"}",
			"",
		];
		switch (actor)
		{
			case "NamVet":
			{
				defaultContent[0] = "//Bill as NamVet";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\", \"08\"]";
				defaultContent[4] = "\t//HurtCritical = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\", \"08\", \"09\"]";
				break;
			}
			case "TeenGirl":
			{
				defaultContent[0] = "//Zoey as TeenGirl";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\", \"08\", \"09\", \"10\", \"11\"]";
				defaultContent[4] = "\t//HurtCritical = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\"]";
				break;
			}
			case "Biker":
			{
				defaultContent[0] = "//Francis as Biker";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\", \"08\", \"09\", \"10\"]";
				defaultContent[4] = "\t//HurtCritical = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\", \"08\", \"09\", \"10\", \"11\"]";
				break;
			}
			case "Manager":
			{
				defaultContent[0] = "//Louis as Manager";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\", \"08\", \"09\", \"10\"]";
				defaultContent[4] = "\t//HurtCritical = [\"01\", \"02\", \"03\", \"04\", \"05\"]";
				break;
			}
			//l4d2
			case "Gambler":
			{
				defaultContent[0] = "//Nick as Gambler";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\"]";
				defaultContent[4] = "\t//HurtCritical = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\"]";
				break;
			}
			case "Producer":
			{
				defaultContent[0] = "//Rochelle as Producer";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\"]";
				defaultContent[4] = "\t//HurtCritical = [\"01\", \"02\", \"03\", \"04\"]";
				break;
			}
			case "Coach":
			{
				defaultContent[0] = "//Coach as Coach";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\", \"08\", \"09\"]";
				defaultContent[4] = "\t//HurtCritical = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\", \"08\"]";
				break;
			}
			case "Mechanic":
			{
				defaultContent[0] = "//Ellis as Mechanic";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\"]";
				defaultContent[4] = "\t//HurtCritical = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\"]";
				defaultContent.insert(5, "\t//EllisStories = [\"A01\", \"A02\", \"B01\", \"B02\", \"C01\", \"D01\", \"E01\", \"F01\", \"G01\", \"H01\", \"I01\", \"J01\", \"K01\", \"L01\", \"M01\", \"N01\", \"P01\", \"Q01\", \"R01\", \"S01\", \"T01\", \"U01\", \"V01\"]");
				break;
			}
			//[VScript] Custom Survivor Takeover (CST)
			case "Yusuke":
			{
				defaultContent[0] = "//Custom Survivor: Yusuke";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\"]";
				defaultContent.remove(4);
				break;
			}
			case "Sara":
			{
				defaultContent[0] = "//Custom Survivor: Sara";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\"]";
				defaultContent.remove(4);
				break;
			}
			case "Haruka":
			{
				defaultContent[0] = "//Custom Survivor: Haruka";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\", \"07\", \"08\", \"09\"]";
				defaultContent.remove(4);
				break;
			}
			case "Blake":
			{
				defaultContent[0] = "//Custom Survivor: Blake";
				defaultContent[3] = "\tDeathScream = [\"01\", \"02\", \"03\", \"04\", \"05\", \"06\"]";
				defaultContent.remove(4);
				break;
			}
			default: //Other Custom Survivors
			{
				defaultContent[0] = "//Custom Survivor: " + actor;
				defaultContent.remove(4);
			}
		}
		
		local FileContent = defaultContent.reduce(@(a, b) a + "\n" + b);
		//very slow
		//local FileContent = "";
		//foreach (line in defaultContent)
		//	FileContent += line + "\n";
		//printl(FileContent);
		
		local str = GetTable(FileContent);
		local tbl = compilestring("return " + str)();
		Scenes[actor] <- tbl;
		
		return FileContent;
	}
	
	function LoadActorDeathReasonLinesFromFile(actor, name, filepath, fileContents = null)
	{
		if (!fileContents && !(fileContents = FileToString(filepath)))
			return false;
		
		local deathreasonData = SplitTableFromKeyName("\"DeathReason\"", fileContents);
		if (!deathreasonData)
		{
			ErrorLog(name + "'s \"DeathReason\" load failed");
			ErrorInfo.add(name, filepath);
			return true;
		}
		
		try
		{
			local main = Scenes[actor];
			local temp = {};
			local tempOnly = {};
			local tbl = compilestring("return " + deathreasonData.table)();
			foreach (key, val in tbl)
			{
				local type = key.toupper();
				if (type in DamageTypes)
				{
					foreach (i, v in val)
					{
						if (v.find("-") == 0)
						{
							v = v.len() > 1 ? v.slice(1) : "";
							val[i] = v;
							
							if (v in main)
								tempOnly[v] <- delete main[v];
						}
					}
					temp[DamageTypes[type]] <- val;
				}
				else
					ErrorLog(name + "'s \"DeathReason\" has unknown Damage Type：" + type);
			}
			ScenesDeathReason[actor] <- temp;
			ScenesDeathReasonOnly[actor] <- tempOnly;
		}
		catch(exception)
		{
			ErrorLog(name + "'s \"DeathReason\" loading error");
			PrintException(exception, LoadActorDeathReasonLinesFromFile);
			ErrorInfo.add(name, filepath);
		}
		
		return true;
	}
	
	function BuildDefaultDeathReasonCFG(actor, name)
	{
		local defaultContent =
		[
			"\"DeathReason\"",
			"{",
				"\t//DMG_FALL = []",
				"\t//DMG_DROWN = []",
				"\t//DMG_HEADSHOT = []",
			"}",
			"",
		];
		switch (actor)
		{
			case "NamVet":
			{
				defaultContent[4] = "\t//DMG_HEADSHOT = [\"NiceShot02\"]";
				break;
			}
			case "TeenGirl":
			{
				defaultContent[4] = "\t//DMG_HEADSHOT = [\"NiceShot05\"]";
				break;
			}
			case "Biker":
			{
				defaultContent[4] = "\t//DMG_HEADSHOT = [\"NiceShot01\"]";
				break;
			}
			case "Manager":
			{
				defaultContent[4] = "\t//DMG_HEADSHOT = [\"NiceShot03\"]";
				break;
			}
			//l4d2
			case "Gambler":
			{
				defaultContent[4] = "\t//DMG_HEADSHOT = [\"NiceShot03\"]";
				break;
			}
			case "Producer":
			{
				defaultContent[4] = "\t//DMG_HEADSHOT = [\"NiceShot01\"]";
				break;
			}
			case "Coach":
			{
				defaultContent[4] = "\t//DMG_HEADSHOT = [\"NiceShot06\"]";
				break;
			}
			case "Mechanic":
			{
				defaultContent[4] = "\t//DMG_HEADSHOT = [\"NiceShot07\"]";
				break;
			}
			//[VScript] Custom Survivor Takeover (CST)
			//case "Yusuke":
			//case "Sara":
			//case "Haruka":
			//case "Blake":
			//default: //Other Custom Survivors
			//	break;
		}
		
		local FileContent = defaultContent.reduce(@(a, b) a + "\n" + b);
		
		local str = GetTable(FileContent);
		local tbl = compilestring("return " + str)();
		ScenesDeathReason[actor] <- tbl;
		
		return FileContent;
	}
	
	// return table and the rest
	function SplitTable(string, rexpTable = regexp(@"{}|{.*}"))
	{
		if (!string || string == "")
			return null;
		
		local ret = null;
		local findtbl = rexpTable.search(string);
		if (findtbl != null)
		{
			local tbl = string.slice(findtbl.begin, findtbl.end);
			local begin = string.slice(0, findtbl.begin);
			local end = string.slice(findtbl.end);
			ret = { begin = begin, table = tbl, end = end };
		}
		return ret;
	}
	
	// add key name
	function TransformToNewFormat(keyname, old)
	{
		local part = SplitTable(old);
		if (!part)
			return false;
		
		local begin = strip(part.begin);
		if (begin != "")
			begin += "\n";
		
		return begin + keyname + "\n" + part.table + rstrip(part.end) + "\n";
	}
	
	function MigrateOldFiles()
	{
		if (FileToString(SettingsFilePath))
			return;
		
		local mutefile = FileToString("survivor_death_lines/mute.txt");
		if (mutefile && strip(mutefile) != "")
		{
			mutefile = TransformToNewFormat("\"Mute\"", mutefile);
			if (mutefile)
			{
				local announcerdata = BuildAnnouncerCFG(true);
				local FileContent = announcerdata + mutefile + "\n";
				
				StringToFile(SettingsFilePath, FileContent);
				
				// empty old files
				StringToFile("survivor_death_lines/mute.txt", "");
				Log("migration \"mute.txt\" succeeded");
			}
			else
				Log("migration \"mute.txt\" failed");
		}
		
		foreach (actor, name in ActorList)
		{
			local linesfile = FileToString(EMSFolder + name + ".txt");
			local death_reasonfile = FileToString(EMSFolder + name + "_death_reason.txt");
			if ((!linesfile || strip(linesfile) == "") && (!death_reasonfile || strip(death_reasonfile) == ""))
				continue;
			
			local linesdata = TransformToNewFormat("\"VoiceLines\"", linesfile);
			if (!linesdata)
			{
				linesfile = null;
				linesdata = BuildDefaultVoiceLinesCFG(actor, name);
			}
			local deathreasondata = TransformToNewFormat("\"DeathReason\"", death_reasonfile);
			if (!deathreasondata)
			{
				death_reasonfile = null;
				deathreasondata = BuildDefaultDeathReasonCFG(actor, name);
			}
			
			StringToFile(GetFilePathFromActor(actor, name), linesdata + deathreasondata + "\n");
			
			// empty old files
			if (linesfile)
				StringToFile(EMSFolder + name + ".txt", "");
			if (death_reasonfile)
				StringToFile(EMSFolder + name + "_death_reason.txt", "");
			
			Log("migration \"" + name + ".txt\" " + (linesfile ? "succeeded, \"" : "failed, \"") + name + "_death_reason.txt\" " + (death_reasonfile ? "succeeded" : "failed"));
		}
	}
	
	function UpdateSettings(scope, content)
	{
		foreach (key, val in content)
		{
			if (key in scope)
				scope[key] = val;
		}
	}
	
	// add double quotes
	function PackageString(text)
	{
		if (typeof(text) != "string")
			return text;
		
		local delDouble = split(text, "\"");
		return "\"" + (delDouble.len() > 0 ? delDouble.reduce(@(a, b) a + b) : "") + "\"";
	}
	
	function BuildAnnouncerCFG(reset = false)
	{
		local content =
		[
			"\"LastOneAnnouncer\"",
			"{",
				"\tEnable = " + (reset ? 0 : LastOneAnnouncer.Enable),
				"\tSoundFile = " + (reset ? "\"\"" : PackageString(LastOneAnnouncer.SoundFile)),
				"\tVolume = " + (reset ? 1 : LastOneAnnouncer.Volume),
				"\tDelay = " + (reset ? 0 : LastOneAnnouncer.Delay),
			"}",
			"",
		];
		
		local announcerata = content.reduce(@(a, b) a + "\n" + b);
		
		if (reset)
		{
			local str = GetTable(announcerata);
			local tbl = compilestring("return " + str)();
			LastOneAnnouncer <- tbl;
		}
		
		return announcerata;
	}
	
	function WriteAnnouncerCFG(reset = false)
	{
		local announcerdata = BuildAnnouncerCFG(reset);
		local mutedata = BuildMuteCFG();
		
		local FileContent = announcerdata + mutedata + "\n";
		
		StringToFile(SettingsFilePath, FileContent);
		Log("setting \"LastOneAnnouncer\" has been " + (reset ? "recreated" : "updated"));
	}
	
	function LoadAnnouncerCFG(settingsfileContent = null)
	{
		if (!settingsfileContent && !(settingsfileContent = FileToString(SettingsFilePath)))
		{
			ReleaseDefaultSettingsFile();
			return;
		}
		
		local announcerData = GetTableFromKeyName("\"LastOneAnnouncer\"", settingsfileContent);
		if (announcerData != "")
		{
			try
			{
				local tbl = compilestring("return " + announcerData)();
				UpdateSettings(LastOneAnnouncer, tbl);
				//Log("Setting LastOneAnnouncer loaded");
			}
			catch(exception)
			{
				ErrorLog("setting \"LastOneAnnouncer\" loading error");
				PrintException(exception, LoadAnnouncerCFG);
				//WriteAnnouncerCFG(reset);
			}
		}
		else
		{
			Log("setting \"LastOneAnnouncer\" was not found");
			WriteAnnouncerCFG(true);
		}
	}
	
	function BuildMuteCFG(reset = false)
	{
		if (reset)
		{
			foreach (name, val in Mute)
			{
				if (name != "SDL_delimiter")
					Mute[name] = 0;
			}
		}
		
		local mutecfg = Mute;
		local cfg = "\"Mute\"\n{" + MuteNameSort.reduce(@(str, key) str + "\n\t" + (key != "SDL_delimiter" ? key + " = " : "") + mutecfg[key]) + "\n}\n";
		
		return cfg;
	}
	
	function WriteMuteCFG(reset = false)
	{
		local announcerdata = BuildAnnouncerCFG();
		local mutedata = BuildMuteCFG(reset);
		
		local FileContent = announcerdata + mutedata + "\n";
		
		StringToFile(SettingsFilePath, FileContent);
		Log("setting \"Mute\" has been " + (reset ? "recreated" : "updated"));
	}
	
	function LoadMuteCFG(settingsfileContent = null)
	{
		if (!settingsfileContent && !(settingsfileContent = FileToString(SettingsFilePath)))
		{
			ReleaseDefaultSettingsFile();
			return;
		}
		
		local muteData = GetTableFromKeyName("\"Mute\"", settingsfileContent);
		if (muteData != "")
		{
			try
			{
				local mute = clone Default.Mute;
				local mutenamesort = clone Default.MuteNameSort;
				local custom = {};
				
				local tbl = compilestring("return " + muteData)();
				foreach (name, val in tbl)
				{
					if (name in mute)
						mute[name] = val;
					else
						custom[name] <- val;
				}
				
				local update = false;
				foreach (name in CustomSurvivorsActorList)
				{
					if (!(name in tbl)) //plus new custom survivors
					{
						custom[name] <- 0;
						update = true;
					}
				}
				if (custom.len() > 0)
				{
					mute["SDL_delimiter"] <- "\n\t// Custom Survivors";
					mutenamesort.append("SDL_delimiter");
					
					foreach (name, val in custom)
					{
						mute[name] <- val;
						mutenamesort.append(name);
					}
					
					if (muteData.find("// Custom Survivors") == null)
						update = true;
				}
				
				Mute = mute;
				MuteNameSort = mutenamesort;
				
				if (update)
					WriteMuteCFG();
				//Log("setting \"Mute\" loaded");
			}
			catch(exception)
			{
				ErrorLog("setting \"Mute\" loading error and will be reset");
				PrintException(exception, LoadMuteCFG);
				WriteMuteCFG(true);
			}
		}
		else
		{
			Log("setting \"Mute\" was not found");
			WriteMuteCFG(true);
		}
	}
	
	function ReleaseDefaultSettingsFile()
	{
		local announcerdata = BuildAnnouncerCFG(true);
		local mutedata = BuildMuteCFG(true);
		
		local FileContent = announcerdata + mutedata + "\n";
		
		StringToFile(SettingsFilePath, FileContent);
		Log("settings file has been recreated");
	}
	
	function LoadSettings()
	{
		local settingsData = FileToString(SettingsFilePath);
		if (settingsData)
		{
			try
			{
				LoadAnnouncerCFG(settingsData);
				LoadMuteCFG(settingsData);
			}
			catch(exception)
			{
				ErrorLog("settings file loading error, please check it");
				PrintException(exception, LoadSettings);
			}
		}
		else
			ReleaseDefaultSettingsFile();
	}
	
	function AddNewLines()
	{
		local NewData = FileToString(AddNewFilePath);
		if (!NewData)
		{
			StringToFile(AddNewFilePath, "");
		}
		else if (strip(NewData) != "")
		{
			AutoImportData(NewData);
			return true;
		}
	}
	
	function LoadVoiceLines()
	{
		if (AddNewLines())
			return;
		
		foreach (actor, name in ActorList)
		{
			local filepath = GetFilePathFromActor(actor, name);
			local fileContents = FileToString(filepath);
			if (fileContents)
			{
				LoadActorLinesFromFile(actor, name, filepath, fileContents);
				LoadActorDeathReasonLinesFromFile(actor, name, filepath, fileContents);
			}
			else
				ReleaseDefaultFile(actor, name);
		}
	}
	
	function ReleaseInformation()
	{
		local info = GetInformation();
		
		local fileContents = FileToString(InfoFilePath);
		if (fileContents && strip(fileContents) == info)
			return;
		
		StringToFile(InfoFilePath, info + "\n\n");
		Log("Information file has been recreated");
	}
		
	function GetCSTProfileCFG()
	{
		local CST_settings = ::Custom_Survivor_Takeover.Settings;
		
		if ("profile_cfgs" in CST_settings)
		{
			foreach (cfg in CST_settings.profile_cfgs)
				yield cfg;
		}
		
		if ("profile_cfgs_shuffled" in CST_settings)
		{
			foreach (cfg in CST_settings.profile_cfgs_shuffled)
				yield cfg;
		}
		
		return;
	}
	
	// support [VScript] Custom Survivor Takeover (CST)
	function FindCustomSurvivors()
	{
		// CST and [VScript] Base Custom Talker must be enabled
		local root = getroottable();
		if (!("Custom_Survivor_Takeover" in root) || !("Yeoh_Custom_Talker" in root) || !("Custom_Talker_Base" in root))
			return;
		
		CustomSurvivorsActorList.clear();
		try
		{
			// get Actor from loaded custom survivors
			foreach (surv in GetCSTProfileCFG())
			{
				local surv_cfg = FileToString("custom_survivor_takeover/profiles/" + surv);
				if (!surv_cfg)
					continue;
				
				local cfg = compilestring("return " + surv_cfg)();
				foreach (voice_name in cfg.random_voice_names)
				{
													// need voice package
					if (voice_name in ActorList || !FileToString("custom_talker/" + voice_name.tolower() + "/settings.cfg"))
						continue;
					
					CustomSurvivorsActorList[voice_name] <- voice_name.tolower();
				}
			}
		}
		catch(exception)
		{
			return;
		}
		
		// merge into main scope
		if (CustomSurvivorsActorList.len() > 0)
		{
			Mute["SDL_delimiter"] <- "\n\t// Custom Survivors";
			MuteNameSort.append("SDL_delimiter");
			
			foreach (actor, name in CustomSurvivorsActorList)
			{
				Mute[name] <- 0;
				MuteNameSort.append(name);
				ActorList[actor] <- name;
			}
		}
	}
	
	function LoadConfig()
	{
		Mute = clone Default.Mute;
		MuteNameSort = clone Default.MuteNameSort;
		ActorList = clone Default.ActorList;
		
		FindCustomSurvivors();
		
		MigrateOldFiles();
		
		LoadSettings();
		LoadVoiceLines();
		ReleaseInformation();
	}
	
	function OnScriptLoad()
	{
		if (FirstLoad)
		{
			//"director_base_addon.nut" will load twice, skip the first time
			FirstLoad = false;
			Initialized = false;
			return;
		}
		FirstLoad = true; //if round restarts, this will fix something
		
		Initialize();
	}
	
	function Initialize()
	{
		if (Initialized)
			return;
		
		Msg("\n[LXC]  Start loading Survivor Death Lines...\n");
		
		ErrorInfo.setdelegate(ErrorInfoFunc);
		LoadConfig();
		Initialized = true;
		
		Msg("[LXC]  Initialize END\n\n");
	}
	
	function ReloadConfig(player)
	{
		ErrorInfo.clear();
		
		Msg("\n[LXC]  Reloading Survivor Death Lines...\n");
		
		LoadConfig();
		
		Msg("[LXC]  Reload END\n\n");
		
		ErrorInfo.print(player);
	}
	
	function ResetConfig(cmd, actor, name)
	{
		MuteSurvivor("unmute", actor, name);
		ReleaseDefaultFile(actor, name);
		Log(name + "'s file reset completed");
	}
	
	function MuteSurvivor(cmd, actor, name)
	{
		Mute[name] = cmd == "mute" ? 1 : 0;
		Log(name + " is " + cmd + "d");
	}
	
	function GetSurvivors(name)
	{
		local teaml4d = (name == "l4d" || name == "l4d1" || name == "all");
		local teaml4d2 = (name == "l4d2" || name == "all");
		local custom = (name == "custom" || name == "all");
		switch (name)
		{
			case "all":
			case "l4d": case "l4d1":
			case "bill": case "b":
			{
				yield { actor = "NamVet", name = "bill" };
				if (!teaml4d)
					return;
			}
			case "zoey": case "z":
			{
				yield { actor = "TeenGirl", name = "zoey" };
				if (!teaml4d)
					return;
			}
			case "francis": case "f":
			{
				yield { actor = "Biker", name = "francis" };
				if (!teaml4d)
					return;
			}
			case "louis": case "l":
			{
				yield { actor = "Manager", name = "louis" };
				if (!teaml4d2)
					return;
			}
			
			case "l4d2":
			case "nick": case "n":
			{
				yield { actor = "Gambler", name = "nick" };
				if (!teaml4d2)
					return;
			}
			case "rochelle": case "r":
			{
				yield { actor = "Producer", name = "rochelle" };
				if (!teaml4d2)
					return;
			}
			case "coach": case "c":
			{
				yield { actor = "Coach", name = "coach" };
				if (!teaml4d2)
					return;
			}
			case "ellis": case "e":
			{
				yield { actor = "Mechanic", name = "ellis" };
				if (!custom)
					return;
			}
			
			case "custom":
			{
				foreach (a, n in CustomSurvivorsActorList)
					yield { actor = a, name = n };
				
				return;
			}
			default:
			{
				foreach (a, n in CustomSurvivorsActorList)
				{
					if (n == name)
					{
						yield { actor = a, name = n };
						return;
					}
				}
				
				Log("wrong name: " + name);
				return;
			}
		}
		return;
	}
	
	function SaveChangesToFile(cmd)
	{
		switch (cmd)
		{
			case "mute":
			case "unmute":
			case "reset":
				WriteMuteCFG(cmd == "reset");
				break;
			//case "":
		}
	}
	
	function StringToFloat(string)
	{
		try
		{
			string = string.tofloat();
		}
		catch(exception)
		{
			string = null;
		}
		
		return string;
	}
	
	function StringToInteger(string)
	{
		try
		{
			string = string.tointeger();
		}
		catch(exception)
		{
			string = null;
		}
		
		return string;
	}
	
	function OnGameEvent_player_say(params)
	{
		local text = params["text"].tolower();
		if (text.find("!sdl ") != 0)
			return;
		
		local player = GetPlayerFromUserID(params["userid"]);
		if (!IsAdmin(player))
			return;
		
		local args = split(text.slice(5), ", ");
		local cmd = args[0];
		local cmdfunc = null;
		switch (cmd)
		{
			case "reload":
				ReloadConfig(player);
				break;
			case "mute":
			case "unmute":
				cmdfunc = MuteSurvivor;
			case "reset":
				if (cmdfunc == null)
					cmdfunc = ResetConfig;
				
				LoadMuteCFG(); //respect mute.txt
				
				local c = 0;
				local param = (args.len() > 1 ? args[1] : "all");
				foreach (surv in GetSurvivors(param))
				{
					cmdfunc(cmd, surv.actor, surv.name);
					c++;
				}
				if (c)
					SaveChangesToFile(cmd);
				break;
			case "test":
				TestScream = null;
				
				local list = {};
				local param = (args.len() > 1 ? args[1] : "all");
				foreach (surv in GetSurvivors(param))
					list[surv.actor] <- 1;
				if (list.len() > 0)
				{
					TestScream = TestSurvivorScream(null, list);
					SetTimer(0.03); //resume TestScream;
				}
				break;
			case "ancr":
				local param = (args.len() > 1 ? args[1] : null);
				if (!param)
					break;
				local c = 0;
				local val = (args.len() > 2 ? args[2] : null);
				switch (param)
				{
					case "reset":
						WriteAnnouncerCFG(true);
						break;
					case "play":
					case "stop":
						foreach (key, val in LastOneAnnouncer)
							printl(key + " = " + PackageString(val));
						
						StopAmbientSoundOnPlayer(player.GetPlayerUserId());
						if (param == "play" && LastOneAnnouncer.SoundFile != "")
							DoEntFire("!self", "RunScriptCode", @"::L4D2Lxc_SDL.PlaySoundOn(self, ::L4D2Lxc_SDL.LastOneAnnouncer.SoundFile);", 0.03, null, player);
						break;
					case "enable":
						if (!val)
							printl("LastOneAnnouncer.Enable = " + LastOneAnnouncer.Enable);
						else if ((val = StringToInteger(val)) != null)
						{
							LastOneAnnouncer.Enable = (val > 0).tointeger();
							c++;
						}
						break;
					case "file":
						if (!val)
							printl("LastOneAnnouncer.SoundFile = " + PackageString(LastOneAnnouncer.SoundFile));
						else
						{
							local fix = split(val, "\\");
							val = fix.reduce(@(a, b) a + "/" + b);
							val = split(val, "\"").reduce(@(a, b) a + b);
							
							LastOneAnnouncer.SoundFile = val;
							c++;
						}
						break;
					case "volume":
						if (!val)
							printl("LastOneAnnouncer.Volume = " + LastOneAnnouncer.Volume);
						else if ((val = StringToFloat(val)) != null)
						{
							LastOneAnnouncer.Volume = (val > 1.0 ? 1.0 : (val < 0.0 ? 0.0 : val));
							c++;
						}
					case "delay":
						if (!val)
							printl("LastOneAnnouncer.Delay = " + LastOneAnnouncer.Delay);
						else if ((val = StringToFloat(val)) != null)
						{
							LastOneAnnouncer.Delay = val;
							c++;
						}
						break;
				}
				if (c)
					WriteAnnouncerCFG();
				break;
			default:
				return;
		}
	}
	
	function OnGameEvent_item_pickup(params)
	{
		Initialize();
		
		ErrorInfo.print(GetHostPlayer());
		RemoveRegisteredGameEvent(::L4D2Lxc_SDL, "item_pickup", "GameEventCallbacks");
	}
}
IncludeScript("survivor_death_lines_string", ::L4D2Lxc_SDL);

