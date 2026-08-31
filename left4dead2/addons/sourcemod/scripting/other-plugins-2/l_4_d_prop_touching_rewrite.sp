// Reescritura de l4d_prop_touching_rules.sp SIN Source Scramble
// Usa SDKHooks para controlar colisiones con props físicos
// Requiere: SDKHooks y Left 4 DHooks instalados

#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>
#include <sdkhooks>
#include <sdktools>

#define PLUGIN_NAME "L4D Prop Touching Rules (Reescrito)"
#define PLUGIN_VERSION "1.0"

public Plugin myinfo = 
{
    name = PLUGIN_NAME,
    author = "Adaptado por ChatGPT",
    description = "Evita que ciertos props físicos interactúen con jugadores.",
    version = PLUGIN_VERSION,
    url = ""
};

// Lista de clases físicas que ignoraremos (props)
char g_BlockProps[][] = 
{
    "prop_physics",
    "physics_prop_ragdoll"
};

public void OnPluginStart()
{
    HookEvent("round_start", Event_RoundStart, EventHookMode_Post);
    PrintToServer("%s v%s cargado.", PLUGIN_NAME, PLUGIN_VERSION);
}

public void Event_RoundStart(Event event, const char[] name, bool dontBroadcast)
{
    CreateTimer(2.0, Timer_HookAllEntities);
}

public Action Timer_HookAllEntities(Handle timer)
{
    int entityCount = GetMaxEntities();

    for (int i = 1; i < entityCount; i++)
    {
        if (!IsValidEntity(i) || !IsValidEdict(i)) continue;

        char classname[64];
        GetEntityClassname(i, classname, sizeof(classname));

        for (int j = 0; j < sizeof(g_BlockProps); j++)
        {
            if (StrEqual(classname, g_BlockProps[j]))
            {
                SDKHook(i, SDKHook_StartTouch, OnPropStartTouch);
                break;
            }
        }
    }
    return Plugin_Handled;
}

public Action OnPropStartTouch(int entity, int other)
{
    if (!IsValidEntity(other) || other < 1 || other > MaxClients) return Plugin_Continue;

    if (IsClientInGame(other) && IsPlayerAlive(other))
    {
        // Bloquear la interacción entre el prop y el jugador
        // Desactivar momentáneamente la física o empujar el prop
        TeleportEntity(entity, NULL_VECTOR, NULL_VECTOR, view_as<float>({0.0, 0.0, 50.0}));
    }
    return Plugin_Handled;
}
