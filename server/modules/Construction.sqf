private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
 
_spawnChance =  0.40; // Percentage chance of event happening
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns
 
_loot_box = "USVehicleBox";
_loot_lists = [
[
["M9SD"],
[
"15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD",
"ItemComboLock",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"cinder_garage_kit",
"cinder_door_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit",
"MortarBucket","MortarBucket",
"CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"
]
],
[
["M9SD"],
[
"15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD",
"workbench_kit","workbench_kit",
"outhouse_kit","outhouse_kit",
"ItemWoodFloor","ItemWoodFloor","ItemWoodFloor","ItemWoodFloor",
"ItemWoodStairs","ItemWoodStairs",
"ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg",
"ItemWoodWallWindowLg",
"ItemWoodLadder","ItemWoodLadder","ItemWoodLadder",
"ItemScaffoldingKit"
]
],
[
[],
[
"workbench_kit","workbench_kit",
"Partplywoodpack","Partplywoodpack","Partplywoodpack","Partplywoodpack","Partplywoodpack",
"partplankpack","partplankpack","partplankpack","partplankpack","partplankpack",
"forest_net_kit",
"deer_stand_kit","deer_stand_kit",
"light_pole_kit","light_pole_kit",
"sun_shade_kit","sun_shade_kit",
"stick_fence_kit","stick_fence_kit","stick_fence_kit","stick_fence_kit","stick_fence_kit",
"rusty_gate_kit","rusty_gate_kit",
"ItemFireBarrel_kit","ItemFireBarrel_kit"
]
],
[
["M9SD"],
[
"15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD",
"workbench_kit","workbench_kit",
"ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag",
"ItemSandbagLarge","ItemSandbagLarge",
"sandbag_nest_kit","sandbag_nest_kit",
"forest_large_net_kit","forest_large_net_kit",
"metal_panel_kit","metal_panel_kit","metal_panel_kit",
"wooden_shed_kit",
"ItemCorrugated","ItemCorrugated","ItemCorrugated","ItemCorrugated","ItemCorrugated",
"fuel_pump_kit",
"light_pole_kit","light_pole_kit"
]
],
[
["M9SD"],
[
"15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD",
"workbench_kit","workbench_kit",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit",
"cinder_garage_kit",
"metal_panel_kit","metal_panel_kit","metal_panel_kit",
"cinder_door_kit",
"deer_stand_kit","deer_stand_kit"
]
],
[
["M9SD"],
[
"15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD",
"workbench_kit","workbench_kit",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit",
"ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag",
"ItemSandbagLarge","ItemSandbagLarge","ItemSandbagLarge",
"forest_large_net_kit",
"sandbag_nest_kit","sandbag_nest_kit",
"ItemFireBarrel_kit","ItemFireBarrel_kit"
]
],
[
["M9SD"],
[
"15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD",
"workbench_kit","workbench_kit",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"metal_floor_kit","metal_floor_kit",
"ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag",
"forest_large_net_kit",
"sandbag_nest_kit","sandbag_nest_kit",
"fuel_pump_kit",
"light_pole_kit","light_pole_kit","light_pole_kit","light_pole_kit"
]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
_loot_amount = 200;
_wait_time = 1200; 
 
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
_event_marker setMarkerColor "ColorGreen";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorGreen";
_debug_marker setMarkerAlpha 1;
};
 
diag_log(format["Creating ammo box at %1", _loot_pos]);
 
// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
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
	<t size='0.6' color='#00FF11' align='left'>Construction Crate</t><br/>
	<t size='0.3' color='#FFFFFF' align='left'>̚</t><br/>
	<t size='0.55' color='#CCCCCC' align='left'>An Ikea Truck lost its Cargo, Check your Map for the Location!</t><br/>
";
[[""+server_var+"","all"],"rMsg",_msg] call server_sendremoteExe;

// Send center message to users 
//[nil,nil,rTitleText,"An Ikea Truck lost its Cargo, Check your Map for the Location!", "PLAIN",10] call RE;

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