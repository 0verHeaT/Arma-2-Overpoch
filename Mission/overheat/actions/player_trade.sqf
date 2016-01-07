/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: player_trade.sqf
	Description: Advanced Trading System (SC)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_trader","_trader_data","_dialog","_gindex","_cindex"];
if (DZE_ActionInProgress) exitWith {cutText [(localize "str_epoch_player_97"), "PLAIN DOWN"];};

_trader = _this select 3;
_trader_data = _trader getVariable ["TraderData",-1];

if ((typeName _trader_data != "ARRAY") || count _trader_data < 1) exitWith {cutText ["No Categories available for this trader. Please report this to an admin!","PLAIN DOWN"];};

createdialog "SCTraderDialog";

SCTradeAble = false;
SCPlayerGearList = [];
SCTraderCat = ["nil"];
SCTraderItemList = [];

ctrlSetText[32008,"1"];ctrlSetText[32009,"1"];
lbClear 32000;lbClear 32001;lbClear 32002;lbClear 32003;

_gindex = lbAdd [32000,"Current Category"];
_gindex = lbAdd [32000,"<Vehicles>"];
_gindex = lbAdd [32000,"<Backpacks>"];
_gindex = lbAdd [32000,"<All>"];

_cindex = lbAdd [32002,"<Categories>"];

{
	_cindex = lbAdd [32002,(_x select 0)];
	SCTraderCat set [count SCTraderCat,(_x select 1)];
} count _trader_data;

lbSetCurSel [32000,0];lbSetCurSel [32002,0];

waitUntil { !dialog };
SCTradeAble = false;
SCTraderCat = ["nil"];
SCPlayerGearList = [];
SCTraderItemList = [];
