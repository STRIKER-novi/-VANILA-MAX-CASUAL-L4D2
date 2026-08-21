local scrver = 20260703, scrcode = "rng_item", scrcat = 0;
if(!(scrcode in ::MANACAT) || ::MANACAT[scrcode].ver <= scrver){
	::MANACAT[scrcode] <- {
		ver = scrver
		check = false

		t_kr = "아이템 스킨 확장"
		t_jp = "アイテムスキン拡張"//https://steamcommunity.com/id/nattsuiy/
		t_es = "Pack de Skins Extendidos de Items"//https://steamcommunity.com/id/sirwololo/
		t_sc = "物品皮肤增加"//Google
		t_tc = "物品皮膚增加"//Google
		t_ru = "Скин Пак для Улучшенных Предметов"//https://steamcommunity.com/profiles/76561199136004364/
		t_th = "เพิ่มเติมสกินสิ่งของแพ็ค"//https://steamcommunity.com/profiles/76561199258990944/
		t_po = "Rozszerzony pakiet skórek przedmiotów"//https://steamcommunity.com/id/Klyxer/
		t_de = "Erweitertes Item Skin Pack"//https://steamcommunity.com/id/renetm/
		t_it = "Pacchetto skin oggetti estesi"//https://steamcommunity.com/id/TheRealBlackWolf/
		t_fr = "pack de skin étendue pour objet"//https://steamcommunity.com/id/grandvoledevoiture5/
		t_pt = "pack the skins estendido"//https://steamcommunity.com/profiles/76561199228689957/
		t_br = "Pacote de Visuais Extendido para Items"//https://steamcommunity.com/id/chaduofficial/
		t_nl = "Uitgebreide skinpakket voor items"//https://steamcommunity.com/id/MMNL/
		t_vn = "Gói Skin vật phẩm mở rộng"//https://steamcommunity.com/profiles/76561199204271477/
		t_en = "Extended Items Skin Pack"
	}

	local scr = true;
	for(local i = 1; i <= ::MANACAT["category"+scrcat][0]; i++){
		if(::MANACAT["category"+scrcat][i] == scrcode){scr = false;break;}
	}
	if(scr){::MANACAT["category"+scrcat].append(scrcode);	::MANACAT["category"+scrcat][0]++;}
}else if(::MANACAT[scrcode].ver > scrver){
	return;
}

::manacat_rng_item_lang <- {
pistol_kr = "사용 키를 한번 꾹 누르면 오른쪽 권총을, 빠르게 두번 꾹 누르면 왼쪽 권총을 바꿉니다."
pistol_jp = "キーを1回押し、長押しして右手のピストル、キーを2回押し、長押しして左手のピストルを変える"
pistol_es = "Aprieta y manten una vez para cambiar la pistola derecha, dos veces y manten para la izquierda"
pistol_sc = "按住该键一次可更换右手枪，快速按住两次可更换左手枪"
pistol_tc = "按住該鍵一次可更換右手槍，快速按兩次該鍵可更換左手槍"
pistol_ru = "Зажмите чтобы заменить правый пистолет, или же нажмите дважды чтобы сменить левый"
pistol_th = "เมื่อกดปุ่มรอบเดียวแล้วให้กดค้างไว้เพื่อเปลี่ยนปืนด้านขวา, หรือ กดปุ่มสองครั้งแล้วให้กดค้างไว้เพื่อเปลี่ยนปืนซ้าย"
pistol_pl = "Naciśnij i przytrzymaj, aby zamienić prawy pistolet, naciśnij i przytrzymaj dwa razy, aby zamienić lewy pistolet"
pistol_de = "Drücke und halte um die rechte Pistole zu ersetzen, oder drücke doppelt und halte für die linke"
pistol_it = "Tieni premuto una volta per equipaggiare la pistola sulla dx, o premi due volte e tieni premuto per la sx"
pistol_fr = "Appuyez et maintenez pour remplacer le pistolet droite, ou double-cliquez et maintenez pour le pistolet gauche"
pistol_pt = "pressione e segure para trocar a sua pistola direita, ou pressione duas vezes para trocar a pistola esquerda"
pistol_br = "Aperte e segure para trocar a pistola da direita, ou aperte e segure duas vezes para trocar a da esquerda"
pistol_nl = "Houd ingedrukt om rechter pistool te vervangen, of houd dubbel ingedrukt voor het linker"
pistol_vn = "Ấn một lần và giữ nút để đổi súng bên tay phải, hoặc ấn hai lần và giữ để đổi súng bên tay trái"
pistol_en = "Press and hold to replace your right pistol, or double tap and hold for your left pistol"

pistol_same_r_kr = "오른쪽 권총을 바꿀 필요가 없습니다."
pistol_same_l_kr = "왼쪽 권총을 바꿀 필요가 없습니다."
pistol_same_r_jp = "既に右手に同じピストルを持っている"
pistol_same_l_jp = "既に左手に同じピストルを持っている"
pistol_same_r_es = "No necesitas cambiar la pistola derecha"
pistol_same_l_es = "No necesitas cambiar la pistola izquierda"
pistol_same_r_sc = "无需更换右手枪"
pistol_same_l_sc = "无需更换左手枪"
pistol_same_r_tc = "無需更換右手槍"
pistol_same_l_tc = "無需更換左手槍"
pistol_same_r_ru = "Вам не нужно менять правый пистолет"
pistol_same_l_ru = "Вам не нужно менять левый пистолет"
pistol_same_r_th = "คุณไม่การต้องเปลี่ยนปืนด้านขวา"
pistol_same_l_th = "คุณไม่การต้องเปลี่ยนปืนด้านซ้าย"
pistol_same_r_pl = "Nie musisz zmieniać prawego pistoletu"
pistol_same_l_pl = "Nie musisz zmieniać lewego pistoletu"
pistol_same_r_de = "Du brauchst die rechte Pistole nicht zu ändern"
pistol_same_l_de = "Du brauchst die linke Pistole nicht zu ändern"
pistol_same_r_it = "hai già questa pistola sulla destra"
pistol_same_l_it = "hai già questa pistola sulla sinistra"
pistol_same_r_fr = "Tu n'as pas besoin de changer le pistolet de droite"
pistol_same_l_fr = "Tu n'as pas besoin de changer le pistolet de gauche"
pistol_same_r_pt = "Não precisas de trocar a pistola direita"
pistol_same_l_pt = "Não precisas de trocar a pistola esquerda"
pistol_same_r_br = "Você não precisa trocar a pistola da direita"
pistol_same_l_br = "Você não precisa trocar a pistola da esquerda"
pistol_same_r_nl = "Hetzelfde pistool al in rechterhand"
pistol_same_l_nl = "Hetzelfde pistool al in linkerhand"
pistol_same_r_vn = "Bạn không cần đổi súng bên tay phải"
pistol_same_l_vn = "Bạn không cần đổi súng bên tay trái"
pistol_same_r_en = "You don't need to change your right pistol"
pistol_same_l_en = "You don't need to change your left pistol"

wpn_kr = "사용 키를 꾹 누르고 있으면 가지고 있는 무기와 바꿉니다."
itm_kr = "사용 키를 꾹 누르고 있으면 가지고 있는 물품과 바꿉니다."
wpn_jp = "長押しして武器を変える"
itm_jp = "長押ししてアイテムを変える"
wpn_es = "Mantén para reemplazar tu arma"
itm_es = "Mantén para reemplazar tu ítem"
wpn_sc = "按住可交换武器"
itm_sc = "按住可交换物品"
wpn_tc = "按住可交換武器"
itm_tc = "按住可交換物品"
wpn_ru = "Нажмите и удерживайте чтобы заменить ваше оружие"
itm_ru = "Нажмите и удерживайте чтобы заменить ваш предмет"
wpn_th = "กดและให้กดข้างไว้เพื่อเปลี่ยนอาวุธ"
itm_th = "กดและให้กดข้างไว้เพื่อเปลี่ยนไอเทม"
wpn_pl = "Naciśnij i przytrzymaj, aby zastąpić swój broń"
itm_pl = "Naciśnij i przytrzymaj, aby zastąpić swój przedmiot"
wpn_de = "Gedrückt halten um Waffe zu ersetzen"
itm_de = "Gedrückt halten um Gegenstand zu ersetzen"
wpn_it = "Tieni premuto per sostituire la tua arma"
itm_it = "Tieni premuto per sostituire il tuo oggetto"
wpn_fr = "Appuyez et maintenez enfoncée la touche pour remplacer votre arme"
itm_fr = "Appuyez et maintenez enfoncée la touche pour remplacer votre objet"
wpn_pt = "Segure para trocar a sua arma"
itm_pt = "Segure para trocar o seu item"
wpn_br = "Segure para substituir sua arma"
itm_br = "Segure para substituir seu item"
wpn_nl = "Houd ingedrukt om je wapen te vervangen"
itm_nl = "Houd ingedrukt om je item te vervangen"
wpn_vn = "Nhấn và giữ để thay thế vũ khí của bạn"
itm_vn = "Nhấn và giữ để thay thế vật phẩm của bạn"
wpn_en = "Hold to replace your weapon"
itm_en = "Hold to replace your item"

unlock_kr = "추가 기능이 해금되었습니다."
lock_kr = "추가 기능이 제한되었습니다."
host_kr = "로컬 서버 호스트는 설정하지 않아도 자동으로 적용됩니다."
unlock_en = "Additional features have been unlocked."
lock_en = "Additional features have been restricted."
host_en = "The local server host is automatically applied without any configuration."
}

