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

local scrver = 20241005, scrcode = "delayHeal", scrcat = 5;
if(!(scrcode in ::MANACAT) || ::MANACAT[scrcode].ver <= scrver){
	::MANACAT[scrcode] <- {
		ver = scrver
		check = false

		t_kr = "지연치유"
		t_jp = "治癒遅延"
		t_es = "Retrasar la curación"
		t_sc = "延迟愈合"
		t_tc = "延遲癒合"
		t_ru = ""
	//	t_th = ""
	//	t_pl = ""
	//	t_de = ""
	//	t_it = ""
	//	t_fr = ""
	//	t_pt = ""
	//	t_br = ""
	//	t_nl = ""
	//	t_vn = ""
		t_en = "Delay Healing"
	}

	local scr = true;
	for(local i = 1; i <= ::MANACAT["category"+scrcat][0]; i++){
		if(::MANACAT["category"+scrcat][i] == scrcode){scr = false;break;}
	}
	if(scr){::MANACAT["category"+scrcat].append(scrcode);	::MANACAT["category"+scrcat][0]++;}
}else if(::MANACAT[scrcode].ver > scrver){
	return;
}

::DurationHealVar<-{
	temphealList = [] //유휴 상태로 전환되었을 때 진통제/아드 효과가 끊어지는 것 방지

	pill = 25
	adre = 25
	work = false
}

::DurationHeal<-{
	function OnGameEvent_pills_used(params){
		local player = GetPlayerFromUserID(params.userid);
		::DurationHeal.UseItem(player, ::DurationHealVar.pill, ::DurationHealVar.pill);
	}

	function OnGameEvent_adrenaline_used(params){
		local player = GetPlayerFromUserID(params.userid);
		::DurationHeal.UseItem(player, ::DurationHealVar.adre);
	}

	function UseItem(player, amount1 = 0, amount2 = 0){
		local len = ::DurationHealVar.temphealList.len();		local chk = false;
		for(local i = 0; i < len; i++){
			if(::DurationHealVar.temphealList[i][0] == player){
				::DurationHealVar.temphealList[i][1] += amount1;
				::DurationHealVar.temphealList[i][2] += amount2;
				chk = true;
			}
		}
		if(!chk)::DurationHealVar.temphealList.append([player, amount1, amount2]);
		
		if(!::DurationHealVar.work){
			::DurationHealVar.work = true;
			EntFire( "worldspawn", "RunScriptCode", "g_ModeScript.DurationHealThink()", 0.0 );
		}
	}

	function OnGameEvent_weapon_fire(params){
		local player = GetPlayerFromUserID(params.userid);
		local item = player.GetActiveWeapon().GetClassname();
		if(item == "weapon_pain_pills" && Convars.GetFloat("pain_pills_health_value") > 0){
			::DurationHealVar.pill = Convars.GetFloat("pain_pills_health_value")/2;
			Convars.SetValue("pain_pills_health_value",0);
		}else if(item == "weapon_adrenaline" && Convars.GetFloat("adrenaline_health_buffer") > 0){
			::DurationHealVar.adre = Convars.GetFloat("adrenaline_health_buffer");
			Convars.SetValue("adrenaline_health_buffer",0);
		}
	}

	function OnGameEvent_bot_player_replace(params){
		local player = GetPlayerFromUserID(params.player);
		local bot = GetPlayerFromUserID(params.bot);
		::DurationHeal.targetFix(bot, player);
	}
	function OnGameEvent_player_bot_replace(params){
		local player = GetPlayerFromUserID(params.player);
		local bot = GetPlayerFromUserID(params.bot);
		::DurationHeal.targetFix(player, bot);
	}

	function targetFix(player, bot){
		local len = ::DurationHealVar.temphealList.len();
		for(local i = 0; i < len; i++){
			if(::DurationHealVar.temphealList[i][0] == player){
				::DurationHealVar.temphealList[i][0] = bot;
			}
		}
	}
}

function DurationHealThink(){
	local chk = false;
	local len = ::DurationHealVar.temphealList.len()-1;
	for(local i = len; i >= 0; i--){
		if(::DurationHealVar.temphealList[i][0] == null || !::DurationHealVar.temphealList[i][0].IsValid() ||
			::DurationHealVar.temphealList[i][0].IsDead() || ::DurationHealVar.temphealList[i][0].IsIncapacitated()){
			::DurationHealVar.temphealList.remove(i);	continue;
		}
		local model = ::DurationHealVar.temphealList[i][0].GetModelName();
		if(model == "models/infected/hunter.mdl" || model == "models/infected/hunter_l4d1.mdl"){
			::DurationHealVar.temphealList.remove(i);	continue;
		}
		local hp = ::DurationHealVar.temphealList[i][0].GetHealth();
		local hpb = ::DurationHealVar.temphealList[i][0].GetHealthBuffer();
		local maxhp = NetProps.GetPropInt( ::DurationHealVar.temphealList[i][0], "m_iMaxHealth" );
		if(hp + hpb >= maxhp){
			::DurationHealVar.temphealList.remove(i);	continue;
		}
		local heal = 0;
		if(::DurationHealVar.temphealList[i][1] > 0){
			::DurationHealVar.temphealList[i][1]--;
			heal++;	chk = true;
		}
		if(::DurationHealVar.temphealList[i][2] > 0){
			::DurationHealVar.temphealList[i][2]--;
			heal++;	chk = true;
		}
		::DurationHealVar.temphealList[i][0].SetHealthBuffer(hpb+heal);
		hpb = ::DurationHealVar.temphealList[i][0].GetHealthBuffer();
		if(hp + hpb > maxhp)
			::DurationHealVar.temphealList[i][0].SetHealthBuffer(hpb-1);
		if(hp + hpb == maxhp){
			::DurationHealVar.temphealList.remove(i);	continue;
		}
	}
	if(chk){
		EntFire( "worldspawn", "RunScriptCode", "g_ModeScript.DurationHealThink()", 0.08 );
	}else{
		::DurationHealVar.work = false;
	}
}

__CollectEventCallbacks(::DurationHeal, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);