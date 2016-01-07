private ["_smoketype","_colour","_position","_box","_name","_lootbox","_markercolour","_msgstart","_msgwin","_msgfail","_vehclass","_veh","_vehdir","_objPosition","_filename","_slots","_loot","_objects","_u1","_u2","_u3","_u4","_u5","_u6","_s1","_s2","_s3","_s4","_s5","_s6","_s7","_s8","_missionover","_playerPresent","_cleanmission","_i","_smoke"];
_filename = _this select 0;
_slots = _this select 1;
_loot = _this select 2;
WAI_CURRENT_MISSIONS = WAI_CURRENT_MISSIONS + [_filename];
WAI_MISSIONSLOTS = (WAI_MISSIONSLOTS - _slots) max 0;
_objects = [];
/******************************************* BASIC CONFIG *******************************************/
_name = "Building Supply Camp";
_markercolour = "ColorGreen";
_msgstart = "Bandits have set up a building supply camp! Kill the bandits and grab the building stuff!";
_msgwin = "Survivors have claimed the building stuff!";
_msgfail = "The survivors were unable to capture the building supply camp time is up!";
_colour = "#00FF00";
_smoketype = "SmokeShellGreen";
/******************************************* BASIC CONFIG *******************************************/

_position = [[8000,6360,0],0,WAI_MISSION_AREA,2.5,0,30,0] call BIS_fnc_findSafePos;

/****************************************** LOOTBOX CONFIG ******************************************/
_lootbox =	crates_small call BIS_fnc_selectRandom;
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
WAI_Buildings = 
[
["MAP_BigHBarrier",5.52344,5.77051,-0.00927258,-325.486],
["MAP_Misc_palletsfoiled",-5.99854,0.0483398,0.0593576,0],
["MAP_obstacle_run_duck",-4.4585,-3.8894,0.0687227,-134.727],
["MAP_fort_watchtower",9.63428,-0.531738,0.110151,-505.459],
["MAP_dragonTeethBig",5.2666,-9.25195,0.0200615,-53.9266],
["MAP_BigHBarrier",2.12207,7.71802,0.0562468,-325.486],
["Land_Fire_barrel_burning",3.18457,-2.573,-0.0212965,0],
["MAP_Misc_Cargo1Ao",-7.6665,-3.09814,0.0687037,-189.689],
["MAP_BigHBarrier",-1.87842,-8.48926,0.00228786,-325.486],
["MAP_Misc_G_Pipes",3.91309,3.28101,0.0664663,41.9855],
["MAP_GuardShed",-2.29736,7.46509,0.0793419,-238.223],
["FlagCarrierBIS_EP1",0.91748,5.70435,0.0614595,0],
["FlagCarrierBIS_EP1",2.2793,-8.80127,0.053895,0]
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

_u1 = [[_position select 0, _position select 1, 0],3,1,"Random",3,"","","Random",true] call spawn_group;
_u2 = [[_position select 0, _position select 1, 0],3,1,"Random",4,"","","Random",true] call spawn_group;
_u3 = [[_position select 0, _position select 1, 0],3,1,"Random",2,"","","Random",true] call spawn_group;
_objects = _objects + _u1 + _u2 + _u3;
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