::manacat_rng_item <- {
	world = Entities.First()
	debug = false
	startflag = false
	iniflag = false
	classnameList = [
		"weapon_spawn",		"weapon_melee_spawn",		"weapon_melee",

		"weapon_first_aid_kit_spawn",
		"weapon_defibrillator_spawn",// 2,
		"weapon_upgradepack_incendiary_spawn",		"upgrade_ammo_incendiary",
		"weapon_upgradepack_explosive_spawn",		"upgrade_ammo_explosive",
		"weapon_pain_pills_spawn",
		"weapon_adrenaline_spawn",
		"weapon_molotov_spawn",
		"weapon_pipe_bomb_spawn",
		"weapon_vomitjar_spawn",// 5,
		
		"weapon_chainsaw_spawn",
		
		"weapon_pistol_spawn",						"weapon_pistol",
		"weapon_pistol_magnum_spawn",				"weapon_pistol_magnum",
		"weapon_smg_spawn",							"weapon_smg",
		"weapon_smg_silenced_spawn",				"weapon_smg_silenced",	
		"weapon_smg_mp5_spawn",						"weapon_smg_mp5",	
		"weapon_pumpshotgun_spawn",					"weapon_pumpshotgun",
		"weapon_shotgun_chrome_spawn",				"weapon_shotgun_chrome",
		"weapon_autoshotgun_spawn",					"weapon_autoshotgun",
		"weapon_shotgun_spas_spawn",				"weapon_shotgun_spas",
		"weapon_rifle_spawn",						"weapon_rifle",
		"weapon_rifle_ak47_spawn",					"weapon_rifle_ak47",
		"weapon_rifle_desert_spawn",				"weapon_rifle_desert",
		"weapon_rifle_sg552_spawn",					"weapon_rifle_sg552",
		"weapon_hunting_rifle_spawn",				"weapon_hunting_rifle",
		"weapon_sniper_military_spawn",				"weapon_sniper_military",
		"weapon_sniper_awp_spawn",					"weapon_sniper_awp",
		"weapon_sniper_scout_spawn",				"weapon_sniper_scout",
		"weapon_rifle_m60_spawn",					"weapon_rifle_m60",
		"weapon_grenade_launcher_spawn",			"weapon_grenade_launcher",

		"prop_minigun_l4d1",						"prop_minigun",

		"weapon_ammo_spawn", "upgrade_laser_sight", "weapon_gascan"
	]
	modelnameList = ["models/props_junk/gascan001a.mdl", "models/props_junk/propanecanister001a.mdl"]
	weaponList = {}

	sessionData = {}
	sessionInv = {}
	sessionInvReady = {}
	sessionChkp = {}
	round_first_inv_load = false
	intro = 0

	function weaponid(id){
		if(typeof id == "integer"){
			switch(id){
				case 1:return "pistol";case 2:return "smg";case 3:return "pumpshotgun";case 4:return "autoshotgun";case 5:return "rifle";case 6:return "hunting_rifle";case 7:return "smg_silenced";case 8:return "shotgun_chrome";case 9:return "rifle_desert";case 10:return "sniper_military";case 11:return "shotgun_spas";case 12:return "first_aid_kit";
				case 13:return "molotov";case 14:return "pipe_bomb";case 15:return "pain_pills";case 16:return "gascan";case 17:return "propanetank";case 18:return "oxygentank";case 19:return "melee";case 20:return "chainsaw";case 21:return "grenade_launcher";case 23:return "adrenaline";case 24:return "defibrillator";case 25:return "vomitjar";
				case 26:return "rifle_ak47";case 27:return "gnome";case 28:return "cola_bottles";case 29:return "fireworks_crate";case 30:return "upgradepack_incendiary";case 31:return "upgradepack_explosive";case 32:return "pistol_magnum";case 33:return "smg_mp5";case 34:return "rifle_sg552";case 35:return "sniper_awp";case 36:return "sniper_scout";case 37:return "rifle_m60";
				default:return null;
			}
		}else{
			switch(id){
				case "1":return "pistol";case "2":return "smg";case "3":return "pumpshotgun";case "4":return "autoshotgun";case "5":return "rifle";case "6":return "hunting_rifle";case "7":return "smg_silenced";case "8":return "shotgun_chrome";case "9":return "rifle_desert";case "10":return "sniper_military";case "11":return "shotgun_spas";case "12":return "first_aid_kit";
				case "13":return "molotov";case "14":return "pipe_bomb";case "15":return "pain_pills";case "16":return "gascan";case "17":return "propanetank";case "18":return "oxygentank";case "19":return "melee";case "20":return "chainsaw";case "21":return "grenade_launcher";case "23":return "adrenaline";case "24":return "defibrillator";case "25":return "vomitjar";
				case "26":return "rifle_ak47";case "27":return "gnome";case "28":return "cola_bottles";case "29":return "fireworks_crate";case "30":return "upgradepack_incendiary";case "31":return "upgradepack_explosive";case "32":return "pistol_magnum";case "33":return "smg_mp5";case "34":return "rifle_sg552";case "35":return "sniper_awp";case "36":return "sniper_scout";case "37":return "rifle_m60";
				
				case "pistol":case "weapon_pistol":return 1;case "smg":case "weapon_smg":return 2;case "pumpshotgun":case "weapon_pumpshotgun":return 3;case "autoshotgun":case "weapon_autoshotgun":return 4;case "rifle":case "weapon_rifle":return 5;case "hunting_rifle":case "weapon_huntingrifle":return 6;
				case "smg_silenced":case "weapon_smg_silenced":return 7;case "shotgun_chrome":case "weapon_shotgun_chrome":return 8;case "rifle_desert":case "weapon_rifle_desert":return 9;case "sniper_military":case "weapon_sniper_military":return 10;case "shotgun_spas":case "weapon_shotgun_spas":return 11;case "first_aid_kit":case "weapon_first_aid_kit":return 12;
				case "molotov":case "weapon_molotov":return 13;case "pipe_bomb":case "weapon_pipe_bomb":return 14;case "pain_pills":case "weapon_pain_pills":return 15;case "gascan":case "weapon_gascan":return 16;case "propanetank":case "weapon_propanetank":return 17;case "oxygentank":case "weapon_oxygentank":return 18;
				case "melee":case "weapon_melee":return 19;
				case "chainsaw":case "weapon_chainsaw":return 20;case "grenade_launcher":case "weapon_grenade_launcher":return 21;case "adrenaline":case "weapon_adrenaline":return 23;case "defibrillator":case "weapon_defibrillator":return 24;case "vomitjar":case "weapon_vomitjar":return 25;
				case "rifle_ak47":case "weapon_rifle_ak47":return 26;case "gnome":case "weapon_gnome":return 27;case "cola_bottles":case "weapon_cola_bottles":return 28;case "fireworks_crate":case "weapon_fireworkcrate":return 29;case "upgradepack_incendiary":case "weapon_upgradepack_incendiary":return 30;case "upgradepack_explosive":case "weapon_upgradepack_explosive":return 31;
				case "magnum":case "pistol_magnum":case "weapon_pistol_magnum":return 32;
				case "smg_mp5":case "weapon_smg_mp5":return 33;case "rifle_sg552":case "weapon_rifle_sg552":return 34;
				case "awp":case "sniper_awp":case "weapon_sniper_awp":return 35;
				case "scout":case "sniper_scout":case "weapon_sniper_scout":return 36;
				case "m60":case "rifle_m60":case "weapon_rifle_m60":return 37;
				default:return null;
			}
		}
	}

	function skinSelect(skin_fam, skin_set = 0, calculate=false){
		if(!(skin_fam in ::manacat_rng_item.weaponList))return;
		if(typeof ::manacat_rng_item.weaponList[skin_fam][2] == "integer")return ::manacatLib.rnd(0, ::manacat_rng_item.weaponList[skin_fam][2]-1);
		skin_fam = ::manacat_rng_item.weaponList[skin_fam][2];

		if(!("exceptlist" in ::manacat_rng_item.sessionData))::manacat_rng_item.sessionData.exceptlist <- "";

		local skin_table = [[0]], skin_total = 0, len = skin_fam.len();
		for(local i = 0; i < len; i++){
			if(skin_fam[i].len()==2 || (skin_fam[i].len()==3 && ::manacat_rng_item.sessionData.exceptlist.find("|"+skin_fam[i][2]+"|") == null))skin_total += skin_fam[i][skin_set];
		}

		local skin_accrue = 0;
		for(local i = 0; i < len; i++){
			if(skin_fam[i].len()==3){
				if(::manacat_rng_item.sessionData.exceptlist.find("|"+skin_fam[i][2]+"|") == null)
						skin_table.append( [skin_table[i][0] + (skin_fam[i][skin_set].tofloat()/skin_total)*100, skin_fam[i][2]] );
				else	skin_table.append( [skin_table[i][0]] );
			}else		skin_table.append( [skin_table[i][0] + (skin_fam[i][skin_set].tofloat()/skin_total)*100] );
		}

		local r = ::manacatLib.rnd(0.0, len) * (100.0/len);

		if(!calculate){
			for(local i = 1; i <= len; i++){
				if(skin_table[i-1][0] == skin_table[i][0])continue;
				if(r < skin_table[i][0]){
					if(skin_table[i].len()==2 && ::manacat_rng_item.sessionData.exceptlist.find("|"+skin_table[i][1]+"|") == null){
					//	printl("스킨 배제 코드 추가 : "+skin_table[i][1]);
						::manacat_rng_item.sessionData.exceptlist += "|"+skin_table[i][1]+"|";	//배제 코드 기록
					}
					return i-1;
				}
			}
		}else{//스킨별 스폰확률 계산용 (디버그 시에만 사용되는 부분)
			print(skin_set==0?"Dirty)  ":"Clean)  ");
			for(local i = 1; i <= len; i++){
				print("["+i+"] "+(skin_table[i][0]-skin_table[i-1][0])+"％ ");
				if(skin_table[i].len()==2)print("("+skin_table[i][1]+")");
				print("   ")
			}
			printl(" ");
		}
	}

	function OnGameEvent_spawner_give_item(params){
		local player = GetPlayerFromUserID(params.userid);		if(player == null || !player.IsValid() || NetProps.GetPropInt( player, "m_iTeamNum") != 2)return;
		::manacat_rng_item.inv_save(params.userid);
		local itemSpawn = EntIndexToHScript(params.spawner);	if(itemSpawn == null || !itemSpawn.IsValid())return;
		local invTable = {};	GetInvTable(player, invTable);
		if(params.item == "weapon_rifle_m60" || params.item == "weapon_grenade_launcher"){
			NetProps.SetPropInt(invTable.slot0, "m_nSkin", NetProps.GetPropInt(itemSpawn, "m_nSkin"));
			NetProps.SetPropInt(invTable.slot0, "m_nWeaponSkin", NetProps.GetPropInt(itemSpawn, "m_nSkin"));
			resetCurrentWeapon(params.userid);
		}else if(params.item == "weapon_chainsaw"){
			invTable.slot1.Kill();
			player.GiveItemWithSkin("weapon_chainsaw", NetProps.GetPropInt(itemSpawn, "m_nSkin"));
		}else if(params.item == "weapon_melee"){
			NetProps.SetPropInt(invTable.slot1, "m_nBody", NetProps.GetPropInt(itemSpawn, "m_nBody"));
		}else if(params.item == "weapon_molotov" || params.item == "weapon_pipe_bomb" || params.item == "weapon_vomitjar"){
			itemSpawn.ValidateScriptScope();
			local rng = itemSpawn.GetScriptScope();
			if("rngskin" in rng)rng = RandomInt(0, rng.rngskin);
			else rng = NetProps.GetPropInt(itemSpawn, "m_nSkin");
			NetProps.SetPropInt(invTable.slot2, "m_nSkin", rng);
			::manacat_rng_item.chkThrows(player);
		}else if(params.item == "weapon_first_aid_kit" || params.item == "weapon_defibrillator" || params.item == "weapon_upgradepack_explosive" || params.item == "weapon_upgradepack_incendiary"){
			NetProps.SetPropInt(invTable.slot3, "m_nSkin", NetProps.GetPropInt(itemSpawn, "m_nSkin"));
			::manacat_rng_item.chkPacks(player);
			NetProps.SetPropInt(invTable.slot3, "m_nWeaponSkin", NetProps.GetPropInt(itemSpawn, "m_nSkin"));
		}else if(params.item == "weapon_pain_pills" || params.item == "weapon_adrenaline"){
			itemSpawn.ValidateScriptScope();
			local rng = itemSpawn.GetScriptScope();
			if("rngskin" in rng)rng = RandomInt(0, rng.rngskin);
			else rng = NetProps.GetPropInt(itemSpawn, "m_nSkin");
			NetProps.SetPropInt(invTable.slot4, "m_nSkin", rng);
			NetProps.SetPropInt(invTable.slot4, "m_nWeaponSkin", rng);
		}
		chk_golden_magnum(params.userid, itemSpawn);
		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.validSpawner("+params.spawner+")" , 0.0 , null, world);
	}

	function chk_golden_magnum(userid, entity){
		if(entity != null && entity.IsValid() && (entity.GetClassname() == "weapon_pistol_magnum_spawn" || weaponid(NetProps.GetPropInt(entity, "m_weaponID")) == "pistol_magnum") && NetProps.GetPropInt(entity, "m_nSkin")%6 == 5){
			local player = GetPlayerFromUserID(userid);
			if(NetProps.GetPropInt(player, "m_iTeamNum") == 2){
				DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.speakVocal({player = "+userid+", code = \"golden_magnum\"})" , 0.75 , null, world);
				::manacat_rng_item.pistolPickup(player, entity);
			}
		}
	}

	function validSpawner(spawner){
		local spawner = EntIndexToHScript(spawner);
		if(spawner == null || !spawner.IsValid())return;
		if(NetProps.GetPropInt(spawner, "m_itemCount") <= 0)spawner.Kill();
	}

	function pistolChange(userid){
		local player = GetPlayerFromUserID(userid);		if(player == null || !player.IsValid() || NetProps.GetPropInt( player, "m_iTeamNum") != 2)return;
		local invTable = {};	GetInvTable(player, invTable);
		if("slot1" in invTable && invTable.slot1.GetClassname() == "weapon_pistol"){
			local b = RandomInt(1,::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][0]);
			local s = RandomInt(0,::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][2]-1);
			if(NetProps.GetPropInt(invTable.slot1, "m_hasDualWeapons") == 1){
				b += RandomInt(1,::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][0])*::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][0];
				s += RandomInt(0,::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][2]-1)*::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][2];
			}
			NetProps.SetPropInt(invTable.slot1, "m_nWeaponSkin", s);
			NetProps.SetPropInt(invTable.slot1, "m_nSkin", s);
			NetProps.SetPropInt(invTable.slot1, "m_nBody", b);
			if(player.GetActiveWeapon() == invTable.slot1)resetCurrentWeapon(userid);
		}
	}

	function pistolPickup(player, pistol){
		local pclass = pistol.GetClassname(), model = pistol.GetModelName().tolower(), skin = 0, body = 0, dual = false, magnum = 0, scrScope = player.GetScriptScope();
		local invTable = {};	GetInvTable(player, invTable);

		if(pclass == "weapon_pistol_magnum_spawn" || pclass == "weapon_pistol_magnum" || model == "models/w_models/weapons/w_desert_eagle.mdl"){
			skin = NetProps.GetPropInt(pistol, "m_nSkin");
			body = 4+(NetProps.GetPropInt(pistol, "m_nBody") % 2);
			magnum = 1;
		}else{
			local pistols = ::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][0];//현재 준비된 권총의 종류 수
			if(model == "models/w_models/weapons/w_pistol_a.mdl"){
				if(NetProps.GetPropInt(pistol, "m_nBody") == 0)NetProps.SetPropInt(pistol, "m_nBody", 1);
			}else if(model == "models/w_models/weapons/w_pistol_b.mdl"){
				if(NetProps.GetPropInt(pistol, "m_nBody") == 0)NetProps.SetPropInt(pistol, "m_nBody", 2);
			}

			if("slot1" in invTable && invTable.slot1.GetClassname() == "weapon_pistol"){
				local invpistol = invTable.slot1.GetModelName().tolower();
				if(invpistol == "models/v_models/v_pistola.mdl"){
					skin = NetProps.GetPropInt(pistol, "m_nSkin");
					body = NetProps.GetPropInt(pistol, "m_nBody");		if(body > pistols)body -= pistols;
				}else{
					skin = NetProps.GetPropInt(invTable.slot1, "m_nSkin")*3 + NetProps.GetPropInt(pistol, "m_nSkin");
					local a = NetProps.GetPropInt(invTable.slot1, "m_nBody");		local b = NetProps.GetPropInt(pistol, "m_nBody");		if(b > pistols)b -= pistols;
					body = (a*(pistols+1))	+	b;
					if(!IsPlayerABot(player)){
						dual = true;
					}
				}
			}
			NetProps.SetPropInt(invTable.slot1, "m_nSkin", skin);NetProps.SetPropInt(invTable.slot1, "m_nWeaponSkin", skin);NetProps.SetPropInt(invTable.slot1, "m_nBody", body);
			
		}
		scrScope.m_hasMagnumWeapon <- magnum;
		scrScope.m_hasDualWeapons <- NetProps.GetPropInt(invTable.slot1, "m_hasDualWeapons");

		local viewmodel = NetProps.GetPropEntity(player, "m_hViewModel");NetProps.SetPropInt(viewmodel, "m_nBody", body);

		::manacat_rng_item.resetPistol(player, body, skin, dual);
		::manacat_rng_item.inv_save(player.GetPlayerUserId());
	}
	
	function OnGameEvent_player_say(params){
		local player = GetPlayerFromUserID(params.userid);
		if(player == null || !player.IsValid())return;
		local weapon = player.GetActiveWeapon();

		local chat = split( params.text.tolower(), " ");
		local len = chat.len();

		if(len == 1){
			if(!::manacat_rng_item.debug)return;
			if(params.text == "f"){
				printl(::manacat_rng_item.sessionData.exceptlist);
			}
			if(params.text == "z"){
				local mdls = [
					"w_models/weapons/w_eq_medkit.mdl"
					"w_models/weapons/w_eq_incendiary_ammopack.mdl"		"w_models/weapons/w_eq_explosive_ammopack.mdl"
					"w_models/weapons/w_eq_painpills.mdl"				"w_models/weapons/w_eq_adrenaline.mdl"
					"w_models/weapons/w_eq_molotov.mdl"		"w_models/weapons/w_eq_pipebomb.mdl"	"weapons/melee/w_fireaxe.mdl"
					"weapons/melee/w_crowbar.mdl"			"weapons/melee/w_bat.mdl"				"weapons/melee/w_cricket_bat.mdl"
					"weapons/melee/w_frying_pan.mdl"		"weapons/melee/w_tonfa.mdl"				"weapons/melee/w_katana.mdl"
					"weapons/melee/w_golfclub.mdl"			"weapons/melee/w_electric_guitar.mdl"	"weapons/melee/w_machete.mdl"
					"w_models/weapons/w_knife_t.mdl"		"weapons/melee/w_pitchfork.mdl"			"weapons/melee/w_shovel.mdl"
					"weapons/melee/w_chainsaw.mdl"

					"w_models/weapons/w_pistol_a.mdl"		"w_models/weapons/w_pistol_b.mdl"		"w_models/weapons/w_desert_eagle.mdl"
					"w_models/weapons/w_smg_uzi.mdl"		"w_models/weapons/w_smg_a.mdl"			"w_models/weapons/w_smg_mp5.mdl"
					"w_models/weapons/w_shotgun.mdl"				"w_models/weapons/w_pumpshotgun_a.mdl"
					"w_models/weapons/w_autoshot_m4super.mdl"		"w_models/weapons/w_shotgun_spas.mdl"
					"w_models/weapons/w_rifle_m16a2.mdl"			"w_models/weapons/w_rifle_ak47.mdl"
					"w_models/weapons/w_desert_rifle.mdl"			"w_models/weapons/w_rifle_sg552.mdl"
					"w_models/weapons/w_sniper_mini14.mdl"		"w_models/weapons/w_sniper_military.mdl"
					"w_models/weapons/w_sniper_awp.mdl"			"w_models/weapons/w_sniper_scout.mdl"
					"w_models/weapons/w_m60.mdl"				"w_models/weapons/w_grenade_launcher.mdl"];
				for(local i = 0, len = mdls.len(); i < len; i++){
					printl(mdls[i]);
					::manacat_rng_item.skinSelect("models/"+mdls[i], 0, true);
					::manacat_rng_item.skinSelect("models/"+mdls[i], 1, true);
					printl(" ");
				}
			}
		}/*else if(len == 2){
			switch(chat[0]){
				case "!sp":
					local msg = shove_save(player, chat[1]);

					printl(msg);
					switch(msg){
						case -2:
							msg = ::manacatLib.lang(player, ::manacat_common_lang, "wrong_cmd");
						break;
						case -1:
							msg = ::manacatLib.lang(player, ::manacat_rng_item_lang, "host");
						break;
						case 0:
							msg = ::manacatLib.lang(player, ::manacat_rng_item_lang, "unlock");
						break;
						case 1:
							msg = ::manacatLib.lang(player, ::manacat_rng_item_lang, "lock");
						break;
					}
					ClientPrint(player, 5, "MANACAT WEAPONS: \x01"+msg);
				break;
			}
		}*/
	}

	function resetPistol(player, body, skin, dual = false){
		local weapon = null;
		local viewmodel = NetProps.GetPropEntity(player, "m_hViewModel");
		resetCurrentWeapon(player.GetPlayerUserId());
		if(!dual){
			local invTable = {};	GetInvTable(player, invTable);
			weapon = invTable.slot1;
		}

		NetProps.SetPropInt(weapon, "m_nSkin", skin);NetProps.SetPropInt(weapon, "m_nWeaponSkin", skin);NetProps.SetPropInt(weapon, "m_nBody", body);
		NetProps.SetPropInt(viewmodel, "m_nBody", body);
	}

	function resetCurrentWeapon(userid, hideonly = false){
		local player = GetPlayerFromUserID(userid);		if(NetProps.GetPropInt( player, "m_iTeamNum") != 2)return;
		local invTable = {};	GetInvTable(player, invTable);
		if("slot5" in invTable){
			local viewmodel = NetProps.GetPropEntity(player, "m_hViewModel");
			NetProps.SetPropInt(viewmodel, "m_nSkin", NetProps.GetPropInt(player.GetActiveWeapon(), "m_nSkin"));
		}else{
			local viewmodel = NetProps.GetPropEntity(player, "m_hViewModel");
			resetCurrentWeapon_anim(player.GetPlayerUserId());

			NetProps.SetPropInt( viewmodel, "m_hWeapon", 0 );
			NetProps.SetPropInt( viewmodel, "m_nModelIndex", 0 );
		
			if(hideonly)return;

			local game_ui = SpawnEntityFromTable("game_ui",
			{
				FieldOfView = "-1.0"
				spawnflags = "96"
			});
			
			DoEntFire("!self", "Activate", "", 0.0, player, game_ui);
			DoEntFire("!self", "Deactivate", "", 0.0, player, game_ui);
			DoEntFire("!self", "Kill", "", 0.0, null, game_ui);
		}
	}

	function resetCurrentWeapon_anim(userid, seq = "ACT_VM_DEPLOY_LAYER"){
		local player = GetPlayerFromUserID(userid);		if(NetProps.GetPropInt( player, "m_iTeamNum") != 2)return;
		local viewmodel = NetProps.GetPropEntity(player, "m_hViewModel"), weapon = player.GetActiveWeapon();
		local deploySeq = viewmodel.LookupSequence(seq);
		if (deploySeq != -1){
			NetProps.SetPropInt(viewmodel, "m_nLayerSequence", deploySeq);
			NetProps.SetPropInt(viewmodel, "m_nLayer", 0);
			
			local time = Time();
			NetProps.SetPropFloat(viewmodel, "m_flLayerStartTime", time);
			local duration = viewmodel.GetSequenceDuration(deploySeq);
			NetProps.SetPropFloat(weapon, "m_flNextPrimaryAttack", time + duration);
			NetProps.SetPropFloat(weapon, "m_helpingHandSuppressionTimer.m_duration", 1);
			NetProps.SetPropFloat(weapon, "m_helpingHandSuppressionTimer.m_timestamp", time + 1);
			NetProps.SetPropInt(weapon, "m_helpingHandState", 0);
		}
	}

	function speakVocal(params){
		local speaker = GetPlayerFromUserID(params.player);
		local scene = speaker.GetCurrentScene();
		if(scene == null){
			local vocal = VocalSelect(params);
			speaker.PlayScene(vocal, 0.0);
		}
	}

	function VocalSelect(params){
		local vcd = "scenes/";	local pcode = "";
		switch(GetPlayerFromUserID(params.player).GetModelName()){
			case "models/survivors/survivor_gambler.mdl":		vcd += "gambler/";	pcode = "n_";	break;
			case "models/survivors/survivor_producer.mdl":		vcd += "producer/";	pcode = "r_";	break;
			case "models/survivors/survivor_coach.mdl":			vcd += "coach/";	pcode = "c_";	break;
			case "models/survivors/survivor_mechanic.mdl":		vcd += "mechanic/";	pcode = "e_";	break;
			case "models/survivors/survivor_namvet.mdl":		vcd += "namvet/";	pcode = "b_";	break;
			case "models/survivors/survivor_teenangst.mdl":		vcd += "teengirl/";	pcode = "z_";	break;
			case "models/survivors/survivor_manager.mdl":		vcd += "manager/";	pcode = "l_";	break;
			case "models/survivors/survivor_biker.mdl":			vcd += "biker/";	pcode = "f_";	break;
			default:	return false;
		}

		return vcd+::manacat_rngitem_vcd[pcode+params.code][RandomInt(0,::manacat_rngitem_vcd[pcode+params.code].len()-1)];
	}

	function OnGameEvent_weapon_drop(params){
		if(!("item" in params))return;
		local player = GetPlayerFromUserID(params.userid);		if(player == null || !player.IsValid())return;
		local scrScope = player.GetScriptScope();
		if(player.GetActiveWeapon() == null)scrScope.mnc_lastWeapon <- "x";
		::manacat_rng_item.chkThrows(player);		if(NetProps.GetPropInt(player,"m_iHealth") != 0 && NetProps.GetPropFloat(player,"m_healthBuffer") != 0)::manacat_rng_item.inv_save(params.userid);
		local drop = EntIndexToHScript(params.propid), skin = NetProps.GetPropInt(drop, "m_nSkin"), body = NetProps.GetPropInt(drop, "m_nBody");
		if(params.item == "pistol"){
			if(drop == null || !drop.IsValid())return;
			local dual = null;

			local drop_pistols = [];
			
			local extra = true;		local drop_pos = player.EyePosition()-Vector(0,0,12);
			for(local pistol = null; (pistol = Entities.FindInSphere(pistol, drop_pos, 1)) != null && pistol.IsValid();){
				if(pistol.GetClassname() != "weapon_pistol" || NetProps.GetPropEntity(pistol, "m_hOwner") != null)continue;
				if((drop_pos - pistol.GetOrigin()).Length() == 0)drop_pistols.append(pistol);
			}

			local pistols = ::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][0];//현재 준비된 권총의 종류 수
			local a_body = (body-1)/(pistols+1);				local b_body = body - (a_body*(pistols+1));
			pistols = ::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][2];//스킨 종류 수
			local a_skin = (skin/pistols).tointeger();			local b_skin = (skin%pistols).tointeger();

			foreach(pistol in drop_pistols){
				pistol.ValidateScriptScope();
				if(!("mnc_legacy" in pistol.GetScriptScope())){
					if(drop == pistol){
						local pang = RotateOrientation(player.EyeAngles(), QAngle(0, 30, 0));pang = Vector(pang.x, pang.y, pang.z);
						drop = SpawnEntityFromTable( "weapon_pistol", {skin = b_skin, origin = drop_pos, angles = pang, spawnflags = 1073741824} );
						if(drop_pistols.len() == 2)b_body += ::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][0];
						DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.pistolDropDirection(GetPlayerFromUserID("+params.userid+"), EntIndexToHScript("+drop.GetEntityIndex()+"), "+b_body+", "+b_skin+", -1)" , 0.0, null, world);
					}else{
						local pang = RotateOrientation(player.EyeAngles(), QAngle(0, -30, 0));pang = Vector(pang.x, pang.y, pang.z);
						dual = SpawnEntityFromTable( "weapon_pistol", {skin = a_skin, origin = drop_pos, angles = pang, spawnflags = 1073741824} );
						DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.pistolDropDirection(GetPlayerFromUserID("+params.userid+"), EntIndexToHScript("+dual.GetEntityIndex()+"), "+a_body+", "+a_skin+", 1)" , 0.0, null, world);
					}
				}
				pistol.Kill();
			}
		}else if(params.item == "pistol_magnum"){
			local scrScope = player.GetScriptScope();
			player.GetScriptScope().m_hasMagnumWeapon <- 0;
		}else if(params.item == "gascan"){
			local mdl = drop.GetModelName();
			body = ((NetProps.GetPropInt(drop, "m_nSkin")-::manacat_rng_item.weaponList[mdl][1]) / ::manacat_rng_item.weaponList[mdl][2].len())+::manacat_rng_item.weaponList[mdl][0];
			if(body < ::manacat_rng_item.weaponList[mdl][0])body = ::manacat_rng_item.weaponList[mdl][0];
			NetProps.SetPropInt(drop, "m_nBody", body);
			NetProps.SetPropInt(drop, "m_Gender", 9);
		}else{
			if(drop == null || !drop.IsValid())return;
			resetSkinBody(drop);
		}
	}

	function resetSkinBody(entity){
		local mdl = entity.GetModelName().tolower();
		if(!(mdl in ::manacat_rng_item.weaponList))return;
		local variation = typeof ::manacat_rng_item.weaponList[mdl][2] == "array"?::manacat_rng_item.weaponList[mdl][2].len() : ::manacat_rng_item.weaponList[mdl][2];
		if(::manacat_rng_item.weaponList[mdl][0] != 1)NetProps.SetPropInt(entity, "m_nBody", ((NetProps.GetPropInt(entity, "m_nSkin")-::manacat_rng_item.weaponList[mdl][1]) / variation)+abs(::manacat_rng_item.weaponList[mdl][0]));
	}

	function pistolDropDirection(player, pistol, body, skin, n){
		if(player == null || !player.IsValid() || pistol == null || !pistol.IsValid())return;
		local pang = RotateOrientation(player.EyeAngles(), QAngle(0, 30*n, 0));pang = Vector(pang.x, pang.y, pang.z);
		pistol.ApplyLocalAngularVelocityImpulse(pang);
		local invTable = {};	GetInvTable(player, invTable);
		if(n == 0){
			pistol.ApplyAbsVelocityImpulse(player.EyeAngles().Forward().Scale(150));
			pistol.ApplyAbsVelocityImpulse(Vector(0, 0, 100));
		}else if("slot1" in invTable){
			pistol.ApplyAbsVelocityImpulse(player.EyeAngles().Forward().Scale(-150));
		}else{
			pistol.ApplyAbsVelocityImpulse(player.EyeAngles().Forward().Scale(400));
		}
		NetProps.SetPropInt(pistol, "m_nSkin", skin);
		NetProps.SetPropInt(pistol, "m_nWeaponSkin", skin);
		NetProps.SetPropInt(pistol, "m_nBody", body);
		NetProps.SetPropInt(pistol, "m_itemCount", 1);
	}

	function OnGameEvent_player_spawn(params){
		local p = GetPlayerFromUserID(params.userid);
		if(NetProps.GetPropInt( p, "m_iTeamNum") != 2)return;
		::manacat_rng_item.pistolChange(params.userid);
		::manacat_rng_item.chkThrows(p);
		::manacat_rng_item.shove_load(p);
	}
	function OnGameEvent_player_team(params){
		local p = GetPlayerFromUserID(params.userid);
		::manacat_rng_item.chkThrows(p);
		::manacat_rng_item.shove_load(p);
	}
	function OnGameEvent_player_first_spawn(params){
		local p = GetPlayerFromUserID(params.userid)
		::manacat_rng_item.chkThrows(p);
		if(!::manacat_rng_item.iniflag && p == GetListenServerHost()){
			::manacat_rng_item.iniflag = true;
			SetSkinBatch();
		}
	}
	function OnGameEvent_player_entered_start_area(params){
		::manacat_rng_item.startflag = true;
		::manacat_rng_item.chkThrows(GetPlayerFromUserID(params.userid));

		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.CheckPlayingIntro(0)" , 0.1 , null, world);
	}
	function OnGameEvent_player_entered_checkpoint(params){
		::manacat_rng_item.startflag = true;
	}
	function OnGameEvent_player_death(params){
		if("userid" in params)inv_save(params.userid, true);
	}
	function OnGameEvent_player_transitioned(params){
		local p = GetPlayerFromUserID(params.userid);
		::manacat_rng_item.chkThrows(p);
		
		if(!::manacat_rng_item.round_first_inv_load){
			::manacat_rng_item.round_first_inv_load = true;
			RestoreTable("rngiteminv", ::manacat_rng_item.sessionInv);		SaveTable("rngiteminv", ::manacat_rng_item.sessionInv);
		}

		local who = ResponseCriteria.GetValue(p, "who").tolower()+"_act";
		if(!(who in ::manacat_rng_item.sessionInvReady))::manacat_rng_item.sessionInvReady.who <- true;

		::manacat_rng_item.inv_continuity(params.userid, 1);
	}

	function OnGameEvent_player_activate(params){
		local p = GetPlayerFromUserID(params.userid);
		if(IsPlayerABot(p))return;
		::manacat_rng_item.inv_continuity(params.userid);
	}

	function inv_save(userid, death = false, save = true){
		local player = GetPlayerFromUserID(userid);		if(player == null || !player.IsValid() || NetProps.GetPropInt( player, "m_iTeamNum") != 2)return;
		local who = ResponseCriteria.GetValue(player, "who").tolower();
		if(who == "")return;
		who += "_inv";
		local invTable = {};	GetInvTable(player, invTable);	local inv = "";
		for(local i = 0; i < 6; i++){
			if("slot"+i in invTable)inv += NetProps.GetPropInt(invTable["slot"+i], "m_nBody")+":"+NetProps.GetPropInt(invTable["slot"+i], "m_nSkin")+":"+invTable["slot"+i].GetClassname()+":"+NetProps.GetPropInt(invTable["slot"+i], "m_hasDualWeapons")+"|";
			else	inv += "-1:-1:_:-1|";
		}
		if(death){
			::manacat_rng_item.sessionInv[who+"_d_archive"] <- ::manacat_rng_item.sessionInv[who];
			local dying_inv = split(::manacat_rng_item.sessionInv[who], "|");
			local dying_secondary = split(dying_inv[1], ":");
			if(dying_secondary[2] == "weapon_pistol" && dying_secondary[3] == "1"){
				local pistols = ::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][0];//현재 준비된 권총의 종류 수
				local a_body = (dying_secondary[0].tointeger()-1)/(pistols+1);			//	local b_body = dying_secondary[0].tointeger() - (a_body*(pistols+1));
				pistols = ::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][2];//스킨 종류 수
				local a_skin = (dying_secondary[1].tointeger()/pistols).tointeger();	//	local b_skin = (dying_secondary[1].tointeger()%pistols).tointeger();
				dying_inv[1] = a_body+":"+a_skin+":weapon_pistol:0";
			}

			local dead_inv = "";
			for(local i = 0; i < 6; i++){
				dead_inv += dying_inv[i]+"|";
			}
			::manacat_rng_item.sessionInv[who+"_d"] <- dead_inv;
		}
		if(save)::manacat_rng_item.sessionInv[who] <- inv;
		if("slot1" in invTable){
			local viewmodel = NetProps.GetPropEntity(player, "m_hViewModel");
			NetProps.SetPropInt(viewmodel, "m_nBody", NetProps.GetPropInt(invTable.slot1, "m_nBody"));
		}
	}

	function inv_continuity(userid, order = 0){
		local player = GetPlayerFromUserID(userid);		if(player == null || !player.IsValid() || player.IsDead() || player.IsDying())return;
		if(order == 0){
			::manacat_rng_item.resetCurrentWeapon(userid, true);
			DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.inv_continuity("+userid+", 1)" , 0.1 , null, world);
		}else{
			local who = ResponseCriteria.GetValue(player, "who").tolower()+"_inv";
			if(!(who in ::manacat_rng_item.sessionInv))return;
			local invTable = {};	GetInvTable(player, invTable);	local inv = split(::manacat_rng_item.sessionInv[who], "|");
			for(local i = 0; i < 6; i++){
				if("slot"+i in invTable){
					inv[i] = split(inv[i], ":");
					if(inv[i][0].tointeger() >= 0)NetProps.SetPropInt(invTable["slot"+i], "m_nBody", inv[i][0].tointeger());
					if(inv[i][1].tointeger() >= 0)NetProps.SetPropInt(invTable["slot"+i], "m_nSkin", inv[i][1].tointeger());
					NetProps.SetPropInt(invTable["slot"+i], "m_Gender", 9);
					local wclass = invTable["slot"+i].GetClassname();
					if(wclass == "weapon_pistol_magnum")player.GetScriptScope().m_hasMagnumWeapon <- 1;
				}
			}
			::manacat_rng_item.resetCurrentWeapon(userid);
			::manacat_rng_item.inv_save(userid);
		}
	}

	function OnGameEvent_defibrillator_used(params){
		local player = GetPlayerFromUserID(params.subject);
		local who = ResponseCriteria.GetValue(player, "who").tolower()+"_inv";
		if((who+"_d") in ::manacat_rng_item.sessionInv){
			::manacat_rng_item.sessionInv[who] <- ::manacat_rng_item.sessionInv[who+"_d"];
			inv_continuity(params.subject, 1);
		}
	}

	function OnGameEvent_item_pickup(params){
		local player = GetPlayerFromUserID(params.userid);
		if(NetProps.GetPropInt( player, "m_iTeamNum") != 2)return;
		::manacat_rng_item.chkThrows(player);
		player.SetContext("pickup_timestamp", "chk", 5);
		local invTable = {};	GetInvTable(player, invTable);
		if("slot5" in invTable && player.GetActiveWeapon() == invTable.slot5)player.GetScriptScope().mnc_carry <- player.GetActiveWeapon().GetClassname();
		if(Director.IsSessionStartMap() || (ResponseCriteria.GetValue(player, "who").tolower()+"_act") in ::manacat_rng_item.sessionInvReady){
			DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.inv_save("+params.userid+")" , 0.1 , null, world);
		}
	}

	function OnGameEvent_player_use(params){
		local player = GetPlayerFromUserID(params.userid);	if(player == null || !player.IsValid())return;
		local target = EntIndexToHScript(params.targetid);	if(target == null || !target.IsValid())return;
		local tclass = target.GetClassname(), tmodel = ResponseCriteria.GetValue(target, "weaponname"), tid = "weapon_"+weaponid(NetProps.GetPropInt(target, "m_weaponID"));
		if(tclass == "weapon_melee" || tclass == "weapon_chainsaw" || tclass == "weapon_chainsaw_spawn")return;
		if(tclass == "weapon_pistol_spawn" || tclass == "weapon_pistol" || tid == "weapon_pistol"){
			if(player.GetScriptScope().m_hasDualWeapons <= 0){
				::manacat_rng_item.pistolPickup(player, target);
			}else{
				player.ValidateScriptScope();	local scrScope = player.GetScriptScope();
				if("weapon_switch_1" in scrScope)scrScope.weapon_switch_2 <- scrScope.weapon_switch_1;
				scrScope.weapon_switch_1 <- Time();
				DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.pistol_pickup_switch("+params.userid+","+params.targetid+",0)" , 0.1 , null, world);
			}
		}else if(tclass == "weapon_pistol_magnum_spawn" || tclass == "weapon_pistol_magnum" || tid == "weapon_pistol_magnum"){
			if(player.GetScriptScope().m_hasMagnumWeapon <= 0){
				::manacat_rng_item.pistolPickup(player, target);	//printl("최초 확보");
			}else{
				player.ValidateScriptScope();	local scrScope = player.GetScriptScope();	//printl("교체");
				if("weapon_switch_1" in scrScope)scrScope.weapon_switch_2 <- scrScope.weapon_switch_1;
				scrScope.weapon_switch_1 <- Time();
				local invTable = {}; GetInvTable(player, invTable);
				DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.item_pickup_switch("+params.userid+","+params.targetid+",0)" , 0.1 , null, world);
			}
		}else if(tclass == "prop_physics"){
			local w = player.GetActiveWeapon(), wc = w.GetClassname();
			if((wc == "weapon_gascan" || wc == "weapon_propanetank") && NetProps.GetPropInt(w, "m_Gender") != 9){
				NetProps.SetPropInt(w, "m_Gender", 9);
				local tgskin = NetProps.GetPropInt(target, "m_nSkin");
				NetProps.SetPropInt(w, "m_nBody", NetProps.GetPropInt(target, "m_nBody"));
				NetProps.SetPropInt(w, "m_nSkin", tgskin);
				local viewmodel = NetProps.GetPropEntity(player, "m_hViewModel");
				NetProps.SetPropInt(viewmodel, "m_nSkin", tgskin);
			}
		}else{
			target.ValidateScriptScope(); local target_scrScope = target.GetScriptScope();
			local invTable = {}; GetInvTable(player, invTable);
			for(local i = 0; i < 5; i++){
				if("slot"+i in invTable){
					local mclass = invTable["slot"+i].GetClassname();
					if((mclass == tclass || mclass+"_spawn" == tclass || ((tclass == "weapon_spawn" || tclass == "weapon_melee_spawn") && mclass == tid))
					&& (NetProps.GetPropInt(invTable["slot"+i], "m_nSkin") != NetProps.GetPropInt(target, "m_nSkin") || NetProps.GetPropInt(invTable["slot"+i], "m_nBody") != NetProps.GetPropInt(target, "m_nBody"))
					&& !("rngskin" in target_scrScope)){
						player.ValidateScriptScope();	local scrScope = player.GetScriptScope();
						if("weapon_switch_1" in scrScope)scrScope.weapon_switch_2 <- scrScope.weapon_switch_1;
						scrScope.weapon_switch_1 <- Time();
						DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.item_pickup_switch("+params.userid+","+params.targetid+",0)" , 0.1 , null, world);
					}
				}
			}
		}
	}

	function hint_show(userid, code, timeout = 5, binding="", icon_offscreen="", icon_onscreen=""){
		if(!("hint" in ::manacat_rng_item)){
			local hinttbl ={
				classname = "env_instructor_hint",
				hint_allow_nodraw_target = "1",
				hint_caption = "",
				hint_color = "255 255 255",
				hint_instance_type = 1,
				hint_static = "1",
				targetname = "rng_hint",
			};
			::manacat_rng_item.hint <- g_ModeScript.CreateSingleSimpleEntityFromTable(hinttbl);
		}
		local player = GetPlayerFromUserID(userid);
		if(!("rng_item_use" in ::MANACAT) && player == GetListenServerHost())return;
		NetProps.SetPropString(::manacat_rng_item.hint, "m_iszCaption", ::manacat_rng_item_lang[code+"_"+::manacatLib.lang(player)] );
		NetProps.SetPropInt(::manacat_rng_item.hint, "m_iTimeout", timeout );
		NetProps.SetPropString(::manacat_rng_item.hint, "m_iszBinding", binding );
		NetProps.SetPropString(::manacat_rng_item.hint, "m_iszIcon_Offscreen", icon_offscreen );
		NetProps.SetPropString(::manacat_rng_item.hint, "m_iszIcon_Onscreen", icon_onscreen );
		DoEntFire("!self", "ShowHint", "", 0.0, player, ::manacat_rng_item.hint);
		return;
	}

	function pistol_pickup_switch(userid, targetid, n){
		local player = GetPlayerFromUserID(userid);		if(player == null || !player.IsValid())return;
		local target = EntIndexToHScript(targetid);		if(target == null || !target.IsValid() || (NetProps.GetPropInt(target, "m_itemCount") <= 0 && target.GetClassname() == "weapon_pistol_spawn"))return;
		local invTable = {},	scrScope = player.GetScriptScope();		GetInvTable(player, invTable);
		local tgbody = NetProps.GetPropInt(target, "m_nBody"), tgskin = NetProps.GetPropInt(target, "m_nSkin");
		local mybody = NetProps.GetPropInt(invTable.slot1, "m_nBody"), myskin = NetProps.GetPropInt(invTable.slot1, "m_nSkin");
		local pistols = ::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][0], skins = ::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"][2];//준비된 총 종류 수, 스킨의 가짓수

		if((NetProps.GetPropInt( player, "m_nButtons")&32)!=32){
			scrScope.weapon_switch_2 <- scrScope.weapon_switch_1;

			if(n == 99 && scrScope.weapon_switch_1 != 0){
				if((mybody%(pistols+1) == tgbody && myskin%skins == tgskin) && ((mybody/(pistols+1)).tointeger() == tgbody && (myskin/skins).tointeger() == tgskin))return;
				if(player.GetContext("pickup_timestamp") == "chk")::manacat_rng_item.hint_show(userid, "pistol", 4, "use", "use_binding", "use_binding");
			}else{
				DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.pistol_pickup_switch("+userid+","+targetid+", 99)" , 1.0 , null, world);
			}

			return;
		}else if(n > 10){
			if("weapon_switch_time" in scrScope && scrScope.weapon_switch_time+1 > Time())return;
			if(!("slot1" in invTable) || invTable.slot1.GetClassname() != "weapon_pistol")return;
			if(tgbody == 0){
				local mdl = target.GetModelName().tolower();
				if(mdl == "models/w_models/weapons/w_pistol_a.mdl")		tgbody = 1;
				else													tgbody = 2;
			}else if(tgbody > pistols){
				tgbody -= pistols;
			}
			if("weapon_switch_2" in scrScope && (scrScope.weapon_switch_1 - scrScope.weapon_switch_2) < 0.5){
				if(mybody%(pistols+1) == tgbody && myskin%skins == tgskin){		if(player.GetContext("pickup_timestamp") != "chk")::manacat_rng_item.hint_show(userid, "pistol_same_l", 2, "", "", "");	return;		}
				tgbody = mybody - (mybody%(pistols+1)) + tgbody;			tgskin = myskin - (myskin%skins) + tgskin;
				mybody = mybody%(pistols+1);								myskin = myskin%skins;
			}else{
				if((mybody/(pistols+1)).tointeger() == tgbody && (myskin/skins).tointeger() == tgskin){		if(player.GetContext("pickup_timestamp") != "chk")::manacat_rng_item.hint_show(userid, "pistol_same_r", 2, "", "", "");	return;		}
				tgbody = (tgbody*(pistols+1)) + (mybody%(pistols+1));		tgskin = (tgskin*skins) + (myskin%skins);
				mybody = mybody/(pistols+1).tointeger();					myskin = (myskin/skins).tointeger();
			}

			scrScope.weapon_switch_time <- Time();
			NetProps.SetPropInt(invTable.slot1, "m_nBody", tgbody);		NetProps.SetPropInt(invTable.slot1, "m_nSkin", tgskin);

			if(player.GetActiveWeapon() == invTable.slot1)resetCurrentWeapon(userid);
			else	player.SwitchToItem(invTable.slot1.GetClassname());

			mybody += pistols;//권총 라이트 떼주려고
			local drop_pos = player.EyePosition()-Vector(0,0,12);
			local pang = RotateOrientation(player.EyeAngles(), QAngle(0, 30, 0));pang = Vector(pang.x, pang.y, pang.z);
			local drop = SpawnEntityFromTable( "weapon_pistol", {skin = myskin, origin = drop_pos, angles = pang, spawnflags = 1073741824} );
			DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.pistolDropDirection(GetPlayerFromUserID("+userid+"), EntIndexToHScript("+drop.GetEntityIndex()+"), "+mybody+", "+myskin+", 0)" , 0.0, null, world);

			NetProps.SetPropInt(target, "m_itemCount", NetProps.GetPropInt(target, "m_itemCount")-1);
			if(NetProps.GetPropInt(target, "m_itemCount") <= 0)target.Kill();
			scrScope.weapon_switch_1 = 0;
			inv_save(userid);
			player.SetContext("pickup_timestamp", "chk", 5);
			return;
		}
		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.pistol_pickup_switch("+userid+","+targetid+", "+(++n)+")" , 0.1 , null, world);
	}

	function item_pickup_switch(userid, targetid, n){
		local player = GetPlayerFromUserID(userid);		if(player == null || !player.IsValid())return;
		local scrScope = player.GetScriptScope(), key = NetProps.GetPropInt( player, "m_nButtons");
		if((key&32)!=32 || (key&8224)==8224){
			scrScope.weapon_switch_2 <- scrScope.weapon_switch_1;

			if(n == 99 && scrScope.weapon_switch_1 != 0){
				local target = EntIndexToHScript(targetid);		if(target == null || !target.IsValid())return;
				local tclass = target.GetClassname();			if(NetProps.GetPropInt(target, "m_itemCount") <= 0 && tclass.find("_spawn") != null)return;
				if(tclass.find("_spawn") != null)tclass = "weapon_"+weaponid(NetProps.GetPropInt(target, "m_weaponID"));
				local msg = "wpn";
				switch(tclass.tolower()){
					case "weapon_molotov":case "weapon_pipe_bomb":case "weapon_vomitjar":case "weapon_first_aid_kit":case "weapon_defibrillator":
					case "weapon_upgradepack_explosive":case "weapon_upgradepack_incendiary":case "weapon_pain_pills":case "weapon_adrenaline":msg = "itm";
				}
				if(player.GetContext("pickup_timestamp") != "chk")::manacat_rng_item.hint_show(userid, msg, 4, "use", "use_binding", "use_binding");
			}else{
				DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.item_pickup_switch("+userid+","+targetid+", 99)" , 1.0 , null, world);
			}

			return;
		}else if(n > 10){
			if("weapon_switch_time" in scrScope && scrScope.weapon_switch_time+1 > Time())return;
			local target = EntIndexToHScript(targetid);		if(target == null || !target.IsValid())return;
			local tclass = target.GetClassname();
			if(NetProps.GetPropInt(target, "m_itemCount") <= 0 && tclass.find("_spawn") != null)return;
			if(tclass.find("_spawn") != null)tclass = "weapon_"+weaponid(NetProps.GetPropInt(target, "m_weaponID"));
			local invTable = {};	GetInvTable(player, invTable);
			local have = -1, mclass = null;
			for(local i = 0; i < 5; i++)if("slot"+i in invTable && invTable["slot"+i].GetClassname() == tclass){have = i;mclass = invTable["slot"+have].GetClassname();break;}
			if(have == -1)return;

			local tgbody = NetProps.GetPropInt(target, "m_nBody"), tgskin = NetProps.GetPropInt(target, "m_nSkin");
			local mybody = NetProps.GetPropInt(invTable["slot"+have], "m_nBody"), myskin = NetProps.GetPropInt(invTable["slot"+have], "m_nSkin");
			local blv = NetProps.GetPropInt( invTable["slot"+have], "m_iBloodyWeaponLevel" );

			local spawntable = {skin = tgskin, body = tgbody, origin = target.GetOrigin(), angles = target.GetAngles(), spawnflags = 1073741824}
			if(mclass == "weapon_melee"){
				spawntable["melee_script_name"] <- NetProps.GetPropString(invTable["slot"+have], "m_strMapSetScriptName");
				local pick = SpawnEntityFromTable( mclass, spawntable );
				DoEntFire("!self", "Use", "", 0.0, player, pick);
				NetProps.SetPropInt(target, "m_itemCount", NetProps.GetPropInt(target, "m_itemCount")-1);
				if(NetProps.GetPropInt(target, "m_itemCount") <= 0)target.Kill();
				return;
			}/*else{
				player.DropItem(mclass);
				DoEntFire("!self", "Use", "", 0.0, player, target);
				DoEntFire("!self", "RunScriptCode", "GetPlayerFromUserID("+userid+").SwitchToItem(\""+mclass+"\")", 0.0, player, target);
				player.SwitchToItem(mclass);
				return;
			}*/


			scrScope.weapon_switch_time <- Time();
			NetProps.SetPropInt(invTable["slot"+have], "m_nBody", tgbody);		NetProps.SetPropInt(invTable["slot"+have], "m_nSkin", tgskin);

			if(player.GetActiveWeapon() == invTable["slot"+have])resetCurrentWeapon(userid);
			else	player.SwitchToItem(mclass);

			local drop_pos = player.EyePosition()-Vector(0,0,mclass=="weapon_melee"?16:12);
			local pang = RotateOrientation(player.EyeAngles(), mclass=="weapon_melee"?QAngle(50, 100, 0):QAngle(0, 30, 0));pang = Vector(pang.x, pang.y, pang.z);
			local spawntable = {skin = myskin, origin = drop_pos, angles = pang, spawnflags = 1073741824}

			local drop = SpawnEntityFromTable( mclass, spawntable );
			
			if(("slot0" in invTable && invTable.slot0.GetClassname() == mclass)
			|| ("slot1" in invTable && invTable.slot1.GetClassname() == mclass)){
				local ammo = NetProps.GetPropIntArray( player, "m_iAmmo", NetProps.GetPropInt( invTable["slot"+have], "m_iPrimaryAmmoType" ));
				if(ammo >= 0){
					NetProps.SetPropInt( drop, "m_iExtraPrimaryAmmo", ammo);
					NetProps.SetPropInt( drop, "m_iClip1", NetProps.GetPropInt( invTable["slot"+have], "m_iClip1" ));
				}
				ammo = NetProps.GetPropInt( target, "m_iExtraPrimaryAmmo" );
				if(ammo >= 0){
					NetProps.SetPropIntArray( player, "m_iAmmo", ammo, NetProps.GetPropInt( target, "m_iPrimaryAmmoType" ));
					NetProps.SetPropInt( invTable["slot"+have], "m_iClip1", NetProps.GetPropInt( target, "m_iClip1" ));
				}
			}
			NetProps.SetPropInt( drop, "m_iBloodyWeaponLevel", blv );

			DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.pistolDropDirection(GetPlayerFromUserID("+userid+"), EntIndexToHScript("+drop.GetEntityIndex()+"), "+mybody+", "+myskin+", 0)" , 0.0, null, world);

			NetProps.SetPropInt(target, "m_itemCount", NetProps.GetPropInt(target, "m_itemCount")-1);
			if(NetProps.GetPropInt(target, "m_itemCount") <= 0)target.Kill();
			scrScope.weapon_switch_1 = 0;
			inv_save(userid);

			EmitSoundOnClient("Player.PickupWeapon", player);
			chk_golden_magnum(userid, target);
			player.SetContext("pickup_timestamp", "chk", 5);
			return;
		}
		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.item_pickup_switch("+userid+","+targetid+", "+(++n)+")" , 0.1 , null, world);
	}

	function OnGameEvent_player_bot_replace(params){character_replace(params, true);}//사람을 봇으로 교체
	function OnGameEvent_bot_player_replace(params){character_replace(params, false);}//봇을 사람이 테이크오버

	function character_replace(params, botsub){
		local player = GetPlayerFromUserID(params.player);			local bot = GetPlayerFromUserID(params.bot);
		::manacat_rng_item.chkThrows(player);						::manacat_rng_item.chkThrows(bot);
		if(::manacat_rng_item.intro == 1){
			ctrl_invisible(player);									ctrl_invisible(bot);
		}

		if(botsub){
			inv_save(params.player);		inv_continuity(params.bot);
		}else{
			inv_save(params.bot);			inv_continuity(params.player);
		}
	}

	function OnGameEvent_player_disconnect(params){
		local player = GetPlayerFromUserID(params.userid);
		if(player == null || !player.IsValid() || !("GetModelName" in player))return;
		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.character_remove(\""+ResponseCriteria.GetValue(player, "who").tolower()+"\", \""+player.GetModelName()+"\")" , 0.1 , null, world);
	}

	function character_remove(who, mdl){
		local find = false;
		for(local player = null; (player = Entities.FindByClassname(player, "player")) != null && player.IsValid();){
			if(NetProps.GetPropInt( player, "m_iTeamNum") == 2 && player.GetModelName() == mdl){	find = true;	break;	}
		}
		if(find || !("dummy" in ::manacat_rng_item.sessionInvReady))return;
		foreach(d in ::manacat_rng_item.sessionInvReady.dummy)if(d[0] == who && d[1] != null && d[1].IsValid())d[1].Kill();
	}

	function chkThrows(player){
		local invTable = {};	GetInvTable(player, invTable);
		player.ValidateScriptScope();	local scrScope = player.GetScriptScope();
		if(!("mnc_reload" in scrScope)){
			scrScope.mnc_reload <- 0;
			scrScope.mnc_deploy <- 0;
			scrScope.mnc_parity_deploy <- 0;
			scrScope.mnc_lastWeapon <- null;
		}
		if("slot1" in invTable){
			scrScope.m_hasMagnumWeapon <- invTable.slot1.GetClassname() == "weapon_pistol_magnum"?1:0;
			scrScope.m_hasDualWeapons <- NetProps.GetPropInt(invTable.slot1, "m_hasDualWeapons");
		}else if(!("slot1" in invTable)){
			scrScope.m_hasMagnumWeapon <- 0;
			scrScope.m_hasDualWeapons <- -1;
		}
		if("slot2" in invTable){
			local weapon = invTable.slot2;
			local wclass = weapon.GetClassname();
			if(wclass == "weapon_molotov" || wclass == "weapon_pipe_bomb" || wclass == "weapon_vomitjar"){
				NetProps.SetPropInt(weapon, "m_nWeaponSkin", NetProps.GetPropInt( weapon, "m_nSkin"));
				local scrScope = scrScope;
				scrScope.throwSkin <- NetProps.GetPropInt( weapon, "m_nSkin");
			}
		}
		if("slot3" in invTable){
			local weapon = invTable.slot3;
			local wclass = weapon.GetClassname();
			if(wclass == "weapon_first_aid_kit" || wclass == "weapon_defibrillator" || wclass == "weapon_upgradepack_explosive" || wclass == "weapon_upgradepack_explosive"){
				NetProps.SetPropInt(weapon, "m_nWeaponSkin", NetProps.GetPropInt( weapon, "m_nSkin"));
			}
		}
	}

	function chkPacks(player){
		local invTable = {};	GetInvTable(player, invTable);
		if(!("slot3" in invTable))return;
		local weapon = invTable.slot3;
		local wclass = weapon.GetClassname();
		if(wclass == "weapon_first_aid_kit" || wclass == "weapon_defibrillator" || wclass == "weapon_upgradepack_explosive" || wclass == "weapon_upgradepack_incendiary"){
			NetProps.SetPropInt(weapon, "m_nWeaponSkin", NetProps.GetPropInt( weapon, "m_nSkin"));
		}
	}

	function chkLay(weapon){
		local cn = weapon.GetClassname();
		switch(cn){
			case "prop_physics":case "prop_dynamic":
			case "weapon_molotov":case "weapon_molotov_spawn":
			case "weapon_pipe_bomb":case "weapon_pipe_bomb_spawn":
			case "weapon_vomitjar":case "weapon_vomitjar_spawn":
			case "prop_minigun":case "prop_minigun_l4d1":
			case "weapon_ammo_spawn":
			case "weapon_first_aid_kit_spawn":
			case "weapon_defibrillator_spawn":
			case "weapon_upgradepack_incendiary_spawn":case "upgrade_ammo_incendiary":
			case "weapon_upgradepack_explosive_spawn":case "upgrade_ammo_explosive":
			case "weapon_pain_pills":case "weapon_pain_pills_spawn":
			case "weapon_adrenaline":case "weapon_adrenaline_spawn":
			case "weapon_chainsaw_spawn":
			case "weapon_pistol_spawn":case "weapon_pistol":
			case "weapon_pistol_magnum_spawn":case "weapon_pistol_magnum":
			return true;
			default:break;
		}
		local startpos = weapon.GetOrigin();
		local endpos = startpos + weapon.GetAngles().Left().Scale(50);
		if(endpos.z < startpos.z)endpos = startpos + weapon.GetAngles().Left().Scale(-50);

		local targetNorm = Vector(endpos.x, endpos.y, endpos.z);
		targetNorm.x -= startpos.x;	targetNorm.y -= startpos.y;	targetNorm.z -= startpos.z;
		targetNorm.x = targetNorm.x/targetNorm.Norm();
		targetNorm.y = targetNorm.y/targetNorm.Norm();
		targetNorm.z = targetNorm.z/targetNorm.Norm();

		if(180/PI*acos(targetNorm.Dot(Vector(0,0,1))) < 4.0){
			//DebugDrawLine(startpos, endpos, 0, 255, 0, true, 60);
			return true;
		}
		//DebugDrawLine(startpos, endpos, 255, 0, 0, true, 60);
		return false;
	}

	function timer(){
		for(local gascan = null; (gascan = Entities.FindByClassname(gascan, "weapon_gascan")) != null && gascan.IsValid();){
			gascan.ValidateScriptScope();
			local scrScope = gascan.GetScriptScope();
			if("rngchk" in scrScope)continue;
		//	if(NavMesh.GetNearestNavArea(gascan.GetOrigin(), 150.0, true, true) != null){
				if(NetProps.GetPropInt(gascan, "m_Gender") != 9){
					if(NetProps.GetPropInt(gascan, "m_nSkin") == 0 || shove_alt(GetListenServerHost(), null, 16))SetSkin({e = gascan, p = true});
					else if(NetProps.GetPropInt(gascan, "m_nBody") == 0)NetProps.SetPropInt(gascan, "m_nBody", 3);
				}
		//	}
			scrScope.rngchk <- true;
		}

		for(local carry = null; (carry = Entities.FindByClassname(carry, "prop_physics")) != null && carry.IsValid();){
			if(carry.GetModelName() == "models/props_junk/propanecanister001a.mdl" && NetProps.GetPropInt(carry, "m_Gender") != 9){
			//	if(NavMesh.GetNearestNavArea(gascan.GetOrigin(), 150.0, true, true) != null){
					NetProps.SetPropInt(carry, "m_nBody", 2);
			//	}
				local pos = carry.GetOrigin();
				for(local e = null; (e = Entities.FindByClassname(e, "weapon_propanetank")) != null && e.IsValid();){
					if(NetProps.GetPropEntity(e, "m_hOwner") == null){
						if(NetProps.GetPropInt(e, "m_iClip1") == 9)continue;
						NetProps.SetPropInt(e, "m_iClip1", 9);
						if((e.GetOrigin() - pos).Length() < 100){
							foreach(p in ::manacatLib.survivor){
								if((p.GetOrigin()-e.GetOrigin()).Length() < 10){
									NetProps.SetPropInt(carry, "m_nBody", NetProps.GetPropInt(e, "m_nBody"));
									NetProps.SetPropInt(carry, "m_nSkin", NetProps.GetPropInt(e, "m_nSkin"));
									NetProps.SetPropInt(carry, "m_Gender", 9);
									break;
								}
							}
						}
					}
					if(NetProps.GetPropInt(carry, "m_Gender") == 9)break;
				}
				NetProps.SetPropInt(carry, "m_Gender", 9)
			}
		}

		DoEntFire("!self", "RunScriptCode", "manacat_rng_item.prt_sync()", 0.0, null, world);

		for(local player = null; (player = Entities.FindByClassname(player, "player")) != null && player.IsValid();){
			if(player.IsDead() || player.IsDying() || NetProps.GetPropInt( player, "m_iTeamNum") != 2)continue;
			local weapon = player.GetActiveWeapon(); if(weapon == null)continue;
			local wclass = weapon.GetClassname(), wseq = weapon.GetSequence(), wact = weapon.GetSequenceActivityName(wseq);
			local viewmodel = NetProps.GetPropEntity(player, "m_hViewModel"), parity = NetProps.GetPropInt(viewmodel, "m_nAnimationParity"), pseq = player.GetSequence(), pact = player.GetSequenceActivityName(pseq);
			local scrScope = player.GetScriptScope(), weapon_changed = false, parity_changed = false;
		
			/*if("mnc_carry" in scrScope){
				if(wclass == scrScope.mnc_carry)continue;
				else scrScope.rawdelete("mnc_carry");
			}*/

			if(scrScope.mnc_lastWeapon == null || scrScope.mnc_lastWeapon != wclass){
				scrScope.mnc_lastWeapon <- wclass;
			//	resetCurrentWeapon(player.GetPlayerUserId());
				weapon_changed = true;
			}

			if((wact == "ACT_VM_DRAW" || wact == "ACT_VM_DEPLOY_LAYER" || wact == "ACT_VM_DEPLOY_GASCAN") && parity != scrScope.mnc_parity_deploy){
				scrScope.mnc_parity_deploy <- parity;
				parity_changed = true;
				local wmodel = weapon.GetModelName();
				if(wmodel in ::manacat_rng_item.weaponList){
					local variation = typeof ::manacat_rng_item.weaponList[wmodel][2] == "array"?::manacat_rng_item.weaponList[wmodel][2].len() : ::manacat_rng_item.weaponList[wmodel][2];
					NetProps.SetPropInt(weapon, "m_nBody", (abs(::manacat_rng_item.weaponList[wmodel][0])*2) + ((NetProps.GetPropInt(weapon, "m_nSkin"))/variation).tointeger());
				}
			}

			if((weapon_changed && parity_changed) && !player.IsIncapacitated()){
				if(scrScope.mnc_deplay_out < Time() && (GetListenServerHost() != player || shove_alt(player, parity))){
					local userid = player.GetPlayerUserId();
					if(wact == "ACT_VM_DEPLOY_LAYER" || wact == "ACT_VM_DEPLOY_GASCAN"){						
						local deploy = 0;
						if(wclass == "weapon_pistol_magnum"){
							local body = NetProps.GetPropInt(weapon, "m_nBody");
							if(body == 5){
								deploy = RandomInt(0,2);	if(deploy != 0)deploy = "ACT_VM_DEPLOY2_"+(64+deploy).tochar()+"_LAYER";
							}else{
								deploy = RandomInt(0,3);	if(deploy != 0)deploy = "ACT_VM_DEPLOY_"+(64+deploy).tochar()+"_LAYER";
							}
						}else if(wclass == "weapon_pistol"){
							local pm = player.GetModelName();
							if((pm == "models/survivors/survivor_biker.mdl" || pm == "models/survivors/survivor_mechanic.mdl") && RandomInt(0,2)==0)
									deploy = "ACT_VM_DEPLOY_SPIN_LAYER";
							else	deploy = "ACT_VM_DEPLOY_"+(64+RandomInt(0,3)).tochar()+"_LAYER";
						}else{
							if(RandomInt(1,3)!=1)deploy = "ACT_VM_DEPLOY_"+(64+RandomInt(1,2)).tochar()+"_LAYER";//가스캔
						}

						if(deploy != 0){
							local deploySeq = viewmodel.LookupSequence("ACT_VM_DEPLOY_LAYER");
							if(deploySeq == -1)deploySeq = viewmodel.LookupSequence("ACT_VM_DEPLOY_GASCAN");
							NetProps.SetPropInt(viewmodel, "m_nLayerSequence", deploySeq);
							NetProps.SetPropInt(viewmodel, "m_nLayer", 0);
							DoEntFire("!self", "RunScriptCode", "manacat_rng_item.viewmodel_anim("+userid+", 2, \""+deploy+"\")", 0.001, null, world);

							scrScope.mnc_deploy <- (Time()+0.7);
						}
					}
				}
			}
			if(wact == "ACT_VM_MELEE_LAYER"){
				if(shove_alt(player, parity)){
					if(wclass == "weapon_pistol_magnum"){
						if(scrScope.shove_r.slice(1,2) != parity.tostring()){
							if(scrScope.shove_r.slice(0,1) == "B"){
								scrScope.shove_r = "A"+parity;
							}else{
								scrScope.shove_r = "B"+parity;
								local userid = player.GetPlayerUserId();
								::manacat_rng_item.viewmodel_anim(userid, 3, "ACT_VM_MELEE_2_LAYER");
							}
						}
					}else{
						//local shove_r = player.GetContext("mnc_s_r"), shove_l = player.GetContext("mnc_s_l"), shove_t = player.GetContext("mnc_sm_"), shove_h = player.GetContext("mnc_s_h");
						if(scrScope.shove_t.slice(1,2) != parity.tostring()){
							if(/*scrScope.shove_t.slice(0,1) == "B" || */scrScope.shove_t.slice(2).tofloat()+1 < Time()){
								scrScope.shove_t = "A"+parity+Time();	scrScope.shove_h = "R0";					//	printl("오른손 첫타");
							}else{
								scrScope.shove_t = "B"+parity+Time();
								local weight = scrScope.shove_h.slice(1,2).tointeger(), Hside;
								if(scrScope.shove_h.slice(0,1) == "R"){
									if(RandomInt(0,weight) > 0 || weight == 4){
										Hside = false;scrScope.shove_h = "L0";scrScope.shove_r = "B"+parity;		//	printl("왼손 스위치");
									}else{
										Hside = true;scrScope.shove_h = "R"+(++weight);								//	printl("오른손 계속  " + weight);
									}
								}else{
									if(RandomInt(0,weight) > 0 || weight == 1){
										Hside = true;scrScope.shove_h = "R0";scrScope.shove_l = "B"+parity;			//	printl("오른손 스위치");
									}else{
										Hside = false;scrScope.shove_h = "L"+(++weight);							//	printl("왼손 계속  " + weight);
									}
								}

								if(Hside){
									local userid = player.GetPlayerUserId();
									if(scrScope.shove_r.slice(0,1) == "B"){
										scrScope.shove_r = "A"+parity;
										::manacat_rng_item.viewmodel_anim(userid, 3, "ACT_VM_MELEE_LAYER");
									}else{
										scrScope.shove_r = "B"+parity;
										::manacat_rng_item.viewmodel_anim(userid, 3, "ACT_VM_MELEE_1_LAYER");
									}
								}else{
									local userid = player.GetPlayerUserId();
									if(scrScope.shove_l.slice(0,1) == "B"){
										scrScope.shove_l = "A"+parity;
										::manacat_rng_item.viewmodel_anim(userid, 3, "ACT_VM_MELEE_2_LAYER");
									}else{
										scrScope.shove_l = "B"+parity;
										::manacat_rng_item.viewmodel_anim(userid, 3, "ACT_VM_MELEE_3_LAYER");
									}
								}
							}
						}
					}
				}
			}else if(wact == "ACT_VM_SECONDARYATTACK" || wact == "ACT_VM_SECONDARYATTACK_LAYER"){
			//	if(shove_alt(player, parity)){
					local scrScope = player.GetScriptScope();
					if(scrScope.shove_t.slice(1,2) != parity.tostring()){
						if(scrScope.shove_t.slice(0,1) == "B" || scrScope.shove_t.slice(2).tofloat()+1 < Time()){
							scrScope.shove_t = "A"+parity+Time();
						}else{
							scrScope.shove_t = "B"+parity+Time();
							local userid = player.GetPlayerUserId();
							::manacat_rng_item.viewmodel_anim(userid, 2, "ACT_VM_SECONDARYATTACK_2_LAYER");
						}
					}
			//	}
			}else if(wact == "ACT_VM_MELEE_GASCAN"){
				if(shove_alt(player, parity)){
					local scrScope = player.GetScriptScope();
					if(scrScope.shove_t.slice(1,2) != parity.tostring()){
						if(scrScope.shove_t.slice(0,1) == "B" || scrScope.shove_t.slice(2).tofloat()+1 < Time()){
							scrScope.shove_t = "A"+parity+Time();
							if(RandomInt(1,2)==1){
								local userid = player.GetPlayerUserId();
								::manacat_rng_item.viewmodel_anim(userid, 3, "ACT_VM_MELEE_1_LAYER");
							}
						}else{
							scrScope.shove_t = "B"+parity+Time();
							local userid = player.GetPlayerUserId();
							::manacat_rng_item.viewmodel_anim(userid, 3, "ACT_VM_MELEE_"+RandomInt(2,3)+"_LAYER");
						}
					}
				}
			}
		}
		DoEntFire("!self", "RunScriptCode", "manacat_rng_item.timer()", 0.1, null, world);
	}

	function prt_sync(){
		for(local dynamic = null; (dynamic = Entities.FindByClassname(dynamic, "prop_dynamic")) != null && dynamic.IsValid();){
			dynamic.ValidateScriptScope();
			local scrScope = dynamic.GetScriptScope();
			if("prtchk" in scrScope)continue;
			scrScope.prtchk <- true;
			local prt = NetProps.GetPropEntity(dynamic, "moveparent");
			if(prt != null && prt.IsValid() && prt.GetModelName() == dynamic.GetModelName() && prt.GetClassname().slice(0, 3) != "fun"){
				NetProps.SetPropInt(dynamic, "m_nBody", NetProps.GetPropInt(prt, "m_nBody"));
			}
		}
	}

	function shove_alt(player, parity = null, wid = -1){
		if(IsPlayerABot(player))return false;
		local shove = null;
		if(player == null || !player.IsValid()){
			if(GetListenServerHost() == null && "mnc_shove" in ::manacat_rng_item){
				shove = ::manacat_rng_item.mnc_shove;
			}else{
				return false;
			}
		}else{
			local scrScope = player.GetScriptScope();
			if(parity != null){
				if(scrScope.mnc_parity == parity)return;
				else scrScope.mnc_parity = parity;
			}
			shove = scrScope.mnc_shove;	
		}
		if(shove == null)return false;
		shove = split(shove, " ");
		if(player != null && player.IsValid()){
			local weapon = player.GetActiveWeapon();	if(weapon == null || !weapon.IsValid())return false;
			if(wid == -1)wid = weaponid(weapon.GetClassname());		wid = wid.tostring();
		}
		foreach(chk in shove){
			if(chk == wid)return true;
		}
		return false;
	}

	function shove_load(player, read = false){
		if(player == null || !player.IsValid()){
			if(GetListenServerHost() == null){
				local shove = "";
				for(local i = 0; i < 37; i++){
					if(FileToString("manacat_skin_host/"+i+".txt") != null)	shove += i+" ";
				}
				::manacat_rng_item.mnc_shove <- shove;
			}
		}else{
			player.ValidateScriptScope();
			local scrScope = player.GetScriptScope();
			scrScope.shove_r <- "A0";
			scrScope.shove_l <- "A0";
			scrScope.shove_t <- "A00";
			scrScope.shove_h <- "R0";
			scrScope.mnc_parity <- -1;
			scrScope.mnc_deplay_out <- 0;
			if(IsPlayerABot(player))return;
			if(!read && "mnc_shove" in scrScope)return;

			if(GetListenServerHost() == player){
				local shove = "";
				for(local i = 0; i < 37; i++){
					if(FileToString("manacat_skin_host/"+i+".txt") != null)	shove += i+" ";
				}
				scrScope.mnc_shove <- shove;
			}else{
				local steamid = split(player.GetNetworkIDString().slice(6), ":");		steamid = steamid[0]+"-"+steamid[1]+"-"+steamid[2];

				scrScope.mnc_shove <- FileToString("manacat_skin/"+steamid+".txt");
			}
		}
	}

	function shove_save(player, weapon){
		if(IsPlayerABot(player))return;
		if(GetListenServerHost() == player){
			return -1;
		}else{
			local steamid = split(player.GetNetworkIDString().slice(6), ":");		steamid = steamid[0]+"-"+steamid[1]+"-"+steamid[2];

			local dat = FileToString("manacat_skin/"+steamid+".txt");
			dat = dat==null?null:split(dat, " ");
			local res = "", c = true;
			weapon = weaponid(weapon);		if(weapon == null)return -2;
			weapon = weapon.tostring();
			
			if(dat != null){
				foreach(idx in dat){
					if(weapon == idx)	c = false;
					else				res += idx+" ";
				}
			}

			if(c)res += weapon;
			StringToFile("manacat_skin/"+steamid+".txt", res);

			shove_load(player);
			return c?0:1;
		}
	}

	function viewmodel_anim(userid, layer, seq, layerchk = "", seqchk = ""){
		local player = GetPlayerFromUserID(userid);
		//local activeWep = player.GetActiveWeapon();
		local viewmodel = NetProps.GetPropEntity(player, "m_hViewModel");
		if(seqchk != ""){
			seqchk = viewmodel.LookupSequence(seqchk);		if(seqchk == -1)seqchk = "";
		}
		if(seqchk != "" && (layerchk != NetProps.GetPropInt(viewmodel, "m_nLayer") || seqchk != NetProps.GetPropInt(viewmodel, "m_nLayerSequence")))return;
		if(layer == 0){
			seq = viewmodel.LookupSequence("ACT_VM_IDLE");
			viewmodel.SetSequence(seq);

			NetProps.SetPropInt(viewmodel, "m_nLayer", 2);
			NetProps.SetPropInt(viewmodel, "m_nLayerSequence", -1);

			return -1;
		}else{
			if(seq == "-"){
				seq = -1;
			}else{
				seq = viewmodel.LookupSequence(seq);		if(seq == -1)return -1;
			}
			
			NetProps.SetPropInt(viewmodel, "m_nLayer", layer);
			NetProps.SetPropInt(viewmodel, "m_nLayerSequence", seq);

			return viewmodel.GetSequenceDuration(seq);
		}
	//	NetProps.SetPropFloat(player.GetActiveWeapon(), "m_flTimeWeaponIdle", Time()+viewmodel.GetSequenceDuration(anim)+1);
	}

	function OnGameEvent_weapon_fire(params){
		local player = GetPlayerFromUserID(params.userid);		if(player == null || !player.IsValid() || NetProps.GetPropInt( player, "m_iTeamNum") != 2)return;
		if(params.weapon == "molotov" || params.weapon == "pipe_bomb" || params.weapon == "vomitjar"){
			DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.throwsSkin("+params.userid+", \""+params.weapon+"\", 15)" , 0.15 , null, world); //Worldspawn
		}/*else if(params.weapon == "melee"){
			DoEntFire("!self", "RunScriptCode", "manacat_rng_item.melee_swing("+player.GetActiveWeapon().GetEntityIndex()+")", 0.0, null, world);
			return;
		}*/
		local scrScope = player.GetScriptScope(), currentTime = Time();
		if(player.GetActiveWeapon().Clip1() == 1)scrScope.mnc_deplay_out = Time() + 1;
		if(scrScope.mnc_reload > currentTime)return;
		if(scrScope.mnc_deploy > currentTime){
			//이 코드가 없으면 deploy 시 발사하면 이상한 방향으로 쏘는 것처럼 보임
			DoEntFire("!self", "RunScriptCode", "manacat_rng_item.viewmodel_anim("+params.userid+", 2, \"-\")", 0.0, null, world);
		}
	}

	//근접무기 공격 애니메이션이 길어도 시퀀스 조작에 영향이 없도록 할 수 있는 코드지만 아주 작은 스터터링이 생기기 때문에 봉인
	/*function melee_swing(meleeid){
		local weapon = EntIndexToHScript(meleeid);		if(weapon == null || !weapon.IsValid())return;
		NetProps.SetPropFloat(weapon, "m_flNextPrimaryAttack", Time() + NetProps.GetPropFloat(weapon, "m_meleeSwingTimer.m_duration"));
	}*/

	function OnGameEvent_weapon_reload(params){
	//	DoEntFire("!self", "RunScriptCode", "manacat_rng_item.viewmodel_anim("+params.userid+", 0, \"ACT_VM_IDLE\")", 0.0, null, world);
	
		local player = GetPlayerFromUserID(params.userid);		if(player == null || !player.IsValid() || NetProps.GetPropInt( player, "m_iTeamNum") != 2)return;
		local weapon = player.GetActiveWeapon(), wclass = weapon.GetClassname(), scrScope = player.GetScriptScope(), currentTime = Time();
		NetProps.SetPropFloat(weapon, "m_flTimeAttackQueued", currentTime);

		scrScope.mnc_reload <- currentTime+3;

		if(wclass == "weapon_pistol_magnum"){
			local host = GetListenServerHost();
			if(NetProps.GetPropInt(weapon, "m_nBody")%2 == 1){
				local reload = "";
				if(shove_alt(host, null, 32)){
					if(weapon.Clip1() == 0){
						reload = "ACT_VM_RELOAD2_EMPTY_"+(65+RandomInt(0,1)).tochar()+"_LAYER";
					}else{
						reload = "ACT_VM_RELOAD2_"+(65+RandomInt(0,1)).tochar()+"_LAYER";
					}
				}else{
					if(player != host){
						if(weapon.Clip1() == 0){
							reload = "ACT_VM_RELOAD_EMPTY";
						}else{
							reload = "ACT_VM_RELOAD";
						}
					}
				}
				if(reload != "")::manacat_rng_item.viewmodel_anim(params.userid, 2, reload);
			}
			if(shove_alt(host, null, 32)){
				local timestamp = currentTime + ((weapon.Clip1() == 0?2.0:1.633)*(player.IsIncapacitated()?1.25:1.0));
				NetProps.SetPropFloat(player, "m_flNextAttack", timestamp);
				NetProps.SetPropFloat(weapon, "m_flNextPrimaryAttack", timestamp);
			}
			
			scrScope.mnc_deploy <- (currentTime+2.2);
		}else if(wclass == "weapon_pistol"){
			local host = GetListenServerHost();
			local reload = "", clip = weapon.Clip1();
			if(shove_alt(host, null, 1)){
				if(weapon.GetModelName() == "models/v_models/v_pistolA.mdl"){
					if(clip <= 1){
						reload = "ACT_VM_RELOAD_EMPTY_"+(64+RandomInt(0,3)).tochar()+"_LAYER";
					}else{
						if(::manacatLib.tension(player) != 0){
							reload = "ACT_VM_RELOAD_"+(64+RandomInt(0,1)).tochar()+"_LAYER";
						}else{
							local pm = player.GetModelName();
							if(pm != "models/survivors/survivor_namvet.mdl" && pm != "models/survivors/survivor_gambler.mdl")
									reload = "ACT_VM_RELOAD_"+(64+RandomInt(2,3)).tochar()+"_LAYER";
							else	reload = "ACT_VM_RELOAD_"+(64+RandomInt(4,5)).tochar()+"_LAYER";
						}
					}
				}else{
					if(clip <= 1){
						reload = "ACT_VM_RELOAD_EMPTY_"+(64+RandomInt(0,5)).tochar()+"_LAYER";
					}else if(clip == 29){
						reload = "ACT_VM_RELOAD_SINGLE_"+(64+RandomInt(1,3)).tochar()+"_LAYER";
					}else{
						reload = "ACT_VM_RELOAD_"+(64+RandomInt(0,5)).tochar()+"_LAYER";
					}
				}
			}
			if(reload != "" && reload.find("@") == null){
				::manacat_rng_item.viewmodel_anim(params.userid, 2, reload);
			}
		}
	}

	function throwsSkin(userid, throwstype, count){
		local player = GetPlayerFromUserID(userid);
		player.ValidateScriptScope();
		local scrScope = player.GetScriptScope();

		for (local ent = null; (ent = Entities.FindByClassname(ent , throwstype+"_projectile")) != null && ent.IsValid();){
			if(NetProps.GetPropEntity( ent, "m_hThrower" ) == player && ent.GetContext("throwskin") == null){
				ent.SetContext("throwskin", "chk", 15.0);
				NetProps.SetPropInt( ent, "m_nSkin", scrScope.throwSkin );return;
			}
		}
		if(--count > 0)DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.throwsSkin("+userid+", \""+throwstype+"\", "+count+")" , 0.1 , null, world);
	}

	function OnGameEvent_upgrade_pack_begin(params){
		local player = GetPlayerFromUserID(params.userid);
		local ammo = player.GetActiveWeapon();
		if(ammo != null && ammo.IsValid()){
			player.ValidateScriptScope();
			local scrScope = player.GetScriptScope();
			scrScope.ammopack <- NetProps.GetPropInt( ammo, "m_nSkin");
		}
	}

	function OnGameEvent_upgrade_pack_used(params){
		local player = GetPlayerFromUserID(params.userid);
		local ammo = EntIndexToHScript(params.upgradeid);
		if(ammo != null && ammo.IsValid()){
			player.ValidateScriptScope();
			local scrScope = player.GetScriptScope();
			if("ammopack" in scrScope)NetProps.SetPropInt( ammo, "m_nSkin", scrScope.ammopack);
		}
	}

	function OnGameEvent_round_start_post_nav(params){
		local gm = ::manacatLib.gamemode(), t = Time(), gamerules = Entities.FindByClassname(null, "terror_gamerules");
		RestoreTable("rngitemspawn", ::manacat_rng_item.sessionData);
		RestoreTable("rngiteminv", ::manacat_rng_item.sessionInv);
		RestoreTable("rngitemchkp", ::manacat_rng_item.sessionChkp);

		if(::manacat_rng_item.sessionData.len() == 0 || (gm == "coop" && t < 10 && Director.IsSessionStartMap()) || 
		(gm == "versus" && t < 10
		&& NetProps.GetPropInt(gamerules, "terror_gamerules_data.m_iCampaignScore.000")+NetProps.GetPropInt(gamerules, "terror_gamerules_data.m_iCampaignScore.001") == 0)){
			::manacat_rng_item.sessionData.clear();
			::manacat_rng_item.sessionInv.clear();
			::manacat_rng_item.sessionChkp.clear();
		}

		SaveTable("rngitemspawn", ::manacat_rng_item.sessionData);
		SaveTable("rngiteminv", ::manacat_rng_item.sessionInv);
		SaveTable("rngitemchkp", ::manacat_rng_item.sessionChkp);

		for(local door = null; (door = Entities.FindByClassname(door,"prop_door_rotating_checkpoint")) != null && door.IsValid();){
			if(GetFlowPercentForPosition(door.GetOrigin(), false) > 90){
				door.ValidateScriptScope();
				local scrScope = door.GetScriptScope();
				scrScope["InputLock"] <- function(){
					for(local i = 3; i < 58; i++)
						for(local entity = null; (entity = Entities.FindByClassname(entity, ::manacat_rng_item.classnameList[i])) != null && entity.IsValid();)::manacat_rng_item.FixSkin(entity);
					
					return true;
				}
				door.ConnectOutput("OnBlockedClosing","InputLock");
			}
		}

		::manacatLib.rs_ini();
		::manacat_rng_item.timer();
	}

	function OnGameEvent_round_end(params){
		if(Director.AreTeamsFlipped())savetables();
	}

	function OnGameEvent_map_transition(params){
		savetables();
	}

	function savetables(){
		for(local player = null; (player = Entities.FindByClassname(player, "player")) != null && player.IsValid();){
			if(NetProps.GetPropInt( player, "m_iTeamNum") == 2 && NetProps.GetPropInt(player,"m_lifeState") == 0){//살아있을때만
				::manacat_rng_item.inv_save(player.GetPlayerUserId());
			}
		}
		SaveTable("rngiteminv", ::manacat_rng_item.sessionInv);

		//드랍 아이템
		local landmark = ::manacat_rng_item.GetLandmark();
		if(landmark != false){
			::manacat_rng_item.sessionChkp["landmark"] <- landmark.name;
			landmark = landmark.origin;
		}
		
		local ec = "", eb = "", es = "", ews = "", ex = "", ey = "", ez = "", pm = "", pb = "", ps = "", px = "", py = "", pz = "";

		for(local i = 0; i < 58; i++){
			for(local ent = null; (ent = Entities.FindByClassname(ent, ::manacat_rng_item.classnameList[i])) != null && ent.IsValid();){
				if(NetProps.GetPropEntity(ent, "m_hOwner") == null){
					local pos = ent.GetOrigin();
				//	local location = NavMesh.GetNearestNavArea(pos, 150.0, true, true);
				//	local chkpoint = false;
				//	if(location == null)continue;
				//	if(location.HasSpawnAttributes(2048)){
						ec += ent.GetClassname() + "|";
						eb += NetProps.GetPropInt(ent, "m_nBody") + "|";	es += NetProps.GetPropInt(ent, "m_nSkin") + "|"; ews += NetProps.GetPropInt(ent, "m_nWeaponSkin") + "|";
						if(::manacat_rng_item.sessionChkp["landmark"] == "coldstream3_coldstream4"){
							ex += landmark.x+pos.x + "|";	ey += landmark.y+pos.y + "|";	ez += landmark.z+pos.z + "|";
						}else{
							ex += landmark.x-pos.x + "|";	ey += landmark.y-pos.y + "|";	ez += landmark.z-pos.z + "|";
						}
				//	}
				}
			}
		}

		::manacat_rng_item.sessionChkp["ec"] <- ec;		::manacat_rng_item.sessionChkp["eb"] <- eb;		::manacat_rng_item.sessionChkp["es"] <- es;		::manacat_rng_item.sessionChkp["ews"] <- ews;
		::manacat_rng_item.sessionChkp["ex"] <- ex;		::manacat_rng_item.sessionChkp["ey"] <- ey;		::manacat_rng_item.sessionChkp["ez"] <- ez;

		for(local i = 0; i < 2; i++){
			for(local ent = null; (ent = Entities.FindByClassname(ent, "prop_physics")) != null && ent.IsValid();){
				if(ent.GetModelName() != ::manacat_rng_item.modelnameList[i])continue;
				local pos = ent.GetOrigin();
				//	local location = NavMesh.GetNearestNavArea(pos, 150.0, true, true);
				//	local chkpoint = false;
				//	if(location == null)continue;
				//	if(location.HasSpawnAttributes(2048)){
						pm += ent.GetModelName() + "|";
						pb += NetProps.GetPropInt(ent, "m_nBody") + "|";	ps += NetProps.GetPropInt(ent, "m_nSkin") + "|";
						if(::manacat_rng_item.sessionChkp["landmark"] == "coldstream3_coldstream4"){
							px += landmark.x+pos.x + "|";	py += landmark.y+pos.y + "|";	pz += landmark.z+pos.z + "|";
						}else{
							px += landmark.x-pos.x + "|";	py += landmark.y-pos.y + "|";	pz += landmark.z-pos.z + "|";
						}
				//	}
			}
		}

		::manacat_rng_item.sessionChkp["pm"] <- pm;		::manacat_rng_item.sessionChkp["pb"] <- pb;		::manacat_rng_item.sessionChkp["ps"] <- ps;
		::manacat_rng_item.sessionChkp["px"] <- px;		::manacat_rng_item.sessionChkp["py"] <- py;		::manacat_rng_item.sessionChkp["pz"] <- pz;

		SaveTable("rngitemchkp", ::manacat_rng_item.sessionChkp);

		SaveTable("rngitemspawn", ::manacat_rng_item.sessionData);
	}

	function OnGameEvent_round_freeze_end(params){
		round_start();
	}
	function OnGameEvent_player_connect_full(params){
		round_start();
	}
	function round_start(){
		::manacat_rng_item.shove_load(GetListenServerHost());
		::manacat_rng_item.startflag = true;
		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.ResetSkinSupplies()" , 0.1 , null, world);
	}

	function ctrl_invisible(player){
		if(!("dummy" in ::manacat_rng_item.sessionInvReady))return;
		local who = ResponseCriteria.GetValue(player, "who").tolower();
		foreach(d in ::manacat_rng_item.sessionInvReady.dummy){
			if(d[0] == who){
				NetProps.SetPropInt(player, "m_fEffects", 32);
				return;
			}
		}
	}

	function CheckPlayingIntro(stat){
		switch(stat){
			case 0:
				if(::manacat_rng_item.intro != 0)return;
				::manacat_rng_item.intro = 1;
				::manacat_rng_item.sessionInvReady.dummy <- [];
				for(local player = null; (player = Entities.FindByClassname(player, "player")) != null && player.IsValid();){
					if(NetProps.GetPropInt( player, "m_iTeamNum") == 2 && player.IsImmobilized()){
						local invTable = {}, weapon = player.GetActiveWeapon();	GetInvTable(player, invTable);
						if(weapon != null && weapon.GetClassname() == "weapon_pistol" && "slot1" in invTable){
							local who = ResponseCriteria.GetValue(player, "who").tolower();
							local dummy = SpawnEntityFromTable( "commentary_dummy", {model = player.GetModelName(), StartingWeapons = "weapon_pistol"} );
							::manacat_rng_item.sessionInvReady[who] <- [NetProps.GetPropInt(invTable["slot1"], "m_nBody"), NetProps.GetPropInt(invTable["slot1"], "m_nSkin")];
							::manacat_rng_item.sessionInvReady.dummy.append([who, dummy]);
							invTable["slot1"].Kill();

							for(local pos = null; (pos = Entities.FindByClassname(pos, "info_survivor_position")) != null && pos.IsValid();){
						//		local survname = "";
						//		for(local i = 0; i < 8; i++)if(namelist[i*2] == who)survname = namelist[(i*2)+1];
								if(/*NetProps.GetPropString(pos, "m_iszSurvivorName").tolower() == survname ||*/ (pos.GetOrigin() - player.GetOrigin()).Length() < 1){
									ctrl_invisible(player);
									DoEntFire("!self", "SetParent", "!activator", 0.00, pos , dummy );
									dummy.SetOrigin(pos.GetOrigin()+Vector(0, 0, 0));	dummy.SetAngles(pos.GetAngles());
									break;
								}
							}

							local seq = player.GetSequence();
							local act = player.GetSequenceActivityName(seq)
							if(act == "ACT_IDLE_PISTOL" || act == "ACT_RUN_CALM_PISTOL" || act == "ACT_RUN_PISTOL")seq = player.LookupSequence("ACT_IDLE_CALM_PISTOL");//IDLE
							if(seq <= 0)seq = dummy.LookupSequence("ACT_IDLE_CALM_PISTOL");
							dummy.SetSequence(seq);
							NetProps.SetPropFloat(dummy, "m_flCycle", NetProps.GetPropFloat(player, "m_flCycle"));
							NetProps.SetPropInt(dummy, "m_flAnimTime", NetProps.GetPropInt(player, "m_flAnimTime"));
							weapon = NetProps.GetPropEntity(dummy, "m_hActiveWeapon");
							NetProps.SetPropInt(weapon, "m_nBody", ::manacat_rng_item.sessionInvReady[who][0]);
							NetProps.SetPropInt(weapon, "m_nSkin", ::manacat_rng_item.sessionInvReady[who][1]);
						}
					}
				}
				DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.CheckPlayingIntro(1)" , 0.1 , null, world);
			return;
			case 1:
				for(local player = null; (player = Entities.FindByClassname(player, "player")) != null && player.IsValid();){
					if(NetProps.GetPropInt( player, "m_iTeamNum") == 2){
						if(player.IsImmobilized())
							DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.CheckPlayingIntro(1)" , 0.1 , null, world);
						else
							DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.CheckPlayingIntro(2)" , 0.1 , null, world);
						return;
					}
				}
			return;
			case 2:
				::manacat_rng_item.intro = 2;
				foreach(d in ::manacat_rng_item.sessionInvReady.dummy)if(d[1] != null && d[1].IsValid())d[1].Kill();
				::manacat_rng_item.sessionInvReady.rawdelete("dummy");
				for(local player = null; (player = Entities.FindByClassname(player, "player")) != null && player.IsValid();){
					if(NetProps.GetPropInt( player, "m_iTeamNum") == 2){
						local invTable = {};	GetInvTable(player, invTable);
						if(!("slot0" in invTable) && !("slot1" in invTable))player.GiveItem("pistol");
						NetProps.SetPropInt(player, "m_fEffects", 0);
						local who = ResponseCriteria.GetValue(player, "who").tolower();
						if(!(who in ::manacat_rng_item.sessionInvReady))continue;
						NetProps.SetPropInt(player.GetActiveWeapon(), "m_nBody", ::manacat_rng_item.sessionInvReady[who][0]);
						NetProps.SetPropInt(player.GetActiveWeapon(), "m_nSkin", ::manacat_rng_item.sessionInvReady[who][1]);
						::manacat_rng_item.resetPistol(player, ::manacat_rng_item.sessionInvReady[who][0], ::manacat_rng_item.sessionInvReady[who][1], true);
					}
				}
			return;
		}
	}

	function OnGameEvent_player_left_safe_area(params){
		::manacat_rng_item.startflag = true;
	}

	function OnGameEvent_weapon_spawn_visible(params){
		local weapon = EntIndexToHScript(params.subject);
		local wclass = weapon.GetClassname();
		if(wclass == "weapon_first_aid_kit_spawn"
		|| wclass == "weapon_defibrillator_spawn"
		|| wclass == "weapon_upgradepack_incendiary_spawn"
		|| wclass == "upgrade_ammo_incendiary"
		|| wclass == "weapon_upgradepack_explosive_spawn"
		|| wclass == "upgrade_ammo_explosive"
		|| wclass == "weapon_pain_pills_spawn"
		|| wclass == "weapon_adrenaline_spawn"
		|| wclass == "weapon_molotov_spawn"
		|| wclass == "weapon_pipe_bomb_spawn"
		|| wclass == "weapon_vomitjar_spawn")
		NetProps.SetPropInt(weapon, "m_nWeaponSkin", -1);
	}

	function OnGameEvent_foot_locker_opened(params){
		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.foot_locker_rng()" , 0.1 , null, world); //Worldspawn
	}

	function foot_locker_rng(){
		for(local i = 9; i < 13; i++)
			for(local entity = null; (entity = Entities.FindByClassname(entity, ::manacat_rng_item.classnameList[i])) != null && entity.IsValid();)SetSkin({e = entity, dummy = true});
		
		local dummy = {};
		dummy["models/w_models/weapons/w_eq_painpills.mdl"] <- 3;
		dummy["models/w_models/weapons/w_eq_adrenaline.mdl"] <- 3;
		dummy["models/w_models/weapons/w_eq_molotov.mdl"] <- 14;
		dummy["models/w_models/weapons/w_eq_pipebomb.mdl"] <- 3;

		for(local i = 0; i < 3; i++)
			for(local entity = null; (entity = Entities.FindByClassname(entity, "prop_dynamic")) != null && entity.IsValid();){
				local model = entity.GetModelName();
				if(model in dummy)SetSkin({e = entity, dummy = true});
			}
	}

	function FixSkin(entity){
		NetProps.SetPropInt(entity, "m_nWeaponSkin", NetProps.GetPropInt( entity, "m_nSkin"));
	}

	function SetSkin(params){//c = weapon_spawn, weapon_melee_spawn, p = prop_physics
		if(params.e == null || !params.e.IsValid())return;
		local entity = params.e, c = ("c" in params), p = ("p" in params), dummy = ("dummy" in params);

		if(NetProps.GetPropEntity(entity, "m_hOwner") != null)return;
		entity.ValidateScriptScope();
		local mdl = entity.GetModelName().tolower(), cn = entity.GetClassname(), scrScope = entity.GetScriptScope(), alreadySet = false;
		if(p){//피직스
			if(mdl == "models/props_junk/gascan001a.mdl"){
				if(cn == "prop_dynamic"){
					local btn = Entities.FindByClassnameNearest("func_button", entity.GetOrigin(), 20);
					if(btn != null/* && NetProps.GetPropEntity(btn, "m_glowEntity") == entity*/)return;
				}
				if(shove_alt(GetListenServerHost(), null, 16) || NetProps.GetPropInt(entity, "m_nSkin") == 0){
					if(cn == "prop_dynamic"){
						params.s <- entity;
						if(!("skintype" in scrScope)){
							scrScope.skintype <- NetProps.GetPropInt(params.s, "m_nSkin");
							params.first <- true;
						}
					}else{
						local scv = Entities.FindByClassnameNearest("weapon_scavenge_item_spawn", entity.GetOrigin()-Vector(0,0,15), 20);
						if(scv != null){
							params.s <- scv;
							params.s.ValidateScriptScope();
							local scvScope = params.s.GetScriptScope();
							if(!("skintype" in scvScope)){
								if(NetProps.GetPropInt(params.s, "m_nSkin") != 2){
									scvScope.skintype <- 1;
								}else{
									scvScope.skintype <- 2;
								}
								params.first <- true;
							}
						}
					}
				}else{
					return;
				}
			}else if(mdl == "models/props_junk/propanecanister001a.mdl"){
				
			}else if(mdl == "models/props_vehicles/cara_95sedan.mdl"){
				// local salt1 = entity.GetOrigin(), salt2 = entity.GetAngles();
				// salt1.x = salt1.x.tointeger();salt1.y = salt1.y.tointeger();salt1.z = salt1.z.tointeger();
				// salt2.x += salt2.x<0?360:0;salt2.y += salt2.y<0?360:0;salt2.z += salt2.z<0?360:0;
				// salt2.x = salt1.x.tointeger();salt2.y = salt1.y.tointeger();salt2.z = salt1.z.tointeger();
				// ::manacatLib.rs_ini(salt1, salt2);
				if(::manacatLib.rnd(0, 1) == 1){
					NetProps.SetPropInt(entity, "m_nBody", 1);
					for(local i = 0, cns = ["prop_dynamic", "prop_car_glass"]; i < 2; i++){
						for(local child = null; (child = Entities.FindByClassname(child, cns[i])) != null && child.IsValid();){
							if(NetProps.GetPropEntity(child, "moveparent") == entity)NetProps.SetPropInt(child, "m_nBody", 1);
						}
					}
				}
				return;
			}else{
				return;
			}
		}
		if(NetProps.GetPropInt(entity, "m_nSkin") > 0)alreadySet = true;

		if("rngload" in scrScope || ("rngchk" in scrScope && !::manacat_rng_item.debug))return;
		scrScope.rngchk <- true;

		if("s" in params){
			local salt1 = params.s.GetOrigin(), salt2 = params.s.GetAngles();
			salt1.x = salt1.x.tointeger();salt1.y = salt1.y.tointeger();salt1.z = salt1.z.tointeger();
			salt2.x += salt2.x<0?360:0;salt2.y += salt2.y<0?360:0;salt2.z += salt2.z<0?360:0;
			salt2.x = salt1.x.tointeger();salt2.y = salt1.y.tointeger();salt2.z = salt1.z.tointeger();
			::manacatLib.rs_ini(salt1, salt2);
		}else{
			local salt1 = entity.GetOrigin(), salt2 = entity.GetAngles();
			if(p){
				salt1.x = salt1.x.tointeger();salt1.y = salt1.y.tointeger();salt1.z = salt1.z.tointeger();
				salt2.x += salt2.x<0?360:0;salt2.y += salt2.y<0?360:0;salt2.z += salt2.z<0?360:0;
				salt2.x = salt1.x.tointeger();salt2.y = salt1.y.tointeger();salt2.z = salt1.z.tointeger();
			}
			::manacatLib.rs_ini(salt1, salt2);
		}

		local mdl = entity.GetModelName().tolower(), cn = entity.GetClassname(), body = 0, body_skin = 1, skin = ::manacat_rng_item.skinSelect(mdl, ::manacat_rng_item.chkLay(entity)?0:1);
		if(mdl in ::manacat_rng_item.weaponList && ::manacat_rng_item.weaponList[mdl][0] != 1)body = ::manacat_rng_item.weaponList[mdl][0];

		if(alreadySet && mdl != "models/props_junk/gascan001a.mdl"){
			NetProps.SetPropInt(entity, "m_nBody", body);	//미리 맵에서 스킨을 지정한 무기는 건드리지 않고, 다만 바디만 설정
		}else{
			if(skin == null){if(::manacat_rng_item.debug)printl("실패 : "+mdl);return;}
		//	if((nearnav != null && (!nearnav.HasSpawnAttributes(2048)/*checkpoint*/ || (nearnav.HasSpawnAttributes(2048) && GetFlowPercentForPosition(nearnav.GetCenter(), false) > 90))) || Director.IsSessionStartMap()){
				if(::manacat_rng_item.weaponList[mdl][0] != 1){
					if(cn == "weapon_pistol" || cn == "weapon_pistol_spawn"){
						body = ::manacatLib.rnd(1,body);
						NetProps.SetPropInt(entity, "m_nBody", body);
					}else{
						body = abs(body);
						body_skin = ::manacatLib.rnd(1,body)-1;
						NetProps.SetPropInt(entity, "m_nBody", body+body_skin);
						if((typeof ::manacat_rng_item.weaponList[mdl][2]) == "array")
								skin += ::manacat_rng_item.weaponList[mdl][2].len()*body_skin;
						else	skin += ::manacat_rng_item.weaponList[mdl][2]*body_skin;
					}
				}
				skin += manacat_rng_item.weaponList[mdl][1];
				NetProps.SetPropInt(entity, "m_nSkin", skin);
				NetProps.SetPropInt(entity, "m_nWeaponSkin", skin);
				if(cn == "weapon_ammo_spawn"){
					local dummymdl = Entities.FindByClassnameNearest("prop_dynamic", entity.GetOrigin(), 8);
					if(dummymdl != null && dummymdl.GetModelName().tolower() == mdl){
						NetProps.SetPropInt(dummymdl, "m_nBody", body);
						NetProps.SetPropInt(dummymdl, "m_nSkin", skin);
					}
				}
		//	}

			if("s" in params){
				local scvScope = params.s.GetScriptScope();
				local vanilla = ::manacat_rng_item.weaponList["models/props_junk/gascan001a.mdl"][0], gascans = ::manacat_rng_item.weaponList["models/props_junk/gascan001a.mdl"][2].len();
				
				if(!("skin" in scvScope)){
					NetProps.SetPropInt(params.s, "m_nSkin", skin);
					scvScope.skin <- skin;
				}else{
					NetProps.SetPropInt(params.s, "m_nSkin", scvScope.skin);
				}
				if("first" in params){
					NetProps.SetPropInt(entity, "m_nSkin", scvScope.skin+(scvScope.skintype*3));
				}else{
					skin = ::manacat_rng_item.weaponList["models/props_junk/gascan001a.mdl"][1] + (gascans*RandomInt(0,2)) + RandomInt(0,2) + (scvScope.skintype*3);
					body = ((skin-::manacat_rng_item.weaponList["models/props_junk/gascan001a.mdl"][1]) / gascans)+vanilla;
					NetProps.SetPropInt(entity, "m_nSkin", skin);	NetProps.SetPropInt(entity, "m_nBody", body);
				}
			}
		}

		if(c || !dummy){
		//	if(c)::manacat_rng_item.weaponmodel += mdl + "|";
		//	else ::manacat_rng_item.itemclass += cn + "|";
		//	c = c?"weapon":"item";
		//	::manacat_rng_item[c+"body"] += body + "|";		::manacat_rng_item[c+"skin"] += skin + "|";
		//	local itempos = entity.GetOrigin();
		//	::manacat_rng_item[c+"x"] += itempos.x + "|";		::manacat_rng_item[c+"y"]+= itempos.y + "|";		::manacat_rng_item[c+"z"] += itempos.z + "|";
		}else{
			scrScope.rngskin <- skin;
			NetProps.SetPropInt(entity, "m_nWeaponSkin", -1);
		}
	}

	function RestoreSkin(entity, c){
		entity.ValidateScriptScope();
		local scrScope = entity.GetScriptScope();
		if("rngload" in scrScope)return;
		scrScope.rngload <- true;
		local mdl = entity.GetModelName().tolower();
		if(c && !(mdl in ::manacat_rng_item.weaponList))return;
		local entpos = entity.GetOrigin(), coord = false;
		for(local i = 0, k = c?"weapon":"item", t = ::manacat_rng_item[k+"len"]; i < t; i++){
			if(c || ::manacat_rng_item.itemclass[i] == entity.GetClassname()){
				local tgpos = Vector(::manacat_rng_item[k+"x"][i].tofloat(), ::manacat_rng_item[k+"y"][i].tofloat(), ::manacat_rng_item[k+"z"][i].tofloat());
				if((entpos-tgpos).Length() < 3){
					if(::manacat_rng_item[k+"body"][i] == "X"){entity.Kill();return;}
					if(c)coord = true;
					//if(::manacat_rng_item.debug)DebugDrawBoxAngles(tgpos, Vector(-15, -15, -15), Vector(15, 15, 15), QAngle(0, 0, 0), Vector(255, 0, 255), 64, 30.0);

					NetProps.SetPropInt(entity, "m_nBody", ::manacat_rng_item[k+"body"][i].tointeger());
					NetProps.SetPropInt(entity, "m_nSkin", ::manacat_rng_item[k+"skin"][i].tointeger());
					NetProps.SetPropInt(entity, "m_nWeaponSkin", ::manacat_rng_item[k+"skin"][i].tointeger());
					::manacat_rng_item[k+"body"][i] = "X";
					return;
				}
			}
		}
		if(coord)entity.Kill();
		return;
	}

	function GetLandmark(){
		local landmark = "";
		for(local ent = null; (ent = Entities.FindByClassname(ent, "info_changelevel")) != null && ent.IsValid();){
			local name = NetProps.GetPropString(ent, "m_landmarkName");
			if(name != ""){	landmark = name;	break;	}
		}
		for(local ent = null; (ent = Entities.FindByClassname(ent, "info_landmark")) != null && ent.IsValid();){
			if(ent.GetName() == landmark)return {origin = ent.GetOrigin(), name = ent.GetName()};
		}

		return false;
	}

	function ResetSkinSupplies(){
		if(!::manacat_rng_item.startflag
		|| ("itemSpawner" in ::MANACAT && !::MANACAT.itemSpawner.check)
		|| ("ammoChanger" in ::MANACAT && !::MANACAT.ammoChanger.check)){
			DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.ResetSkinSupplies()" , 0.1 , null, world); //Worldspawn
			return;
		}

		local map = ::manacatLib.GetMapName(), save = false;

		RestoreTable("rngitemchkp", ::manacat_rng_item.sessionChkp);	SaveTable("rngitemchkp", ::manacat_rng_item.sessionChkp);
		if("ec" in ::manacat_rng_item.sessionChkp){
			local landmark = null;
			for(local ent = null; (ent = Entities.FindByClassname(ent, "info_landmark")) != null && ent.IsValid();){
				if(ent.GetName() == ::manacat_rng_item.sessionChkp["landmark"]){
					landmark = ent.GetOrigin();	break;
				}
			}

			if(landmark != null){
				local ec = split(::manacat_rng_item.sessionChkp["ec"], "|"),		eb = split(::manacat_rng_item.sessionChkp["eb"], "|"),		es = split(::manacat_rng_item.sessionChkp["es"], "|"),		ews = split(::manacat_rng_item.sessionChkp["ews"], "|");
				local ex = split(::manacat_rng_item.sessionChkp["ex"], "|"),		ey = split(::manacat_rng_item.sessionChkp["ey"], "|"),		ez = split(::manacat_rng_item.sessionChkp["ez"], "|");
				local elen = ec.len();

				for(local i = 0; i < 58; i++)for(local ent = null; (ent = Entities.FindByClassname(ent, ::manacat_rng_item.classnameList[i])) != null && ent.IsValid();){
					if(NetProps.GetPropEntity(ent, "m_hOwner") != null)continue;
					local pos = ent.GetOrigin();
					for(local j = 0; j < elen; j++){
						if(::manacat_rng_item.classnameList[i] == ec[j] && (pos - (landmark-Vector(ex[j].tofloat(), ey[j].tofloat(), ez[j].tofloat()))).Length() < 2){
							NetProps.SetPropInt(ent, "m_nBody", eb[j].tointeger());	NetProps.SetPropInt(ent, "m_nSkin", es[j].tointeger());	NetProps.SetPropInt(ent, "m_nWeaponSkin", ews[j].tointeger());
							ent.ValidateScriptScope();
							local scrScope = ent.GetScriptScope();
							scrScope.rngload <- true;
						//	NetProps.SetPropInt(ent, "m_clrRender", 128);
						}
					}
				}

				local pm = split(::manacat_rng_item.sessionChkp["pm"], "|"),		pb = split(::manacat_rng_item.sessionChkp["pb"], "|"),		ps = split(::manacat_rng_item.sessionChkp["ps"], "|");
				local px = split(::manacat_rng_item.sessionChkp["px"], "|"),		py = split(::manacat_rng_item.sessionChkp["py"], "|"),		pz = split(::manacat_rng_item.sessionChkp["pz"], "|");
				local plen = pm.len();

				for(local i = 0; i < 2; i++)for(local ent = null; (ent = Entities.FindByClassname(ent, "prop_physics")) != null && ent.IsValid();){
					if(ent.GetModelName() != ::manacat_rng_item.modelnameList[i])continue;
					local pos = ent.GetOrigin();
					for(local j = 0; j < plen; j++){
						if(::manacat_rng_item.modelnameList[i] == pm[j] && (pos - (landmark-Vector(px[j].tofloat(), py[j].tofloat(), pz[j].tofloat()))).Length() < 2){
							NetProps.SetPropInt(ent, "m_nBody", pb[j].tointeger());	NetProps.SetPropInt(ent, "m_nSkin", ps[j].tointeger());
							ent.ValidateScriptScope();
							local scrScope = ent.GetScriptScope();
							scrScope.rngload <- true;
						}
					}
				}
			}
		}

		::manacat_rng_item.itemlist <- [];
		for(local i = 0; i < 3; i++)
			for(local ent = null; (ent = Entities.FindByClassname(ent, ::manacat_rng_item.classnameList[i])) != null && ent.IsValid();)itemlist.append({e = ent, c = true});
		for(local i = 3; i < 58; i++)
			for(local ent = null; (ent = Entities.FindByClassname(ent, ::manacat_rng_item.classnameList[i])) != null && ent.IsValid();)itemlist.append({e = ent});
		for(local ent = null; (ent = Entities.FindByClassname(ent, "prop_physics")) != null && ent.IsValid();)itemlist.append({e = ent, p = true});
		for(local ent = null; (ent = Entities.FindByClassname(ent, "prop_dynamic")) != null && ent.IsValid();)itemlist.append({e = ent, p = true});
		for(local ent = null; (ent = Entities.FindByClassname(ent, "prop_car_alarm")) != null && ent.IsValid();)itemlist.append({e = ent, p = true});
		SetSkinBatch();

		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.ResetSkinProcess()" , 0.1 , null, world);
	}

	function SetSkinBatch(index = 0){
		if(!("itemlist" in ::manacat_rng_item)){
			DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.SetSkinBatch("+index+")" , 0.1 , null, world);
			return;
		}
		local len = ::manacat_rng_item.itemlist.len();
		for(local i = 0; i < 64; i++){
			if(index+i >= len)return;
			SetSkin(::manacat_rng_item.itemlist[index+i]);
		}
		DoEntFire("!self", "RunScriptCode", "g_ModeScript.manacat_rng_item.SetSkinBatch("+(index+64)+")" , 0.0 , null, world);
	}
	
	function ResetSkinProcess(){
		for(local i = 3; i < 15; i++)
			for(local ent = null; (ent = Entities.FindByClassname(ent, ::manacat_rng_item.classnameList[i])) != null && ent.IsValid();)NetProps.SetPropInt(ent, "m_nWeaponSkin", -1);
	}
}

