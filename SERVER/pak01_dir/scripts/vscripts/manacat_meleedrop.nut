if(!("manacatLib" in getroottable())){
	::manacat_error <- {
		error = false
		function OnGameEvent_player_spawn(params){
			if(error)return;
			local host = GetListenServerHost();
			if(host != GetPlayerFromUserID(params.userid))return;
			local msg = Convars.GetClientConvarValue("cl_language", host.GetEntityIndex());
			switch(msg){
				case "korean":case "koreana":	msg = "기능 실행을 위해 공용 라이브러리가 필요합니다.\n아래 애드온을 구독해주세요.";break;
				case "japanese":				msg = "この機能を使用するには共通ライブラリが必要です。\n 以下のリンクからサブスクライブすることができます。";break;
				case "spanish":					msg = "Common Library es requerido para ejecutar la función.\nPor favor suscribete al add-on mencionado abajo.";break;
				case "schinese":				msg = "运行该功能需要通用库。\n请订阅以下插件。";break;
				case "tchinese":				msg = "運行該功能需要通用庫。\n請訂閱以下插件。";break;
				case "russian":					msg = "Common Library необходима для работы функции.\nПожалуйста перейдите по ссылке снизу.";break;
				case "thai":					msg = "“Common Library” จำเป็นต้องใช้เพื่อจะสามารถใช้ฟังชั่นได้\nให้กดใช้งานม็อดด้านล่าง";break;
				case "polish":					msg = "Do uruchomienia funkcji wymagana jest Biblioteka Wspólna.\nProszę Zasubskrybować Dodatek Nadole";break;
				case "german":					msg = "Die Common Library ist erforderlich, um die Funktion auszuführen.\nBitte abonnieren Sie das untenstehende Add-on.";break;
				case "italian":					msg = "La “Common Library” è necessaria a far funzionare questo add-on correttamente.\nPer favore scarica l'add-on linkato qui sotto.";break;
				case "french":					msg = "La bibliothèque commune est nécessaire pour exécuter la fonction.\nveuillez vous abonner au mod ci-dessous";break;
				case "portuguese":				msg = "A biblioteca MANACAT é necessária para carregar a função.\nPor favor inscreva-se ao add-on abaixo.";break;
				case "brazilian":				msg = "O Common Library é necessário para rodar esta função.\nPor favor se inscreva no add-on abaixo.";break;
				case "dutch":					msg = "De 'Common Library' is vereist om deze functie uit te voeren.\nAbonneer a.u.b. op de add-on hieronder.";break;
				case "vietnamese":				msg = "Common Library là cần thiết để chạy chức năng này.\nLàm ơn hãy subscribe cái add-on dưới đây.";break;
				default:						msg = "The Common Library is required to run the function.\nPlease subscribe to the add-on below.";break;
			}

			ClientPrint( host, 5, "MANACAT\x01 :  " + msg + " ▼");
			ClientPrint( host, 5, "\x03https://steamcommunity.com/sharedfiles/filedetails/?id=213445426");
			error = true;return;
		}
	}
	__CollectEventCallbacks(::manacat_error, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);
	return;
}

local scrver = 20260125, scrcode = "deadWeapon", scrcat = 5;
if(!(scrcode in ::MANACAT) || ::MANACAT[scrcode].ver <= scrver){
	::MANACAT[scrcode] <- {
		ver = scrver
		check = false

		t_kr = "유품 무기 관리"
		t_jp = "遺品の補助管理"
		t_es = "Legacy Weapon Manager"
		t_sc = "遗物管理"
		t_tc = "遺物管理"
	//	t_ru = ""
	//	t_th = ""
	//	t_pl = ""
	//	t_de = ""
	//	t_it = ""
	//	t_fr = ""
	//	t_pt = ""
	//	t_br = ""
	//	t_nl = ""
	//	t_vn = ""
		t_en = "Legacy Weapon Manager"
	}

	local scr = true;
	for(local i = 1; i <= ::MANACAT["category"+scrcat][0]; i++){
		if(::MANACAT["category"+scrcat][i] == scrcode){scr = false;break;}
	}
	if(scr){::MANACAT["category"+scrcat].append(scrcode);	::MANACAT["category"+scrcat][0]++;}
}else if(::MANACAT[scrcode].ver > scrver){
	return;
}

