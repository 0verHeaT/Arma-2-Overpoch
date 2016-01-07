_box = _this;

loot_list = [
[
["ItemEtool","ItemCrowbar"],
[
"workbench_kit","workbench_kit",
"cinder_wall_kit","cinder_wall_kit","cinder_wall_kit",
"metal_floor_kit","metal_floor_kit","metal_floor_kit",
"cinder_garage_kit",
"cinder_door_kit",
"MortarBucket","MortarBucket",
"CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"
],
[""]
],
[
["ItemCrowbar"],
[
"workbench_kit","workbench_kit",
"Partplywoodpack","Partplywoodpack","Partplywoodpack",
"partplankpack","partplankpack","partplankpack","partplankpack","partplankpack","partplankpack",
"ItemWoodFloor","ItemWoodFloor","ItemWoodFloor","ItemWoodFloor",
"ItemWoodStairs","ItemWoodStairs",
"ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg","ItemWoodWallLg",
"ItemWoodWallGarageDoorLocked",
"ItemWoodWallDoor",
"ItemWoodWallWindowLg","ItemWoodWallWindowLg",
"ItemWoodLadder","ItemWoodLadder","ItemWoodLadder"
],
[""]
],
[
["ItemEtool","ItemCrowbar"],
[
"workbench_kit","workbench_kit",
"ItemSandbag","ItemSandbag","ItemSandbag","ItemSandbag",
"ItemSandbagLarge","ItemSandbagLarge",
"sandbag_nest_kit",
"forest_large_net_kit",
"wooden_shed_kit",
"ItemCorrugated","ItemCorrugated","ItemCorrugated","ItemCorrugated","ItemCorrugated",
"fuel_pump_kit",
"light_pole_kit","light_pole_kit","light_pole_kit"
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
if ((floor(random 10)) == 1) then {_box addWeaponCargoGlobal [(wai_chainsaws call BIS_fnc_selectRandom),1];_box addMagazineCargoGlobal ["ItemMixOil",(ceil random 4)];};
if ((floor(random 2)) == 1) then {_box addWeaponCargoGlobal ["ItemSledge",1];};