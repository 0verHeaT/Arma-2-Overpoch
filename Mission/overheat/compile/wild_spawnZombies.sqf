private ["_unitTypes","_lootType","_lootTypeCfg","_loot_count","_index","_weights","_loot","_array","_player","_doLoiter","_agent","_type","_radius","_method","_position","_isAlive","_myDest","_newDest","_rnd","_id","_cfg"];
_player = _this select 0;

_unitTypes = [];
if (DZE_MissionLootTable) then {
	_unitTypes = 	[]+ getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
} else {
	_unitTypes = 	[]+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
};
_doLoiter = 	true;

_loot = 	"";
_array = 	[];
_agent = 	objNull;

_type = _unitTypes call BIS_fnc_selectRandom;

//Create the Group && populate it
//diag_log ("Spawned: " + _type);
_radius = 40;
_method = "NONE";

_position = [_player,120,200,10,0,0,0] call BIS_fnc_findSafePos;

_agent = createAgent [_type, _position, [], _radius, _method];

if (_doLoiter) then {
	//_agent setPosATL _position;
	//_agent setVariable ["doLoiter",true,true];
	_agent setDir round(random 180);
};

dayz_spawnZombies = dayz_spawnZombies + 1;

if (random 1 > 0.7) then {
	_agent setUnitPos "Middle";
};

if (isNull _agent) exitWith {
	dayz_spawnZombies = dayz_spawnZombies - 1;
};

_isAlive = alive _agent;

_myDest = getPosATL _agent;
_newDest = getPosATL _agent;
_agent setVariable ["myDest",_myDest];
_agent setVariable ["newDest",_newDest];

//Add some loot
_rnd = random 1;
if (_rnd > 0.3) then {
	_loot = "";
	_lootarray = [];
	_lootType = configFile >> "CfgVehicles" >> _type >> "zombieLoot";
	if (isText _lootType) then {
		_lootarray = [];
		if (DZE_MissionLootTable) then {
			_cfg = missionConfigFile >> "cfgLoot";
		} else {
			_cfg = configFile >> "cfgLoot";
		};
		{
			_lootarray set [count _lootarray,_x];
		} count getArray (_cfg >> getText(_lootType));
		if (count _lootarray > 0) then {
			_zloot = _lootarray call BIS_fnc_selectRandom;
			_chance = (floor(random 20))/100;
			if ((_zloot select 1) >= _chance) then {
				_loot_count = getNumber(configFile >> "CfgMagazines" >> (_zloot select 0) >> "count");
				if(_loot_count > 1) then {
					_agent addMagazine [(_zloot select 0), ceil(random _loot_count)];
				} else {
					_agent addMagazine (_zloot select 0);
				};
			};
		};
	};
};

//Start behavior
_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm";