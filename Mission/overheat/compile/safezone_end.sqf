private ["_veh","_szs","_end"];
canbuild = true;

terminate SafezoneSpeedLimit;

hintSilent "You left the Safe Zone!";

player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
player_zombieAttack = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieAttack.sqf";
player_fired = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
fnc_usec_unconscious = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
object_monitorGear = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\object_monitorGear.sqf';
vehicle_handleDamage = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\vehicle_handleDamage.sqf';
	
_veh = vehicle player;
_szs = _veh getVariable ['inSafeZone',0];
if (_szs == 1) then
{
	_veh setVariable ['inSafeZone',0,true];
	if (player != _veh) then
	{
		_veh removeAllEventHandlers 'HandleDamage';
		_veh addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
		_veh allowDamage true;
	};
};
	
_end = false;
if (isNil 'gmadmin') then
{
	_end = true;
}
else
{
	if (gmadmin == 0) then
	{
		_end = true;
	};
};
if (_end) then
{
	player allowDamage true;
	fnc_usec_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
	player removeAllEventHandlers 'HandleDamage';
	player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
};