/*** Created by 0verHeaT ***/
private ["_index","_item","_displayName","_descriptionShort","_image","_warning","_buy","_sell"];
_index = _this select 0;
if (_index < 0) exitWith {};
while {count BuildingItemList < 1} do { sleep 1; };
_item = BuildingItemList select _index;
_displayName =	(_item select 0) select 1;
_descriptionShort =	(_item select 0) select 2;
_image = (_item select 0) select 3;
_warning = "NOTE: All custom buildings are destructible!";
hintSilent parseText format[/*<img size='7' image='%1'/><br/>*/"<t size='1.2' font='TahomaB'>%2</t><br/><t size='1' color='#999999' font='TahomaB'>%3</t><br/><t size='0.8' color='#FF0000'>%4</t>",_image,_displayName,_descriptionShort,_warning];
_buy = _item select 1;
_sell = _item select 2;

if ((_buy select 1) == "Coins") then {
	ctrlSetText [72002, format["%1 %2", [_buy select 0] call BIS_fnc_numberText,CurrencyName]];
	ctrlSetText [72003, format["%1 %2", [_sell select 0] call BIS_fnc_numberText,CurrencyName]];
} else {
	private ["_name"];
	_name = getText(configFile >> "CfgMagazines" >> (_buy select 1) >> "displayName");
	ctrlSetText [72002, format["%1 %2", _buy select 0,_name]];
	ctrlSetText [72003, format["%1 %2", _sell select 0,_name]];
};