_box = _this;

loot_list = [
[
["ItemCrowbar","ItemCrowbar","ItemEtool","ItemEtool"],
[
"workbench_kit","workbench_kit",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"cinder_garage_kit",
"MortarBucket","MortarBucket","MortarBucket",
"CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks",
"wooden_shed_kit"
],
[""]
],
[
["ItemCrowbar","ItemCrowbar","ItemEtool","ItemEtool"],
[
"workbench_kit","workbench_kit",
"ItemComboLock",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit",
"cinder_door_kit",
"MortarBucket","MortarBucket","MortarBucket",
"CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"
],
[""]
],
[
["ItemCrowbar","ItemCrowbar","ItemEtool","ItemEtool"],
[
"workbench_kit","workbench_kit",
"ItemComboLock",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit",
"cinder_garage_kit",
"cinder_door_kit",
"MortarBucket","MortarBucket","MortarBucket",
"CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"
],
[""]
],
[
["ItemCrowbar","ItemCrowbar","ItemEtool","ItemEtool"],
[
"workbench_kit","workbench_kit",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit",
"MortarBucket","MortarBucket","MortarBucket","MortarBucket",
"CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"
],
[""]
],
[
["ItemCrowbar","ItemCrowbar","ItemEtool","ItemEtool"],
[
"workbench_kit","workbench_kit",
"ItemComboLock",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit",
"cinder_garage_kit",
"cinder_door_kit",
"MortarBucket","MortarBucket",
"CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"
],
[""]
]
];

_loot = loot_list call BIS_fnc_selectRandom;

{
_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);
{
_box addBackpackCargoGlobal [_x,1];
} forEach (_loot select 2);

if ((floor(random 4)) == 1) then {_box addWeaponCargoGlobal [(wai_chainsaws call BIS_fnc_selectRandom),1];_box addMagazineCargoGlobal ["ItemMixOil",(ceil random 4)];};