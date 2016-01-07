/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: sc_tradeCfgWeapons.sqf
	Description: Advanced Trading System (SC)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_item","_qty","_scprice","_vtype","_BOS","_plyrgear","_backgear","_name","_wealth","_ingear","_wp","_bp","_i","_new","_wepType","_slots","_avail","_req","_bps","_addtoBp"];
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
_name = getText(configFile >> "CfgWeapons" >> _item >> "displayName");
_wealth = player getVariable ["cashMoney",0];

if (_BOS == 0) then 
{
	_ingear = [_plyrgear,_item,-1] call fnc_getArrayPos;
	if (count _ingear >= _qty) then 
	{
		_wp = (count ([(weapons player),_item,-1] call fnc_getArrayPos)) min _qty;
		_bp = (count ([_backgear,_item,-1] call fnc_getArrayPos)) min _qty;
		
		if ((_wp + _bp) < _qty) exitWith 
		{
			cutText ["\n\nCould not count player weapons. Please try again.","PLAIN DOWN"];
			VGTradeInProgress = nil;
		};
		
		_bp = _qty - _wp;
		
		if (_wp > 0) then {player removeWeapon _item;};
		if (_bp > 0) then {_removed = [(unitBackpack player),_item,"CfgWeapons",_bp] call fnc_removeBackItem;};
		
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
		_wp = 0;
		_wepType = getNumber(configFile >> "CfgWeapons" >> _item >> "Type");
		
		_slots = [player] call BIS_fnc_invSlotsEmpty;
		
		switch (_wepType) do 
		{
			case 1: {_avail = (_slots select 0); _req = 1;}; 						//primary weapon
			case 2: {_avail = (_slots select 1); _req = 1;};							//secondary
			case 4: {_avail = (_slots select 2); _req = 1;_qty = 1;};			//RPGs
			case 5: {_avail = (_slots select 0); _req = 1;_qty = 1;};			//Bp remove (overwatch)
			case 4096: {_avail = (_slots select 5); _req = 1;};					//binoculars
			case 131072: {_avail = (_slots select 7); _req = 1;};					//toolbelt
		};
			
		for [{_i=1},{_i<=_qty},{_i=_i+1}] do
		{
			if (_wp >= 1) then {_avail = 0;};
			if (_avail < _req || (_item in weapons player)) then //Player cant have the same tool twice
			{
				_bp = _bp + 1;
			}
			else
			{
				_wp = _wp + 1;
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
			if (_wp > 0) then 
			{
				player addWeapon _item;
			};
			if (_bp > 0) then 
			{
				(unitBackpack player) addWeaponCargoGlobal [_item,_bp];
			};
			_new = _scprice * (_wp + _bp);
			player setVariable ["cashMoney",_wealth - _new,true];
			
			if (_bp > 0) then{cutText [format["\n\nTraded %1 Gold Coins for %2 %3. Added %4 to backpack.",[_new] call BIS_fnc_numberText,(_wp + _bp),_name,_bp],"PLAIN DOWN"];}
			else{cutText [format["\n\nTraded %1 Gold Coins for %2 %3.",[_new] call BIS_fnc_numberText,(_wp + _bp),_name],"PLAIN DOWN"];};
		
			PVDZE_plr_Save = [player,(magazines player),true,true];
			publicVariableServer "PVDZE_plr_Save";
			PVDZE_deb = ["trade",toArray(format["%1 (%2) bought %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,(_wp + _bp),_name,_new,inTraderCity])];
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
