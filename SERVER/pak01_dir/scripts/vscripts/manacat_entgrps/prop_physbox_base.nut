PrecacheModel(::manacat_temp.model);
Obj <-
{
	//-------------------------------------------------------
	// Required Interface functions
	//-------------------------------------------------------
	function GetPrecacheList()
	{
		local precacheModels =
		[
			EntityGroup.SpawnTables.prop,
			EntityGroup.SpawnTables.physbox,
		]
		return precacheModels
	}

	//-------------------------------------------------------
	function GetSpawnList()
	{
		local spawnEnts =
		[
			EntityGroup.SpawnTables.prop,
			EntityGroup.SpawnTables.physbox,
		]
		return spawnEnts
	}

	//-------------------------------------------------------
	function GetEntityGroup()
	{
		return EntityGroup
	}

	//-------------------------------------------------------
	// Table of entities that make up this group
	//-------------------------------------------------------
	EntityGroup =
	{
		SpawnTables =
		{
			prop = 
			{
				SpawnInfo =
				{
					classname = "prop_dynamic_override"
					body = "0"
					fadescale = "1"
					disableshadows = ::manacat_temp.disableshadows
					LagCompensate = "0"
					MaxAnimTime = "10"
					MinAnimTime = "5"
					model = ::manacat_temp.model
					PerformanceMode = "0"
					pressuredelay = "0"
					RandomAnimation = "0"
					SetBodyGroup = "0"
					solid = "5"
					skin = ::manacat_temp.skin
					spawnflags = "4"
					StartDisabled = "0"
					targetname = "prop_#mnc#"
					parentname = "physbox_#mnc#"
					updatechildren = "0"
					angles = Vector( 0, 0, 0 )
					origin = Vector( 0, 0, 0 )
					lightingorigin = ::manacat_temp.info_target
					rendercolor = ::manacat_temp.color
					effects = ::manacat_temp.effects
				}
			}
			physbox =
			{
				SpawnInfo =
				{
					classname = "func_physbox"
					origin = Vector( 0, 0, 0 )
					angles = Vector( 0, 0, 0 )
					disableshadows = "1"
					model = ::manacat_temp.model
					targetname = "physbox_#mnc#"
					spawnflags = "32768"
					effects = "32"
				}
			}
		} // SpawnTables
	} // EntityGroup
}

RegisterEntityGroup( "Obj", Obj )