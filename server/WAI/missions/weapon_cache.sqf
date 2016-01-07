private ["_smoketype","_colour","_position","_box","_name","_lootbox","_markercolour","_msgstart","_msgwin","_msgfail","_vehclass","_veh","_vehdir","_objPosition","_filename","_slots","_loot","_objects","_u1","_u2","_u3","_u4","_u5","_u6","_s1","_s2","_s3","_s4","_s5","_s6","_s7","_s8","_missionover","_playerPresent","_cleanmission","_i","_smoke"];
_filename = _this select 0;
_slots = _this select 1;
_loot = _this select 2;
WAI_CURRENT_MISSIONS = WAI_CURRENT_MISSIONS + [_filename];
WAI_MISSIONSLOTS = (WAI_MISSIONSLOTS - _slots) max 0;
_objects = [];
/******************************************* BASIC CONFIG *******************************************/
_name = "Bandit Weapons";
_markercolour = "ColorRed";
_msgstart = "Bandits are rearming, go kill them and claim their weapons!";
_msgwin = "Survivors have killed the Bandits!";
_msgfail = "The survivors were unable to kill the Bandits!";
_colour = "#FF0000";
_smoketype = "SmokeShellRed";
/******************************************* BASIC CONFIG *******************************************/

_position = [[8000,6360,0],0,WAI_MISSION_AREA,2.5,0,30,0] call BIS_fnc_findSafePos;

/****************************************** LOOTBOX CONFIG ******************************************/
_lootbox =	crates_medium call BIS_fnc_selectRandom;
_box = createVehicle [_lootbox,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_box setVariable ["ObjectID","1",true];
_box setVariable ["permaLoot",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_box];
clearWeaponCargoGlobal _box;clearMagazineCargoGlobal _box;
_objects = _objects + [_box];
/****************************************** LOOTBOX CONFIG ******************************************/
 
/****************************************** VEHICLE CONFIG ******************************************
_vehclass = civil_vehicles call BIS_fnc_selectRandom;
_veh = createVehicle [_vehclass,[(_position select 0) + 10, (_position select 1) + 10,0], [], 0, "CAN_COLLIDE"];
_vehdir = round(random 360);
_veh setDir _vehdir;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["WAI: %2 spawned a %1",_vehclass,_name];
_objPosition = getPosATL _veh;
_objects = _objects + [_veh]
****************************************** VEHICLE CONFIG ******************************************/

diag_log format["WAI: %2 Started At %1",_position,_name];

/************************************** BUILDINGS && AI CONFIG **************************************/
WAI_Buildings = [];
WAI_Buildings = 
[
["MAP_HBarrier3",5.26855,2.37622,-0.00423241,-151.83],
["MAP_HBarrier5",-1.79297,6.02344,-0.0528555,26.686],
["MAP_HBarrier5",-1.61475,-3.23511,-0.0459385,26.686],
["MAP_HBarrier3",-4.64795,-1.8252,-0.0518064,24.9463],
["MAP_HBarrier5",4.30225,-2.05835,0.0557098,-61.4996],
["MAP_fortified_nest_small",-5.71777,0.810059,-0.0167007,-245.239],
["MAP_Misc_palletsfoiled",-2.74219,7.80737,-0.0766411,0],
["MAP_Misc_palletsfoiled",-4.09863,6.07813,-0.0450878,34.2543],
["MAP_paletaA",3.58838,0.695801,-9.53674e-006,-25.3201],
["Land_Fire_barrel_burning",3.0083,2.06836,-0.000134468,0],
["MAP_fort_bagfence_long",4.09033,-6.53613,-0.0146303,-153.865],
["MAP_GuardShed",6.86523,-6.49634,-0.0141001,-421.639],
["FlagCarrierBIS_EP1",5.23438,-3.02466,-2.09808e-005,0],
["FlagCarrierBIS_EP1",-4.41309,7.41553,-0.00480938,0]
];

{
	private ["_pos","_baserunover"];
	_pos = [(_position select 0) + (_x select 1),(_position select 1) + (_x select 2),(_x select 3)];
	_baserunover = createVehicle [(_x select 0),_pos,[],0,"CAN_COLLIDE"];
	_baserunover setDir (_x select 4);
	_baserunover setPos _pos;
	_baserunover setVectorUp surfaceNormal _pos;
	if ((_x select 0) == "FlagCarrierBIS_EP1") then
	{
		_baserunover setVehicleInit "this setFlagTexture 'overheat\gui\logo.paa';";
	};
	_objects set [count _objects,_baserunover];
} count WAI_Buildings;

processInitCommands;

_u1 = [[_position select 0, _position select 1, 0],4,1,"Random",5,"","","Random",true] call spawn_group;
_u2 = [[_position select 0, _position select 1, 0],4,1,"Random",5,"","","Random",true] call spawn_group;

_s1 = [[[(_position select 0) - 10, (_position select 1) - 10, 0]],"M2StaticMG",0.8,"SFSG_des_tl",1,2,"","Random",true] call spawn_static;
_s2 = [[[(_position select 0) + 10, (_position select 1) + 10, 0]],"TOW_TriPod_US_EP1",0.8,"SFSG_des_tl",1,2,"","Random",true] call spawn_static;

_objects = _objects + _u1 + _u2 + _s1 + _s2;
 /************************************** BUILDINGS && AI CONFIG **************************************/

[_name,_msgstart,_colour] call WAI_Send_Msg;

_missionover = true;
_playerPresent = false;
_cleanmission = false;
_i = 0;

while {_missionover} do
{
	[_position,_markercolour,_filename,_name] call wai_createMarker;
	_smoke = _smoketype createVehicle _position;
	uiSleep 10;
	_i = _i + 10;
	{
		if(isPlayer _x) then 
		{
			if (_x distance _position < 50) then {_playerPresent = true;};
			if (_x distance _position < 400) then {_i = _i - 10;};
		};
	} count playableUnits;
	
	if (_i >= WAI_MISSION_TIMEOUT) then 
	{
		_cleanmission = true;
	};
	
	deleteMarker format["mission%1",_filename];
	deleteMarker format["missiondot%1",_filename];
	
	if ((_playerPresent) || (_cleanmission)) then {_missionover = false;};
	deleteVehicle _smoke;
};

if (_playerPresent) then 
{
	waitUntil
	{
		private ["_playerNear"];
		_playerNear = false;
		{
			if((isPlayer _x) && (_x distance _position <= 15)) then 
			{
				_playerNear = true;
				[[""+server_var+"",_x],'rCut',toArray (format['%1, you have finished the mission successfully!',name _x])] call server_sendremoteExe;
			};
		} count playableUnits;
		(_playerNear)
	};
	
	//[_position,false,1] call server_FireWorks;
	
	if (_loot != "" && !isNil "_box") then 
	{
		call compile format ["_box call %1;",_loot];
	};
	
	[_name,_msgwin,_colour] call WAI_Send_Msg;
	
	diag_log format["WAI: %2 ended at %1",_position,_name];
}
else
{
	{deleteVehicle _x} count _objects;
	
	[_name,_msgfail,_colour] call WAI_Send_Msg;
	
	diag_log format["WAI: %2 timed out at %1",_position,_name];
};

WAI_MISSIONSLOTS = (WAI_MISSIONSLOTS + _slots) min 4;
WAI_CURRENT_MISSIONS = WAI_CURRENT_MISSIONS - [_filename];