/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: twp_showInfo.sqf
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
disableSerialization;
private ["_index","_array","_type","_display","_balanceCtrl","_infoCtrl","_picCtrl","_item","_pic","_name","_description","_nameb","_max","_wealth","_btxt","_pm","_new","_clr"];
_index = _this select 0;
_array = _this select 1;
_type = _this select 2;

if (_index < 0 || (_index >= count _array)) exitWith {};

_display = (uiNamespace getVariable "TradeWithPlayersDialog");
_balanceCtrl = _display displayCtrl 9006;
_infoCtrl = _display displayCtrl 9007;
_picCtrl = _display displayCtrl 9008;

_item = _array select _index;

_pic = getText(configFile >> (_item select 1) >> (_item select 0) >> "picture");
_name = getText(configFile >> (_item select 1) >> (_item select 0) >> "displayName");
_description = getText(configFile >> (_item select 1) >> (_item select 0) >> "descriptionShort");

_nameb = _name;
if(count(toArray _nameb) > 10) then 
{
	_max = [];
	for "_i" from 0 to 10 do
	{
		_max set [count _max,(toArray _nameb) select _i];
	};
	_nameb = toString _max + ".";
};

_wealth = player getVariable ["cashMoney",0];

_btxt = "";

if (_type >= 0) then
{
	_pm = "";
	_new = 0;
	_clr = "#00FF00";
	if (_type == 0) then 
	{
		_pm = format ["<t size='0.8' align='left'>1x %1</t><t size='0.8' align='right'>+  %2 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/><br/>",_nameb,[(_item select 3)] call BIS_fnc_numberText];
		_new = _wealth + (_item select 3);
	};
	if (_type == 1) then 
	{
		_pm = format ["<t size='0.8' align='left'>1x %1</t><t size='0.8' align='right'>-  %2 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/><br/>",_nameb,[(_item select 3)] call BIS_fnc_numberText];
		_new = _wealth - (_item select 3);
		if (_new < 0) then {_clr = "#FF0000";};
	};

	_btxt =  "<t size='0.8' align='left'>Current Bill</t><br/>";
	_btxt = _btxt + format ["<t size='0.8' align='left'>Wealth</t><t size='0.8' align='right'>%1 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/><br/>",[_wealth] call BIS_fnc_numberText];
	_btxt = _btxt + _pm;
	_btxt = _btxt + "<t size='0.8' align='right'>--------------------</t><br/>";
	_btxt = _btxt + format ["<t size='0.8' color='%1' align='right'>%2 </t><img size='0.8' align='right' image='overheat\GUI\dollars.paa'/>",_clr,[_new] call BIS_fnc_numberText];
};

_balanceCtrl ctrlSetStructuredText parseText _btxt;
_infoCtrl ctrlSetStructuredText parseText format ["<t size='0.9' align='left' font='TahomaB'>%1</t><br/><t size='0.65' color='#999999' align='left'font='TahomaB'>%2</t><br/>",_name,_description];
_picCtrl ctrlSetStructuredText parseText format ["<img size='4' image='%1'/>",_pic];