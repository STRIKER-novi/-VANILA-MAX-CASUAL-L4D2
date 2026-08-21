PrecacheModel(::manacat_temp.body);
PrecacheModel(::manacat_temp.glass);
Obj <-
{
	//-------------------------------------------------------
	// Required Interface functions
	//-------------------------------------------------------
	function GetPrecacheList()
	{
		local precacheModels =
		[
			EntityGroup.SpawnTables.car,
			EntityGroup.SpawnTables.glass,
		]
		return precacheModels
	}

	//-------------------------------------------------------
	function GetSpawnList()
	{
		local spawnEnts =
		[
			EntityGroup.SpawnTables.car,
			EntityGroup.SpawnTables.glass,
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
			car = 
			{
				SpawnInfo =
				{
					classname = "prop_physics"
					model = ::manacat_temp.body
					targetname = "car_#mnc#"
					skin = ::manacat_temp.skin
					solid = "6"
					spawnflags = "256"
					rendercolor = ::manacat_temp.color
					rendermode = "0"
				}
			}
			glass =
			{
				SpawnInfo =
				{
					classname = "prop_dynamic"
					model = ::manacat_temp.glass
					targetname = "car_glass_#mnc#"
					parentname = "car_#mnc#"
					skin = "0"
					solid = "6"
					spawnflags = "0"
				}
			}
		} // SpawnTables
	} // EntityGroup
}

RegisterEntityGroup( "Obj", Obj )