::manacatTalker<-{
	speak_timestamp = {}
	prev = {}

	function vcdSelect(params){
		local vcd = params.path + params.vcd[RandomInt(0,params.vcd.len()-1)] + ".vcd";

		if(!vcdCheck(vcd, params)){
			params.tryn++;//printl(" : same speech as before, "+params.tryn+" retries.");
			if(params.tryn == 10)return vcd;
			return vcdSelect(params);
		}else{
			return vcd;
		}
	}

	function vcdCheck(vcd, params){
		if(params.who in ::manacatTalker.prev && vcd == ::manacatTalker.prev[params.who])return false;
		return true;
	}

	function vocal(params){
		local speaker = ::manacatLib.findPlayer(params.speaker);
		if(speaker == null || !speaker.IsValid())return;
		if(speakable_core(speaker) && (speaker.GetCurrentScene() == null || "force" in params)){
			local c = ::manacatLib.getCharacter(speaker), ct = Time();
			if(c.who in speak_timestamp && speak_timestamp[c.who] == ct)return;
			if(!("l" in params))params.l <- "common";
			params.who <- c.who;	params.initial <- c.initial;	params.tryn <- 0;
			params.vcd <- getroottable()["manacat_"+params.l+"_vocal"][c.initial+"_"+params.code];
			params.path <- "scenes/"+c.who+"/";
			speak_timestamp[c.who] <- ct;
			local vcd = vcdSelect(params);
			//printl("["+speaker.GetPlayerName()+"]발화 "+vocal);
			speaker.PlayScene(vcd, 0.0);
			return;
		}
	}

	function speakable(p, t = 0){
		if(p != null && p.IsValid() && NetProps.GetPropInt( p, "m_iTeamNum") == 2 && !p.IsDead() && !p.IsDying())return speakable_core(p, t);
		return false;
	}

	function speakable_core(p, t = 0){
		switch(t){
			case 1:
				//
			break;
			default:
				if(!p.IsIncapacitated() && !p.IsDominatedBySpecialInfected() && !p.IsStaggering())return true;
			break;
		}
		if(!p.IsIncapacitated() && !p.IsDominatedBySpecialInfected())return true;
		return false;
	}
}