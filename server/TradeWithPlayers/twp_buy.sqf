/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: twp_buy.sqf
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_index","_data","_item","_type","_maxqty","_price","_addtoBp","_removetarget","_iname","_trgtback","_trgtgear","_plyrback","_plyrgear","_twealth","_pwealth","_ccheck","_proceed","_bp","_wp","_wepType","_slots","_avail","_req","_wpT","_bpT","_r","_msg","_mg","_mgT","_mgtype"];
_index = _this select 0;

if (_index < 0 || _index > (count TWPTargetList)) exitWith {cutText["\n\nPlease select an item!","PLAIN DOWN"];};

_data = TWPTargetList select _index;

if (isNil "VGTWPActive") then {VGTWPActive = false;};
if (VGTWPActive) exitWith {cutText["\n\nTrading already in progress!","PLAIN DOWN"];};

_item = _data select 0;
_type = _data select 1;
_maxqty = _data select 2;
_price = _data select 3;

_addtoBp = false;
_removetarget = -1;

_iname = getText(configFile >> _type >> _item >> "displayName");

_trgtback = (unitBackpack TWPTarget) call fnc_getBackpackitems;
_trgtgear = (weapons TWPTarget) + (magazines TWPTarget) + _trgtback;

_plyrback = (unitBackpack player) call fnc_getBackpackitems;
_plyrgear = (weapons player) + (magazines player) + _plyrback;

_twealth = TWPTarget getVariable ["CashMoney",0];
_pwealth = player getVariable ["CashMoney",0];

_ccheck = -1;
_proceed = false;

if (!(_item in _trgtgear) || (isNull TWPTarget) || !(isPlayer TWPTarget) || (getPlayerUID TWPTarget == "") || !(alive TWPTarget)) exitWith {cutText["\n\nSomething went wrong! Could not count weapons/magazines of target!","PLAIN DOWN"];};

if ((_twealth + _price) > 999999) exitWith {cutText[format["\n\n%1 is carrying to much Gold Coins!",name TWPTarget],"PLAIN DOWN"];};

VGTWPActive = true;

