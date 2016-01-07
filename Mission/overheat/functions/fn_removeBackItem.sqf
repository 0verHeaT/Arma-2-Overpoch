/*
	File: fnc_removeBackItem.sqf
	Author: 0verHeaT

	Description:
	Removes an item from a unit's backpack
	(Made for A2Epoch)
	
	Parameter(s):
	1: <object> backpack of unit
	1: <string> item to remove
	1: <string> type of item
	1: <scalar> count
	
	Returns:
	<scalar> number of removed items
		
	Example:
		[(unitBackpack player),"DMR","CfgWeapons",2] call fnc_removeBackItem;
		--> 2
*/
private ["_back","_item","_type","_qty","_allbpgear","_i"];
_back = _this select 0;
_item = _this select 1;
_type = _this select 2;
_qty = _this select 3;

_allbpgear = _back call fnc_getBackpackitems;

clearMagazineCargoGlobal _back;
clearWeaponCargoGlobal _back;

_i = 1;

{
	if (_x == _item) then 
	{
		if (_i <= _qty) then 
		{
			_i = _i + 1;
		}
		else
		{
			if (_type == "CfgWeapons") then 
			{
				_back addWeaponCargoGlobal [_x,1];
			}
			else
			{
				_back addMagazineCargoGlobal [_x,1];
			};
		};
	}
	else
	{
		if (isClass(configFile >> "CfgWeapons" >> _x)) then 
		{
			_back addWeaponCargoGlobal [_x,1];
		}
		else
		{
			_back addMagazineCargoGlobal [_x,1];
		};
	};
} count _allbpgear;
_i