::meleeDropFunc<-{
	pistol_retain = []
	primary_backup = {}

	function OnGameEvent_survivor_rescued(params){
		local player = GetPlayerFromUserID(params.victim);
		local invTable = {};	GetInvTable(player, invTable);
		if(!("slot0" in invTable)){
			local pmodel = player.GetModelName();	if(!(pmodel in primary_backup))return;
			switch(primary_backup[pmodel]){
				case "weapon_smg":case "weapon_rifle":case "weapon_rifle_sg552":case "weapon_hunting_rifle":
					player.GiveItem("smg");	break;
				case "weapon_smg_silenced":case "weapon_rifle_ak47":case "weapon_rifle_desert":case "weapon_sniper_military":
					player.GiveItem("smg_silenced");	break;
				case "weapon_smg_mp5":case "weapon_rifle_m60":case "weapon_sniper_awp":case "weapon_sniper_scout":
					player.GiveItem("smg_mp5");	break;
				case "weapon_pumpshotgun":case "weapon_autoshotgun":
					player.GiveItem("pumpshotgun");	break;
				case "weapon_shotgun_chrome":case "weapon_shotgun_spas":case "weapon_grenade_launcher":
					player.GiveItem("shotgun_chrome");	break;
			}
		}
	}

	function OnGameEvent_defibrillator_used(params){
		local player = GetPlayerFromUserID(params.subject), pmodel = player.GetModelName();
		local invTable = {};	GetInvTable(player, invTable);
		for(local i = 0; i < 10; i++){
			if("slot"+i in invTable && invTable["slot"+i].GetClassname() == "weapon_pistol"){
				local retained = false
				for (local i = pistol_retain.len() - 1; i >= 0; i--) {
					if (pistol_retain[i] == pmodel) {
						retained = true;
						pistol_retain.remove(i);
					}
				}
				if(!retained){
					invTable["slot"+i].ValidateScriptScope();
					invTable["slot"+i].GetScriptScope().mnc_legacy <- true;
				}
			}
		}
	}

	function OnGameEvent_item_pickup(params){
		local player = GetPlayerFromUserID(params.userid);
		if(player == null || !player.IsValid() || NetProps.GetPropInt(player, "m_iTeamNum") != 2 || player.IsDead() || player.IsDying())return;
		local invTable = {};	GetInvTable(player, invTable);
		if ("slot0" in invTable)primary_backup[player.GetModelName()] <- invTable["slot0"].GetClassname();
	}

	function OnGameEvent_weapon_drop(params){
		if(!("propid" in params))return;
		local weapon = EntIndexToHScript(params.propid);	if(weapon == null || !weapon.IsValid())return;
		weapon.ValidateScriptScope();
		if("mnc_legacy" in weapon.GetScriptScope())weapon.Kill();
	}

	function OnGameEvent_player_death(params){
		if(params.victimname == "Infected" || params.victimname == "Witch")return;
		local victim = GetPlayerFromUserID(params.userid);
		if(!GetPlayerFromUserID(params.userid).IsSurvivor())return;
		local vicV = victim.GetOrigin(), vecV = vicV+victim.EyePosition();
		vecV = Vector(vecV.x/2, vecV.y/2, vecV.z/2);
	//	if(vecV.z < vicV.z+45)vecV.z = vicV.z+45;
		//local angV = Vector((RandomInt(0,1)*180)+60+(RandomInt(0,1)*60), RandomInt(0,359), (RandomInt(0,1)*180)+70+(RandomInt(0,1)*40));
		local angV = Vector(30-(RandomInt(0,1)*60), RandomInt(0,359), 30-(RandomInt(0,1)*60));
		local mdl, modelName;

		for (local ent = null; (ent = Entities.FindByClassname(ent, "weapon_*")) != null && ent.IsValid();){
			if(NetProps.GetPropEntity(ent, "m_hOwnerEntity") != victim)continue;
			
			local item = null, cn = ent.GetClassname();
			if(cn == "weapon_melee"){
				item = SpawnEntityFromTable("weapon_melee", {
					melee_script_name = NetProps.GetPropString(ent, "m_strMapSetScriptName")
					origin = vecV
					angles = angV
					solid = "6"
					spawnflags = "1073741824"
				});
			}else{
				if(ent.GetClassname() == "weapon_pistol" && NetProps.GetPropInt(ent, "m_hasDualWeapons") != 1){
					pistol_retain.append(victim.GetModelName());	continue;
				}

				item = SpawnEntityFromTable(cn, {
					origin = vecV
					angles = angV
					solid = "6"
					spawnflags = "1073741824"
					count = "1"
				});
			}

			NetProps.SetPropInt(item, "m_nSkin", NetProps.GetPropInt(ent, "m_nSkin"));
			NetProps.SetPropInt(item, "m_nBody", NetProps.GetPropInt(ent, "m_nBody"));
			NetProps.SetPropInt(item, "m_iClip1", NetProps.GetPropInt(ent, "m_iClip1"));
			NetProps.SetPropInt(item, "m_iClip2", NetProps.GetPropInt(ent, "m_iClip2"));

			if(NetProps.GetPropInt(ent, "m_hasDualWeapons") == 1){
				local skin = NetProps.GetPropInt(ent, "m_nSkin"), body = NetProps.GetPropInt(ent, "m_nBody");
				
				local pistols = 4;//현재 준비된 권총의 종류 수
				local a_body = (body-1)/(pistols+1);			local b_body = body - (a_body*(pistols+1));
				local a_body = (body-1)/(pistols+1);			local b_body = body - (a_body*(pistols+1));
				b_body += pistols;//라이트 떼주려고
				pistols = 3;//스킨 종류 수
				local a_skin = (skin/pistols).tointeger();		local b_skin = (skin%pistols).tointeger();

				printl(a_skin+"  "+a_body);
				printl(b_skin+"  "+b_body);

				NetProps.SetPropInt(item, "m_nSkin", b_skin);
				NetProps.SetPropInt(item, "m_nBody", b_body);
			}else{
				::manacat_rng_item.resetSkinBody(item);
			}
			
			ent.Kill();

			local impulseVec = victim.GetLocalVelocity().Scale(0.9);
			impulseVec.z = 180;

			item.ApplyAbsVelocityImpulse(impulseVec);
			item.ApplyLocalAngularVelocityImpulse(Vector(250,0,0));
		}
	}
}

__CollectEventCallbacks(::meleeDropFunc, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);