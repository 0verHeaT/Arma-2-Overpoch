/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: twp_add.sqf
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_index","_price","_item","_class","_type","_maxqty","_name","_list","_mode","_toreplace","_qty","_newqty","_price"];
_index = _this select 0;
_price = _this select 1;

if (_index < 0 || (_index >= count TWPPlayerGearList)) exitWith {cutText["\n\nPlease select an item!","PLAIN DOWN"];};

if (count TWPPlayerList > 10) exitWith {cutText["\n\nYou cannot add more than 10 items at once!","PLAIN DOWN"];};

_item = TWPPlayerGearList select _index;
_class = _item select 0;
_type = _item select 1;
_maxqty = _item select 2;

_name = getText(configFile >> _type >> _class >> "displayName");

_list = player getVariable ["twpitems",[]];

_mode = [_list,_class,0] call fnc_getArrayPos;

if (count _mode > 0) then 
{
	_toreplace = _list select (_mode select 0);
	_qty = _toreplace select 2;
	_newqty = _qty + 1;
	
	if (_newqty > _maxqty) exitWith {cutText ["\n\nYou cannot offer more than you have!","PLAIN DOWN"]};
	
	_toreplace set [2,_newqty];
	_list set [(_mode select 0),_toreplace];
	
	cutText [format ["\n\nAppend another %1 to your sell list!",_name],"PLAIN DOWN"];
}
else
{
	if (_price == "" || (parseNumber _price <= 0)) exitWith {cutText ["\n\nPlease enter your quantity!","PLAIN DOWN"]};
	_price = parseNumber _price;

	if (_price > 999999) exitWith {cutText ["\n\nYou cannot set a price over 1,000,000 Gold Coins!","PLAIN DOWN"]};
	
	_list set [count _list,[_class,_type,1,_price]];
	
	cutText [format ["\n\nAdded a %1 for %2 Gold Coins to your sell list!",_name,[_price] call BIS_fnc_numberText],"PLAIN DOWN"];
};
player setVariable ["twpitems",_list,true];

call twp_loadItems;[(lbCurSel 9000)] call twp_loadGear;
[TWPTarget,"","twpupdate"] call vg_RE;