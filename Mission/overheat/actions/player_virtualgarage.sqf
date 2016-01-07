/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: player_virtualgarage.sqf
	Description: Virtual Vehicle Garage
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
createDialog "GarageDialog";
VirtualGarage = _this select 3;

call garage_getnearVeh;
call garage_getstoredVeh;
