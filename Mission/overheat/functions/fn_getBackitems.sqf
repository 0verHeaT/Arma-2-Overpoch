/*
	File: fnc_getBackitems.sqf
	Author: 0verHeaT

	Description:
	Returns an array of all backpack items of a unit.
	(Made for A2Epoch)
	
	Parameter(s):
	1: <object> backpack of unit
	
	Returns:
	<array> all item classnames
		
	Example:
		(unitBackpack player) call fnc_getBackpackitems;	 
		--> ["DMR",...,"ItemMap"]
*/
private ["_bp","_wpn","_mag","_array"];
_bp = _this;
_array = [];
if !(isNull _bp) then 
{
	_wpn = getWeaponCargo _bp;
	_mag = getMagazineCargo _bp;
	{
		for "_i" from 0 to ((count (_x select 0)) - 1) do 
		{
			for "_j" from 1 to ((_x select 1) select _i) do 
			{
				_array set [count _array,(_x select 0) select _i];
			};
		};
	} count [_wpn,_mag];
};
_array