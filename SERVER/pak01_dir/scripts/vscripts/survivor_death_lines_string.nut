
function GetInformation()
{
	//printl(Convars.GetStr("cl_language"));
	//printl(Convars.GetClientConvarValue("cl_language", Entities.FindByClassname(null, "player").GetEntityIndex()));
	local info = InformationText.english;
	local lang = Convars.GetStr("cl_language");
	switch (lang)
	{
		case "schinese":
		case "tchinese":
			info = InformationText.schinese;
			break;
		//case "english":
		//default:
			//info = InformationText.english;
	}
	return info.reduce(@(a, b) a + "\n" + b);
}

InformationText <-
{
	english =
	[
		"This is only an information file, don't edit this.",
		"",
		"<name> and <Actor>, <name> as the file name, <Actor> used to select the correct voice for character.",
		"support Custom Survivor Takeover (CST)，<name> and <Actor> using the \"random_voice_names\" parameter.",
		"bill = NamVet",
		"zoey = TeenGirl",
		"francis = Biker",
		"louis = Manager",
		"nick = Gambler",
		"rochelle = Producer",
		"coach = Coach",
		"ellis = Mechanic",
		"",
		"addnew.txt",
		"    You can easily add contents, use GCFScape open: Left 4 Dead 2/./pak01_dir.vpk -> scripts/talker/<Actor>.txt, and copy it such like \"scenes/Gambler/DeathScream01.vcd\" to this file, each line one.",
		"    Some voices not have vcd files, so also allow wav files in the sound/player/survivor/voice/<Actor>/ directory, the format is \"voice/Gambler/Fall01.wav\".",
		"",
		"settings.txt",
		"    \"LastOneAnnouncer\"    play audio for human survivors if he is the last one.",
		"        Enable = 0/1      on/off.",
		"        SoundFile = \"sub-directory/audio.mp3\"    the audio file need place in a sub-directory of the left4dead2/sound/ folder, see also (https://developer.valvesoftware.com/wiki/L4D2_Custom_Sound_and_Music_Tutorial).",
		"        Volume = 1.0      range is 0.0 to 1.0.",
		"        Delay = 0         delay for playing audio.",
		"    \"Mute\"",
		"        Mute survivors, high priority.",
		"",
		"voicelines/<name>.txt, CST survivors in the custom_survivors folder.",
		"    \"VoiceLines\"",
		"        This file stores the lines for each survivor.",
		"        please refer to the format in the file when editing.",
		"        use \"//\" to disable unwanted lines.",
		"    \"DeathReason\"",
		"        Match specified damage type if survivors dies from it. (https://developer.valvesoftware.com/wiki/Damage_types).",
		"        You can choose an existed scene from the \"VoiceLines\" file: [\"DeathScream\"].",
		"        \"-\" prefix means that the scene only used for this file: [\"-DeathScream\"].",
		"        Support single line, need full name: [\"HurtCritical01\"].",
		"        Can also combine them: [\"DeathScream\", \"HurtCritical01\"].",
		"        Blank means mute: [].",
		"        Disabled by default, uncomment to enable match.",
		"",
		"Chat Commands(use \"!sdl \" as prefix):",
		"Command    Parameter                                   Description",
		"",
		"reload                                                 when you change files after game started, use it.",
		"",
		"mute       [<name>]                                    mute / unmute survivors.",
		"unmute     support first character and full name.      example:",
		"           \"all, l4d, l4d2, custom\" for multiple       !sdl mute n",
		"           survivors, empty means \"all\"                !sdl unmute nick",
		"",
		"reset      same as above                               reset mute state and files content.",
		"                                                       example:",
		"                                                       !sdl reset all",
		"",
		"test       same as above                               test survivor one by one whatever alive or dead.",
		"                                                       example:",
		"                                                       !sdl test",
		"",
		"ancr       play/stop     test audio and print info     test or change settings for LastOneAnnouncer.",
		"           enable <0|1>             on/off             example:",
		"           file \"audio file path\"   set audio          !sdl ancr play",
		"           volume <float>                              !sdl ancr enable 0",
		"           delay <float>            set play delay     !sdl ancr reset",
		"           reset                reset all settings",
	]

	schinese =
	[
		"该文件只是说明，不要修改它",
		"",
		"<名字> 和 <演员名称>，<名字> 作为设置的文件名，<演员名称> 则用来判断玩家的角色，以播放正确的语音",
		"支持 Custom Survivor Takeover (CST)，使用 random_voice_names 的参数作为 <名字> 和 <演员名称>",
		"bill = NamVet",
		"zoey = TeenGirl",
		"francis = Biker",
		"louis = Manager",
		"nick = Gambler",
		"rochelle = Producer",
		"coach = Coach",
		"ellis = Mechanic",
		"",
		"addnew.txt",
		"    你可以方便地添加内容，用 GCFScape 打开：Left 4 Dead 2/./pak01_dir.vpk -> scripts/talker/<演员名称>.txt，然后复制像 \"scenes/Gambler/DeathScream01.vcd\" 这样的内容到该文件内，每行一条",
		"    有些语音没有场景文件，因此也支持 sound/player/survivor/voice/<演员名称> 目录中的 wav 文件，格式为 \"voice/Gambler/Fall01.wav\"",
		"",
		"settings.txt",
		"    \"LastOneAnnouncer\"    剩下最后一个人类生还者时，为他播放音频",
		"        Enable = 0/1      关闭/开启功能",
		"        SoundFile = \"子文件夹/音频.mp3\"    音频文件需要在 left4dead2/sound/ 的子文件夹内，参考：https://developer.valvesoftware.com/wiki/Zh/L4D2_Custom_Sound_and_Music_Tutorial",
		"        Volume = 1.0      设置音量大小，范围 0.0 到 1.0",
		"        Delay = 0         设置播放音频的延迟",
		"    \"Mute\"",
		"        全局开关，禁音生还者",
		"",
		"voicelines/<名字>.txt，CST 生还者在 custom_survivors 文件夹内",
		"    \"VoiceLines\"",
		"        保存生还者死亡时会说出的台词",
		"        修改时请参考文件中的格式，用“//”可以禁用不需要的行",
		"    \"DeathReason\"",
		"        控制生还者死于特定伤害类型时的台词 (https://developer.valvesoftware.com/wiki/Damage_types)",
		"        你可以从 \"VoiceLines\" 选择一条已有的台词：[\"DeathScream\"]",
		"        \"-\"标识意味着该条台词只会在符合此设置中的情况下被使用：[\"-DeathScream\"]",
		"        也可以使用单条台词，需要全名：[\"HurtCritical01\"]",
		"        还可以组合起来：[\"DeathScream\", \"HurtCritical01\"]",
		"        留空角色将保持沉默：[]",
		"        默认禁用，取消注释可以启用匹配",
		"",
		"聊天命令(先输入“!sdl ”)：",
		"命令      参数                                     说明",
		"",
		"reload                                             当你在游戏中切出去修改了文件，可以用来重新加载设置",
		"",
		"mute      [<name>]                                 禁音/解除禁音",
		"unmute    支持生还者名字的首字母和全名             用例：",
		"          使用 \"all, l4d, l4d2, custom\"            !sdl mute n",
		"          可以选择多个目标，留空表示 \"all\"         !sdl unmute nick",
		"",
		"reset     同上                                     重置禁音状态和文件内容",
		"                                                   用例：",
		"                                                   !sdl reset all",
		"",
		"test      同上                                     依次测试每个生还者，不论生死",
		"                                                   用例：",
		"                                                   !sdl test",
		"",
		"ancr      play/stop    播放/停止音频并打印信息     测试以及修改 LastOneAnnouncer",
		"          enable <0|1>            关闭/开启        用例：",
		"          file \"音频文件路径\"     修改音频         !sdl ancr play",
		"          volume <浮点数>         设置音量         !sdl ancr enable 0",
		"          delay <浮点数>          设置延迟         !sdl ancr reset",
		"          reset               重置所有设置",
	]
}

