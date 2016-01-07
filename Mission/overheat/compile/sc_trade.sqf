/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: sc_trade.sqf
	Description: Advanced Trading System (SC)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_index","_count","_type","_item","_class","_itype","_price","_vtype","_file"];
_index = _this select 0;
_count = _this select 1;
_type = _this select 2;

if (_index < 0) exitWith {cutText["\n\nPlease select an item!","PLAIN DOWN"];};
if (_count == "" || parseNumber _count < 1 || parseNumber _count > 25) then {_count = "1";};
_count = parseNumber _count;

if (_type == 0) then //sell
{
	if (SCTradeAble) then 
	{
		_item = SCPlayerGearList select _index;
		_class = _item select 0;
		_itype = _item select 1;
		_vtype = _item select 2;
		_price = _item select 4;
		_file = "overheat\actions\sc_trade"+_itype+".sqf";
		[_class,_count,_price,_vtype,_type] execVM _file;
	}
	else
	{
		cutText["\n\nYou can not trade items from this category!","PLAIN DOWN"];
	};
}
else //buy
{
	_item = SCTraderItemList select _index;
	_class = _item select 0;
	_itype = _item select 1;
	_vtype = _item select 2;
	_price = _item select 3;
	_file = "overheat\actions\sc_trade"+_itype+".sqf";
	[_class,_count,_price,_vtype,_type] execVM _file;
};