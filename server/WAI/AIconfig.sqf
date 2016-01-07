WAI_WPN_MAGS =
{
	private ["_mags","_mag"];
	_mags = getArray (configFile >> "CfgWeapons" >> _this >> "magazines");
	_mag = _mags select 0;
	_mag
};

///////////////////////////////////////////////////////
///Use the built in mission system (config file for mission system in mission folder)
ai_mission_sysyem = True;

///////////////////////////////////////////////////////
/// clears all Weapons and Magazines off body on death
ai_clear_body = False;

/// Clears dead bodies after given time
ai_clean_dead = True;

/// Time (in seconds) after which a dead body will be cleaned up
cleanup_time = 3600;
///////////////////////////////////////////////////////
/// Sets radius for AI patrols (call spawn_group)
ai_patrol_radius = 200;

/// Sets number of waypoints to add in patrol area (call spawn_group)
ai_patrol_radius_wp = 10;

/// Sets behavior of AI groups 
ai_combatmode = "RED";
ai_behaviour = "SAFE";

///////////////////////////////////////////////////////
/// Turns on AI info sharing (Makes them very hard even on low skill settings)
ai_ahare_info = True;

/// Distance AI will let other enemies know of your position (currently only on kill) 
ai_share_distance = 750;

///////////////////////////////////////////////////////
/// Gain humanity for killing an AI unit (True: is on. False: is off.) 
ai_humanity_gain = True;

/// Humanity added for AI kill 
ai_add_humanity = 25;

/// Adds bandit kill when killing an AI (True: on. False: off.)
ai_banditkills_gain = True;

///////////////////////////////////////////////////////
/// Allows you to set a custom skill array for units. (True: will use these arrays. False: will use number in spawn array)
ai_custom_skills = True;

/// Custom skill array. Use 0 to use this with ai_custom_skills = True 
ai_custom_array1 = [
["aimingAccuracy",0.60],
["aimingShake",0.80],
["aimingSpeed",0.85],
["endurance",0.95],
["spotDistance",0.50],
["spotTime",0.50],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",0.90],
["general",0.90]
];

/// Custom skill array. Use 1 to use this with ai_custom_skills = True 
ai_custom_array2 = [
["aimingAccuracy",0.75],
["aimingShake",0.60],
["aimingSpeed",0.85],
["endurance",0.95],
["spotDistance",0.50],
["spotTime",0.50],
["courage",1.00],
["reloadSpeed",1.00],
["commanding",0.70],
["general",0.90]
];

/// Arrays used in "Random" custom skill 
ai_skill_random = [ai_custom_array1,ai_custom_array2];

///////////////////////////////////////////////////////
/// Allows AI on static guns to have a loadout 
ai_static_useweapon = True;

/// Allows you to set custom array for AI on static weapons. (True: On False: Off) 
ai_static_skills = True;

/// Custom skill array. Use this with ai_static_skills = True;
ai_static_array = [
["aimingAccuracy",0.70],
["aimingShake",0.70],
["aimingSpeed",0.70],
["endurance",1.00],
["spotDistance",0.40],
["spotTime",0.40],
["courage",0.50],
["reloadSpeed",1.00],
["commanding",1.00],
["general",1.00]
];

ai_gear0 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

ai_gear1 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

ai_gear2 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

ai_gear3 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

ai_gear4 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

ai_gear5 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

ai_gear6 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];

ai_gear7 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemKnife","ItemFlashlight"]
];
ai_gear_random = [ai_gear0,ai_gear1,ai_gear2,ai_gear3,ai_gear4,ai_gear5,ai_gear6,ai_gear7];

/////////////////////////////////////////////////////////

