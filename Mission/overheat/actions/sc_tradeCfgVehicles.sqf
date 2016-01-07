/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: sc_tradeCfgVehicles.sqf
	Description: Advanced Trading System (SC)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_item","_qty","_scprice","_vtype","_BOS","_name","_wealth","_haskey","_cid","_id","_uid","_keyid","_keySelected","_haskey","_keyname","_near","_object","_new","_keyColor","_keyNumber","_isKeyOK","_keyname","_isOk","_helipad","_location"];
_item = _this select 0;
//_qty = _this select 1;
_scprice = _this select 2;
_vtype = _this select 3;
_BOS = _this select 4;

if (_scprice >= 1000000) exitWith {cutText ["\n\nYou cannot trade items for more than 1,000,000 Gold Coins!","PLAIN DOWN"]};
if !(isNil "VGTradeInProgress") exitWith {cutText ["\n\nTrading already in progress!","PLAIN DOWN"]};

VGTradeInProgress = 1;

if (isNil "inTraderCity") then {inTraderCity = "Unknown Trader";} 
else {if (inTraderCity == "Any") then {inTraderCity = "Unknown Trader";};};

_name = getText(configFile >> "CfgVehicles" >> _item >> "displayName");
_wealth = player getVariable ["cashMoney",0];

switch (_vtype) do 
{
	case 0: // LandVehicle && Air
	{
		if (_BOS == 0) then 
		{
			_haskey = false;
			
			_near = nearestObjects [player,[_item],40];
			if ((count _near) < 1) exitWith {cutText ["\n\nNo vehicle found!","PLAIN DOWN"];VGTradeInProgress = nil;};
			_object = _near select 0;
			
			_cid = _object getVariable["CharacterID","0"];
			_id = _object getVariable ["ObjectID","0"];
			_uid = _object getVariable ["ObjectID","0"];
			
			if (_id != "0" || _uid != "0") then 
			{
				_keyid = parsenumber _cid;
				if (_keyid == 0) then {_keySelected = ""};
				if ((_keyid > 0) && (_keyid <= 2500)) then {_keySelected = format["ItemKeyGreen%1",_keyid];};
				if ((_keyid > 2500) && (_keyid <= 5000)) then {_keySelected = format["ItemKeyRed%1",_keyid-2500];};
				if ((_keyid > 5000) && (_keyid <= 7500)) then {_keySelected = format["ItemKeyBlue%1",_keyid-5000];};
				if ((_keyid > 7500) && (_keyid <= 10000)) then {_keySelected = format["ItemKeyYellow%1",_keyid-7500];};
				if ((_keyid > 10000) && (_keyid <= 12500)) then {_keySelected = format["ItemKeyBlack%1",_keyid-10000];};
				_keyname = getText(configFile >> "CfgWeapons" >> _keySelected >> "displayName");
				
				if (local _object && !isNull _object && alive _object) then 
				{
					if(damage _object < 1) then 
					{
						if (_cid != "0") then	
						{
							if (_keySelected in (weapons player)) then {player removeWeapon _keySelected;_haskey = true;};
						};
					
						if (_haskey || _cid == "0") then 
						{
							PVDZE_obj_Delete = [_id,_uid,player];
							publicVariableServer "PVDZE_obj_Delete";
							deleteVehicle _object;
					
							_new = _scprice;
							player setVariable ["cashMoney",_wealth + _new,true];
					
							if (_cid == "0") then	{cutText [format["\n\nSold a %1 for %2 Gold Coins.",_name,[_new] call BIS_fnc_numberText],"PLAIN DOWN"];}
							else {cutText [format["\n\nSold a %1 for %2 Gold Coins. %3 has been removed from your toolbelt.",_name,[_new] call BIS_fnc_numberText,_keyname],"PLAIN DOWN"];};
					
							PVDZE_plr_Save = [player,(magazines player),true,true];
							publicVariableServer "PVDZE_plr_Save";
							PVDZE_deb = ["trade",toArray(format["%1 (%2) sold %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,1,_name,_new,inTraderCity])];
							publicVariableServer "PVDZE_deb";
					
							[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32008,'1'];//[(lbCurSel 32001),0,(ctrlText 32008)] call sc_showInfo;
						}
						else
						{
							cutText [format["\n\nYou have to have the Key (%1) in your inventory to sell lockable vehicles!",_keyname],"PLAIN DOWN"];
						};
					}
					else
					{
						cutText ["\n\nYou cannot sell destroyed vehicles!","PLAIN DOWN"];
					};
				}
				else
				{
					cutText ["\n\nPlace the vehicle as near as possible and/or get into drivers seat to sell it!","PLAIN DOWN"];
				};
			}
			else
			{
				cutText ["\n\nYou cannot sell this vehicle as it is not verified by the server!","PLAIN DOWN"];
			};
		}
		else
		{
			if (_wealth >= _scprice) then
			{
				_keyColor = ["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
				_keyNumber = (floor(random 2500)) + 1;
				_keySelected = format[("ItemKey%1%2"),_keyColor,_keyNumber];
				_isKeyOK = isClass(configFile >> "CfgWeapons" >> _keySelected);
				_keyname = getText(configFile >> "CfgWeapons" >> _keySelected >> "displayName");
				_isOk = [player,_keySelected] call BIS_fnc_invAdd;
				
				waitUntil {!isNil "_isOk"};
			
				if (_isOk && _isKeyOK) then 
				{
					_helipad = nearestObjects [player,["HeliHCivil","HeliHempty","SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"],100];
					if(count _helipad > 0) then {	_location = (getPosATL (_helipad select 0));} 
					else {_location = [(position player),0,20,1,0,2000,0] call BIS_fnc_findSafePos;};
					
					_object = createVehicle ["Sign_arrow_down_large_EP1",_location,[],0,"CAN_COLLIDE"];
					_location = getPosATL _object;
					
					PVDZE_veh_Publish2 = [_object,[random 360,_location],_item,false,_keySelected,player];
					publicVariableServer  "PVDZE_veh_Publish2";
					
					_new = _scprice;
					player setVariable ["cashMoney",_wealth - _new,true];
					
					cutText [format["\n\nBought a %1 for %2 Gold Coins. %3 has been added to your toolbelt.",_name,[_new] call BIS_fnc_numberText,_keyname],"PLAIN DOWN"];
					
					PVDZE_plr_Save = [player,(magazines player),true,true];
					publicVariableServer "PVDZE_plr_Save";
					PVDZE_deb = ["trade",toArray(format["%1 (%2) bought %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,1,_name,_new,inTraderCity])];
					publicVariableServer "PVDZE_deb";
					
					[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32009,'1'];[(lbCurSel 32003),1,(ctrlText 32009)] call sc_showInfo;
				}
				else
				{
					cutText ["\n\nYou do not have enough room on your toolbelt!", "PLAIN DOWN"];
				};
			} 
			else
			{
				cutText [format["\n\nYou need another %1 Gold Coins!",[_scprice - _wealth] call BIS_fnc_numberText],"PLAIN DOWN"];
			};
		};
	}; 
	case 1: // Bike
	{
		if (_BOS == 0) then 
		{
			_near = nearestObjects [player,[_item],40];
			if ((count _near) < 1) exitWith {cutText ["\n\nNo vehicle found!","PLAIN DOWN"];VGTradeInProgress = nil;};
			_object = _near select 0;
			
			_cid = _object getVariable["CharacterID","0"];
			_id = _object getVariable ["ObjectID","0"];
			_uid = _object getVariable ["ObjectID","0"];
			
			if (_id != "0" || _uid != "0") then 
			{
				if (local _object && !isNull _object && alive _object) then 
				{
					if(damage _object < 1) then 
					{
						PVDZE_obj_Delete = [_id,_uid,player];
						publicVariableServer "PVDZE_obj_Delete";
						deleteVehicle _object;
					
						_new = _scprice;
						player setVariable ["cashMoney",_wealth + _new,true];
					
						cutText [format["\n\nSold a %1 for %2 Gold Coins.",_name,[_new] call BIS_fnc_numberText],"PLAIN DOWN"];
						
						PVDZE_plr_Save = [player,(magazines player),true,true];
						publicVariableServer "PVDZE_plr_Save";
						PVDZE_deb = ["trade",toArray(format["%1 (%2) sold %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,1,_name,_new,inTraderCity])];
						publicVariableServer "PVDZE_deb";
					
						[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32008,'1'];//[(lbCurSel 32001),0,(ctrlText 32008)] call sc_showInfo;
					}
					else
					{
						cutText ["\n\nYou cannot sell destroyed vehicles!","PLAIN DOWN"];
					};
				}
				else
				{
					cutText ["\n\nPlace the vehicle as near as possible and/or get into drivers seat to sell it!","PLAIN DOWN"];
				};
			}
			else
			{
				cutText ["\n\nYou cannot sell this vehicle as it is not verified by the server!","PLAIN DOWN"];
			};
		}
		else
		{
			if (_wealth >= _scprice) then
			{
				_keySelected = str(floor(random 2500));
				_helipad = nearestObjects [player,["HeliHCivil","HeliHempty","SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue"],100];
					
				if(count _helipad > 0) then {	_location = (getPosATL (_helipad select 0));} 
				else {_location = [(position player),0,20,1,0,2000,0] call BIS_fnc_findSafePos;};
					
				_object = createVehicle ["Sign_arrow_down_large_EP1",_location,[],0,"CAN_COLLIDE"];
				_location = getPosATL _object;
					
				PVDZE_veh_Publish2 = [_object,[random 360,_location],_item,true,_keySelected,player];
				publicVariableServer  "PVDZE_veh_Publish2";
				
				_new = _scprice;
				player setVariable ["cashMoney",_wealth - _new,true];
					
				cutText [format["\n\nBought a %1 for %2 Gold Coins.",_name,[_new] call BIS_fnc_numberText],"PLAIN DOWN"];
					
				PVDZE_plr_Save = [player,(magazines player),true,true];
				publicVariableServer "PVDZE_plr_Save";
				PVDZE_deb = ["trade",toArray(format["%1 (%2) bought %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,1,_name,_new,inTraderCity])];
				publicVariableServer "PVDZE_deb";
				
				[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32009,'1'];[(lbCurSel 32003),1,(ctrlText 32009)] call sc_showInfo;
			} 
			else
			{
				cutText [format["\n\nYou need another %1 Gold Coins!",[_scprice - _wealth] call BIS_fnc_numberText],"PLAIN DOWN"];
			};
		};
	};  
	case 2: // Ship
	{
		if (_BOS == 0) then 
		{
			_haskey = false;
			_near = nearestObjects [player,[_item],40];
			if ((count _near) < 1) exitWith {cutText ["\n\nNo vehicle found!","PLAIN DOWN"];VGTradeInProgress = nil;};
			_object = _near select 0;
			
			_cid = _object getVariable["CharacterID","0"];
			_id = _object getVariable ["ObjectID","0"];
			_uid = _object getVariable ["ObjectID","0"];
			
			if (_id != "0" || _uid != "0") then 
			{
				_keyid = parsenumber _cid;
				if (_keyid == 0) then {_keySelected = ""};
				if ((_keyid > 0) && (_keyid <= 2500)) then {_keySelected = format["ItemKeyGreen%1",_keyid];};
				if ((_keyid > 2500) && (_keyid <= 5000)) then {_keySelected = format["ItemKeyRed%1",_keyid-2500];};
				if ((_keyid > 5000) && (_keyid <= 7500)) then {_keySelected = format["ItemKeyBlue%1",_keyid-5000];};
				if ((_keyid > 7500) && (_keyid <= 10000)) then {_keySelected = format["ItemKeyYellow%1",_keyid-7500];};
				if ((_keyid > 10000) && (_keyid <= 12500)) then {_keySelected = format["ItemKeyBlack%1",_keyid-10000];};
				_keyname = getText(configFile >> "CfgWeapons" >> _keySelected >> "displayName");
				
				if (local _object && !isNull _object && alive _object) then 
				{
					if(damage _object < 1) then 
					{
						if (_cid != "0") then	
						{
							if (_keySelected in (weapons player)) then {player removeWeapon _keySelected;_haskey = true;};
						};
					
						if (_haskey || _cid == "0") then 
						{
							PVDZE_obj_Delete = [_id,_uid,player];
							publicVariableServer "PVDZE_obj_Delete";
							deleteVehicle _object;
					
							_new = _scprice;
							player setVariable ["cashMoney",_wealth + _new,true];
					
							if (_cid == "0") then	{cutText [format["\n\nSold a %1 for %2 Gold Coins.",_name,[_new] call BIS_fnc_numberText],"PLAIN DOWN"];}
							else {cutText [format["\n\nSold a %1 for %2 Gold Coins. %3 has been removed from your toolbelt.",_name,[_new] call BIS_fnc_numberText,_keyname],"PLAIN DOWN"];};
					
							PVDZE_plr_Save = [player,(magazines player),true,true];
							publicVariableServer "PVDZE_plr_Save";
							PVDZE_deb = ["trade",toArray(format["%1 (%2) sold %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,1,_name,_new,inTraderCity])];
							publicVariableServer "PVDZE_deb";
					
							[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32008,'1'];//[(lbCurSel 32001),0,(ctrlText 32008)] call sc_showInfo;
						}
						else
						{
							cutText [format["\n\nYou have to have the Key (%1) in your inventory to sell lockable vehicles!",_keyname],"PLAIN DOWN"];
						};
					}
					else
					{
						cutText ["\n\nYou cannot sell destroyed vehicles!","PLAIN DOWN"];
					};
				}
				else
				{
					cutText ["\n\nPlace the vehicle as near as possible and/or get into drivers seat to sell it!","PLAIN DOWN"];
				};
			}
			else
			{
				cutText ["\n\nYou cannot sell this vehicle as it is not verified by the server!","PLAIN DOWN"];
			};
		}
		else
		{
			if (_wealth >= _scprice) then
			{
				_keyColor = ["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
				_keyNumber = (floor(random 2500)) + 1;
				_keySelected = format[("ItemKey%1%2"),_keyColor,_keyNumber];
				_isKeyOK = isClass(configFile >> "CfgWeapons" >> _keySelected);
				_keyname = getText(configFile >> "CfgWeapons" >> _keySelected >> "displayName");
				_isOk = [player,_keySelected] call BIS_fnc_invAdd;
				
				waitUntil {!isNil "_isOk"};
			
				if (_isOk && _isKeyOK) then 
				{
					_location = [(position player),0,20,1,2,2000,0] call BIS_fnc_findSafePos;
					
					_object = createVehicle ["Sign_arrow_down_large_EP1",_location,[],0,"CAN_COLLIDE"];
					_location = getPosATL _object;
					
					PVDZE_veh_Publish2 = [_object,[random 360,_location],_item,false,_keySelected,player];
					publicVariableServer  "PVDZE_veh_Publish2";
					
					_new = _scprice;
					player setVariable ["cashMoney",_wealth - _new,true];
					
					cutText [format["\n\nBought a %1 for %2 Gold Coins. %3 has been added to your toolbelt.",_name,[_new] call BIS_fnc_numberText,_keyname],"PLAIN DOWN"];
					
					PVDZE_plr_Save = [player,(magazines player),true,true];
					publicVariableServer "PVDZE_plr_Save";
					PVDZE_deb = ["trade",toArray(format["%1 (%2) bought %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,1,_name,_new,inTraderCity])];
					publicVariableServer "PVDZE_deb";
					
					[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32009,'1'];[(lbCurSel 32003),1,(ctrlText 32009)] call sc_showInfo;
				}
				else
				{
					cutText ["\n\nYou do not have enough room on your toolbelt!", "PLAIN DOWN"];
				};
			} 
			else
			{
				cutText [format["\n\nYou need another %1 Gold Coins!",[_scprice - _wealth] call BIS_fnc_numberText],"PLAIN DOWN"];
			};
		};
	}; 
	case 3: // Backpack
	{
		if (_BOS == 0) then 
		{
			if !(isNull (unitBackpack player)) then
			{
				if (typeOf (unitBackpack player) == _item) then
				{
					removeBackpack player;
				
					_new = _scprice;
					player setVariable ["cashMoney",_wealth + _new,true];
				
					cutText [format["\n\nTraded %1 %2 for %3 Gold Coins.",1,_name,[_new] call BIS_fnc_numberText],"PLAIN DOWN"];
				
					PVDZE_plr_Save = [player,(magazines player),true,true];
					publicVariableServer "PVDZE_plr_Save";
					PVDZE_deb = ["trade",toArray(format["%1 (%2) sold %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,1,_name,_new,inTraderCity])];
					publicVariableServer "PVDZE_deb";
					
					[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32008,'1'];//[(lbCurSel 32001),0,(ctrlText 32008)] call sc_showInfo;
				}
				else
				{
					cutText [format["\n\nYou need a %1 to sell it!",_name],"PLAIN DOWN"];
				};
			}
			else
			{
				cutText [format["\n\nYou need a %1 to sell it!",_name],"PLAIN DOWN"];
			};
		}
		else
		{
			if (_wealth >= _scprice) then
			{
				if (isNull (unitBackpack player)) then
				{
					removeBackpack player;
					player addBackpack _item;
					
					_new = _scprice;
					player setVariable ["cashMoney",_wealth - _new,true];
					
					cutText [format["\n\nTraded %1 Gold Coins for %2 %3.",[_new] call BIS_fnc_numberText,1,_name],"PLAIN DOWN"];
					
					PVDZE_plr_Save = [player,(magazines player),true,true];
					publicVariableServer "PVDZE_plr_Save";
					PVDZE_deb = ["trade",toArray(format["%1 (%2) bought %3x %4 for %5 Gold Coins in/at %6",name player,getPlayerUID player,1,_name,_new,inTraderCity])];
					publicVariableServer "PVDZE_deb";
					
					[(lbCurSel 32000),32001] spawn sc_loadGear;	ctrlSetText[32009,'1'];[(lbCurSel 32003),1,(ctrlText 32009)] call sc_showInfo;
				}
				else
				{
					cutText ["\n\nYou need to drop or sell your current Backpack!","PLAIN DOWN"];
				};
			}
			else
			{
				cutText [format["\n\nYou need another %1 Gold Coins!",[_scprice - _wealth] call BIS_fnc_numberText],"PLAIN DOWN"];
			};
		};
	}; 
};
VGTradeInProgress = nil;
