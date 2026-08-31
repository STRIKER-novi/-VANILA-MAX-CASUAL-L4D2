#pragma semicolon 1
#pragma newdecls required

#include <sourcemod>

public void OnPluginStart()
{
    AddCommandListener(Command_Say, "say");
    AddCommandListener(Command_Say, "say_team");
}

public Action Command_Say(int client, const char[] command, int argc)
{
    if (client <= 0 || !IsClientInGame(client))
        return Plugin_Continue;

    char text[192];
    GetCmdArgString(text, sizeof(text));

    StripQuotes(text);
    TrimString(text);

    if (StrEqual(text, "!spec", false) || StrEqual(text, "/spec", false))
    {
        if (GetClientTeam(client) != 1)
        {
            ChangeClientTeam(client, 1);
        }

        return Plugin_Handled;
    }

    return Plugin_Continue;
}