ai_bp0 = 
[
	"ItemEpinephrine","ItemSodaRabbit","FoodCanBadguy","HandChemBlue","HandChemGreen","HandChemRed","HandRoadFlare","HandRoadFlare"
];
ai_bp1 = 
[
	"ItemEpinephrine","ItemSodaMtngreen","FoodCanGriff","FoodPumpkin","HandChemBlue","HandChemGreen","HandChemRed","HandRoadFlare","HandRoadFlare"
];
ai_bp2 = 
[
	"ItemHeatPack","ItemSodaClays","FoodCanBoneboy","HandChemBlue","HandChemGreen","HandChemRed","HandRoadFlare","HandRoadFlare"
];
ai_bp3 = 
[
	"ItemBloodbag","ItemSodaSmasht","FoodCanCorn","FoodCanOrlok","HandChemBlue","HandChemGreen","HandChemRed","HandRoadFlare","HandRoadFlare"
];
ai_bp4 = 
[
	"ItemMorphine","ItemSodaLemonade","FoodCanDemon","HandChemBlue","HandChemGreen","HandChemRed","HandRoadFlare","HandRoadFlare"
];
ai_bp5 = 
[
	"ItemHeatPack","ItemSodaLvg","FoodCanFraggleos","FoodSunFlowerSeed","HandChemBlue","HandChemGreen","HandChemRed","HandRoadFlare","HandRoadFlare"
];
ai_bp6 = 
[
	"ItemMorphine","ItemSodaMzly","FoodCanHerpy","FoodCanPowell","HandChemBlue","HandChemGreen","HandChemRed","HandRoadFlare","HandRoadFlare"
];

/////////////////////////////////////////////////////////

ai_wep0 = [
["AKS_74_UN_kobra","30Rnd_545x39_AKSD"], 
["M4A3_CCO_EP1","30Rnd_556x45_Stanag"], 
["M4A1_AIM_SD_camo","30Rnd_556x45_StanagSD"], 
["M4A3_RCO_GL_EP1","30Rnd_556x45_Stanag"],
["Sa58V_CCO_EP1","30Rnd_762x39_AK47"]
];

ai_wep1 = [
["AK_107_pso","30Rnd_545x39_AK"], 
["Sa58V_RCO_EP1","30Rnd_762x39_AK47"], 
["SCAR_L_STD_Mk4CQT","30Rnd_556x45_Stanag"], 
["BAF_L86A2_ACOG","30Rnd_556x45_Stanag"], 
["M14_EP1","20Rnd_762x51_DMR"]
];

ai_wep2 = [
["AK_107_GL_pso","30Rnd_545x39_AK"], 
["AK_107_GL_kobra","30Rnd_545x39_AK"], 
["M4A1_HWS_GL","30Rnd_556x45_Stanag"], 
["M16A4_ACG_GL","30Rnd_556x45_Stanag"], 
["M4A3_RCO_GL_EP1","30Rnd_556x45_Stanag"]
];

ai_wep3 = [ 
["DMR_DZ","20Rnd_762x51_DMR"], 
["M40A3","5Rnd_762x51_M24"],
["RPK_74","75Rnd_545x39_RPK"], 
["M249_DZ","200Rnd_556x45_M249"],
["M4A1_HWS_GL","30Rnd_556x45_Stanag"], 
["M16A4_ACG_GL","30Rnd_556x45_Stanag"]
];

ai_wep4 = [
["RPK_74","75Rnd_545x39_RPK"], 
["M249_DZ","200Rnd_556x45_M249"],
["M4A1_HWS_GL","30Rnd_556x45_Stanag"], 
["M16A4_ACG_GL","30Rnd_556x45_Stanag"]
];

/////////////////////////////////////////////////////////

