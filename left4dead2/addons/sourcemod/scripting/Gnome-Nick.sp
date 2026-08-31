#include <sourcemod>
#include <sdktools>
#include <sdktools_stringtables>

public void OnMapStart()
{
    // Materiales
    AddFileToDownloadsTable("materials/models/survivors/gambler/eyeball_l.vmt");
    AddFileToDownloadsTable("materials/models/survivors/gambler/eyeball_r.vmt");
    AddFileToDownloadsTable("materials/models/survivors/gambler/gambler_eye_ao.vtf");
    AddFileToDownloadsTable("materials/models/survivors/gambler/gambler_eyes.vtf");
	
	//Modelo
    AddFileToDownloadsTable("models/props_junk/gnome.dx90.vtx");
    AddFileToDownloadsTable("models/props_junk/gnome.mdl");
    AddFileToDownloadsTable("models/props_junk/gnome.phy");
    AddFileToDownloadsTable("models/props_junk/gnome.vvd");
    AddFileToDownloadsTable("models/weapons/melee/v_gnome.dx90.vtx");
    AddFileToDownloadsTable("models/weapons/melee/v_gnome.mdl");
    AddFileToDownloadsTable("models/weapons/melee/v_gnome.vvd");

	
	// PrecacheModelo (.mdl)
    PrecacheModel("models/props_junk/gnome.mdl", true);
    PrecacheModel("models/weapons/melee/v_gnome.mdl", true);

	//Sonidos 
    //AddFileToDownloadsTable("sound/?");
    //AddFileToDownloadsTable("sound/?");
	
	// preCacheSonidos (todos)
    //PrecacheSound("unused/?", true);
    //PrecacheSound("unused/?", true);
}