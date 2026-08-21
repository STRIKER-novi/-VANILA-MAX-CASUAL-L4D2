body_sequence_rag <- "";
//body_sequence_defib <- "";
parentBone <- "ValveBiped.Bip01_Pelvis";

if (!("clSlot" in this)) clSlot <- null;
if (!("body" in this)) body <- null;

//local script_1 = "vscript_script_defibshock";

local allowBoogie = false;

local allowDeadCam = true;
deadCamera <- null;

function InitiateRagdoll()
{
	if ( this.body == null || !this.body.IsValid() ) { RemoveSelf(); return; }
	
	this.body.SetOrigin(Vector());
	this.body.SetAngles(QAngle());
	
	NetProps.SetPropInt(self, "m_CollisionGroup", 1); // COLLISION_GROUP_DEBRIS
	NetProps.SetPropInt(self, "m_iEFlags", (1<<17));
	
	NetProps.SetPropInt(this.body, "m_MoveType", 0);
	NetProps.SetPropInt(this.body, "m_fEffects", 1|512); // EF_BONEMERGE|EF_PARENT_ANIMATES
	
	body_sequence_rag = this.body.LookupActivity("ACT_DIERAGDOLL");
	this.body.ResetSequence(body_sequence_rag);
	
	//DoEntFire("!self", "RunScriptFile", script_1, 0, null, this.body);
	if (!this.body.ValidateScriptScope()) return;
	local bodyScope = this.body.GetScriptScope();
	
	bodyScope.timeTilThink1 <- -1.0;
	bodyScope.doThink1 <- false;
	bodyScope["InputShock"] <- function() // Exception made for this because game somehow calls Shock even if shock is in string table
	{
		// This think stuff is so we don't run into an infinite loop when we call Shock again
		local game_time = Time();
		if (timeTilThink1 >= game_time && doThink1 == true)
		{
			doThink1 = false;
			return true;
		}
		timeTilThink1 = game_time+0.05;
		doThink1 = true;
		
		local moveparent = self.GetMoveParent();
		if (moveparent == null || moveparent.GetClassname() != "prop_ragdoll") return true;
		DoEntFire("!self", "ClearParent", "", 0, null, self);
		DoEntFire("!self", "CallScriptFunction", "AllowBoogie", 0, null, moveparent);
		DoEntFire("!self", "StartRagdollBoogie", "", 0, null, moveparent);
		DoEntFire("!self", "SetParent", "!activator", 0, moveparent, self);
		DoEntFire("!self", "CallScriptFunction", "DisallowBoogie", 0, null, moveparent);
		DoEntFire("!self", "Shock", "", 0.01, null, self);
		// Do shock again because clearing parent clears the shock effect
		
		DoEntFire("!self", "CallScriptFunction", "SetBoogieValues", 0.01, null, moveparent);
	}
	
	//body_sequence_defib = this.body.LookupActivity("ACT_TERROR_DEFIBRILLATOR_SHOCK");
	
	//NetProps.SetPropInt(self, "m_nCharacterType", NetProps.GetPropInt(this.body, "m_nCharacterType"));
	//Msg("m_nCharacterType: "+NetProps.GetPropInt(self, "m_nCharacterType")+"\n");
}

// thank you a lot Nescius
// if you don't know string tables precache strings so when you use
// something like GetMeAString on anything entity related it might pop up
// as Getmeastring because the map's first use of this string uses that case
// this is important because input hooks are CASE SENSITIVE
// but inputs themselves are NOT CASE SENSITIVE
function GetFromStringTable(str, strTblLookup = Entities.First())
{
	local oldName = strTblLookup.GetName();
	
	strTblLookup.__KeyValueFromString("targetname", str);
	local strFromStrTbl = strTblLookup.GetName();
	
	strTblLookup.__KeyValueFromString("targetname", oldName);
	
	return strFromStrTbl;
}

local timeTilThink1 = -1.0;
function DefibRagdollThink()
{
	local game_time = Time();
	if (timeTilThink1 < game_time)
	{
		timeTilThink1 = game_time+0.1;
		if (this.body == null || !this.body.IsValid()) { RemoveSelf(); return 1.0; }
		CheckForTeleport();
	}
	
	FindDeadCamera();
	return 0.033;
}

function SetBoogieValues()
{
	// Boogie entity is env_ragdoll_boogie. Try to find some kind of trickery to set it's time limit
	// without potentially affecting other boogie entities
	local boogie = FindBoogie();
	if (boogie != null)
	{
		NetProps.SetPropFloat(boogie, "m_flBoogieLength", 0.25);
		NetProps.SetPropFloat(boogie, "m_flMagnitude", 150.0);
	}
}