::manacat_rngitem_vcd <- {
c_golden_magnum = ["TakeMelee05" "TakeMelee06" "TakePills02" "Taunt06" "PainRelieftFirstAid02"]
n_golden_magnum = ["NiceJob10" "TakeMelee05" "Hurrah06" "MeleeWeapons18"]
e_golden_magnum = ["TakePistol02" "WorldC2M303" "WorldC2M305" "WorldC2M319" "WorldC3M145" "MeleeWeapons41" "TransitionClose11" "WorldC1M1B117" "WorldC1M1B118" "Taunt07" "World435" "WorldMisc37" "TransitionClose16" "TransitionClose17" "WorldC1M4B33" "WorldC1M4B34"]
r_golden_magnum = ["TakeFryingPan02" "TakeMelee04" "TakeMelee05" "TakeMelee07" "WorldC2M124" "GrenadeLauncher06" "MeleeResponse02" "WorldC1M2B18" "WorldC1M2B27" "WorldC1M2B28" "WorldC1M2B29" "WorldC1M2B30" "WorldC1M2B38" "WorldC1M2B45" "WorldC1M2B46" "WorldC1M2B49" "WorldC1M2B50" "WorldGenericProducer22" "WorldGenericProducer39" "WorldGenericProducer40"]
f_golden_magnum = ["generic63" "hurrah01" "hurrah02" "hurrah03" "hurrah04" "hurrah11" "hurrah16" "hurrah17" "hurrah18" "hurrah19" "hurrah20" "hurrah24" "incoming07" "laughter04" "lookhere07" "nicejob05" "nicejob13" "reactionpositive03" "safespotaheadreaction07" "takeassaultrifle01" "takeassaultrifle06" "takeautoshotgun04" "taunt05" "taunt06" "taunt07" "taunt08" "taunt09" "violenceawe02" "violenceawe07" "worldairport0322" "worldfarmhousenpc03"]
l_golden_magnum = ["hurrah01" "hurrah02" "hurrah14" "hurrah15" "hurrah16" "niceshot09" "playertransitionclose01" "playertransitionclose02" "playertransitionclose04" "reactionpositive05" "reactionpositive06" "reactionpositive07" "reactionpositive10" "taunt04" "taunt05" "violenceawe01" "violenceawe02" "violenceawe05" "violenceawe08" "violenceawe10"]
b_golden_magnum = ["gnericweaponpickup01" "nicejob08" "reactionpositive02" "reactionpositive04" "reactionpositive10" "safespotaheadreaction04" "violenceawe04" "violenceawe06"]
z_golden_magnum = ["hurrah03" "hurrah12" "hurrah17" "hurrah23" "hurrah56" "hurrah57" "reactionpositive02" "reactionpositive07" "takesubmachinegun01" "takesubmachinegun05" "violenceawe13" "genericresponses32"]

c_melee = ["SpotWeapons01" "SpotWeapons02" "SpotWeapons03"]
n_melee = ["SpotWeapons01" "SpotWeapons02"]
e_melee = ["SpotWeapons01" "SpotWeapons02"]
r_melee = ["SpotWeapons01" "SpotWeapons02" "SpotWeapons03"]
f_melee = ["SpotWeapons01" "SpotWeapons02" "SpotWeapons04" "SpotWeapons05"]
l_melee = ["SpotWeapons01" "SpotWeapons02" "SpotWeapons03"]
b_melee = ["SpotWeapons01" "SpotWeapons02" "SpotWeapons03"]
z_melee = ["SpotWeapons01" "SpotWeapons02" "SpotWeapons03" "SpotWeapons04" "SpotWeapons05" "SpotWeapons06"]

c_meleepickup = ["TakeMelee01" "TakeMelee02" "TakeMelee03" "TakeMelee04" "TakeMelee05"]
n_meleepickup = ["TakeMelee01" "TakeMelee02" "TakeMelee03" "TakeMelee04" "TakeMelee05" "TakeMelee06"]
e_meleepickup = ["TakeMelee01" "TakeMelee02" "TakeMelee04" "TakeMelee07" "TakeMelee08" "TakeMelee09"]
r_meleepickup = ["TakeMelee01" "TakeMelee02" "TakeMelee03" "TakeMelee04" "TakeMelee05" "TakeMelee06" "TakeMelee08"]
f_meleepickup = ["NiceJob01" "NiceJob02" "NiceJob07" "NiceJob14" "NiceJob17"]
l_meleepickup = ["NiceJob01" "GenericResponses16" "GenericResponses40" "ReactionPositive03" "Yes01" "Yes09"]
b_meleepickup = ["GnericWeaponPickup03" "NiceJob08" "NiceShot14" "Yes03"]
z_meleepickup = ["Hurrah04" "Hurrah08" "Hurrah11" "NiceJob01" "NiceJob18" "NiceJob36" "NiceJob48" "NiceJob51" "NiceJob57" "NiceShot08" "NiceShot16" "PositiveNoise14" "ReactionNegativeSpecial11" "YouAreWelcome16"]
}

