printl("Initializing Nescius' saferoom door script");

local function SetUpDebrification(checkpoint_door) {
	EntityOutputs.AddOutput(checkpoint_door,
		"OnFullyOpen",
		"nescius_safedoor",
		"RunScriptCode",
		"Debrify(caller)", 0, -1);

	checkpoint_door.__KeyValueFromInt("speed", 800);
	checkpoint_door.ValidateScriptScope();
	local scope = checkpoint_door.GetScriptScope();
	local prev_func = @()true;
	if("InputUse" in scope) {
		prev_func = scope.InputUse;
	}
	scope.InputUse <- function() {
		local ret = prev_func();
		nes_last_door_user <- activator.weakref();
		return ret;
	}

	local center = checkpoint_door.GetCenter();
	local angles = checkpoint_door.GetAngles();

	local mins = NetProps.GetPropVector(checkpoint_door, "m_Collision.m_vecMins");
	local maxs = NetProps.GetPropVector(checkpoint_door, "m_Collision.m_vecMaxs");
	local max_v = (center + maxs);
	local extent = max_v - center + Vector(10,10,10);

	local trigger = SpawnEntityFromTable("script_trigger_multiple", {
		origin = center,
		extent = extent,
		angles = angles.ToKVString(),
		spawnflags = 1,
		targetname = "nes_tank_debrify_trigger"
		OnStartTouch = "!self,CallScriptFunction,nesrealism_tank_check"
	});
	scope.nes_debrif_trigger <- trigger.weakref();

	trigger.ValidateScriptScope();
	local scope = trigger.GetScriptScope();
	scope.safe_door <- checkpoint_door.weakref();
	scope.nesrealism_tank_check <- function() {
		if(activator && activator.GetZombieType() == 8) {
			if(safe_door) {
				NesciusSafeDoor.Debrify(safe_door, activator);
			}
			self.Kill();
		}
	}
}

function FindStartingSaferoom() {
	for(local checkpoint_door = null; checkpoint_door = Entities.FindByClassname(checkpoint_door, "prop_door_rotating_checkpoint"); ) {
		if(GetFlowPercentForPosition(checkpoint_door.GetCenter(), true) < 30) {
			SetUpDebrification(checkpoint_door);
		}
	}
}

local function qtov(q) {
	return Vector(q.x, q.y, q.z);
}

function Debrify(ent, away_from = null) {
	local origin = ent.GetOrigin();
	local angles = ent.GetAngles();
	local model = ent.GetModelName();
	local closed_angles = NetProps.GetPropVector(ent, "m_angRotationClosed");
	closed_angles = QAngle(closed_angles.x, closed_angles.y, closed_angles.z)

	local name = UniqueString();
	local ent_group = {
		door = {
			prop_physics_override = {
				origin = origin - angles.Left()*5 + Vector(0,0,1),
				angles = angles.ToKVString(),
				spawnflags = 4,
				model = model,
				targetname = name
			}
		}
	}

	for(local child = ent.FirstMoveChild(), i = 0; child; child = child.NextMovePeer()) {
		if(child.GetClassname() == "prop_dynamic") {
			ent_group[i++] <- {
				prop_dynamic_override = {
					model = child.GetModelName(),
					origin = child.GetOrigin(),
					angles = child.GetAngles().ToKVString(),
					parentname = name,
					skin = NetProps.GetPropInt(child, "m_nSkin"),
					solid = 0
				}
			}
		}
	}
	local scope = ent.GetScriptScope();
	if(scope) {
		if("nes_last_door_user" in scope) {
			DoEntFire("!self", "SpeakResponseConcept", "NesciusSaferoomDoor", 0, null, scope.nes_last_door_user);
		}
		DoEntFire("!self", "Kill", "", 0, null, scope.nes_debrif_trigger);
	}
	ent.Kill();
	SpawnEntityGroupFromTable(ent_group);
	local prop = Ent(name);
	if(away_from == null) {
		prop.ApplyLocalAngularVelocityImpulse(qtov(angles-closed_angles)*RandomInt(2,5));
		prop.ApplyAbsVelocityImpulse(closed_angles.Left()*RandomInt(800,1300));
	}
	else {
		prop.ApplyLocalAngularVelocityImpulse(Vector(1500, 0, 0));
		prop.ApplyAbsVelocityImpulse(away_from.EyeAngles().Forward()*1000);
	}
}

function OnGameEvent_round_start(p) {
	EntFire("!self", "CallScriptFunction", "FindStartingSaferoom");
}
