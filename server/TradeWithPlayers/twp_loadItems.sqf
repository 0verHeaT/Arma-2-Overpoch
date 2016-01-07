/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: twp_loadItems.sqf
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_gear"];

lbClear 9004;
TWPPlayerList = [];

_gear = player getVariable ["twpitems",[]];

// [["DMR_DZ","CfgWeapons",1,20000],["MortarBucket","CfgWeapons",4,4000]]

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
		_j = lbAdd [9004,format["%2 x %1",_name,_c]];
		lbSetPicture [9004,_j,_pic];
		TWPPlayerList set [count TWPPlayerList,(_gear select _i)];
	};
};