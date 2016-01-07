/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: twp_loadTargetItems.sqf
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_index","_gear","_allgear"];
_index = _this select 0;
if (_index < 0) exitWith {};

lbClear 9003;
TWPTargetList = [];

_allgear = TWPTarget getVariable ["twpitems",[]];
_gear = [];

// [["DMR_DZ","CfgWeapons",1,20000],["MortarBucket","CfgWeapons",4,4000]]

switch (_index) do
{
	case 0: {_gear = _allgear;};
	case 1: 
	{
		{
			if ((_x select 1) == "CfgMagazines") then 
			{
				_gear set [count _gear,_x];
			};
		} count _allgear;
	};
	case 2: 
	{
		{
			if ((_x select 1) == "CfgWeapons") then 
			{
				_gear set [count _gear,_x];
			};
		} count _allgear;
	};
};

for "_i" from 0 to ((count _gear) - 1) do
{
	private ["_item","_type","_c","_price","_name","_pic"];
	_item = (_gear select _i) select 0;
	_type = (_gear select _i) select 1;
	_c = (_gear select _i) select 2;
	_price = (_gear select _i) select 3;
	
	_name = "";
	_pic = "";
	_name = getText (configFile >> _type >> _item >> "displayName");
	_pic = getText (configFile >> _type >> _item >> "picture");
	
	if (_name != "" && _pic != "") then
	{
		_j = lbAdd [9003,format["%2 x %1",_name,_c]];
		lbSetPicture [9003,_j,_pic];
		TWPTargetList set [count TWPTargetList,(_gear select _i)];
	};
};