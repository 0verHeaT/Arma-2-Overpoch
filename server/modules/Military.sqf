private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
 
_spawnChance =  0.20; // Percentage chance of event happening
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns
 
_loot_box = "RUVehicleBox";
_loot_lists = [
[
["G36a","G36C","MP5A5","MP5SD","DMR_DZ","SCAR_H_STD_EGLM_Spect","G36a","G36C","G36_C_SD_eotech","G36K","MP5A5","MP5SD"],
[
"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag",
"30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD",
"30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD",
"30Rnd_9x19_MP5","30Rnd_9x19_MP5","30Rnd_9x19_MP5","30Rnd_9x19_MP5","30Rnd_9x19_MP5",
"20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR",
"20Rnd_762x51_B_SCAR","20Rnd_762x51_B_SCAR","20Rnd_762x51_B_SCAR","20Rnd_762x51_B_SCAR","20Rnd_762x51_B_SCAR",
"SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell",
"SmokeShellGreen","SmokeShellGreen","SmokeShellGreen","SmokeShellGreen","SmokeShellGreen",
"SmokeShellRed","SmokeShellRed","SmokeShellRed","SmokeShellRed","SmokeShellRed",
"SmokeShellYellow","SmokeShellYellow","SmokeShellYellow","SmokeShellYellow","SmokeShellYellow",
"SmokeShellOrange","SmokeShellOrange","SmokeShellOrange","SmokeShellOrange","SmokeShellOrange",
"SmokeShellPurple","SmokeShellPurple","SmokeShellPurple","SmokeShellPurple","SmokeShellPurple",
"SmokeShellBlue","SmokeShellBlue","SmokeShellBlue","SmokeShellBlue","SmokeShellBlue"
]
],
[
["huntingrifle","LeeEnfield","M24_des_EP1","huntingrifle","LeeEnfield","M24","M14_EP1","huntingrifle","LeeEnfield","M40A3","SVD_CAMO","M4SPR"],
[
"20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR","20Rnd_762x51_DMR",
"5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR","5x_22_LR_17_HMR",
"5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24",
"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag",
"10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD",
"SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell",
"SmokeShellGreen","SmokeShellGreen","SmokeShellGreen","SmokeShellGreen","SmokeShellGreen",
"SmokeShellRed","SmokeShellRed","SmokeShellRed","SmokeShellRed","SmokeShellRed",
"SmokeShellYellow","SmokeShellYellow","SmokeShellYellow","SmokeShellYellow","SmokeShellYellow",
"SmokeShellOrange","SmokeShellOrange","SmokeShellOrange","SmokeShellOrange","SmokeShellOrange",
"SmokeShellPurple","SmokeShellPurple","SmokeShellPurple","SmokeShellPurple","SmokeShellPurple",
"SmokeShellBlue","SmokeShellBlue","SmokeShellBlue","SmokeShellBlue","SmokeShellBlue"
]
],
[
["M16A2","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M16A4_ACG","M4A1","M4A1_HWS_GL","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","M4A1_RCO_GL","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo"],
[
"30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD",
"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag",
"SmokeShell","SmokeShell","SmokeShell","SmokeShell","SmokeShell",
"SmokeShellGreen","SmokeShellGreen","SmokeShellGreen","SmokeShellGreen","SmokeShellGreen",
"SmokeShellRed","SmokeShellRed","SmokeShellRed","SmokeShellRed","SmokeShellRed",
"SmokeShellYellow","SmokeShellYellow","SmokeShellYellow","SmokeShellYellow","SmokeShellYellow",
"SmokeShellOrange","SmokeShellOrange","SmokeShellOrange","SmokeShellOrange","SmokeShellOrange",
"SmokeShellPurple","SmokeShellPurple","SmokeShellPurple","SmokeShellPurple","SmokeShellPurple",
"SmokeShellBlue","SmokeShellBlue","SmokeShellBlue","SmokeShellBlue","SmokeShellBlue"
]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
_loot_amount = 200;
_wait_time = 1800; 
 
// Dont mess with theses unless u know what yours doing
_start_time = time;
_spawnRadius = (dayz_MapArea * 0.4);
_spawnMarker = 'center';
 
if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};
 
// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
	diag_log("Event already running");
};
 
// Random chance of event happening
_spawnRoll = random 1;
if (_spawnRoll > _spawnChance and !_debug) exitWith {};
 
// Random location
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
 
diag_log(format["Spawning loot event at %1", _position]);
 
EPOCH_EVENT_RUNNING = true;

_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorRed";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorRed";
_debug_marker setMarkerAlpha 1;
};
 
diag_log(format["Creating ammo box at %1", _loot_pos]);
 
// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
_loot_box setVariable ['OCGBuild',true,false];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;

// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);
 
_msg = "
	<br/><t size='0.6' color='#999999' align='left'>[Event] </t>
	<t size='0.6' color='#FF0000' align='left'>Military Crate</t><br/>
	<t size='0.3' color='#FFFFFF' align='left'>̚</t><br/>
	<t size='0.55' color='#CCCCCC' align='left'>A special forces unit lost a precious cargo, Check your Map for the Location!</t><br/>
";
[[""+server_var+"","all"],"rMsg",_msg] call server_sendremoteExe;

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

// Wait
sleep _wait_time;
 
// Clean up
EPOCH_EVENT_RUNNING = false;
deleteVehicle _loot_box;
deleteMarker _event_marker;
if (_debug) then {
deleteMarker _debug_marker;
};