// Time between missions (seconds)
//wai_mission_timer = 450;

WAI_MISSION_TIMER = {
	private ["_time","_players"];
	_time = 450;
	_players = (count playableUnits);
	if(_players > 40) then {_players = 41;};
	_time = _time + ((41 - _players) * ((floor random 10) + 30));
	_time;
};

// How long before a mission times out (seconds)
WAI_MISSION_TIMEOUT = 1800;

WAI_MISSION_AREA = (dayz_MapArea * 0.5);

if (dayz_instance == 13) then {
	WAI_MISSION_AREA = (dayz_MapArea * 0.7);
};

// missions used when selecting the next random mission
/*
	select 0: file
	select 1: slots the mission needs (4 max.)
	select 2: loot file (compiled)
*/
WAI_MISSIONSLOTS = 4;
WAI_CURRENT_MISSIONS = [];

WAI_MISSIONS = 
[
	["NATO_cache",4,"box_nato",0.5],
	["build_base",3,"box_b_small"],
	["general_supplies",2,"box_general"],
	["vehicle_armed",4,"",0.5],
	["sas_crash",4,"box_chain"],
	["build_convoy",4,"box_b_large"],
	["treasure",4,"box_treasure"],
	["general_supplies",2,"box_general"],
	//["NATO_crash",4,"box_nato_crash"],
	["build_ural",3,"box_b_medium"],
	["vehicle_civ",4,""],
	["weapon_cache",3,"box_cache"],
	["build_base",3,"box_b_small"]
];

if (dayz_instance == 11) then
{
WAI_MISSIONS = 
[
	["build_base",2,"box_b_small"],
	["general_supplies",1,"box_general"],
	["vehicle_armed",4,""],
	["sas_crash",4,"box_chain"],
	["build_convoy",4,"box_b_large"],
	["treasure",4,"box_treasure"],
	["general_supplies",1,"box_general"],
	["vehicle_civ",4,""],
	["build_ural",3,"box_b_medium"],
	["build_base",2,"box_b_small"]
];
};

// fuel the mission vehicles spawn with 0-100.
wai_mission_fuel = 0.1;

vehicles_military_hive = 
[
"HMMWV_DES_EP1",
"UH1H_TK_EP1",
"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
"pook_H13_gunship_PMC",
"Offroad_DSHKM_Gue_DZE",
"HMMWV_Ambulance",
"HMMWV_Ambulance_CZ_DES_EP1",
"Pickup_PK_GUE_DZE",
"HMMWV_M998A2_SOV_DES_EP1_DZE",
"Pickup_PK_INS_DZE",
"HMMWV_DZ",
"Ural_CDF",
"HMMWV_M1035_DES_EP1",
"Pickup_PK_TK_GUE_EP1_DZE",
"Mi17_DZE",
"LandRover_MG_TK_EP1_DZE",
"Kamaz",
"MTVR_DES_EP1",
"Ural_TK_CIV_EP1",
"Ural_UN_EP1",
"V3S_Open_TK_CIV_EP1",
"V3S_Open_TK_EP1"
];

if (vgserver in vgmiliterized) then 
{
	vehicles_military_hive = vehicles_military_hive + ["LAV25_HQ_DZE","HMMWV_M998_crows_M2_DES_EP1","BTR90_HQ_DZE","BAF_Jackal2_L2A1_W","GAZ_Vodnik_HMG","T34_TK_EP1","M1Abrams","M2A2_EP1","HMMWV_Avenger_DES_EP1","AH1Z","AH64D_EP1","AAV"];
};

/*
armed_vehicle = [
"HMMWV_M998A2_SOV_DES_EP1_DZE",
"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
"LandRover_Special_CZ_EP1_DZE",
"LandRover_MG_TK_EP1_DZE",
"Offroad_DSHKM_Gue_DZE",
"Pickup_PK_GUE_DZE",
"Pickup_PK_INS_DZE",
"Pickup_PK_TK_GUE_EP1_DZE",
"UAZ_MG_TK_EP1_DZE"
];

armed_chopper = [
"UH1H_TK_EP1",
"UH1H_DZE",
"UH1H_DZE",
"BAF_Merlin_DZE",
"UH1Y_DZE"
];

military_unarmed = [
"HMMWV_Ambulance",
"HMMWV_Ambulance_CZ_DES_EP1",
"HMMWV_DES_EP1",
"HMMWV_DZ",
"HMMWV_M1035_DES_EP1",
"LandRover_CZ_EP1",
"LandRover_TK_CIV_EP1",
"UAZ_CDF",
"UAZ_INS",
"UAZ_RU",
"UAZ_Unarmed_TK_CIV_EP1",
"UAZ_Unarmed_TK_EP1",
"UAZ_Unarmed_UN_EP1"
];
*/

