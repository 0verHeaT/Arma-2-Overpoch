private ["_smoketype","_colour","_position","_box","_name","_lootbox","_markercolour","_msgstart","_msgwin","_msgfail","_vehclass","_veh","_vehdir","_objPosition","_filename","_slots","_loot","_objects","_u1","_u2","_u3","_u4","_u5","_u6","_s1","_s2","_s3","_s4","_s5","_s6","_s7","_s8","_missionover","_playerPresent","_cleanmission","_i","_smoke"];
_filename = _this select 0;
_slots = _this select 1;
_loot = _this select 2;
WAI_CURRENT_MISSIONS = WAI_CURRENT_MISSIONS + [_filename];
WAI_MISSIONSLOTS = (WAI_MISSIONSLOTS - _slots) max 0;
_objects = [];
/******************************************* BASIC CONFIG *******************************************/
_name = "NATO Cache";
_markercolour = "ColorBlack";
_msgstart = "Bandits have obtained a NATO weapon cache! Kill the bandits and claim the rare loot!";
_msgwin = "Hoo-ah! The NATO weapon cache has been secured by the survivors!";
_msgfail = "The survivors were unable to secure the NATO weapon cache in time!";
_colour = "#088A85";
_smoketype = "SmokeShellPurple";
/******************************************* BASIC CONFIG *******************************************/

_position = [[8000,6360,0],0,WAI_MISSION_AREA,2.5,0,30,0] call BIS_fnc_findSafePos;

/****************************************** LOOTBOX CONFIG ******************************************/
_lootbox =	crates_large call BIS_fnc_selectRandom;
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
['MAP_fort_rampart',-1.05273,5.26221,0.0377779,-173.275],
['MAP_fort_rampart',3.24512,-0.389404,2.28882e-005,-83.1941],
['Land_CamoNet_NATO',-2.05371,1.74463,3.8147e-005,-355.817],
['MAP_fort_bagfence_long',0.669434,-4.68408,1.90735e-005,-175.658],
['MAP_fort_bagfence_long',-2.28857,-4.41113,5.34058e-005,-175.658],
['MAP_fort_bagfence_long',-5.26758,-4.15552,7.62939e-006,-175.658],
['MAP_Pristresek_mensi',-7.38281,-1.23169,2.28882e-005,97.1122],
['Land_Fire_barrel_burning',-6.28516,4.33936,1.90735e-005,0],
['Land_Fire_barrel_burning',1.28809,-3.63232,9.53674e-006,0],
['FlagCarrierBIS_EP1',-7.59717,5.77637,-7.62939e-006,0],
['FlagCarrierBIS_EP1',1.84766,-4.0918,-1.52588e-005,0]
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

_u1 = [[_position select 0, _position select 1, 0],5,1,"Random",4,"","GUE_Soldier_Sniper_DZ","Random",true] call spawn_group;
_u2 = [[_position select 0, _position select 1, 0],5,1,"Random",4,"","GUE_Soldier_Crew_DZ","Random",true] call spawn_group;
_u3 = [[_position select 0, _position select 1, 0],5,1,"Random",4,"","GUE_Soldier_2_DZ","Random",true] call spawn_group;
_u4 = [[_position select 0, _position select 1, 0],5,1,"Random",4,"","GUE_Soldier_2_DZ","Random",true] call spawn_group;

_s1 = [[[(_position select 0) - 15, (_position select 1) + 15, 0]],"M2StaticMG",0.8,"SFSG_des_tl",1,2,"","Random",true] call spawn_static;
_s2 = [[[(_position select 0) + 15, (_position select 1) - 15, 0]],"M2StaticMG",0.8,"SFSG_des_tl",1,2,"","Random",true] call spawn_static;
_s3 = [[[(_position select 0) + 15, (_position select 1) + 15, 0]],"TOW_TriPod_US_EP1",0.8,"SFSG_des_tl",1,2,"","Random",true] call spawn_static;
_s4 = [[[(_position select 0) - 15, (_position select 1) - 15, 0]],"TOW_TriPod_US_EP1",0.8,"SFSG_des_tl",1,2,"","Random",true] call spawn_static;

_objects = _objects + _u1 + _u2 + _u3 + _u4 + _s1 + _s2 + _s3 + _s4;
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