/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: sc_loadGear.sqf
	Description: Advanced Trading System (SC)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_index","_lbid","_gear","_tmparr","_chk"];
_index = _this select 0;
_lbid = _this select 1;
if (isNil "_index" || isNil "_lbid") exitWith {};
if (_index < 0) exitWith {};

lbClear _lbid;
SCPlayerGearList = [];

_gear = (weapons player) + (magazines player) + ((unitBackpack player) call fnc_getBackpackitems);

switch (_index) do
{
	case 0:
	{
		if (count SCTraderItemList < 1) exitWith {};
		_gear = _gear + [typeOf (unitBackpack player)];
		{_gear set [count _gear,typeOf _x];} count (nearestObjects [player,["LandVehicle","Air","Ship"],40]);
		_tmparr = [];
		_chk = [SCTraderItemList,0] call fnc_reduceArray;
		{
			if (_x in _chk) then
			{
				_tmparr set [count _tmparr,_x];
			};
		} count _gear;
		
		for "_i" from 0 to ((count _tmparr) - 1) do
		{
			private ["_item","_c","_name","_pic","_type","_check","_arr","_sel","_buy","_sell","_vtype"];
			_item = _tmparr select _i;
			
			_arr = [SCTraderItemList,_item,0] call fnc_getArrayPos;
			
			_sel = _arr select 0;
			_buy = (SCTraderItemList select _sel) select 3;
			_sell = (SCTraderItemList select _sel) select 4;
			
			if (count SCPlayerGearList > 0) then 
			{
				_check = [];
				{private ["_x"];_check set [count _check,(_x select 0)]} count SCPlayerGearList;
			} 
			else 
			{
				_check = [];
			};
			waitUntil {!isNil "_check"};
			if !(_item in _check) then 
			{
				_c = 0;
				_vtype = -1;
				if (isClass(configFile >> "CfgWeapons" >> _item)) then 
				{
					_name = getText (configFile >> "CfgWeapons" >> _item >> "displayName");
					_pic = getText (configFile >> "CfgWeapons" >> _item >> "picture");
					_type = "CfgWeapons";
				};
				if (isClass(configFile >> "CfgMagazines" >> _item)) then 
				{
					_name = getText (configFile >> "CfgMagazines" >> _item >> "displayName");
					_pic = getText (configFile >> "CfgMagazines" >> _item >> "picture");
					_type = "CfgMagazines";
				};
				if (isClass(configFile >> "CfgVehicles" >> _item)) then 
				{
					_name = getText (configFile >> "CfgVehicles" >> _item >> "displayName");
					_pic = getText (configFile >> "CfgVehicles" >> _item >> "picture");
					_type = "CfgVehicles";
					_vtype = 0;
					if (_item isKindOf "Bag_Base_EP1") then {_vtype = 3;};
					if (_item isKindOf "Ship") then {_vtype = 2;};
					if (_item in ["MMT_Civ","Old_bike_TK_INS_EP1"]) then {_vtype = 1;};
					
				};
				if (!isNil "_name" && !isNil "_pic") then 
				{
					private ["_j"];
					{
						if (_item == _x) then 
						{
							_c = _c + 1;
						};
					} count _tmparr;
					_j = lbAdd [_lbid,format["%2 x %1",_name,_c]];
					lbSetPicture [_lbid,_j,_pic];
					SCPlayerGearList set [count SCPlayerGearList,[_item,_type,_vtype,_buy,_sell]];
				};
			};
		};
		SCTradeAble = true;
	};
	case 1:
	{
		{
			if (isClass(configFile >> "CfgVehicles" >> (typeOf _x))) then 
			{
				private ["_name","_pic","_j"];
				_name = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
				_pic = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "picture");
				_j = lbAdd [_lbid,format["%1 (%2m)",_name,ceil(player distance _x)]];
				lbSetPicture [_lbid,_j,_pic];
				SCPlayerGearList set [count SCPlayerGearList,[(typeOf _x),"CfgVehicles",-1,0,0]];
			};
		} count (nearestObjects [player,["LandVehicle","Air","Ship"],40]);
		SCTradeAble = false;
	};
	case 2:
	{
		if !(isNull (unitBackpack player)) then
		{
			private ["_name","_pic","_j"];
			_name = getText (configFile >> "CfgVehicles" >> (typeOf (unitBackpack player)) >> "displayName");
			_pic = getText (configFile >> "CfgVehicles" >> (typeOf (unitBackpack player)) >> "picture");
			_j = lbAdd [_lbid,format["%1",_name]];
			lbSetPicture [_lbid,_j,_pic];
			SCPlayerGearList set [count SCPlayerGearList,[(typeOf (unitBackpack player)),"CfgVehicles",-1,0,0]];
		};
		SCTradeAble = false;
	};
	case 3:
	{
		for "_i" from 0 to ((count _gear) - 1) do
		{
			private ["_item","_c","_name","_pic","_type","_check","_arr","_sel","_buy","_sell"];
			_item = _gear select _i;
			
			_arr = [SCTraderItemList,_item,0] call fnc_getArrayPos;
			_buy = 0;
			_sell = 0;
			if (count _arr > 0) then 
			{
				_sel = _arr select 0;
				_buy = (SCTraderItemList select _sel) select 3;
				_sell = (SCTraderItemList select _sel) select 4;
			};
			
			if (count SCPlayerGearList > 0) then 
			{
				_check = [];
				{private ["_x"];_check set [count _check,(_x select 0)]} count SCPlayerGearList;
			} else 
			{
				_check = [];
			};
			waitUntil {!isNil "_check"};
			if !(_item in _check) then 
			{
				_c = 0;
				if (isClass(configFile >> "CfgWeapons" >> _item)) then 
				{
					_name = getText (configFile >> "CfgWeapons" >> _item >> "displayName");
					_pic = getText (configFile >> "CfgWeapons" >> _item >> "picture");
					_type = "CfgWeapons";
				} 
				else 
				{
					_name = getText (configFile >> "CfgMagazines" >> _item >> "displayName");
					_pic = getText (configFile >> "CfgMagazines" >> _item >> "picture");
					_type = "CfgMagazines";
				};
				if (!isNil "_name" && !isNil "_pic") then 
				{
					private ["_j"];
					{
						if (_item == _x) then 
						{
							_c = _c + 1;
						};
					} count _gear;
					_j = lbAdd [_lbid,format["%2 x %1",_name,_c]];
					lbSetPicture [_lbid,_j,_pic];
					SCPlayerGearList set [count SCPlayerGearList,[_item,_type,-1,_buy,_sell]];
				};
			};
		};
		SCTradeAble = false;
	};
};