/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: twp_loadGear.sqf
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_index","_gear","_allgear"];
_index = _this select 0;
if (_index < 0) exitWith {};

lbClear 9002;
TWPPlayerGearList = [];

_gear = [];
_allgear = (weapons player) + (magazines player) + ((unitBackpack player) call fnc_getBackpackitems);

switch (_index) do
{
	case 0: {_gear = _allgear;};
	case 1: {{if (isClass(configFile >> "CfgMagazines" >> _x)) then {_gear set [count _gear,_x];};} count _allgear;};
	case 2: {{if (isClass(configFile >> "CfgWeapons" >> _x)) then {_gear set [count _gear,_x];};} count _allgear;};
};

for "_i" from 0 to ((count _gear) - 1) do
{
	private ["_item","_c","_name","_pic","_type","_check"];
	_item = _gear select _i;
	
	if (count TWPPlayerGearList > 0) then 
	{
		_check = [];
		{private ["_x"];_check set [count _check,(_x select 0)]} count TWPPlayerGearList;
	} 
	else 
	{
		_check = [];
	};
		
	if !(_item in _check) then 
	{
		_c = 0;
		if (isClass(configFile >> "CfgWeapons" >> _item)) then 
		{
			_name = getText (configFile >> "CfgWeapons" >> _item >> "displayName");
			_pic = getText (configFile >> "CfgWeapons" >> _item >> "picture");
			_type = "CfgWeapons";
		} 
		else 
		{
			_name = getText (configFile >> "CfgMagazines" >> _item >> "displayName");
			_pic = getText (configFile >> "CfgMagazines" >> _item >> "picture");
			_type = "CfgMagazines";
		};
		if (!isNil "_name" && !isNil "_pic") then 
		{
			private ["_j"];
			{
				if (_item == _x) then 
				{
					_c = _c + 1;
				};
			} count _gear;
			_j = lbAdd [9002,format["%2 x %1",_name,_c]];
			lbSetPicture [9002,_j,_pic];
			TWPPlayerGearList set [count TWPPlayerGearList,[_item,_type,_c,-1]];
		};
	};
};