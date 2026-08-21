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

local scrver = 20251226, scrcode = "carriable", scrcat = 4;
if(!(scrcode in ::MANACAT) || ::MANACAT[scrcode].ver <= scrver){
	::MANACAT[scrcode] <- {
		ver = scrver
		check = false
		
		t_kr = "운반물 충돌 무효화"
		t_jp = "携行可能品の衝突無効化"
	//	t_es = ""
		t_sc = "移除可携带物品碰撞"
		t_tc = "移除可攜帶物品碰撞"
		t_ru = "Нет Коллизии на Переносимых Предметах"
	//	t_th = ""
	//	t_pl = ""
	//	t_de = ""
	//	t_it = ""
	//	t_fr = ""
	//	t_pt = ""
	//	t_br = ""
	//	t_nl = ""
	//	t_vn = ""
		t_en = "No Collision on Carriable"
	}

	local scr = true;
	for(local i = 1; i <= ::MANACAT["category"+scrcat][0]; i++){
		if(::MANACAT["category"+scrcat][i] == scrcode){scr = false;break;}
	}
	if(scr){::MANACAT["category"+scrcat].append(scrcode);	::MANACAT["category"+scrcat][0]++;}
}else if(::MANACAT[scrcode].ver > scrver){
	return;
}

::manacat_carriable<-{
	function OnGameEvent_item_pickup(params){
		local p = GetPlayerFromUserID(params.userid);
		p.GetActiveWeapon().ValidateScriptScope();	local scp = p.GetActiveWeapon().GetScriptScope();
		if("pair" in scp && scp.pair != null && scp.pair.IsValid())scp.pair.Kill();
	}

	function OnGameEvent_break_prop(params){
		local p = EntIndexToHScript(params.entindex);	if(p == null || !p.IsValid())return;
		p.ValidateScriptScope();	local scp = p.GetScriptScope();

		if("pair" in scp && scp.pair != null && scp.pair.IsValid()){
			if(scp.pair.GetModelName() != "models/props_junk/explosive_box001.mdl"){
				local exp = SpawnEntityFromTable("env_explosion",
				{
					fireballsprite = "1"
					origin = scp.pair.GetOrigin()
					spawnflags = 837
				});
				
				DoEntFire("!self", "Explode", "", 0.0, null, exp);
				DoEntFire("!self", "Kill", "", 0.0, null, exp);
			}
			scp.pair.Kill();
		}
	}

	function OnGameEvent_weapon_drop_to_prop(params){
		local p = EntIndexToHScript(params.propid);	if(p == null || !p.IsValid())return;
		local pos = p.GetOrigin(), mdl = p.GetModelName(), cn = null;

		switch(mdl){
			case "models/props_junk/propanecanister001a.mdl":cn="weapon_propanetank";break;
			case "models/props_equipment/oxygentank01.mdl":cn="weapon_oxygentank";break;
			case "models/props_junk/explosive_box001.mdl":cn="weapon_fireworkcrate";break;
			default:return;
		}
		p.Kill();

		local p_p = SpawnEntityFromTable("prop_physics",
		{
			model = mdl
			health = 20
			spawnflags = 260
		});
		local p_w = SpawnEntityFromTable(cn,
		{
			origin = pos
			solid = 6
			spawnflags = 256
		});
		DoEntFire("!self", "SetParent", "!activator", 0.0, p_w, p_p);
		DoEntFire("!self", "RunScriptCode", "self.SetLocalAngles(QAngle(0,0,0));self.SetLocalOrigin(Vector(0,0,0));", 0.0, null, p_p);
		p_p.ValidateScriptScope();	p_p.GetScriptScope().pair <- p_w;	p_w.ValidateScriptScope();	p_w.GetScriptScope().pair <- p_p;

		local e = GetPlayerFromUserID(params.userid).EyeAngles();
		p_w.ApplyAbsVelocityImpulse(e.Forward().Scale(425));	p_w.ApplyLocalAngularVelocityImpulse(Vector(e.x, e.y, e.z));
	}

	function OnGameEvent_bullet_impact(params){
		local hit = Vector(params.x, params.y, params.z);
		local m_trace = { start = hit, end = hit + GetPlayerFromUserID(params.userid).EyeAngles().Forward().Scale(1), mask = 33636363 };	TraceLine(m_trace);
		if(m_trace.hit && m_trace.enthit != null && m_trace.enthit.IsValid()){
			local cn = m_trace.enthit.GetClassname();
			if(cn != "weapon_propanetank" && cn != "weapon_oxygentank" && cn != "weapon_fireworkcrate")return;
			m_trace.enthit.ValidateScriptScope();	local scp = m_trace.enthit.GetScriptScope();
			if("pair" in scp && scp.pair != null && scp.pair.IsValid() && scp.pair.GetHealth() > 0)
				DoEntFire("!self", "RunScriptCode", "local p = EntIndexToHScript("+scp.pair.GetEntityIndex()+");if(p == null || !p.IsValid())return;p.TakeDamage(33, 2, GetPlayerFromUserID("+params.userid+"));", 0.0, null, ::manacatLib.world);
		}
	}
}

__CollectEventCallbacks(::manacat_carriable, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);