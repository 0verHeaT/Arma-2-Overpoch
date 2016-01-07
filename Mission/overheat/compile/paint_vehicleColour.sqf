/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: paint_vehicleColour.hpp
	Description: Paint Vehicles - Credits to maca134
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_colour","_colour2","_playerWealth"];

_playerWealth = player getVariable["cashMoney",0];

if (ColourPrice > _playerWealth) exitWith {titleText ["You do not have enough money to repaint your vehicle!","PLAIN DOWN"];};

_colour = ""+str((sliderPosition 5700) / 10)+","+str((sliderPosition 5701) / 10)+","+str((sliderPosition 5702) / 10)+",1";
_colour2 = ""+str((sliderPosition 6700) / 10)+","+str((sliderPosition 6701) / 10)+","+str((sliderPosition 6702) / 10)+",1";

PVDZE_veh_Colour = [VehicleToPaint,_colour,_colour2,player];
publicVariableServer "PVDZE_veh_Colour";

titleText ["Vehicle has been repainted! Please wait a moment for the texture to update!","PLAIN DOWN"];

player setVariable["cashMoney",(_playerWealth - ColourPrice),true];

PVDZE_plr_Save = [player,(magazines player),true,true] ;
publicVariableServer "PVDZE_plr_Save";