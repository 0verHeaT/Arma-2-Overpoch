private ["_position","_box","_missiontimeout","_cleanmission","_playerPresent","_i","_currenttime","_cleanunits","_hint","_name","_lootbox","_markercolour","_msgstart","_msgwin","_msgfail","_vehclass","_veh","_vehdir","_objPosition"];
/******************************************* BASIC CONFIG *******************************************/
_name = "NATO Crash Site";
_markercolour = "ColorBlack";
_msgstart = "Bandits have taken down a NATO chopper and are securing the crash site. Check your map for the location!";
_msgwin = "Survivors have secured the crash site!";
_msgfail = "The survivors were unable to secure the crash site in time!";
WAIActiveMissionClr = "#088A85";
missionrunning = true;
/******************************************* BASIC CONFIG *******************************************/

_position = [[8000,6360,0],0,wai_missionarea,2.5,0,30,0] call BIS_fnc_findSafePos;

/****************************************** LOOTBOX CONFIG ******************************************/
_lootbox =	crates_medium call BIS_fnc_selectRandom;
_box = createVehicle [_lootbox,[(_position select 0) - 5,(_position select 1) + 5,0], [], 0, "CAN_COLLIDE"];
_box setVariable ['OCGBuild',true,false];
[_box] call box_nato_crash;
/****************************************** LOOTBOX CONFIG ******************************************/
 
/****************************************** VEHICLE CONFIG ******************************************
_vehclass = military_unarmed call BIS_fnc_selectRandom;
_veh = createVehicle [_vehclass,[(_position select 0),(_position select 1),0], [], 0, "CAN_COLLIDE"];
_vehdir = round(random 360);
_veh setDir _vehdir;
_veh setVariable ["ObjectID","1",true];
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_veh];
diag_log format["WAI: %2 spawned a %1",_vehclass,_name];
_objPosition = getPosATL _veh;
****************************************** VEHICLE CONFIG ******************************************/

diag_log format["WAI: %2 Started At %1",_position,_name];

/************************************** BUILDINGS && AI CONFIG **************************************/
baserunover = createVehicle ["UH60_NAVY_Wreck_burned_DZ",[(_position select 0) + 1, (_position select 1) - 1,0],[], 0, "CAN_COLLIDE"];
baserunover setVariable ['OCGBuild',true,false];

[[_position select 0, _position select 1, 0],3,1,"Random",4,"","RU_Soldier2","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],3,1,"Random",4,"","RU_Soldier2","Random",true] call spawn_group;
[[_position select 0, _position select 1, 0],3,1,"Random",4,"","RU_Soldier2","Random",true] call spawn_group;

[[[(_position select 0) + 7, (_position select 1) + 7, 0]],"M2StaticMG",0.8,"RU_Soldier2",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) - 7, (_position select 1) - 7, 0]],"M2StaticMG",0.8,"RU_Soldier2",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) + 7, (_position select 1) - 7, 0]],"TOW_TriPod_US_EP1",0.8,"RU_Soldier2",1,2,"","Random",true] call spawn_static;
[[[(_position select 0) - 7, (_position select 1) + 7, 0]],"TOW_TriPod_US_EP1",0.8,"RU_Soldier2",1,2,"","Random",true] call spawn_static;
 /************************************** BUILDINGS && AI CONFIG **************************************/

[_position,_name,_markercolour] spawn mission_marker;

[_name,_msgstart] spawn WAI_Send_Msg;

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

if (_playerPresent) then {
	//[_veh,[_vehdir,_objPosition],_vehclass,true,"0"] call custom_publish;
	waitUntil
	{
		uiSleep 5;
		_playerPresent = false;
		{
			if((isPlayer _x) and (_x distance _position <= 30)) then {
				_playerPresent = true;
			};
		} forEach playableUnits;
		(_playerPresent)
	};
	
	diag_log format["WAI: %2 Ended At %1",_position,_name];
	
	[_name,_msgwin] spawn WAI_Send_Msg;
	
} else {
	clean_running_mission = true;
	deleteVehicle _box;
	//deleteVehicle _veh;
	{
		_cleanunits = _x getVariable "missionclean";
		if (!isNil "_cleanunits") then {
			switch (_cleanunits) do {
				case "ground" :  {ai_ground_units = (ai_ground_units -1);};
				case "air" :     {ai_air_units = (ai_air_units -1);};
				case "vehicle" : {ai_vehicle_units = (ai_vehicle_units -1);};
				case "static" :  {ai_emplacement_units = (ai_emplacement_units -1);};
			};
			deleteVehicle _x;
			uiSleep 0.05;
		};
	} forEach allUnits;
 
	diag_log format["WAI: %2 Ended At %1",_position,_name];
	
	[_name,_msgfail] spawn WAI_Send_Msg;
};
 
missionrunning = false;