/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: sc_loadItems.sqf
	Description: Advanced Trading System (SC)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_index","_lbid","_trader_id","_data","_cfgTraderCategory","_class","_type","_buy","_sell","_vtype","_j","_name","_pic"];
_index = _this select 0;
_lbid = _this select 1;
if (isNil "_index" || isNil "_lbid") exitWith {};
if (_index < 1) exitWith {};

SCTraderItemList = [];
lbClear _lbid;

_trader_id = SCTraderCat select _index;

_cfgTraderCategory = missionConfigFile >> "CfgTraderCategory" >> (format["Category_%1",_trader_id]);

for "_i" from 0 to ((count _cfgTraderCategory) - 1) do
{
	_class = configName(_cfgTraderCategory select _i);
	_type = getText((_cfgTraderCategory select _i) >> "type");	
	_buy = getNumber((_cfgTraderCategory select _i) >> "buy");	
	_sell = getNumber((_cfgTraderCategory select _i) >> "sell");
	
	if (_type == "CfgVehicles") then 
	{
		_vtype = getNumber((_cfgTraderCategory select _i) >> "vtype");
		if (isNil "_vtype") then {_vtype = 0;};
	}
	else
	{
		_vtype = -1;
	};
	
	_name = getText(configFile >> _type >> _class >> "displayName");
	_pic = getText(configFile >> _type >> _class >> "picture");
	
	if (!isNil "_name" && !isNil "_pic") then 
	{
		if (_name != "" && _pic != "") then
		{
			_j = lbAdd [_lbid,format["%1",_name]];
			lbSetPicture [_lbid,_j,_pic];
	
			_data = [_class,_type,_vtype,_buy,_sell];
			SCTraderItemList set [count SCTraderItemList,_data];
		};
	};
};

lbSetCurSel [32000,0]; [0,32001] call sc_loadGear;