// check player cash
if (_pwealth >= _price) then
{
	if (_type == "CfgWeapons") then 
	{
		//First check player slots
		_bp = 0;
		_wp = 0;
		_wepType = getNumber(configFile >> "CfgWeapons" >> _item >> "Type");
	
		_slots = [player] call BIS_fnc_invSlotsEmpty;
		
		switch (_wepType) do 
		{
			case 1: {_avail = (_slots select 0); _req = 1;}; 						//primary weapon
			case 2: {_avail = (_slots select 1); _req = 1;};							//secondary
			case 4: {_avail = (_slots select 2); _req = 1;};							//RPGs
			case 5: {_avail = (_slots select 0); _req = 1;};							//Bp remove (overwatch)
			case 4096: {_avail = (_slots select 5); _req = 1;};					//binoculars
			case 131072: {_avail = (_slots select 7); _req = 1;};					//toolbelt
		};
		
		if (_avail < _req || (_item in weapons player)) then //Player cant have the same tool twice
		{
			_bp = _bp + 1;
		}
		else
		{
			_wp = _wp + 1;
		};
		
		if (_bp > 0) then{_addtoBp = [(unitBackpack player),_item,_bp] call fnc_checkBackpack;}
		else {_addtoBp = true;};
	
		if (_addtoBp) then 
		{
			//Target gear
			_wpT = count ([(weapons TWPTarget),_item,-1] call fnc_getArrayPos);
			_bpT = count ([_trgtback,_item,-1] call fnc_getArrayPos);
		
			_bpT = 1 - _wpT;
		
			if (_wpT > 0) then {_removetarget = 0;}; 
			if (_bpT > 0) then {_removetarget = 1;}; 
		
			if (_removetarget >= 0) then
			{
				//remove money player + add money to target
				
				player setVariable ["cashMoney",_pwealth - _price,true];
				TWPTarget setVariable ["cashMoney",_twealth + _price,true];
				
				//remove target item
				if (_removetarget == 0) then 
				{
					//TWPTarget removeWeapon _item;
					[TWPTarget,str([_item,1]),"twpdelete"] call vg_RE;
				}
				else
				{
					_r = [(unitBackpack TWPTarget),_item,"CfgWeapons",1] call fnc_removeBackItem;
				};
				
				PVDZE_plr_Save = [TWPTarget,(magazines TWPTarget),true,true];
				publicVariableServer "PVDZE_plr_Save";
			
				// add item to player
				if (_wp > 0) then 
				{
					player addWeapon _item;
					_msg = format["\n\nTraded a %1 for %2 Gold Coins from %3.",_iname,[_price] call BIS_fnc_numberText,name TWPTarget];
				};
				if (_bp > 0) then 
				{
					(unitBackpack player) addWeaponCargoGlobal [_item,1];
					_msg = format["\n\nTraded a %1 for %2 Gold Coins from %3. Added 1 to Backpack.",_iname,[_price] call BIS_fnc_numberText,name TWPTarget];
				};
				
				PVDZE_plr_Save = [player,(magazines player),true,true];
				publicVariableServer "PVDZE_plr_Save";
			
				cutText [_msg,"PLAIN DOWN"];
				
				PVDZE_deb = ["twp",toArray(format["%1 (%2) bought a %3 for %4 Gold Coins from %5 (%6)",name player,getPlayerUID player,_iname,_price,name TWPTarget,getPlayerUID TWPTarget])];
				publicVariableServer "PVDZE_deb";
				
				if (_removetarget == 0) then {[TWPTarget,format["\n\n%1 traded a %2 for %3 Gold Coins from your gear.",name player,_iname,[_price] call BIS_fnc_numberText],"rCut"] call vg_RE;}
				else {[TWPTarget,format["\n\n%1 traded a %2 for %3 Gold Coins from your gear. Removed 1 from Backpack.",name player,_iname,[_price] call BIS_fnc_numberText],"rCut"] call vg_RE;};
				
				// restock player data
				if ((_maxqty - 1) <= 0) then
				{
					TWPTargetList set [_index,"VOID"];
					TWPTargetList = TWPTargetList - ["VOID"];
				}
				else
				{
					_data set [2,_maxqty - 1];
					TWPTargetList set [_index,_data];
				};
				
				TWPTarget setVariable ["twpitems",TWPTargetList,true];
				
				[(lbCurSel 9000)] call twp_loadGear;[(lbCurSel 9001)] call twp_loadTargetItems;call twp_loadItems;
				[TWPTarget,"","twpupdate"] call vg_RE;
			}
			else
			{
				cutText [format ["\n\n%1 does not have a %2 in his gear!",name TWPTarget,_iname],"PLAIN DOWN"];
			};
		}
		else
		{
			cutText ["\n\nYou do not have enough space in your gear!","PLAIN DOWN"];
		};
	}
	else
	{
		//First check player slots
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
		
		if (_avail < _req) then 
		{
			_bp = _bp + 1;
		}
		else
		{
			_mg = _mg + 1;
			_avail = _avail - _req;
		};
		
		if (_bp > 0) then{_addtoBp = [(unitBackpack player),_item,_bp] call fnc_checkBackpack;}
		else {_addtoBp = true;};
	
		if (_addtoBp) then 
		{
			//Target gear
			_mgT = count ([(magazines TWPTarget),_item,-1] call fnc_getArrayPos);
			_bpT = count ([_trgtback,_item,-1] call fnc_getArrayPos);
		
			_bpT = 1 - _mgT;
		
			if (_mgT > 0) then {_removetarget = 0;}; 
			if (_bpT > 0) then {_removetarget = 1;}; 
		
			if (_removetarget >= 0) then
			{
				//remove money player + add money to target
				
				player setVariable ["cashMoney",_pwealth - _price,true];
				TWPTarget setVariable ["cashMoney",_twealth + _price,true];
				
				//remove target item
				if (_removetarget == 0) then 
				{
					//TWPTarget removeWeapon _item;
					[TWPTarget,str([_item,0]),"twpdelete"] call vg_RE;
				}
				else
				{
					_r = [(unitBackpack TWPTarget),_item,"CfgMagazines",1] call fnc_removeBackItem;
				};
				
				PVDZE_plr_Save = [TWPTarget,(magazines TWPTarget),true,true];
				publicVariableServer "PVDZE_plr_Save";
			
				// add item to player
				if (_mg > 0) then 
				{
					player addMagazine _item;
					_msg = format["\n\nTraded a %1 for %2 Gold Coins from %3.",_iname,[_price] call BIS_fnc_numberText,name TWPTarget];
				};
				if (_bp > 0) then 
				{
					(unitBackpack player) addMagazineCargoGlobal [_item,1];
					_msg = format["\n\nTraded a %1 for %2 Gold Coins from %3. Added 1 to Backpack.",_iname,[_price] call BIS_fnc_numberText,name TWPTarget];
				};
				
				PVDZE_plr_Save = [player,(magazines player),true,true];
				publicVariableServer "PVDZE_plr_Save";
			
				cutText [_msg,"PLAIN DOWN"];
				
				PVDZE_deb = ["twp",toArray(format["%1 (%2) bought a %3 for %4 Gold Coins from %5 (%6)",name player,getPlayerUID player,_iname,_price,name TWPTarget,getPlayerUID TWPTarget])];
				publicVariableServer "PVDZE_deb";
				
				if (_removetarget == 0) then {[TWPTarget,format["\n\n%1 traded a %2 for %3 Gold Coins from your gear.",name player,_iname,[_price] call BIS_fnc_numberText],"rCut"] call vg_RE;}
				else {[TWPTarget,format["\n\n%1 traded a %2 for %3 Gold Coins from your gear. Removed 1 from Backpack.",name player,_iname,[_price] call BIS_fnc_numberText],"rCut"] call vg_RE;};
				
				// restock player data
				if ((_maxqty - 1) <= 0) then
				{
					TWPTargetList set [_index,"VOID"];
					TWPTargetList = TWPTargetList - ["VOID"];
				}
				else
				{
					_data set [2,_maxqty - 1];
					TWPTargetList set [_index,_data];
				};
				
				TWPTarget setVariable ["twpitems",TWPTargetList,true];
				
				[(lbCurSel 9000)] call twp_loadGear;[(lbCurSel 9001)] call twp_loadTargetItems;call twp_loadItems;
				[TWPTarget,"","twpupdate"] call vg_RE;
			} 
			else
			{
				cutText [format ["\n\n%1 does not have a %2 in his gear!",name TWPTarget,_iname],"PLAIN DOWN"];
			};
		}
		else
		{
			cutText ["\n\nYou do not have enough space in your gear!","PLAIN DOWN"];
		};
	};
}
else
{
	cutText[format["\n\nYou need another %1 Gold Coins!",[(_price - _pwealth)] call BIS_fnc_numberText],"PLAIN DOWN"];
};

VGTWPActive = false;