::manacat_rng_item.weaponList["models/w_models/weapons/w_eq_medkit.mdl"] <- [1,0,5];
::manacat_rng_item.weaponList["models/w_models/weapons/w_eq_defibrillator.mdl"] <- [1,0,3];
::manacat_rng_item.weaponList["models/w_models/weapons/w_eq_incendiary_ammopack.mdl"] <- [1,0,2];
::manacat_rng_item.weaponList["models/w_models/weapons/w_eq_explosive_ammopack.mdl"] <- [1,0,2];
::manacat_rng_item.weaponList["models/w_models/weapons/w_eq_painpills.mdl"] <- [1,0,4];
::manacat_rng_item.weaponList["models/w_models/weapons/w_eq_adrenaline.mdl"] <- [1,0,4];
::manacat_rng_item.weaponList["models/w_models/weapons/w_eq_molotov.mdl"] <- [1,0,15];
::manacat_rng_item.weaponList["models/w_models/weapons/w_eq_pipebomb.mdl"] <- [1,0,4];
::manacat_rng_item.weaponList["models/w_models/weapons/w_eq_bile_flask.mdl"] <- [1,0,6];
::manacat_rng_item.weaponList["models/weapons/melee/w_fireaxe.mdl"] <- [1,0,4];
::manacat_rng_item.weaponList["models/weapons/melee/w_crowbar.mdl"] <- [3,2,[[100,100],[0,0,"golden_crowbar"],[100,100],[100,100],[100,100]]];
::manacat_rng_item.weaponList["models/weapons/melee/w_bat.mdl"] <- [1,0,[[100,100],[100,100],[100,100],[100,100],[34,34,"sign_bat"]]];
::manacat_rng_item.weaponList["models/weapons/melee/w_cricket_bat.mdl"] <- [1,2,4];
::manacat_rng_item.weaponList["models/weapons/melee/w_frying_pan.mdl"] <- [1,0,3];
::manacat_rng_item.weaponList["models/weapons/melee/w_tonfa.mdl"] <- [1,0,2];
::manacat_rng_item.weaponList["models/weapons/melee/w_katana.mdl"] <- [1,0,3];
::manacat_rng_item.weaponList["models/weapons/melee/w_golfclub.mdl"] <- [1,0,3];
::manacat_rng_item.weaponList["models/weapons/melee/w_electric_guitar.mdl"] <- [1,0,[[100,100],[100,100],[100,100],[25,25,"signed_guitar"]]];
::manacat_rng_item.weaponList["models/weapons/melee/w_machete.mdl"] <-
::manacat_rng_item.weaponList["models/weapons/melee/v_machete.mdl"] <- [2,0,3];
::manacat_rng_item.weaponList["models/w_models/weapons/w_knife_t.mdl"] <- [1,0,4];
::manacat_rng_item.weaponList["models/weapons/melee/w_pitchfork.mdl"] <- [1,0,4];
::manacat_rng_item.weaponList["models/weapons/melee/w_shovel.mdl"] <- [1,0,4];
::manacat_rng_item.weaponList["models/weapons/melee/w_chainsaw.mdl"] <- [1,0,5];

