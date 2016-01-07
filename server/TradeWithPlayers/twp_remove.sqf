/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: twp_remove.sqf
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_index","_item","_class","_type","_name","_list","_mode"];
_index = _this select 0;

if (_index < 0 || (_index >= count TWPPlayerList)) exitWith {};

_item = TWPPlayerList select _index;
_class = _item select 0;
_type = _item select 1;

_name = getText(configFile >> _type >> _class >> "displayName");

_list = player getVariable ["twpitems",[]];

_mode = [_list,_class,0] call fnc_getArrayPos;

{
	_list set [_x,"VOID"];
	_list = _list - ["VOID"];
} count _mode;

cutText [format ["\n\n%1 has been removed form your sell list!",_name],"PLAIN DOWN"];

player setVariable ["twpitems",_list,true];

call twp_loadItems;[(lbCurSel 9000)] call twp_loadGear;
[TWPTarget,"","twpupdate"] call vg_RE;