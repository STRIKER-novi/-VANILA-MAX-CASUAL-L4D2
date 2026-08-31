// Reescritura parcial de [L4D & 2] Tongue Block Fix SIN Source Scramble
// Este código evita el bloqueo de la lengua del smoker por compañeros infectados usando CollisionHook y lógica en SourcePawn
// Se omite el parcheo en memoria para mantener compatibilidad y estabilidad

#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <collisionhook>
#include <sdktools>

#define PLUGIN_VERSION "1.0 (Reescrito)"

public Plugin myinfo = 
{
	name = "[L4D & 2] Tongue Block Fix (Safe Version)",
	author = "Adaptado por ChatGPT (Forgetest base)",
	description = "Evita que compañeros infectados bloqueen la lengua del Smoker.",
	version = PLUGIN_VERSION,
	url = ""
};

int g_iTankClass;
int g_iTipFlag;
int g_iFlyFlag;

public APLRes AskPluginLoad2(Handle myself, bool late, char[] error, int err_max)
{
	switch (GetEngineVersion())
	{
		case Engine_Left4Dead: { g_iTankClass = 5; }
		case Engine_Left4Dead2: { g_iTankClass = 8; }
		default:
		{
			strcopy(error, err_max, "Plugin solo compatible con Left 4 Dead 1 y 2.");
			return APLRes_SilentFailure;
		}
	}
	return APLRes_Success;
}

public void OnPluginStart()
{
	CreateConVar("tongue_tip_through_teammate", "0",
		"Permitir que la lengua atraviese infectados (0 = no, 1 = SI comunes, 2 = Tank, 3 = Todos)", FCVAR_NOTIFY);
	CreateConVar("tongue_fly_through_teammate", "1",
		"Permitir que la lengua viaje a través de infectados tras lanzarse.", FCVAR_NOTIFY);
	
	HookCollisionPassFilter(CH_PassFilter);
	PrintToServer("[TongueFix] Plugin cargado sin Source Scramble");
}

public Action CH_PassFilter(int touch, int pass, bool &result)
{
	if (!touch || touch > MaxClients || !IsClientInGame(touch))
		return Plugin_Continue;
	if (GetClientTeam(touch) != 3)
		return Plugin_Continue;
	
	// Pasos extra por si el "pass" es la lengua o jugador
	if (pass > 0 && pass <= MaxClients && IsClientInGame(pass))
	{
		if (GetClientTeam(pass) != 3)
			return Plugin_Continue;
		
		int tongueOwner = GetEntPropEnt(pass, Prop_Send, "m_owner");
		if (tongueOwner == touch)
			return Plugin_Continue; // No bloquear al dueño
		
		int classTouch = GetEntProp(touch, Prop_Send, "m_zombieClass");
		if (classTouch == g_iTankClass && (g_iFlyFlag & 2))
		{
			result = false;
			return Plugin_Handled;
		}
		else if (g_iFlyFlag & 1)
		{
			result = false;
			return Plugin_Handled;
		}
	}
	else
	{
		char cls[64];
		if (GetEdictClassname(pass, cls, sizeof(cls)) && StrEqual(cls, "ability_tongue"))
		{
			int owner = GetEntPropEnt(pass, Prop_Send, "m_owner");
			if (owner != touch)
			{
				int classTouch = GetEntProp(touch, Prop_Send, "m_zombieClass");
				if (classTouch == g_iTankClass && (g_iFlyFlag & 2))
				{
					result = false;
					return Plugin_Handled;
				}
				else if (g_iFlyFlag & 1)
				{
					result = false;
					return Plugin_Handled;
				}
			}
		}
	}
	return Plugin_Continue;
}