this["Input"+GetFromStringTable("StartRagdollBoogie", self)] <- function()
{
	//Msg("allowBoogie: "+allowBoogie+"\n");
	// The Boogie input will remove all children from a ragdoll, so we have to deny it when body is parented
	return allowBoogie;
	// This one works as of now
}

this["Input"+GetFromStringTable("BecomeRagdoll", self)] <- function()
{
	// DON'T do this under any circumstances.
	// I know people really like BecomeRagdoll'ing the damn death models, but this is already a ragdoll damn you
	return false;
}

function AllowBoogie()
{ allowBoogie = true; }

function DisallowBoogie()
{ allowBoogie = false; }

function FindBoogie()
{
	local boogie = Entities.FindByClassname(null, "env_ragdoll_boogie");
	for ( boogie; boogie != null; boogie = Entities.FindByClassname(boogie, "env_ragdoll_boogie"))
	{
		local moveparent = boogie.GetMoveParent();
		if (moveparent == null || moveparent != self) continue;
		
		return boogie;
	}
	return null;
}

function FindDeadCamera()
{
	if (!allowDeadCam) return;
	if (deadCamera == null || !deadCamera.IsValid() || !deadCamera.IsPlayer() || (!deadCamera.IsDead() && !deadCamera.IsDying())) return;
	
	if (!NetProps.HasProp(deadCamera, "m_iObserverMode"))
	{
		allowDeadCam = false;
		return;
	}
	
	local obs_mode = NetProps.GetPropInt(deadCamera, "m_iObserverMode");
	// if OBS_MODE_DEATHCAM or OBS_MODE_FREEZECAM then death cam follow time
	if (obs_mode == 1 || obs_mode == 2)
		deadCamera.SetOrigin(self.GetOrigin());
	else
		allowDeadCam = false;
}

function RemoveSelf()
{
	local player = null;
	for (local loopPly; loopPly = Entities.FindByClassname( loopPly, "player" );)
	{
		if ( loopPly == null || !loopPly.IsSurvivor() )
			continue;
		
		local theirSlot = loopPly.GetSurvivorSlot();
		if (theirSlot != clSlot) continue;
		player = loopPly;
		break;
	}
	/*local attach_bone = GetAttachmentBoneOrigin();
	if (attach_bone != Vector())
	{
		local player = Entities.FindByClassnameNearest("player", attach_bone, 25.0);*/
		if (player != null)
		{
			local ply_origin = player.GetOrigin();
			local body_origin = self.GetOrigin();
			local distance = (ply_origin-body_origin).LengthSqr() / 32;
			//printl(self+"'s distance to body is: "+distance);
			//printl("sequence: "+player.GetSequenceName(player.GetSequence()));
			if (distance <= 32 && !player.IsDead() && !player.IsDying())
			{
				SetToMiddle(player);
				defibragdolls.FixTilt(player);
			}
		}
	//}
	DoEntFire("!self", "Kill", "", 0, null, self);
}

// Ported over from Fainting Ragdolls
function SetToMiddle(target)
{
	local parent_bone = self.LookupBone(parentBone);
	if (parent_bone < 0) parent_bone = 0;
	
	local origin = self.GetBoneOrigin(parent_bone);
	local origin_max_heightcheck = 35.0;
	
	local trace_Table = {};
	trace_Table =
	{
		start = Vector(origin.x, origin.y, origin.z+origin_max_heightcheck),
		end = Vector(origin.x, origin.y, origin.z-origin_max_heightcheck),
		mask = 1174421507 // TRACE_MASK_SHOT
		// https://github.com/jacob404/Official-Vscripts-Decompiled/blob/5017fc6170ae9aa2299cba2c70e05de871090a01/update/rocketdude/rd_utils.nut#L11
	}
	TraceLine(trace_Table);
	
	local final_pos = origin;
	
	if (developer()) g_ModeScript.DeepPrintTable(trace_Table);
	if (trace_Table && ("pos" in trace_Table) && ("hit" in trace_Table) && trace_Table.hit && (!("startsolid" in trace_Table) || !trace_Table.startsolid))
	//if (trace_Table && trace_Table.hit)
		final_pos = trace_Table.pos;
	
	target.SetOrigin(final_pos);
}

function CheckForTeleport()
{
	local body_origin = NetProps.GetPropVector(this.body, "m_vecOrigin");
	if (body_origin.x != 0 && body_origin.y != 0 && body_origin.z != 0)
	{
		this.body.SetOrigin(Vector());
		body_origin.z += NetProps.GetPropVector(self, "m_Collision.m_vecMaxs").z;
		self.SetOrigin(body_origin);
		Awaken();
	}
}

function Awaken()
{
	local origin = self.GetOrigin();
	self.TakeDamageEx(self, self, self, Vector(0,0,1), origin, 5, DirectorScript.DMG_BLAST | (1 << 7)); // DMG_CLUB
}