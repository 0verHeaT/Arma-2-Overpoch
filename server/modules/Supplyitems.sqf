private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
 
_spawnChance =  0.60; // Percentage chance of event happening
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns

_loot_box = "SpecialWeaponsBox";
_loot_lists = [
[
["M9SD"],
[
"15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD",
"ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke",
"ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi",
"ItemSodaMdew","ItemSodaMdew",
"ItemSodaOrangeSherbet","ItemSodaOrangeSherbet",
"ItemSodaRbull",
"ItemSodaR4z0r",
"FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans",
"FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanPasta",
"FoodCanFrankBeans","FoodCanFrankBeans","FoodCanFrankBeans","FoodCanFrankBeans","FoodCanFrankBeans",
"FoodCanSardines","FoodCanSardines","FoodCanSardines","FoodCanSardines","FoodCanSardines",
"FoodPistachio","FoodPistachio",
"FoodNutmix","FoodPistachio",
"FoodMRE"
]
],
[
["M9SD"],
[
"15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD",
"ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic",
"ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage",
"ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag",
"ItemEpinephrine","ItemEpinephrine","ItemEpinephrine","ItemEpinephrine","ItemEpinephrine",
"ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine",
"ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller"
]
],
[
["M9SD"],
["15Rnd_9x19_M9SD","Skin_Camo1_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_Drake_Light_DZ","Skin_FR_OHara_DZ","Skin_FR_Rodriguez_DZ","Skin_Graves_Light_DZ","Skin_Sniper1_DZ","Skin_Soldier1_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ","Skin_Bandit1_DZ","Skin_Bandit2_DZ","Skin_BanditW1_DZ","Skin_GUE_Commander_DZ","Skin_GUE_Soldier_Crew_DZ","Skin_GUE_Soldier_Sniper_DZ","Skin_Ins_Soldier_GL_DZ","Skin_TK_INS_Soldier_EP1_DZ","Skin_TK_INS_Warlord_EP1_DZ","Skin_GUE_Commander_DZ"]
],
[
["M9SD"],
[
"15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD",
"ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic","ItemAntibiotic",
"ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemBandage",
"ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag","ItemBloodbag",
"ItemEpinephrine","ItemEpinephrine","ItemEpinephrine","ItemEpinephrine","ItemEpinephrine",
"ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine","ItemMorphine",
"ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller","ItemPainkiller",
"ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke",
"ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi",
"ItemSodaMdew","ItemSodaMdew",
"ItemSodaOrangeSherbet","ItemSodaOrangeSherbet",
"ItemSodaRbull",
"ItemSodaR4z0r",
"FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans",
"FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanPasta",
"FoodCanFrankBeans","FoodCanFrankBeans","FoodCanFrankBeans","FoodCanFrankBeans","FoodCanFrankBeans",
"FoodCanSardines","FoodCanSardines","FoodCanSardines","FoodCanSardines","FoodCanSardines",
"FoodPistachio","FoodPistachio",
"FoodNutmix","FoodPistachio",
"FoodMRE"
]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
_loot_amount = 200;
_wait_time = 900; 
 
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
_event_marker setMarkerColor "ColorBlue";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorBlue";
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
	<t size='0.6' color='#0D00FF' align='left'>Supply Crate</t><br/>
	<t size='0.3' color='#FFFFFF' align='left'>̚</t><br/>
	<t size='0.55' color='#CCCCCC' align='left'>UN Agency drops life-saving supplies for Survivors, Check your Map for the Location!</t><br/>
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