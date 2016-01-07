/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: player_paint.hpp
	Description: Paint Vehicles - Credits to maca134
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_txt","_coins","_vehicle"];
VehicleToPaint = _this select 3;
ColourPrice = 7500;
_coins = 'overheat\GUI\dollars.paa';
_vehicle = getText(configFile >> "cfgVehicles" >> (typeOf VehicleToPaint) >> "displayName");
createdialog "VehicleColourDialog";
_txt = format ["<t>It will cost %1 <img image='%2'/><br/>to repaint your %3.</t>",[ColourPrice] call BIS_fnc_numberText,_coins,_vehicle];
((uiNamespace getVariable "VehicleColourDialog") displayCtrl 5703) ctrlSetStructuredText parseText _txt;