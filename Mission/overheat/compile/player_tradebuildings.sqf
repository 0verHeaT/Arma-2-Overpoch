/*** 
	Custom Structures && Buildings 
	via Trader Menu
	
	Created by 0verHeaT 
***/
private ["_class","_displayname","_price","_buy_o_sell","_isVehicle","_wealth","_currencyname","_inmag"];
BuildingTradeResult = -1;
_class = _this select 0;
_displayname = _this select 1;
_price = _this select 2;
_buy_o_sell = _this select 3;
_isVehicle = _this select 4;
_offset = _this select 5;

if ((_price select 1) == "Coins") then {
	_wealth = player getVariable ["CashMoney",0];
	switch (_buy_o_sell) do {
		case "buy": {
			if (((_wealth - (_price select 0)) < 0)) exitWith {
				cutText [format["\n\nYou need another %1 Gold Coins!",[((_price select 0) - _wealth)] call BIS_fnc_numberText],"PLAIN DOWN"];
				BuildingTradeResult = false;
			};
			[_class,_displayname,3,0,_isVehicle,_offset,_price] spawn player_custombuild;
		};
		case "sell": {
			if ((count(nearestObjects [(getPosATL player),[_class],5]) < 1)) exitWith {
				cutText [format["\n\nDid not found a %1 within 5 meters!",_displayname],"PLAIN DOWN"];
				BuildingTradeResult = false;
			};
			[_class,_displayname] spawn player_customremove;
		};
	};

	waitUntil {sleep 0.2;((typeName BuildingTradeResult) == "BOOL")};

	if (BuildingTradeResult) then {
		if (_buy_o_sell == "buy") then {
			player setVariable ["CashMoney",(_wealth - (_price select 0)),true];
			cutText [format["\n\nSuccessfully bought a %1 for %2 Gold Coins.",_displayname,[(_price select 0)] call BIS_fnc_numberText],"PLAIN DOWN"];
			PVDZE_deb = ["log",toArray(format["%3  (%4)  bought a %1 for  %2  Gold Coins",_displayname,(_price select 0),name player,getPlayerUID player])];
			publicVariableServer "PVDZE_deb";
		} else {
			player setVariable ["CashMoney",(_wealth + (_price select 0)),true];
			cutText [format["\n\nSuccessfully sold a %1 for %2 Gold Coins.",_displayname,[(_price select 0)] call BIS_fnc_numberText],"PLAIN DOWN"];
			PVDZE_deb = ["log",toArray(format["%3  (%4)  sold a %1 for  %2  Gold Coins",_displayname,(_price select 0),name player,getPlayerUID player])];
			publicVariableServer "PVDZE_deb";
		};
		PVDZE_plr_Save = [player,(magazines player),true,true];
		publicVariableServer "PVDZE_plr_Save";
	};
} else {
	_currencyname = getText(configFile >> "CfgMagazines" >> (_price select 1) >> "displayName");
	switch (_buy_o_sell) do {
		case "buy": {	
			_inmag = {_x == (_price select 1)} count magazines player;
			if (_inmag < (_price select 0)) exitWith {
				cutText [format["\n\nYou need another %1 %2!",((_price select 0) - _inmag),_currencyname],"PLAIN DOWN"];
				BuildingTradeResult = false;
			};
			[_class,_displayname,3,0,_isVehicle,_offset,_price] spawn player_custombuild;
		};
		case "sell": {
			if ((count(nearestObjects [(getPosATL player),[_class],5]) < 1)) exitWith {
				cutText [format["\n\nDid not found a %1 within 5 meters!",_displayname],"PLAIN DOWN"];
				BuildingTradeResult = false;
			};
			[_class,_displayname] spawn player_customremove;
		};
	};
	
	waitUntil {sleep 0.2;((typeName BuildingTradeResult) == "BOOL")};

	if (BuildingTradeResult) then {
		if (_buy_o_sell == "buy") then {
			for "_i" from 1 to (_price select 0) do {
				player removeMagazine (_price select 1);
			};
			cutText [format["\n\nSuccessfully bought a %1 for %2 %3.",_displayname,(_price select 0),_currencyname],"PLAIN DOWN"];
			PVDZE_deb = ["log",toArray(format["%3  (%4)  bought a %1 for  %2  %5",_displayname,(_price select 0),name player,getPlayerUID player,_currencyname])];
			publicVariableServer "PVDZE_deb";
		} else {
			for "_i" from 1 to (_price select 0) do {
				player addMagazine (_price select 1);
			};
			cutText [format["\n\nSuccessfully sold a %1 for %2 %3.",_displayname,(_price select 0),_currencyname],"PLAIN DOWN"];
			PVDZE_deb = ["log",toArray(format["%3  (%4)  sold a %1 for  %2  %5",_displayname,(_price select 0),name player,getPlayerUID player,_currencyname])];
			publicVariableServer "PVDZE_deb";
		};
	};	
	PVDZE_plr_Save = [player,(magazines player),true,true];
	publicVariableServer "PVDZE_plr_Save";
};

BuildingTradeResult = -1;