/*
	File: fnc_checkBackpack.sqf
	Author: 0verHeaT

	Description:
	Checks whether the selected item does fit in the backpack or not.
	(Made for A2Epoch)
	
	Parameter(s):
	1: <object> backpack of unit
	2: <string> item classname 
	
	Returns:
	<bool> enough space or not
		
	Example:
		[unitBackpack player,"DMR"] call fnc_checkBackpack;	 
		--> true/false
*/
private ["_back","_item","_space","_result","_all","_slot","_cap","_mgtype","_wtype","_wtype2","_qty"];
_back = _this select 0;
_item = _this select 1;
if (count _this > 2) then {_qty = _this select 2;}else{_qty = 1;};

if (isClass(configFile >> "CfgMagazines" >> _item)) then 
{
	_space = 1;
	_mgtype = getNumber(configFile >> "CfgWeapons" >> _item >> "Type");
	switch (_mgtype) do
	{
		case 512: {_space = 2;};
		case 768: {_space = 3;};
		case 1563: {_space = 6;};
	};
}
else
{
	_wtype = getNumber(configFile >> "CfgWeapons" >> _item >> "Type");
	switch (_wtype) do 
	{
		case 1: {_space = 10;};
		case 2: {_space = 5;};
		case 4: {_space = 10;};
		case 5: {_space = 10;};
		case 4096: {_space = 5;};
		case 131072: {_space = 1;};
	};
};

_result = false;
_all = _back call fnc_getBackpackitems;
_cap = getNumber(configFile >> "CfgVehicles" >> (typeOf _back) >> "transportMaxMagazines");

_space = _space * _qty;

_slot = 0;
{
	if (isClass(configFile >> "CfgMagazines" >> _x)) then {_slot = _slot + 1;};
	if (isClass(configFile >> "CfgWeapons" >> _x)) then 
	{
		_wtype2 = getNumber(configFile >> "CfgWeapons" >> _x >> "Type");
		if (_wtype2 == 1) then {_slot = _slot + 10;};
		if (_wtype2 == 2) then {_slot = _slot + 5;};
		if (_wtype2 == 4096) then {_slot = _slot + 5;};
		if (_wtype2 == 131072) then {_slot = _slot + 1;};
	};
} count _all;

if ((_cap - _slot) >= _space) then {_result = true;};
_result