ai_wep0OP = 
[
	["AKS_74_UN_kobra","AKS_74_UN_kobra" call WAI_WPN_MAGS],
	["vil_G36E","vil_G36E" call WAI_WPN_MAGS],
	["FHQ_ACR_TAN_RCO","FHQ_ACR_TAN_RCO" call WAI_WPN_MAGS],
	["vil_G36KVZ","vil_G36KVZ" call WAI_WPN_MAGS],
	["vil_G36CC","vil_G36CC" call WAI_WPN_MAGS],
	["vil_AEK1","vil_AEK1" call WAI_WPN_MAGS],
	["vil_AEK2","vil_AEK2" call WAI_WPN_MAGS],
	["RH_hk416","RH_hk416" call WAI_WPN_MAGS]
];
ai_wep1OP = 
[
	["vil_type88_1","vil_type88_1" call WAI_WPN_MAGS],
	["vil_Vikhr","vil_Vikhr" call WAI_WPN_MAGS],
	["vil_Mg3","vil_Mg3" call WAI_WPN_MAGS],//
	["vil_vsk94","vil_vsk94" call WAI_WPN_MAGS],
	["gms_k98zf39","gms_k98zf39" call WAI_WPN_MAGS],
	["RH_ctar21","RH_ctar21" call WAI_WPN_MAGS],
	["RH_maseotech","RH_maseotech" call WAI_WPN_MAGS],
	["DMR_DZ","DMR_DZ" call WAI_WPN_MAGS]//
];
ai_wep2OP = 
[
	["vil_AKM","vil_AKM" call WAI_WPN_MAGS],
	["vil_AKMS","vil_AKMS" call WAI_WPN_MAGS],
	["FHQ_ACR_TAN_HWS_SD_F","FHQ_ACR_TAN_HWS_SD_F" call WAI_WPN_MAGS],//
	["vil_MPi","vil_MPi" call WAI_WPN_MAGS],
	["vil_AK_74m_gp","vil_AK_74m_gp" call WAI_WPN_MAGS],
	["vil_Abakan_P29","vil_Abakan_P29" call WAI_WPN_MAGS],
	["RH_maseotech","RH_maseotech" call WAI_WPN_MAGS],
	["vil_PKP","vil_PKP" call WAI_WPN_MAGS]//
];
ai_wep3OP = 
[
	["vil_G36VA4Eot","vil_G36VA4Eot" call WAI_WPN_MAGS],
	["vil_type88_1","vil_type88_1" call WAI_WPN_MAGS],
	["FHQ_ACR_TAN_RCO","FHQ_ACR_TAN_RCO" call WAI_WPN_MAGS],//
	["vil_MPi","vil_MPi" call WAI_WPN_MAGS],
	["vil_SKS","vil_SKS" call WAI_WPN_MAGS],
	["vil_VAL_C","vil_VAL_C" call WAI_WPN_MAGS],
	["vil_AK_47","vil_AK_47" call WAI_WPN_MAGS],
	["M249_DZ","M249_DZ" call WAI_WPN_MAGS]//
];
ai_wep4OP = 
[
	["vil_AMD63","vil_AMD63" call WAI_WPN_MAGS],
	["vil_Galil_arm","vil_Galil_arm" call WAI_WPN_MAGS],
	["RH_hk417sp","RH_hk417sp" call WAI_WPN_MAGS],//
	["vil_ak12","vil_ak12" call WAI_WPN_MAGS],
	["RH_mas","RH_mas" call WAI_WPN_MAGS],
	["RH_star21","RH_star21" call WAI_WPN_MAGS],
	["vil_AK_74M_PSO","vil_AK_74M_PSO" call WAI_WPN_MAGS],
	["vil_Minimi","vil_Minimi" call WAI_WPN_MAGS]//
];
if (dayz_instance == 11) then {ai_wep_random = [ai_wep0,ai_wep1,ai_wep2,ai_wep3,ai_wep4];} else {ai_wep_random = [ai_wep0OP,ai_wep1OP,ai_wep2OP,ai_wep3OP,ai_wep4OP];};

ai_packs = [
"DZ_Czech_Vest_Puch",
"DZ_ALICE_Pack_EP1",
"DZ_TK_Assault_Pack_EP1",
"DZ_British_ACU",
"DZ_GunBag_EP1",
"DZ_CivilBackpack_EP1",
"DZ_Backpack_EP1",
"DZ_LargeGunBag_EP1"
];

ai_skin = [
"Bandit1_DZ",
"BanditW1_DZ",
"BanditW2_DZ",
"Camo1_DZ",
"Sniper1_DZ",
"Soldier1_DZ",
"Survivor2_DZ",
"SurvivorW2_DZ",
"GUE_Soldier_MG_DZ",
"GUE_Soldier_Sniper_DZ",
"GUE_Soldier_Crew_DZ",
"GUE_Soldier_2_DZ",
"RU_Policeman_DZ",
"Pilot_EP1_DZ",
"Haris_Press_EP1_DZ",
"Ins_Soldier_GL_DZ",
"GUE_Commander_DZ",
"Priest_DZ",
"Rocker1_DZ",
"Rocker2_DZ",
"Rocker3_DZ",
"TK_INS_Warlord_EP1_DZ",
"TK_INS_Soldier_EP1_DZ",
"Soldier_Sniper_PMC_DZ",
"Soldier_TL_PMC_DZ",
"FR_OHara_DZ",
"FR_Rodriguez_DZ",
"CZ_Soldier_Sniper_EP1_DZ",
"Bandit2_DZ",
"SurvivorWcombat_DZ"
];

WAIconfigloaded = True;