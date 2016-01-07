_box = _this;

loot_list = [
[
["ItemEtool","ItemCrowbar"],
[
"workbench_kit","workbench_kit",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"MortarBucket","MortarBucket",
"CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks",
"cinder_garage_kit",
"metal_panel_kit","metal_panel_kit",
"cinder_door_kit","cinder_door_kit",
"wooden_shed_kit"
],
[""]
],
[
["ItemEtool","ItemCrowbar"],
[
"workbench_kit","workbench_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit",
"cinder_garage_kit",
"metal_panel_kit","metal_panel_kit","metal_panel_kit",
"cinder_door_kit",
"ItemComboLock",
"wooden_shed_kit"
],
[""]
],
[
["ItemCrowbar"],
[
"workbench_kit","workbench_kit",
"Partplywoodpack","Partplywoodpack","Partplywoodpack","Partplywoodpack","Partplywoodpack",
"partplankpack","partplankpack","partplankpack","partplankpack","partplankpack","partplankpack","partplankpack","partplankpack","partplankpack","partplankpack",
"ItemWoodFloor","ItemWoodFloor","ItemWoodFloor","ItemWoodFloor",
"ItemWoodStairs","ItemWoodStairs","ItemWoodStairs",
"ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg",
"ItemWoodWallDoor","ItemWoodWallDoor",
"ItemWoodLadder","ItemWoodLadder","ItemWoodLadder",
"wooden_shed_kit"
],
[""]
],
[
["ChainSawR"],
["ItemMixOil","ItemMixOil","ItemMixOil","ItemMixOil"],
[""]
],
[
["ChainSawG"],
["ItemMixOil","ItemMixOil","ItemMixOil","ItemMixOil"],
[""]
],
[
["ItemEtool","ItemCrowbar"],
[
"workbench_kit","workbench_kit",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit",
"cinder_garage_kit",
"metal_panel_kit","metal_panel_kit",
"cinder_door_kit",
"MortarBucket","MortarBucket",
"CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"
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

if ((floor(random 2)) == 1) then {{_box addWeaponCargoGlobal [_x,2];} count ammo_box_tools;};
if ((floor(random 6)) == 1) then {_box addWeaponCargoGlobal [(wai_chainsaws call BIS_fnc_selectRandom),1];_box addMagazineCargoGlobal ["ItemMixOil",(ceil random 4)];};
if ((floor(random 3)) == 1) then {_box addWeaponCargoGlobal ["ItemSledge",1];};