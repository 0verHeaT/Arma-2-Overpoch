/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: marker.sqf
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_i","_j"];
_i = 0;
_j = 0;

waitUntil {!isNil "PV_DynTraderMarkers"};

{
	private ["_marker"];
	_i = _i + 1;
	_marker = createMarkerLocal [format["TraderMarker%1", _i], (_x select 0)];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal (_x select 3);
	_marker setMarkerTextLocal (_x select 1);
	_marker setMarkerColorLocal (_x select 2);
	true
} count PV_DynTraderMarkers;

{
	private ["_marker","_radius"];
	_marker = createMarkerLocal [format["VGMarker%1",random 999], (_x select 0)];
	_marker setMarkerShapeLocal "ICON";
	_marker setMarkerTypeLocal (_x select 3);
	_marker setMarkerTextLocal (_x select 1);
	_marker setMarkerColorLocal (_x select 2);
	true
} count VGMarkers;

{
	VGAdmins set [count VGAdmins,_x];
} count VG_ADMINS;