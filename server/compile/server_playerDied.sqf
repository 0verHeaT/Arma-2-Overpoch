private ["_characterID","_minutes","_newObject","_playerID","_infected","_victim","_victimName","_killer","_killerName","_weapon","_distance","_message","_loc_message","_key","_death_record","_pic","_kill_txt","_puid"];
//[unit, weapon, muzzle, mode, ammo, magazine, projectile]
_characterID = _this select 0;
_minutes = _this select 1;
_newObject = _this select 2;
_playerID = _this select 3;
_infected = _this select 4;
if (((count _this) >= 6) && {(typeName (_this select 5)) == "STRING"} && {(_this select 5) != ""}) then {
	_victimName =	_this select 5;
} else {
	_victimName =  if (alive _newObject) then {name _newObject;} else {"";};
};
_victim = _newObject;
_newObject setVariable ["bodyName", _victimName, true];
_newObject setVariable["processedDeath",diag_tickTime];

if (typeName _minutes == "STRING") then {
	_minutes = parseNumber _minutes;
};

diag_log ("PLAYERDEATH: Player Died " + _playerID);

if (_characterID != "0") then {
	_key = format["CHILD:202:%1:%2:%3:",_characterID,_minutes,_infected];
	#ifdef DZE_SERVER_DEBUG_HIVE
	diag_log ("HIVE: WRITE: "+ str(_key));
	#endif
	[_key,""+server_var+"HIVE"] call server_hiveWrite;
} else {
	deleteVehicle _newObject;
};