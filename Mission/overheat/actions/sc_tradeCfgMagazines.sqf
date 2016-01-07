/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: sc_tradeCfgMagazines.sqf
	Description: Advanced Trading System (SC)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_item","_qty","_scprice","_vtype","_BOS","_plyrgear","_backgear","_name","_wealth","_ingear","_mgtype","_mg","_bp","_i","_k","_new","_slots","_avail","_req","_bps","_addtoBp"];
_item = _this select 0;
_qty = _this select 1;
_scprice = _this select 2;
//_vtype = _this select 3;
_BOS = _this select 4;

if ((_scprice * _qty) >= 1000000) exitWith {cutText ["\n\nYou cannot trade items for more than 1,000,000 Gold Coins!","PLAIN DOWN"]};
if !(isNil "VGTradeInProgress") exitWith {cutText ["\n\nTrading already in progress!","PLAIN DOWN"]};

VGTradeInProgress = 1;

if (isNil "inTraderCity") then {inTraderCity = "Unknown Trader";} 
else {if (inTraderCity == "Any") then {inTraderCity = "Unknown Trader";};};

_backgear = (unitBackpack player) call fnc_getBackpackitems;
_plyrgear = (weapons player) + (magazines player) + _backgear;
_name = getText(configFile >> "CfgMagazines" >> _item >> "displayName");
_wealth = player getVariable ["cashMoney",0];

if (_BOS == 0) then 
{
	_ingear = [_plyrgear,_item,-1] call fnc_getArrayPos;
	if (count _ingear >= _qty) then
	{
		_mg = (count ([(magazines player),_item,-1] call fnc_getArrayPos)) min _qty; 
		_bp = (count ([_backgear,_item,-1] call fnc_getArrayPos)) min _qty;
		
		if ((_mg + _bp) < _qty) exitWith 
		{
			cutText ["\n\nCould not count player magazines. Please try again.","PLAIN DOWN"];
			VGTradeInProgress = nil;
		};
		
		_bp = _qty - _mg;
		
		if (_mg > 0) then 
		{
			for [{_k=1},{_k<=_mg},{_k=_k+1}] do
			{
				player removeMagazine _item;
			};
		};
		if (_bp > 0) then {_removed = [(unitBackpack player),_item,"CfgMagazines",_bp] call fnc_removeBackItem;};
		
		_new = _scprice * _qty;
		player setVariable ["cashMoney",_wealth + _new,true];
		
		if (_bp > 0) then{cutText [format["\n\nTraded %1 %2 for %3 Gold Coins. Removed %4 from backpack.",_qty,_name,[_new] call BIS_fnc_numberText,_bp],"PLAIN DOWN"];}
		else{cutText [format["\n\nTraded %1 %2 for %3 Gold Coins.",_qty,_name,[_new] call BIS_fnc_numberText],"PLAIN DOWN"];};
		
		PVDZE_plr_Save = [player,(magazines player),true,true];
		publicVariableServer "PVDZE_plr_Save";
		PVDZE_deb = ["trade",toArray(format["%1 (%2) sold %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,_qty,_name,_new,inTraderCity])];
		publicVariableServer "PVDZE_deb";
		
		[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32008,'1'];//[(lbCurSel 32001),0,(ctrlText 32008)] call sc_showInfo;
	}
	else
	{
		cutText [format["\n\nYou need %1 more of %2!",_qty - (count _ingear),_name],"PLAIN DOWN"];
	};
}
else
{
	if (_wealth >= (_qty*_scprice)) then
	{
		_bp = 0;
		_mg = 0;
		_mgtype = getNumber(configFile >> "CfgMagazines" >> _item >> "Type");
		
		_slots = [player] call BIS_fnc_invSlotsEmpty;
		
		switch (_mgtype) do 
		{
			case 16: {_avail = (_slots select 3); _req = 1;}; 		//sec. mags
			case 256: {_avail = (_slots select 4); _req = 1;};		//mags
			case 512: {_avail = (_slots select 4); _req = 2;};
			case 768: {_avail = (_slots select 4); _req = 3;};
			case 1563: {_avail = (_slots select 4); _req = 6;};
		};
		
		for [{_i=1},{_i<=_qty},{_i=_i+1}] do
		{
			if (_avail < _req) then 
			{
				_bp = _bp + 1;
			}
			else
			{
				_mg = _mg + 1;
				_avail = _avail - _req;
			};
		};
		
		if (_bp > 0) then
		{
			_addtoBp = [(unitBackpack player),_item,_bp] call fnc_checkBackpack;
		}
		else
		{
			_addtoBp = true;
		};
		
		if (_addtoBp) then 
		{
			if (_mg > 0) then 
			{
				for [{_k=1},{_k<=_mg},{_k=_k+1}] do
				{
					player addMagazine _item;
				};
			};
			if (_bp > 0) then 
			{
				(unitBackpack player) addMagazineCargoGlobal [_item,_bp];
			};
			_new = _scprice * (_mg + _bp);
			player setVariable ["cashMoney",_wealth - _new,true];
			
			if (_bp > 0) then{cutText [format["\n\nTraded %1 Gold Coins for %2 %3. Added %4 to backpack.",[_new] call BIS_fnc_numberText,(_mg + _bp),_name,_bp],"PLAIN DOWN"];}
			else{cutText [format["\n\nTraded %1 Gold Coins for %2 %3.",[_new] call BIS_fnc_numberText,(_mg + _bp),_name],"PLAIN DOWN"];};
		
			PVDZE_plr_Save = [player,(magazines player),true,true];
			publicVariableServer "PVDZE_plr_Save";
			PVDZE_deb = ["trade",toArray(format["%1 (%2) bought %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,(_mg + _bp),_name,_new,inTraderCity])];
			publicVariableServer "PVDZE_deb";
		
			[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32009,'1'];[(lbCurSel 32003),1,(ctrlText 32009)] call sc_showInfo;
		}
		else
		{
			cutText ["\n\nYou do not have enough space in your gear!","PLAIN DOWN"];
		};
	}
	else
	{
		cutText [format["\n\nYou need another %1 Gold Coins!",[(_qty*_scprice) - _wealth] call BIS_fnc_numberText],"PLAIN DOWN"];
	};
};
VGTradeInProgress = nil;
