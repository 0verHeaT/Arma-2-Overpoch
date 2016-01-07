private ["_smoketype","_colour","_position","_box","_name","_lootbox","_markercolour","_msgstart","_msgwin","_msgfail","_vehclass","_veh","_vehdir","_objPosition","_filename","_slots","_loot","_objects","_u1","_u2","_u3","_u4","_u5","_u6","_s1","_s2","_s3","_s4","_s5","_s6","_s7","_s8","_missionover","_playerPresent","_cleanmission","_i","_smoke"];
_filename = _this select 0;
_slots = _this select 1;
_loot = _this select 2;
WAI_CURRENT_MISSIONS = WAI_CURRENT_MISSIONS + [_filename];
WAI_MISSIONSLOTS = (WAI_MISSIONSLOTS - _slots) max 0;
_objects = [];
/******************************************* BASIC CONFIG *******************************************/
_name = "General Supplies";
_markercolour = "ColorBlue";
_msgstart = "Bandits have attacked an UN truck and are securing the supplies! Kill the bandits and grab the supplies!";
_msgwin = "Survivors have secured the cargo!";
_msgfail = "The survivors were unable to secure the cargo!";
_colour = "#0000AA";
_smoketype = "SmokeShellBlue";
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
["MAP_Misc_cargo_cont_net2",-6.67432,0.234863,6.10352e-005,28.1168],
["MAP_Stan",-4.68457,-5.9707,0.0220356,-692.208],
["MAP_fort_bagfence_long",-4.67969,7.26465,3.62396e-005,-62.0856],
["MAP_fort_bagfence_long",-6.06543,4.63184,-2.19345e-005,-62.0856],
["MAP_fort_bagfence_long",-7.42236,2.01147,2.19345e-005,-62.0856],
["MAP_fort_bagfence_long",-0.917969,6.83911,1.90735e-005,26.7214],
["MAP_fort_bagfence_long",1.67773,5.55298,-0.0108156,26.7214],
["MAP_fort_bagfence_long",4.37256,4.19434,2.86102e-005,26.7214],
["MAP_fortified_nest_small",5.95996,0.873535,2.57492e-005,-63.9344],
["MAP_obstacle_run_duck",4.85303,-5.08325,1.62125e-005,-213.493],
["MAP_paletaA",-1.68555,5.02417,-4.00543e-005,0],
["MAP_paletaA",0.101074,4.25928,1.14441e-005,0],
["MAP_Table",2.14551,-4.16479,3.8147e-006,-194.86],
["Land_Fire_barrel_burning",3.93457,-3.50439,2.67029e-005,0],
["Land_Fire_barrel_burning",-4.81689,5.08765,6.67572e-006,0],
["FlagCarrierBIS_EP1",-8.40332,0.346924,2.28882e-005,0],
["FlagCarrierBIS_EP1",9.11768,2.08496,3.05176e-005,0]
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

_u1 = [[_position select 0, _position select 1, 0],4,1,"Random",4,"","","Random",true] call spawn_group;
_u2 = [[_position select 0, _position select 1, 0],3,1,"Random",4,"","","Random",true] call spawn_group;
_objects = _objects + _u1 + _u2;
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