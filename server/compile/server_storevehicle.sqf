private ["_player","_object","_garage","_class","_cid","_objectID","_objectUID","_fuel","_damage","_inventory","_hitpoints","_array","_hit","_selection","_storedata","_stored","_colour1","_colour2","_newlist"];
_player = _this select 0;
_object = _this select 1;
_garage = _this select 2;

_class = typeOf _object;

_cid = _object getVariable ["CharacterID","0"];
_objectID = _object getVariable ["ObjectID","0"];
_objectUID = _object getVariable ["ObjectUID","0"];

_colour1 = _object getVariable ["Colour","0"];
_colour2 = _object getVariable ["Colour2","0"];

_fuel = fuel _object;

_damage = damage _object;

_inventory = [
	getWeaponCargo _object,
	getMagazineCargo _object,
	getBackpackCargo _object
];

_hitpoints = _object call vehicle_getHitpoints;
_array = [];
{
	_hit = [_object,_x] call object_getHit;
	_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
	if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
	_object setHit ["_selection", _hit];
} count _hitpoints;

_storedata = [_class,_cid,_colour1,_colour2,_inventory,_fuel,_damage,_array];

_stored = _garage getVariable ["StoredVehicles",[]];


_garage setVariable ["StoredVehicles",_stored + [_storedata],true];

deleteVehicle _object;
[_objectID,_objectUID,_player] call server_deleteObj;

uiSleep 0.2;

_newlist = _stored + [_storedata];

diag_log format["VIRTUAL GARAGE: Player %1 (%2) has stored a %3 | "+str (_stored + [_storedata])+"",(name _player),(getPlayerUID _player),_class];

[_garage,_newlist] spawn {
	private ["_obj","_garagelist","_objectID","_uid","_key"];
	_obj = _this select 0;
	_garagelist = _this select 1;
	_objectID =	_obj getVariable ["ObjectID","0"];
	_uid = _obj getVariable ["ObjectUID","0"];
	
	if (_objectID == "0") then {
		_key = format["CHILD:309:%1:%2:",_uid,_garagelist];
	} else {
		_key = format["CHILD:303:%1:%2:",_objectID,_garagelist];
	};
	[_key,""+server_var+"HIVE"] call server_hiveWrite;
};