civ_vehicles_hive = [
"Kamaz",
"MTVR_DES_EP1",
"Ural_CDF",
"Ural_TK_CIV_EP1",
"Ural_UN_EP1",
"V3S_Open_TK_CIV_EP1",
"V3S_Open_TK_EP1",
"hilux1_civil_1_open",
"hilux1_civil_2_covered",
"hilux1_civil_3_open_EP1",
"SUV_Camo",
"SUV_TK_CIV_EP1",
"SUV_Blue",
"SUV_Charcoal",
"SUV_Green",
"SUV_Orange",
"SUV_Pink",
"SUV_Red",
"SUV_Silver",
"SUV_White",
"SUV_Yellow",
"AH6X_DZ",
"MH6J_DZ",
"Mi17_Civilian_DZ",
"pook_H13_medevac_CIV",
"pook_H13_civ",
"pook_H13_amphib"
];

ammo_box_guns = [
["M4A3_CCO_EP1","30Rnd_556x45_Stanag"],
["M4A1","30Rnd_556x45_Stanag"],
["M16A4_ACG","30Rnd_556x45_Stanag"],
["M8_carbineGL","30Rnd_556x45_Stanag"],
["VSS_vintorez",""],
["M8_sharpshooter","30Rnd_556x45_Stanag"],
["M40A3","5Rnd_762x51_M24"],
["M249_DZ","200Rnd_556x45_M249"],
["AK_47_M","30Rnd_762x39_AK47"],
["SVD_CAMO","10Rnd_762x54_SVD"],
["Sa58V_RCO_EP1","30Rnd_762x39_SA58"],
["BAF_L86A2_ACOG","30Rnd_556x45_Stanag"],
["AKS_GOLD","30Rnd_545x39_AK"],
["AK_74","30Rnd_545x39_AK"],
["AKS_74_kobra","30Rnd_545x39_AK"],
["Sa58V_CCO_EP1","30Rnd_762x39_SA58"]
];

ammo_vehicle = [
"100Rnd_127x99_M2",
"50Rnd_127x107_DSHKM",
"2000Rnd_762x51_M134",
"100Rnd_762x51_M240"
];

ammo_smokes = [
"SmokeShell",
"SmokeShellGreen",
"SmokeShellRed",
"SmokeShellYellow",
"SmokeShellOrange",
"SmokeShellPurple",
"SmokeShellBlue"
];

wai_chainsaws = [
"ChainSawP",
"ChainSawB",
"ChainSaw",
"ChainSawG",
"ChainSawR"
];

ammo_box_tools =[
"ItemToolbox",
"ItemKnife",
"ItemCrowbar",
"ItemEtool",
"Binocular_Vector",
"ItemCompass",
"ItemFishingPole",
"ItemFlashlightRed",
"ItemGPS",
"ItemHatchet_DZE",
"ItemMachete",
"ItemMatchbox_DZE",
"NVGoggles"
];

crates_large = ["USVehicleBox","RUVehicleBox","TKVehicleBox_EP1"];
crates_medium = ["USBasicWeaponsBox","RUBasicWeaponsBox","USSpecialWeaponsBox","USSpecialWeapons_EP1","RUSpecialWeaponsBox","SpecialWeaponsBox","TKSpecialWeapons_EP1","CZBasicWeapons_EP1","UNBasicWeapons_EP1"];
crates_small = ["GuerillaCacheBox","RULaunchersBox","RUBasicAmmunitionBox","RUOrdnanceBox","USBasicAmmunitionBox","USLaunchersBox","USOrdnanceBox","USOrdnanceBox_EP1","USLaunchers_EP1","USBasicWeapons_EP1","USBasicAmmunitionBox_EP1","UNBasicAmmunitionBox_EP1","TKOrdnanceBox_EP1","TKLaunchers_EP1","TKBasicAmmunitionBox_EP1","GuerillaCacheBox_EP1","GERBasicWeapons_EP1"];

WAImissionconfig = True;