::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_a.mdl"] <- [4,0,3];
::manacat_rng_item.weaponList["models/w_models/weapons/w_pistol_b.mdl"] <- [4,0,3];
::manacat_rng_item.weaponList["models/w_models/weapons/w_desert_eagle.mdl"] <-
::manacat_rng_item.weaponList["models/v_models/v_desert_eagle.mdl"] <- [2,/*3*/0,[[100,100],[100,100],[100,100],[100,100],[100,100],[27,27,"golden_magnum"]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_smg_uzi.mdl"] <- [1,2,[[100,100],[100,0],[100,100],[100,0]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_smg_a.mdl"] <- [1,2,[[100,100],[100,100],[100,100],[100,0],[100,0]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_smg_mp5.mdl"] <- [1,0,[[100,100],[100,0],[100,100]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_shotgun.mdl"] <- [1,2,[[100,100],[100,100],[100,0],[100,100],[100,100],[100,100]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_pumpshotgun_a.mdl"] <- [1,2,[[100,100],[100,100],[100,100],[100,100],[100,0],[100,100]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_autoshot_m4super.mdl"] <- [1,0,[[100,100],[100,0],[100,0],[100,100],[100,0]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_shotgun_spas.mdl"] <- [1,0,[[100,100],[100,0],[100,100],[100,0],[100,100]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_rifle_m16a2.mdl"] <- [1,3,[[100,100],[100,0,"rusty_m16"],[100,0,"bloody_m16"],[100,100],[100,0]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_rifle_ak47.mdl"] <- [1,3,[[100,100],[100,100],[100,100],[100,100],[100,100],[100,0]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_desert_rifle.mdl"] <- [1,0,[[100,100],[100,0,"bloody_scar"],[100,100],[100,100],[100,100]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_rifle_sg552.mdl"] <- [1,0,[[100,100],[100,100],[100,100],[100,0],[100,100]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_sniper_mini14.mdl"] <- [1,0,[[100,100],[100,0],[100,0],[100,100],[100,100]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_sniper_military.mdl"] <- [1,0,[[100,100],[100,100],[100,100],[100,100],[100,100],[100,100]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_sniper_awp.mdl"] <- [1,0,[[100,100],[100,100],[100,100],[100,0]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_sniper_scout.mdl"] <- [1,0,[[100,100],[100,100],[100,100],[100,100]]];
::manacat_rng_item.weaponList["models/w_models/weapons/w_m60.mdl"] <- [1,0,5];
::manacat_rng_item.weaponList["models/w_models/weapons/w_grenade_launcher.mdl"] <- [1,0,5];

::manacat_rng_item.weaponList["models/w_models/weapons/w_minigun.mdl"] <- [1,0,2];
::manacat_rng_item.weaponList["models/w_models/weapons/50cal.mdl"] <- [1,0,6];
::manacat_rng_item.weaponList["models/props/terror/ammo_stack.mdl"] <- [3,0,1];
::manacat_rng_item.weaponList["models/w_models/weapons/w_laser_sights.mdl"] <- [3,0,1];
::manacat_rng_item.weaponList["models/props_junk/gascan001a.mdl"] <- [3,4,[[100,100],[100,100],[100,100],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]];
::manacat_rng_item.weaponList["models/props_junk/propanecanister001a.mdl"] <- [3,0,3];

__CollectEventCallbacks(::manacat_rng_item, "OnGameEvent_", "GameEventCallbacks", RegisterScriptGameEventListener);

if(!("manacat_rng_item_rules" in getroottable())){
	::manacat_rng_item_rules <- {
		function vocalize_spot_melee(player, query){
		//	g_rr.PrintTable(query);
			if("worldsaidspotweapons" in query && query.worldsaidspotweapons.tointeger() == 1)return;
			if("worldsaidspot" in query && query.worldsaidspot.tointeger() == 1)return;
			local userid = player.GetPlayerUserId();
			::manacat_rng_item.speakVocal({player = userid, code = "melee"});
			::manacatLib.world.SetContext("saidspotweapons", "1", 5);
			::manacatLib.world.SetContext("saidspot", "1", 20);
		}

		function vocalize_pickup_melee(player, query){
		//	g_rr.PrintTable(query);
			if(query.randomnum.tointeger() > 30)return;
			if("pickedupitem" in query && query.pickedupitem.tointeger() == 1)return;
			local userid = player.GetPlayerUserId();
			::manacat_rng_item.speakVocal({player = userid, code = "meleepickup"});
			player.SetContext("pickedupitem", "1", 30);
		}

	//	function vocalize_test(player, query){
	//		g_rr.PrintTable(query);
	//		printl(query.randomnum)
	//	}

		function IsTalk(query){
			local newquery = {};

			foreach(key, val in query)newquery.rawset(key.tolower(), val);

			if("worldtalk" in newquery){
				if(newquery.worldtalk.tointeger() != 1)return true;
				return false;
			}else{
				return true;
			}
		}

		function IsNotSaidSomeoneDied(query){
			local newquery = {};

			foreach(key, val in query)newquery.rawset(key.tolower(), val);
			
			if("worldsaidsomeonedied" in newquery){
				if(newquery.worldsaidsomeonedied.tointeger() != 1)return true;
				return false;
			}else{
				return true;
			}
		}
		
		function IsNotDefaultBody(query){
			for(local player = null; (player = Entities.FindByClassname(player, "player")) != null && player.IsValid();){
				if(ResponseCriteria.GetValue(player, "who") == query.who){
					local startPt = player.EyePosition();
					local endPt = startPt + player.EyeAngles().Forward().Scale(999);
					local m_trace = { start = startPt, end = endPt, ignore = player, mask = 33579137 };
					TraceLine(m_trace);

					local targetent = null;
					if("enthit" in m_trace && m_trace.enthit != null && m_trace.enthit.IsValid()){
						if(m_trace.enthit != ::manacatLib.world && m_trace.enthit.GetClassname().slice(0, 3) == "wea"){
							targetent = m_trace.enthit;
						}
					}

					if(targetent == null){//targetent = Entities.FindByClassnameNearest("weapon_*", m_trace.pos, 150);
						for(local i = 0, mindist = 150, cn = ["weapon_melee", "weapon_melee_spawn"]; i < 2; i++){
							for(local ent = null; (ent = Entities.FindByClassname(ent, cn[i])) != null && ent.IsValid();){
								if(NetProps.GetPropEntity(ent, "m_hOwner") != null)continue;
								local dist = (m_trace.pos-ent.GetOrigin()).Length();
								if(dist < mindist){
									mindist = dist;
									targetent = ent;
								}
							}
						}
					}

					if(targetent != null){
						local mdl = targetent.GetModelName().tolower();
						if(mdl in ::manacat_rng_item.weaponList)return !(NetProps.GetPropInt(targetent, "m_nBody")%::manacat_rng_item.weaponList[targetent.GetModelName().tolower()][0] == 0);
					}
					return false;
				}
			}
		}

		function IsMelee(query){
		//	g_rr.PrintTable(query);
			if("itempickedup" in query && !("weaponname" in query))query.rawset("weaponname", query.itempickedup);
			if(!("weaponname" in query))return false;
			switch(query.weaponname){
				case "crowbar":case "machete":return true;
				default:return false;
			}
		}
	}

	for(local i = 0, talkers = ["Namvet", "Biker", "Manager", "TeenGirl", "Gambler", "Mechanic", "Coach", "Producer"]; i < 8; i++){
		local vocal_rng_items = [
			{
				name = "mnc_SpotWeaponCustomMelee",
				criteria =
				[
					[ "concept", "PlayerSpotWeapon" ],
					[ "who", talkers[i] ],
					[ "Coughing", 0 ],
				//	[ "speaking", 0 ],
					[ ::manacat_rng_item_rules.IsMelee ],
					[ ::manacat_rng_item_rules.IsTalk ],
					[ ::manacat_rng_item_rules.IsNotSaidSomeoneDied ],
					[ ::manacat_rng_item_rules.IsNotDefaultBody ],
				],
				responses = [{  func = ::manacat_rng_item_rules["vocalize_spot_melee"], weight = 100, duration = 30}]
				group_params = g_rr.RGroupParams({})
			}

			{
				name = "mnc_PickupCustomMelee",
				criteria =
				[
					[ "concept", "PlayerPickup" ],
					[ "who", talkers[i] ],
					[ "Coughing", 0 ],
				//	[ "speaking", 0 ],
				//	[ "randomnum", 1,30 ],
					[ ::manacat_rng_item_rules.IsMelee ],
					[ ::manacat_rng_item_rules.IsTalk ],
					[ ::manacat_rng_item_rules.IsNotSaidSomeoneDied ],
					[ ::manacat_rng_item_rules.IsNotDefaultBody ],
				],
				responses = [{ func = ::manacat_rng_item_rules["vocalize_pickup_melee"], weight = 100, duration = 30 }]
				group_params = g_rr.RGroupParams({})
			}
			
			/*{
				name = "mnc_test",
				criteria =
				[
					[ "concept", "PlayerLaugh" ],
					[ "who", talkers[i] ],
					[ "Coughing", 0 ],
				//	[ "speaking", 0 ],
				//	[ "randomnum", 1,50 ],
				],
				responses = [{ func = ::manacat_rng_item_rules["vocalize_test"], weight = 100, duration = 30 }]
				group_params = g_rr.RGroupParams({})
			}//*/
		]
		g_rr.rr_ProcessRules( vocal_rng_items );
	}
}