private ["_cTarget","_isOk","_display","_inVehicle"];
disableSerialization;
_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;
if(_inVehicle) then {
	_cTarget = (vehicle player);
};

_isOk = false;
{
	if(!_isOk) then {
		_isOk = _cTarget isKindOf _x;
	};
} forEach ["LandVehicle","Air", "Ship"];

if((locked _cTarget) && _isOk && (((vehicle player) distance _cTarget) < 12)) then {
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};

if ((isPlayer _cTarget) && (((vehicle player) distance _cTarget) < 12) && !(canbuild)) then
{
	cutText ["You are not allowed to open Gear while near another player!","PLAIN DOWN"];
	_display closeDisplay 1;
};

[_cTarget] spawn 
{
	private ["_cid","_obj","_maxdis","_log"];
	_obj = _this select 0;
	if !(canbuild) exitWith {};
	
	if (vehicle player != player) then {_obj = vehicle player;};
	
	if (isNull _obj) exitWith {};
	
	_maxdis = if (_obj isKindOf "AllVehicles") then {15} else {7.5};
	if ((player distance _obj) > _maxdis) exitWith {};
	
	_cid = player getVariable ["CharacterID","0"];
	
	waitUntil {str(FindDisplay 106) == "Display #106"};
	
	waitUntil {str(FindDisplay 106) == "No Display"};
	
	[_cid] call player_localSync;
};