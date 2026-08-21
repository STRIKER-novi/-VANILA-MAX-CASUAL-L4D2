local scrver = 20260703;
Convars.SetValue("sv_consistency", 0);Convars.SetValue("sv_pure_kick_clients", 0);Convars.SetValue("r_rootlod", 0);

if (!("MANACAT" in getroottable())){
	::MANACAT <- {}
	for(local i = 0; i < 8; i++)::MANACAT["category"+i] <- [0]
}

::manacatLib<-{
	world = Entities.First()
	ignoreEnt = Entities.FindByClassname(null, "cs_team_manager")
	ver = scrver

	seed = {}
	seed_set = false
	seed_func = []
	hintList = {}
	hints = {}
	hintpoints = {}
	hinttime = 0
	hintdelay = 0.0

	survivor = []
	infected = []
	tank = []

	chkpdoor_start = null
	chkpdoor_end = null
	nav_finale = []
	nav_player_start = []
	nav_checkpoint_start = []
	nav_checkpoint_end = []
	nav_escape_route = []

	flag_purgeDupItem = false

	function OnGameEvent_player_connect(params){
		if(!("name" in params) || !("networkid" in params))return;
		if(params.networkid != "BOT"){
			local p = null;
			while (p = Entities.FindByClassname(p, "player")){
				if(p != null && p.IsValid()){
					local msg = lang(p);
					switch(msg){
						case "kr":msg = params["name"]+" 님이 게임에 참가하고 있습니다.";break;
						case "jp":msg = "プレイヤー "+params["name"]+" がゲームに参加しています";break;
						case "es":msg = "El jugador "+params["name"]+" esta ENTRANDO";break;
						case "sc":msg = "玩家 "+params["name"]+" 正在加入游戏";break;//간체
						case "tc":msg = "玩家 "+params["name"]+" 正在加入遊戲";break;//번체
						case "ru":msg = "Игрок "+params["name"]+" вступает в игру";break;
						case "th":msg = "ผู้เล่น "+params["name"]+" กำลังเข้าเกม";break;
						case "pl":msg = "Gracz "+params["name"]+" łączący się do gry";break;
						case "de":msg = "Spieler "+params["name"]+" tritt dem Spiel bei";break;
						case "it":msg = "Il giocatore "+params["name"]+" si sta unendo alla partita";break;
						case "fr":msg = "Le joueur "+params["name"]+" rejoint la partie";break;
						case "pt":msg = params["name"]+" está entrando na partida";break;
						case "br":msg = params["name"]+" está entrando no partida";break;
						case "nl":msg = "Speler "+params["name"]+" doet mee aan het spel";break;
						case "vn":msg = params["name"]+" đang vào trận";break;
						default:  msg = "Player "+params["name"]+" is joining the game";break;
					}
					ClientPrint(p, 5, "\x01"+msg);
				}
			}
		}
	}

	function OnGameEvent_player_say(params){
		local p = GetPlayerFromUserID(params.userid);
		local chat = params.text.tolower();
		chat = split(chat," ");
		local chatlen = chat.len();
		if(chatlen > 0){
			switch(chat[0]){
				case "!addon": case "!add-on": case "!mod": case "!info":
					local l = lang(p);
					switch(l){
						case "kr":l = "이 세션에 적용된 애드온 목록입니다.";break;
						case "jp":l = "このセッションに適用されたアドオンのリストです。";break;
						case "es":l = "Lista de add-ons aplicados a esta sesión.";break;
						case "sc":l = "适用于此会话的附加组件列表。";break;
						case "tc":l = "適用於此會話的附加組件列表。";break;
						case "ru":l = "Список дополнений активных в этом сеансе.";break;
						case "th":l = "รายการม็อดต่อไปนี้จะถูกใช้งานในด่านนี้.";break;
						case "pl":l = "Lista Addonow Dodana w Tej Sesji";break;
						case "de":l = "Liste von add-ons die angewendet werden in der sitzung";break;
						case "it":l = "Lista di add-on attivi in questa sessione.";break;
						case "fr":l = "Liste des add-ons appliqués à cette session.";break;
						case "pt":l = "Lista de add-ons adicionados/aplicados nesta sessão.";break;
						case "br":l = "Lista de conteúdos personalizados aplicados para essa sessão.";break;
						case "nl":l = "Lijst van uitbreidingen toegepast op deze sessie.";break;
						case "vn":l = "Danh sách add-ons áp dụng trong trận này.";break;
						default:  l = "List of add-ons applied to this session.";break;
					}
					ClientPrint(p, 5, "\x03"+l);
					local slotn = 0;
					for(local i = 0; i < 8; i++){
						for(local j = 1; j <= ::MANACAT["category"+i][0]; j++){
							printTitle(::MANACAT["category"+i][j], p, l);	slotn++;
						}
					}
				break;
				case "!seed":
					ClientPrint(p, 5, "\x03"+::manacatLib.lang(p, ::manacat_common_lang, "seed"));
					local preset = FileToString("manacat/rs.txt");
					local map = GetMapName();
					if(preset != null && preset != ""){
						local lines = split(preset, "\n");
						preset = lines[0].tointeger();
						foreach(mapname, seed in ::manacatLib.seed){
							if(mapname == map[0] || mapname == map[1])	ClientPrint( p, 5, "\x02 - "+mapname+" \x01 : "+preset);
							else										ClientPrint( p, 5, "\x02 - "+mapname+"  : "+preset);
						}
					}else{
						foreach(mapname, seed in ::manacatLib.seed){
							if(mapname == map[0] || mapname == map[1])	ClientPrint( p, 5, "\x02 - "+mapname+" \x01 : "+seed);
							else										ClientPrint( p, 5, "\x02 - "+mapname+"  : "+seed);
						}
					}
				break;
			}
		}
	}

	function OnGameEvent_round_start_pre_entity(params){
		rs();
	}

	function OnGameEvent_round_start_post_nav(params){
		nav_categorize();
		tracking();
	}

	function hostname_v(){
		local hostname = Convars.GetStr("hostname");
		if(hostname.find("library") == null){
			local host = GetListenServerHost();
			if(host == null){
				if(hostname == "")hostname = "Null";
				Convars.SetValue("hostname", hostname + "\nlibrary : " + scrver);
			}else{
				local pname = host.GetPlayerName();
				if(hostname == "")hostname = pname;
				if(hostname == pname)Convars.SetValue("hostname", hostname + "\nlibrary : " + scrver);
			}
		}
	}

	function OnGameEvent_player_spawn(params){	census();	GetPlayerFromUserID(params.userid).ValidateScriptScope();	DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacatLib.hostname_v()" , 0.1 , null, world);}
	function OnGameEvent_bot_player_replace(params){	census();	}
	function OnGameEvent_player_bot_replace(params){	census();	}
	function OnGameEvent_player_disconnect(params){	DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacatLib.census()" , 0.0 , null, world);	}
	function OnGameEvent_player_team(params){	census();	}
	function OnGameEvent_witch_spawn(params){	census();	}
	function OnGameEvent_witch_killed(params){	census();	}
	function OnGameEvent_player_death(params){	census();	}

	function census(){
		::manacatLib.survivor = [];		::manacatLib.infected = [];		::manacatLib.tank = [];

		for(local p = null; (p = Entities.FindByClassname(p, "player")) != null && p.IsValid();){
			if(p.IsDead() || p.IsDying())continue;
			switch(NetProps.GetPropInt( p, "m_iTeamNum" )){
				case 2:case 4:
					::manacatLib.survivor.append(p);
				break;
				case 3:
					if(!p.IsIncapacitated()){
						::manacatLib.infected.append(p);
						if(p.GetZombieType() == 8)::manacatLib.tank.append(p);
					}
				break;
			}
		}

	//	for(local w = null; (w = Entities.FindByClassname(w, "witch")) != null && w.IsValid();){
	//		if(NetProps.GetPropInt( w, "m_iHealth" ) > 0)::manacatLib.infected.append(w);
	//	}
	}

	function OnGameEvent_player_transitioned(params){
		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacatLib.purgeDupItem()" , 0.1 , null, world);
	}

	function purgeDupItem(){//장대비 2챕터에서 3챕터로 넘어갈 때, 은신처 바로 앞 테이블에 아이템이 있으면 3챕터에서 2개로 복제됨
		if(flag_purgeDupItem)return;	flag_purgeDupItem = true;
		local items = [];
		for(local i = 0, list = [	"molotov", "pipe_bomb", "vomitjar", "first_aid_kit", "defibrillator", "pain_pills", "adrenaline",
									"pistol", "pistol_magnum", "smg", "smg_silenced", "smg_mp5" "rifle", "rifle_ak47", "rifle_desert", "rifle_sg552", "rifle_m60",
									"pumpshotgun", "shotgun_chrome", "autoshotgun", "shotgun_spas", "hunting_rifle", "sniper_military", "sniper_awp", "sniper_scout",
									"grenade_launcher", "chainsaw", "melee" "upgradepack_incendiary", "upgradepack_explosive"]; i < 30; i++){
			for(local ent = null; (ent = Entities.FindByClassname(ent , "weapon_"+list[i]+"_spawn")) != null && ent.IsValid();)items.append(ent);
			for(local ent = null; (ent = Entities.FindByClassname(ent , "weapon_"+list[i])) != null && ent.IsValid();)if(NetProps.GetPropEntity( ent, "m_hOwner" ) == null)items.append(ent);
		}
		for(local i = 0, len = items.len(); i < len; i++){
			if(items[i] == null || !items[i].IsValid())continue;
			local c1 = items[i].GetClassname();
			local o1 = items[i].GetOrigin();
			local a1 = items[i].GetAngles();	a1 = Vector(a1.x, a1.y, a1.z);
			for(local j = 0; j < len; j++){
				if(items[j] == null || !items[j].IsValid() || i == j)continue;
				local c2 = items[j].GetClassname();	if(c1 != c2)continue;
				local a2 = items[j].GetAngles();	a2 = Vector(a2.x, a2.y, a2.z);	if(a1.x != a2.x || a1.y != a2.y || a1.z != a2.z)continue;
				local o2 = items[j].GetOrigin();
				if((o1 - o2).Length() < 3){
					if(o1.z > o2.z){
						items[i].Kill();	items[i] = null;
					}else{
						items[j].Kill();	items[j] = null;
					}
				}
			}
		}
	}

	function nav_categorize(){
		for(local chkpdoor = null, min = 100, max = 0; (chkpdoor = Entities.FindByClassname(chkpdoor, "prop_door_rotating_checkpoint")) != null && chkpdoor.IsValid();){
			if(NetProps.GetPropInt(chkpdoor, "m_spawnflags") & 32768/*2 << 14*/)continue;
			local flow = GetFlowPercentForPosition(chkpdoor.GetOrigin(), false);
			if (flow < min){
				min = flow;
				chkpdoor_start = chkpdoor;
			}
			if (flow > max){
				max = flow;
				chkpdoor_end = chkpdoor;
			}
		}
		if(chkpdoor_end == null)return;

		local navTable = {};	NavMesh.GetAllAreas(navTable);
		//nav_finale = [];	nav_player_start = [];	nav_checkpoint_start = [];	nav_checkpoint_end = [];	nav_escape_route = [];
		local pos_chkpdoor_start = chkpdoor_start.GetOrigin(), pos_chkpdoor_end = chkpdoor_end.GetOrigin();
		foreach(areaName, nav in navTable){
			if(nav.HasSpawnAttributes(64))nav_finale.append(nav);
			if(nav.HasSpawnAttributes(128))nav_player_start.append(nav);
			if(nav.HasSpawnAttributes(2048)){
				if((nav.GetCenter() - pos_chkpdoor_end).Length() < 2000){
				//	DebugDrawBox(nav.GetCenter(), Vector((nav.GetSizeX()/2)*-1,(nav.GetSizeY()/2)*-1,-12.0), Vector((nav.GetSizeX()/2),(nav.GetSizeY()/2),12.0), 255, 0, 0, 64, 120.0);
					nav_checkpoint_end.append(nav);
				}else if(chkpdoor_start != chkpdoor_end && (nav.GetCenter() - pos_chkpdoor_start).Length() < 2000){
				//	DebugDrawBox(nav.GetCenter(), Vector((nav.GetSizeX()/2)*-1,(nav.GetSizeY()/2)*-1,-12.0), Vector((nav.GetSizeX()/2),(nav.GetSizeY()/2),12.0), 0, 255, 0, 64, 120.0);
					nav_checkpoint_start.append(nav);
				}
			}
			if(nav.HasSpawnAttributes(2048))nav_checkpoint_end.append(nav);
			if(nav.HasSpawnAttributes(131072))nav_escape_route.append(nav);
		}
	}

	function lang(p, txts = null, m = null, txtpr = null, atxts = null, am = null){
		local l = Convars.GetClientConvarValue("cl_language", p.GetEntityIndex());
		switch(l){
			case "korean":case "koreana":l="kr";break;
			case "japanese":l="jp";break;
			case "spanish":l="es";break;
			case "schinese":l="sc";break;
			case "tchinese":l="tc";break;
			case "russian":l="ru";break;
			case "thai":l="th";break;
			case "polish":l="pl";break;
			case "german":l="de";break;
			case "italian":l="it";break;
			case "french":l="fr";break;
			case "portuguese":l="pt";break;
			case "brazilian":l="br";break;
			case "dutch":l="nl";break;
			case "vietnamese":l="vn";break;
			default:l="en";break;
		}

		if(txts != null && m != null){
			if((m+"_"+l) in txts){
				m = txts[m+"_"+l];
			}else if((m+"_en") in txts){
				m = txts[m+"_en"];
			}else if(atxts != null){
				if(am != null){
					if((am+"_"+l) in atxts){
						m = atxts[am+"_"+l];
					}else if((am+"_en") in atxts){
						m = atxts[am+"_en"];
					}
				}else if(!atxts){
					m = "";
				}
			}

			return txtsub(m, txtpr);
		}else{
			return l;
		}
	}

	function txtsub(m, pr){
		if(m.find("^") == null || pr == null)return m;
		
		local txtSplit = split(m, "^");	m = "";
		local prSplit = split(pr.tostring(), "|");
		if(txtSplit[0] == " ")txtSplit[0] = "";
		for(local i = 0, len = txtSplit.len(), prlen = prSplit.len(); i < len; i++){
			m += txtSplit[i];
			if(prlen > i)m += prSplit[i];
		}

		return m;
	}

	function hintpoint(name, origin = Vector(0, 0, 0), parent = null){
		if(!(name in ::manacatLib.hintpoints) || ::manacatLib.hintpoints[name] == null || !::manacatLib.hintpoints[name].IsValid())
			::manacatLib.hintpoints[name] <- g_ModeScript.CreateSingleSimpleEntityFromTable({classname = "info_target_instructor_hint", targetname = "manacat_hint_point_"+name});

		if(parent == null)parent = world;
		
		DoEntFire("!self", "SetParent", "!activator", 0.00, parent, ::manacatLib.hintpoints[name] );
		DoEntFire("!self", "RunScriptCode", "self.SetLocalOrigin( Vector( "+origin.x+", "+origin.y+", "+origin.z+" ) )", 0.03, parent, ::manacatLib.hintpoints[name] );
	}

	function hint(name, show = true, ps = null, params = null){
		if(!(name in hintList) || hintList[name] == null || !hintList[name].IsValid()){
			if(!("color" in params))params.color <- "255 255 255";
			if(!("forcecaption" in params))params.forcecaption <- 0;//0이면 벽 통과 안함, 1이면 벽 통과해서 표시
			if(!("stat" in params))params.stat <- 1;//0이면 타겟에, 1이면 화면고정
			if(!("offscr" in params))params.offscr <- "";
			if(!("onscr" in params))params.onscr <- "";
			if(!("timeout" in params))params.timeout <- 10;
			if(!("pulse" in params))params.pulse <- 0;
			if(!("alpha" in params))params.alpha <- 0;
			hintList[name] <- SpawnEntityFromTable("env_instructor_hint", {
				classname = "env_instructor_hint",
				hint_allow_nodraw_target = "1",
				hint_alphaoption = params.alpha,
				hint_pulseoption = params.pulse,
				hint_caption = "",
				hint_sound = "",
				hint_color = params.color,
				hint_forcecaption = params.forcecaption,//0이면 벽 통과 안함, 1이면 벽 통과해서 표시
				hint_icon_offscreen = params.offscr,
				hint_icon_onscreen = params.onscr,
				hint_instance_type = "2",
				hint_static = params.stat,
				hint_timeout = params.timeout,
				targetname = "manacat_hint_"+name,
			});
		}

		if(params != null){
			if(!("txtpr" in params))params.txtpr <- "";
			if(!("tg" in params))params.tg <- "";
			else	params.tg = params.tg in ::manacatLib.hintpoints?::manacatLib.hintpoints[params.tg].GetName():params.tg;
		}

		if(ps == null){
			if(!show){
				DoEntFire("!self", "EndHint", "", 0.0, null, hintList[name]);
			}else{
				ps = [];
				for(local p = null; (p = Entities.FindByClassname(p, "player")) != null && p.IsValid();){
					if(NetProps.GetPropInt( p, "m_iTeamNum" ) != 2 || IsPlayerABot(p) || p.IsDead() || p.IsDying())continue;
					ps.append(p);
				}
			}
		}else if(typeof ps == "instance" && ps.GetClassname() == "player"){
			ps = [ps];
		}

		if(show){
			for(local p = 0, pl = ps.len(); p < pl; p++){
				if(ps[p] == null || !ps[p].IsValid() || NetProps.GetPropInt( ps[p], "m_iTeamNum" ) != 2 || IsPlayerABot(ps[p]) || ps[p].IsDead() || ps[p].IsDying())continue;
				local currentTime = Time();
				if(hinttime == currentTime){
					hintdelay += 0.033;
				}else{
					hinttime = currentTime;		hintdelay = 0.033;
				}
				local id = hinttime+"_"+hint+"_"+ps[p].GetPlayerUserId();
				hints[id] <- {p = ps[p], hint = hintList[name], m = params.txt, txts = params.txts, pr = params.txtpr, tg = params.tg};
				DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacatLib.hint_show(\""+id+"\")", hintdelay, null, world);
			}
		}else{
			if(ps != null){
				for(local p = 0, pl = ps.len(); p < pl; p++){
					DoEntFire("!self", "EndHint", "", 0.0, ps[p], hintList[name]);
				}
			}
			if("kill" in params)DoEntFire("!self", "Kill", "", 0.0, null, hintList[name]);
		}
	}

	function rs(seed = -1){
		local gm = gamemode(), t = Time(), map = GetMapName(), gamerules = Entities.FindByClassname(null, "terror_gamerules");
		RestoreTable("manacatSD", ::manacatLib.seed);

		if(::manacatLib.seed.len() == 0 || (gm == "coop" && t < 10 && Director.IsSessionStartMap()) || 
		gm == "survival" || (gm == "versus" && t < 10
		&& NetProps.GetPropInt(gamerules, "terror_gamerules_data.m_iCampaignScore.000")+NetProps.GetPropInt(gamerules, "terror_gamerules_data.m_iCampaignScore.001") == 0)){
			::manacatLib.seed.clear();
		}

		if((gm == "coop" || gm == "survival" || (gm == "versus" && t < 20))
		&& NetProps.GetPropInt(gamerules, "terror_gamerules_data.m_iChapterScore.000")+NetProps.GetPropInt(gamerules, "terror_gamerules_data.m_iChapterScore.001") == 0){
			if(map[0] == map[1] || !(map[0] in ::manacatLib.seed)){
				::manacatLib.seed[map[0]] <- seed == -1?RandomInt(0,9999):seed;
				StringToFile("manacat/rs_log.txt", ::manacatLib.seed[map[0]]+"\n"+map[0]);
			}
		}

		rs_ini();
		SaveTable("manacatSD", ::manacatLib.seed);
		::manacatLib.seed_set = true;
	}

	function rs_ini(salt1 = null, salt2 = null){
		RestoreTable("manacatSD", ::manacatLib.seed);
		local seed, preset = FileToString("manacat/rs.txt");
		if(preset != null && preset != ""){
			local lines = split(preset, "\n");
			seed = lines[0].tointeger();
		}else{
			local map = ::manacatLib.GetMapName();
			if(map[0] in ::manacatLib.seed){
				seed = ::manacatLib.seed[map[0]];
			}else{
				seed = ::manacatLib.seed[map[1]];
			}
		}

		if(salt1 != null){
			seed = seed ^ ((abs(salt1.x) * 100000).tointeger() + 0x9e3779b9 + (seed << 6) + (seed >> 2));
			seed = seed ^ ((abs(salt1.y) * 100000).tointeger() + 0x9e3779b9 + (seed << 6) + (seed >> 2));
			seed = seed ^ ((abs(salt1.z) * 100000).tointeger() + 0x9e3779b9 + (seed << 6) + (seed >> 2));
		}
		if(salt2 != null){
			seed = seed ^ ((abs(salt2.x) * 100000).tointeger() + 0x9e3779b9 + (seed << 6) + (seed >> 2));
			seed = seed ^ ((abs(salt2.y) * 100000).tointeger() + 0x9e3779b9 + (seed << 6) + (seed >> 2));
			seed = seed ^ ((abs(salt2.z) * 100000).tointeger() + 0x9e3779b9 + (seed << 6) + (seed >> 2));
		}

		srand(seed);
	}

	function rs_chk(){
		local map = ::manacatLib.GetMapName();
		if(map[0] in ::manacatLib.seed || map[1] in ::manacatLib.seed)return true;
		return false;
	}

	function rnd(min, max){
		if(typeof min == "integer" && typeof max == "integer")return min + rand() % (max - min + 1);
		else return min + (rand().tofloat() / RAND_MAX) * (max - min);
	}

	function round(n, f=0){
		f = pow(10, f);
		n *= f;
		n = (n >= 0) ? floor(n + 0.5) : ceil(n - 0.5);
		return n / f;
	}

	function hint_show(id){
		local caption = txtsub(lang(hints[id].p, hints[id].txts, hints[id].m), hints[id].pr)

		NetProps.SetPropString(hints[id].hint, "m_iszCaption", caption);
		if(hints[id].tg != "")NetProps.SetPropString(hints[id].hint, "m_iszHintTargetEntity", hints[id].tg);
		DoEntFire("!self", "ShowHint", "", 0.0, hints[id].p, hints[id].hint);
		hints.rawdelete(id);
		return;
	}

	function printTitle(title, p, l){
		local msg = "t_"+l;
		if(!(msg in ::MANACAT[title])){
			msg = ::MANACAT[title]["t_en"];
		}
		ClientPrint( p, 5, "\x02 - "+msg+" \x01 v"+::MANACAT[title].ver);
	}

	function rng_caralarm(){
		local r = RandomInt(1,2);
		if(r == 1)	return "vehicles/car_alarm/car_alarm2.wav"
		else if(r == 2)	return "vehicles/car_alarm/car_alarm.wav"
	}

	function rng_color(){
		local r = RandomInt(1,7), g, b;
		if(r == 1)	{ r = 239; g=155; b=155 } //R
		else if(r == 2)	{ r = 128; g=167; b=128 } //G
		else if(r == 3)	{ r = 176; g=204; b=225 } //B
		else if(r == 4)	{ r = 239; g=191; b=36 } //Y
		else				{ r = 235; g=235; b=235 } //W

		r += RandomInt(-15,15);
		g += RandomInt(-15,15);
		b += RandomInt(-15,15);

		return r+" "+g+" "+b;
	}

	function findPlayer(p){
		switch(typeof p){
			case "table":
				if("id" in p)p = p.id;
			case "integer":
				p = p.tostring();
			case "string":
				switch(p){
					case "0": case "gambler": case "models/survivors/survivor_gambler.mdl":p="models/survivors/survivor_gambler.mdl";break;
					case "1": case "producer": case "models/survivors/survivor_producer.mdl":p="models/survivors/survivor_producer.mdl";break;
					case "2": case "coach": case "models/survivors/survivor_coach.mdl":p="models/survivors/survivor_coach.mdl";break;
					case "3": case "mechanic": case "models/survivors/survivor_mechanic.mdl":p="models/survivors/survivor_mechanic.mdl";break;
					case "4": case "namvet": case "models/survivors/survivor_namvet.mdl":p="models/survivors/survivor_namvet.mdl";break;
					case "5": case "teengirl": case "models/survivors/survivor_teenangst.mdl":p="models/survivors/survivor_teenangst.mdl";break;
					case "6": case "manager": case "models/survivors/survivor_manager.mdl":p="models/survivors/survivor_manager.mdl";break;
					case "7": case "biker": case "models/survivors/survivor_biker.mdl":p="models/survivors/survivor_biker.mdl";break;
					default: return null;
				}
				return findPlayerByModel(p);
			case "instance":
				return p;
			default:
				return null;
		}
	}

	function findPlayerByModel(m){
		for(local p = null; (p = Entities.FindByClassname(p, "player")) != null && p.IsValid();)
			if(NetProps.GetPropInt( p, "m_iTeamNum" ) == 2 && p.GetModelName() == m)return p;
		return null;
	}

	function getCharacter(player){
		switch(typeof player){
			case "instance":
				if(!player.IsValid())return null;
				player = player.GetModelName();
			case "integer":case "string":
				if(typeof player == "integer")player = player.tostring();
				switch(player){
					case "0": case "models/survivors/survivor_gambler.mdl":player=[0,"gambler","n"];break;
					case "1": case "models/survivors/survivor_producer.mdl":player=[1,"producer","r"];break;
					case "2": case "models/survivors/survivor_coach.mdl":player=[2,"coach","c"];break;
					case "3": case "models/survivors/survivor_mechanic.mdl":player=[3,"mechanic","e"];break;
					case "4": case "models/survivors/survivor_namvet.mdl":player=[4,"namvet","b"];break;
					case "5": case "models/survivors/survivor_teenangst.mdl":player=[5,"teengirl","z"];break;
					case "6": case "models/survivors/survivor_manager.mdl":player=[6,"manager","l"];break;
					case "7": case "models/survivors/survivor_biker.mdl":player=[7,"biker","f"];break;
				}
				return {id = player[0], who = player[1], initial = player[2]};
			case "bool":
				printl("예기치 못한 경우 getCharacterNumber");
				return player;
			default:
				return null;
		}
	}

	function inFOV(ent, params){//visionCheck
		if(!("target" in params)){
			if("ent" in params){
				if(params.ent.GetClassname() == "player")
					params.target <- params.ent.EyePosition();
				else
					params.target <- params.ent.GetOrigin();
			}else{
				return false;
			}
		}
		local startpos = ent.EyePosition();
		local targetNorm = Vector(params.target.x, params.target.y, params.target.z);
		targetNorm.x -= startpos.x;	targetNorm.y -= startpos.y;	targetNorm.z -= startpos.z;
		targetNorm.x = targetNorm.x/targetNorm.Norm();
		targetNorm.y = targetNorm.y/targetNorm.Norm();
		targetNorm.z = targetNorm.z/targetNorm.Norm();

		if(!("eye" in params))params.eye <- ent.EyeAngles().Forward();
		if(!("tol" in params))params.tol <- 50;
		if(!("mask" in params))params.mask <- 33579137;
		if(!("ignore" in params))params.ignore <- ent;

		if(180/PI*acos(params.eye.Dot(targetNorm)) < params.tol){
			if("ent" in params){
				local m_trace = { start = startpos, end = params.target, ignore = params.ignore, mask = params.mask };
				TraceLine(m_trace);
				if("enthit" in m_trace && m_trace.enthit == params.ent){
					return true;
				}else{
					return false;
				}
			}else{
				return true;
			}
		}
		return false;
	}

	function angTo(ent, params){//SI_control_eye
		local eyeVector = ent.GetOrigin();
		if("EyePosition" in ent)eyeVector = ent.EyePosition();

		local vector = params.target - eyeVector;
		local qy = Quaternion();	local qx = Quaternion();
		qy.SetPitchYawRoll(0, 90-atan2(vector.x, vector.y)*180/PI, 0);
		qx.SetPitchYawRoll(atan2(vector.z, sqrt(vector.x*vector.x+vector.y*vector.y))*-180/PI, 0, 0);
		local qr = Quaternion(
			qy.x*qx.x - qy.y*qx.y - qy.z*qx.z - qy.w*qx.w,
			qy.x*qx.y + qy.y*qx.x + qy.z*qx.w - qy.w*qx.z,
			qy.x*qx.z - qy.y*qx.w + qy.z*qx.x + qy.w*qx.y,
			qy.x*qx.w + qy.y*qx.z + qy.z*qx.y + qy.w*qx.x
		).ToQAngle();

		return QAngle(qr.x, qr.y*-1, 0);
	}

	function norm(v){
		local len = sqrt(v.x * v.x + v.y * v.y + v.z * v.z);
		return Vector(v.x / len, v.y / len, v.z / len);
	}

	function CanTraceToLocation(ent, finish, target = null, traceMask = 33579137){
		local begin = ent.GetOrigin() + Vector(0,0,4);
		if(ent.GetClassname() == "player")begin = ent.EyePosition();
		
		local m_trace = { start = begin, end = finish, ignore = ent, mask = traceMask };	TraceLine(m_trace);
		
		if ("pos" in m_trace && m_trace.pos.x == finish.x && m_trace.pos.y == finish.y && m_trace.pos.z == finish.z)
			return true;
		
		if (target != null && "enthit" in m_trace && m_trace.enthit != null && target == m_trace.enthit && m_trace.enthit.IsValid())
			return m_trace.enthit;

		return false;
	}

	function ignore(ignores = []){
		local ents = [];
		for(local i = 0, len = ignores.len(); i < len; i++){
			for(local ent; ent = Entities.FindByClassname(ent, ignores[i]); ) {
				ents.append([ ent, NetProps.GetPropEntity(ent, "m_hOwnerEntity")]);
				NetProps.SetPropEntity(ent, "m_hOwnerEntity", ::manacatLib.ignoreEnt);
			}
		}
		return ents;
	}

	function ignore_restore(ents){
		ents.map(@(p)NetProps.SetPropEntity(p[0],"m_hOwnerEntity",p[1]));
	}

	function gamemode(){
		local mp_gamemodebase = Director.GetGameModeBase();
		local mp_gamemode = Convars.GetStr("mp_gamemode").tolower();

		if(mp_gamemodebase == "coop" || mp_gamemodebase == "realism")return "coop";
		else if(mp_gamemodebase == "versus" || mp_gamemodebase == "scavenge" || mp_gamemode == "mutation15")return "versus";
		else if(mp_gamemodebase == "survival")return "survival";
		else return "coop";
	}

	function GetMapName(){
		local map = Director.GetMapName();
	
		if(map == "c4m3_sugarmill_b")map = "c4m2_sugarmill_a";
		else if(map == "c4m4_milltown_b" || map == "c4m5_milltown_escape")map = "c4m1_milltown_a";

		return [map.tolower(), Director.GetMapName().tolower()];
	}

	function measureSpace(origin, angles = QAngle(0, 0, 0), space = Vector(48, 48, 48)) {
		local forward = angles.Forward(), left = angles.Left(), up = angles.Up(), minOffset = Vector(0,0,0), maxOffset = Vector(0,0,0);

		foreach (entry in [	{ dir = forward,	dist = space.x }, { dir = forward.Scale(-1),	dist = space.x },
							{ dir = left,		dist = space.y }, { dir = left.Scale(-1),		dist = space.y },
							{ dir = up,			dist = space.z }, { dir = up.Scale(-1),			dist = space.z }]) {
			local dir = entry.dir, dist = entry.dist;

			local m_trace = { start = origin, end = origin + dir * dist, mask = 33636363 };		TraceLine(m_trace);
			local actualDist = m_trace.fraction * dist;

			if (actualDist <= 0.0) continue;

			if (dir.x > 0)maxOffset.x = (dir.x * actualDist > maxOffset.x) ? dir.x * actualDist : maxOffset.x;
			else if (dir.x < 0)minOffset.x = (dir.x * actualDist < minOffset.x) ? dir.x * actualDist : minOffset.x;

			if (dir.y > 0)maxOffset.y = (dir.y * actualDist > maxOffset.y) ? dir.y * actualDist : maxOffset.y;
			else if (dir.y < 0)minOffset.y = (dir.y * actualDist < minOffset.y) ? dir.y * actualDist : minOffset.y;

			if (dir.z > 0)maxOffset.z = (dir.z * actualDist > maxOffset.z) ? dir.z * actualDist : maxOffset.z;
			else if (dir.z < 0)minOffset.z = (dir.z * actualDist < minOffset.z) ? dir.z * actualDist : minOffset.z;
		}

		local localCenter = Vector((minOffset.x + maxOffset.x)/2, (minOffset.y + maxOffset.y)/2, (minOffset.z + maxOffset.z)/2);
		local boxCenter = origin + (forward.Scale(localCenter.x) - left.Scale(localCenter.y) - up.Scale(localCenter.z));

		//local rgb = Vector(0, 255, 0);
		//DebugDrawBoxAngles(origin, minOffset, maxOffset, angles, rgb, 128, 60.0);
		//DebugDrawBoxAngles(boxCenter, Vector(-2, -2, -2), Vector(2, 2, 2), angles, rgb, 128, 60.0);

		return {center = boxCenter, min = minOffset, max = maxOffset};
	}

	////////////////////////////////////////////////////////////생존자 컨디션, 전투 텐션 등
	function IsAlone(player, params = {}){
		player = ::manacatLib.findPlayer(player);
		local origin = player.GetOrigin();
		foreach(p in ::manacatLib.survivor){
			if(p == null || !p.IsValid() || p == player || p.IsDead() || p.IsDying()
			|| NetProps.GetPropInt(p, "m_iTeamNum" ) != 2)continue;
			if("dist" in params && (p.GetOrigin() - origin).Length() > params.dist)continue;
			return false;
		}
		return true;
	}

	function ZCheckNearby(ent, distlimit, zlimit=30){//nearZcount
		local dist = 0, zs = 0;
		local entpos = ent.GetOrigin();
		local shead = ent.GetAttachmentOrigin(ent.LookupAttachment("forward"));
		if(shead.x == entpos.x && shead.y == entpos.y && shead.z == entpos.z)shead = ent.GetAttachmentOrigin(ent.LookupAttachment("mouth"));
		
		for(local zombie = null; (zombie = Entities.FindByClassname(zombie, "infected")) != null && zombie.IsValid();){
			if(NetProps.GetPropInt(zombie, "m_iHealth") <= 0)continue;
			local zpos = zombie.GetOrigin();
			dist = (entpos - zpos).Length();
			if(dist < distlimit){
				local zhead = zombie.GetAttachmentOrigin(zombie.LookupAttachment("head"));
			//	DebugDrawBox(zhead, Vector(-2.0,-2.0,-2.0), Vector(2.0,2.0,2.0), 0, 255, 255, 64, 10.0);
				if(CanTraceToLocation(ent, zhead, zombie) && CanTraceToLocation(zombie, shead, ent)){
					zs++;
					if(zs >= zlimit)return zs;
				}
			}
		}

		foreach(zombie in ::manacatLib.infected){
			if(zombie == null || !zombie.IsValid())continue;
			if(zombie.GetZombieType() != 9){
				local zpos = zombie.GetOrigin();
				dist = (entpos - zpos).Length();
				if(dist < distlimit){
					local zhead = zombie.GetAttachmentOrigin(zombie.LookupAttachment("forward"));
					if(zhead.x == zpos.x && zhead.y == zpos.y && zhead.z == zpos.z){
						zhead = zombie.GetAttachmentOrigin(zombie.LookupAttachment("mouth"));
					}
				//	DebugDrawBox(zhead, Vector(-2.0,-2.0,-2.0), Vector(2.0,2.0,2.0), 0, 255, 255, 64, 10.0);
					if(CanTraceToLocation(ent, zhead, zombie) && CanTraceToLocation(zombie, shead, ent)){
						zs++;
						if(zs >= zlimit)return zs;
					}
				}
			}
		}
		return zs;
	}

	function tension_ctx(p){//고맥락적, 0 = 휴식 / 1 = 긴장 / 2 = 전투
		if(ResponseCriteria.GetValue(p,"incombat") == "1" || p.IsIT())return 2;
		local groupcombat = ResponseCriteria.GetValue(p,"timesincegroupincombat").tofloat();
		if(groupcombat < 10)return 2;
		if(groupcombat < 20)return 1;
		local zombies = ZCheckNearby(p, 300, 5);
		if(zombies >= 5)return 1;
		return 0;
	}

	function tension(p){//저맥락적, 
		if(p.IsIT() || p.IsIncapacitated())return 2;
		if(ZCheckNearby(p, 300, 5) >= 5)return 2;
		if(ZCheckNearby(p, 120, 1) >= 1)return 1;
		return 0;
	}

	function ZCheckFromFocus(ent, dist){//focusChkZombie //시험기능
		if(!ent.IsValid || !("EyeAngles" in ent))return;

		local startPt = ent.EyePosition(), stdAng = ent.EyeAngles(), chk = false;
		stdAng.y -= 20;

		local ig = ::manacatLib.ignore(["survivor"]);

		for(local i = 0; i < 3; i++){
			stdAng.x -= 20;
			for(local j = 0; j < 3; j++){
				stdAng.x += 10;
				if((i == 0 && j == 1)
				|| (i == 1 && j != 1)
				|| (i == 2 && j == 1))continue;
				local endPt = startPt + stdAng.Forward().Scale(999);
				local m_trace = { start = startPt, end = endPt, ignore = ent, mask = 33636355 };//was 33579137
				TraceLine(m_trace);

				if (m_trace.hit && m_trace.enthit != null && m_trace.enthit != ent){
				//	DebugDrawBox(m_trace.pos, Vector(-12,-12,-12.0), Vector(12,12,12.0), 255, 0, 0, 64, 3.0);

					if (IsZombie(m_trace.enthit) && (m_trace.enthit.GetOrigin() - ent.GetOrigin()).Length() <= dist){
						chk = true;break;
					}
				}
			}
			if(chk)break;
			stdAng.x -= 10;	stdAng.y += 20;
		}

		//::manacatLib.ignore_restore(ig);

		if(chk)return true;
		return false;
	}

	keyPresslen = 0
	keyPressStats = {}
	keyPressExes = []
	function keyPressCheck(){
		keyPresslen = keyPressExes.len();
	}

	function tracking(){
		foreach(p in ::manacatLib.survivor){
			local userid = p.GetPlayerUserId();
			local scene = p.GetCurrentScene(), vcd = (scene != null)?NetProps.GetPropString(scene, "m_iszSceneFile"):"";
			if(NetProps.GetPropInt(scene, "m_iHealth") == 0){
				NetProps.SetPropInt(scene, "m_iHealth", 1);
				::manacatTalker.prev[ResponseCriteria.GetValue(p, "who").tolower()] <- NetProps.GetPropString(scene, "m_iszSceneFile");
			}
			
			if(keyPresslen > 0){
				local key = NetProps.GetPropInt(p, "m_nButtons");
				if(!(userid in keyPressStats))keyPressStats[userid] <- {};
				for(local i = 0 ; i < keyPresslen; i++){
					if((key & keyPressExes[i][0]) == keyPressExes[i][0]){
						keyPressExes[i][1](p);
						if(!(keyPressExes[i][0] in keyPressStats[userid]))keyPressStats[userid][keyPressExes[i][0]] <- Time();
					}else{
						if(keyPressExes[i][0] in keyPressStats[userid])keyPressStats[userid].rawdelete(keyPressExes[i][0]);
					}
				}
			}
		}
		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacatLib.tracking()" , 0.033 , null, world);
	}
}

::manacat_common_lang <- {
set_kr = "현재 설정은 다음과 같습니다."
set_jp = "現在の設定は次のとおりです。"
set_es = "La configuración actual es la siguiente:"
set_sc = "当前设置如下："
set_tc = "目前設置如下："
set_ru = "Текущие настройки следующие:"
set_th = "การตั้งค่าปัจจุบันมีดังนี้:"
set_pl = "Aktualne ustawienia są następujące:"
set_de = "Die aktuellen Einstellungen sind wie folgt:"
set_it = "Le impostazioni attuali sono le seguenti:"
set_fr = "Les réglages actuels sont les suivants :"
set_pt = "As configurações atuais são as seguintes:"
set_br = "As configurações atuais são as seguintes:"
set_nl = "De huidige instellingen zijn als volgt:"
set_vn = "Cài đặt hiện tại như sau:"
set_en = "The current settings are as follows:"

change_kr = "설정이 변경되었습니다."
change_jp = "設定が変更されました。"
change_es = "Configuración actualizada."
change_sc = "设置已更改。"
change_tc = "設定已更改。"
change_ru = "Настройки успешно изменены."
change_th = "การตี่งค่าถูกเปลี่ยนแล้ว"
change_pl = "Ustawienie sie zmienily."
change_de = "Die Einstellung wurde geändert."//기계번역
change_it = "Impostazione cambiata."
change_fr = "Le réglage a changé."//기계번역
change_pt = "A configuração foi alterada."//기계번역
change_br = "Configuração mudada."
change_nl = "De instelling is gewijzigd."//기계번역
change_vn = "Cài đặt đã thay đổi."
change_en = "Setting has changed."

default_kr = "변경사항 비활성화"
default_jp = "変更の無効化"
default_es = "Opción desactivada"
default_sc = "禁用更改"
default_tc = "停用更改"
default_ru = "Сбросить настройки"
default_th = "ปิดการใช้งานการเปลี่ยนแปลง"
default_pl = "Wyłącz zmiany"
default_de = "Änderungen deaktivieren"//기계번역
default_it = "Disabilita modifiche"
default_fr = "Désactiver les modifications"//기계번역
default_pt = "Desativar alterações"//기계번역
default_br = "Mudanças desabilitadas"
default_nl = "Wijzigingen uitschakelen"//기계번역
default_vn = "Hủy thay đổi"
default_en = "Disable changes"

wrong_cmd_kr = "잘못된 값을 입력했습니다."
wrong_cmd_jp = "無効な値を入力しました。"
wrong_cmd_es = "Valor ingresado incorrecto."
wrong_cmd_sc = "输入的值不正确。"
wrong_cmd_tc = "輸入的值不正確。"
wrong_cmd_ru = "Некорректное значение."
wrong_cmd_th = "ตัวเลขที่คุณใส่เข้าไปผิดพลาด"
wrong_cmd_pl = "Wprowadzona wartość jest nieprawidłowa."
wrong_cmd_de = "Der eingegebene Wert ist falsch."//기계번역
wrong_cmd_it = "Il valore inserito non è corretto."
wrong_cmd_fr = "La valeur saisie est incorrecte."//기계번역
wrong_cmd_pt = "O valor introduzido está incorreto."//기계번역
wrong_cmd_br = "O valor inserido está incorreto."
wrong_cmd_nl = "De ingevoerde waarde is onjuist."//기계번역
wrong_cmd_vn = "Giá trị vừa điền không hợp lệ."
wrong_cmd_en = "The value entered is incorrect."

wrong_scp_kr = "0과 ^ 사이의 값을 입력해야 합니다."
wrong_scp_jp = "0と^の間の値を入力する必要があります。"
wrong_scp_es = "El valor debe ser un número entre 0 y ^."
wrong_scp_sc = "该值必须介于 0 到 ^ 之间。"
wrong_scp_tc = "該值必須介於 0 和 ^ 之間。"
wrong_scp_ru = "Значение должно варьироваться между 0 и ^."
wrong_scp_th = "ตัวเลขที่คุณใส่เข้าไปต้องอยู่ระหว่าง 0 ถึง ^"
wrong_scp_pl = "Wartość musi mieścić się pomiedzy od 0 do ^."
wrong_scp_de = "Der Wert muss zwischen 0 und ^ liegen."//기계번역
wrong_scp_it = "Il valore deve essere un numero compreso tra 0 e ^."
wrong_scp_fr = "La valeur doit être comprise entre 0 et ^."//기계번역
wrong_scp_pt = "O valor deve estar entre 0 e ^."//기계번역
wrong_scp_br = "O valor deve ser entre 0 e ^."
wrong_scp_nl = "De waarde moet tussen 0 en ^ liggen."//기계번역
wrong_scp_vn = "Giá trị yêu cầu từ 0 đến ^."
wrong_scp_en = "The value must be between 0 and ^."

host_kr = "호스트만 설정을 변경할 수 있습니다."
host_jp = "ホストのみ設定を変更できます。"
host_es = "Solo los anfitriones pueden cambiar la configuración."
host_sc = "只有管理员才能更改设置。"
host_tc = "只有管理員可以變更設定。"
host_ru = "Изменять настройки может только хост."
host_th = "เฉพาะโฮสต์เท่านั้นที่สามารถเปลี่ยนการตั้งค่าได้"
host_pl = "Tylko gospodarz może zmieniać ustawienia."
host_de = "Nur der Host kann Einstellungen ändern."
host_it = "Solo l'host può modificare le impostazioni."
host_fr = "Seul l'hôte peut modifier les paramètres."
host_pt = "Apenas o host pode alterar as definições."
host_br = "Somente o host pode alterar as configurações."
host_nl = "Alleen de host kan instellingen wijzigen."
host_vn = "Chỉ người chủ mới có thể thay đổi cài đặt."
host_en = "Only the host can change settings."

translate_jp = "(翻訳に参加したい場合は、MANACATにお問い合わせください。)"
translate_es = "(Si desea participar en la traducción, póngase en contacto con MANACAT.)"
translate_sc = "(如果您想参与翻译，请联系 MANACAT。)"
translate_tc = "(如果您想參與翻譯，請聯絡 MANACAT。)"
translate_ru = "(Если вы хотите принять участие в переводе, свяжитесь с MANACAT.)"
translate_th = "(หากคุณต้องการมีส่วนร่วมในการแปล โปรดติดต่อ MANACAT)"
translate_pl = "(Jeśli chcesz wziąć udział w tłumaczeniu, skontaktuj się z MANACAT.)"
translate_de = "(Wenn Sie an der Übersetzung teilnehmen möchten, wenden Sie sich bitte an MANACAT.)"
translate_it = "(Se desideri partecipare alla traduzione, contatta MANACAT.)"
translate_fr = "(Si vous souhaitez participer à la traduction, veuillez contacter MANACAT.)"
translate_pt = "(Se desejar adicionar uma tradução, contacte a MANACAT)"//기계번역
translate_br = "(Se você quiser adicionar uma tradução, entre em contato com a MANACAT.)"
translate_nl = "(Als u een vertaling wilt toevoegen, neem dan contact op met MANACAT.)"//기계번역
translate_vn = "(Nếu bạn muốn tham gia dịch thuật, vui lòng liên hệ MANACAT.)"

seed_kr = "현재 세션의 난수 시드는 아래와 같습니다."
seed_jp = "現在のセッションの乱数シードは以下のとおりです。"
seed_sc = "当前会话的随机种子如下："
seed_tc = "目前會話的隨機種子如下："
seed_ru = "Случайное начальное число для текущего сеанса следующее:"
seed_th = "ซีดของตัวเลขสุ่มในเซสชันปัจจุบันมีดังต่อไปนี้"
seed_pl = "Ziarno losowych liczb w bieżącej sesji jest następujące:"
seed_de = "Der Zufallszahl-Seed der aktuellen Sitzung lautet wie folgt:"
seed_it = "Il seed dei numeri casuali della sessione corrente è il seguente:"
seed_fr = "Graine utilisée pour cette session aléatoire :"
seed_pt = "Semente usada para números aleatórios nesta sessão:"
seed_br = "Semente usada para números aleatórios nesta sessão:"
seed_nl = "De seed voor willekeurige getallen in deze sessie is als volgt:"
seed_en = "The random seed of the current session is as follows:"
}

__CollectEventCallbacks(::manacatLib, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

IncludeScript("manacat_lib/talker");
IncludeScript("manacat_lib/rngitem");