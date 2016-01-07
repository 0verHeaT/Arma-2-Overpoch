/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: sc_showInfo.sqf
	Description: Advanced Trading System (SC)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
disableSerialization;
private ["_index","_itype","_count","_item","_display","_sellinfo","_buyinfo","_balance","_iteminfo","_class","_type","_name","_pic","_descriptionShort","_check","_wealth","_color","_max","_nameb","_warning","_wpn","_mag","_bp","_gear"];
_index = _this select 0;
_itype = _this select 1;
_count = _this select 2;
if (_index < 0) exitWith {};
if (_count == "" || parseNumber _count < 1 || parseNumber _count > 25) then {_count = "1";};
_count = parseNumber _count;

_display = (uiNamespace getVariable "SCTraderDialog");
_sellinfo = _display displayCtrl 32004;
_buyinfo = _display displayCtrl 32005;
_balance = _display displayCtrl 32006;
_iteminfo = _display displayCtrl 32007;

if (_itype == 0) then 
{
	_item = SCPlayerGearList select _index;
	_class = _item select 0;
	_type = _item select 1;
	_name = getText(configFile >> _type >> _class >> "displayName");
	_nameb = getText(configFile >> _type >> _class >> "displayName");
	_pic = getText(configFile >> _type >> _class >> "picture");
	_descriptionShort = getText(configFile >> _type >> _class >> "descriptionShort");
	
	if (_type == "CfgVehicles") then {_count = 1;};
	
	if(count(toArray _nameb) > 10) then 
	{
		_max = [];
		for [{_i=0},{_i<=10},{_i=_i+1}] do 
		{
			_max set [count _max,(toArray _nameb) select _i];
		};
		_nameb = toString _max + ".";
	};

	_wealth = player getVariable ["cashMoney",0];
	
	_iteminfo ctrlSetStructuredText parseText format["<img size='5' image='%1'/><br/><t size='0.9' font='TahomaB'>%2</t><br/><t size='0.75' color='#999999' font='TahomaB'>%3</t><br/>",_pic,_name,_descriptionShort];
	
	if (count SCTraderItemList > 0) then 
	{
		_check = [SCTraderItemList,0] call fnc_reduceArray;
		if (_class in _check) then 
		{
			_balance ctrlSetStructuredText parseText format["
				<t size='0.8' align='left'>Current Bill</t><br/>
				<t size='0.8' align='left'>Wealth</t><t size='0.8' align='right'>%5 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/><br/>
				<t size='0.8' align='left'>%1x %2</t><t size='0.8' align='right'>+ %3 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/><br/>
				<t size='0.8' align='right'>--------------------</t><br/>
				<t size='0.8' color='#00FF00' align='right'>%6 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/>
	
				",_count,
				_nameb,
				[_count*(_item select 4)] call BIS_fnc_numberText,
				"",
				[_wealth] call BIS_fnc_numberText,
				[_wealth + _count*(_item select 4)] call BIS_fnc_numberText
			];
			_sellinfo ctrlSetStructuredText parseText format ["<br/><t size='0.9' align='right'>Sell for</t><br/><t size='0.9' align='right'>%1 </t><img size='0.9' align='right' image='overheat\GUI\dollars.paa'/>",[(_item select 4)] call BIS_fnc_numberText];
			_buyinfo ctrlSetStructuredText parseText format ["<br/><t size='0.9' align='left'>Buy for</t><br/><t size='0.9' align='left'>%1 </t><img size='0.9' align='left' image='overheat\GUI\dollars.paa'/>",[(_item select 3)] call BIS_fnc_numberText];
		}
		else
		{
			_balance ctrlSetStructuredText parseText "<br/><br/><t size='0.8' color='#999999' align='center'>Not available in this category!</t>";
			_sellinfo ctrlSetStructuredText parseText format ["<br/><t size='0.9' align='right'>Sell for</t><br/><t size='0.9' align='right'>- </t><img size='0.9' align='right' image='overheat\GUI\dollars.paa'/>",[(_item select 4)] call BIS_fnc_numberText];
			_buyinfo ctrlSetStructuredText parseText format ["<br/><t size='0.9' align='left'>Buy for</t><br/><t size='0.9' align='left'>- </t><img size='0.9' align='left' image='overheat\GUI\dollars.paa'/>",[(_item select 3)] call BIS_fnc_numberText];
		};
	};
}
else
{
	_item = SCTraderItemList select _index;
	_class = _item select 0;
	_type = _item select 1;
	_name = getText(configFile >> _type >> _class >> "displayName");
	_nameb = getText(configFile >> _type >> _class >> "displayName");
	_pic = getText(configFile >> _type >> _class >> "picture");
	_descriptionShort = getText(configFile >> _type >> _class >> "descriptionShort");
	
	if (_type == "CfgVehicles") then {_count = 1;};
	
	if(count(toArray _nameb) > 10) then 
	{
		_max = [];
		for [{_i=0},{_i<=10},{_i=_i+1}] do 
		{
			_max set [count _max,(toArray _nameb) select _i];
		};
		_nameb = toString _max + ".";
	};
	
	_wealth = player getVariable ["cashMoney",0];
	
	if ((_wealth - (_count*(_item select 3))) > 0) then{_color = '#00FF00';}else{_color = '#FF0000';};
	
	_sellinfo ctrlSetStructuredText parseText format ["<br/><t size='0.9' align='right'>Sell for</t><br/><t size='0.9' align='right'>%1 </t><img size='0.9' align='right' image='overheat\GUI\dollars.paa'/>",[(_item select 4)] call BIS_fnc_numberText];
	_buyinfo ctrlSetStructuredText parseText format ["<br/><t size='0.9' align='left'>Buy for</t><br/><t size='0.9' align='left'>%1 </t><img size='0.9' align='left' image='overheat\GUI\dollars.paa'/>",[(_item select 3)] call BIS_fnc_numberText];
	
	if (_type == "CfgVehicles") then 
	{
		_warning = "NOTE: Vehicles will not have any ammunition by default!"; 
		_wpn = getNumber(configFile >> "CfgVehicles" >> _class >> "transportMaxWeapons");
		_mag = getNumber(configFile >> "CfgVehicles" >> _class >> "transportMaxMagazines");
		_bp = getNumber(configFile >> "CfgVehicles" >> _class >> "transportMaxbackpacks");
		_gear = format ["Gear [%1|%2|%3]",_wpn,_mag,_bp];
		_iteminfo ctrlSetStructuredText parseText format["<img size='5' image='%1'/><br/><t size='0.9' font='TahomaB'>%2</t><br/><t size='0.75' color='#999999' font='TahomaB'>%3</t><br/><t size='0.75' color='#999999' font='TahomaB'>%4</t><br/><t size='0.6' color='#FF0000'>%5</t>",_pic,_name,_descriptionShort,_gear,_warning];
	}
	else
	{
		_iteminfo ctrlSetStructuredText parseText format["<img size='5' image='%1'/><br/><t size='0.9' font='TahomaB'>%2</t><br/><t size='0.75' color='#999999' font='TahomaB'>%3</t><br/>",_pic,_name,_descriptionShort];
	};
	
	_balance ctrlSetStructuredText parseText format["
		<t size='0.8' align='left'>Current Bill</t><br/>
		<t size='0.8' align='left'>Wealth</t><t size='0.8' align='right'>%5 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/><br/>
		<t size='0.8' align='left'>%1x %2</t><t size='0.8' align='right'>- %3 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/><br/>
		<t size='0.8' align='right'>--------------------</t><br/>
		<t size='0.8' color='%4' align='right'>%6 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/>
	
		",_count,
		_nameb,
		[_count*(_item select 3)] call BIS_fnc_numberText,
		_color,
		[_wealth] call BIS_fnc_numberText,
		[_wealth - _count*(_item select 3)] call BIS_fnc_numberText
	];
};