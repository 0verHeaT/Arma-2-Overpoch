/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: variables.sqf
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
OPSkins = ["gsc_scientist2","gsc_scientist1","SFSG_des_tl","Desert_SOF_AC","Desert_SOF_AT","frb_mark","frb_tl_mask","SFSG_mtp_tl","SFSG_wdl_tl","Mercenary_Default20b",
"Navy_SEAL_TL","USMC_Soldier_Pilot","gsc_eco_stalker_head_neutral","gsc_eco_stalker_mask_camo","gsc_eco_stalker_mask_duty","gsc_eco_stalker_mask_fred","gsc_eco_stalker_mask_neutral",
"US_Delta_Force_Marksman_EP1","arma1_us_soldier_sabass","SFSG_wdl_mrk","gsc_eco_stalker_head_fred","gsc_scientist1_head","gsc_scientist2_head","Desert_SOF_DA1a","UKSF_wdl_demo_l",
"Soldier_Bodyguard_M4_PMC","UKSF_des_mrk","UKSF_des_mrk_l","UKSF_wdl_mrk_l","UKSF_des_demo_l","UN_CDF_Soldier_Officer_EP1","UN_CDF_Soldier_EP1","Winter_SOF_DA1b","Winter_SOF_Marksman",
"FR_Assault_R","Ger_Soldier_Medic_EP1","Navy_SEAL_SD","Mercenary_Default27","WDL_Mercenary_Default16","CDF_Commander","Gangsta_merc5","GER_Soldier_TL_EP1"];

{AllPlayers set [count AllPlayers,_x];} count OPSkins;

BuildingCategory = [["Static Guns","StaticGuns"],["Vehicle Garages","Garages"],["Helipads","Helipads"],["Fuel Tanks","FuelTanks"],["Fences/Barriers","Barriers"],["Containers/Crates","Containers"],["Towers","Towers"],["Light Poles","Lights"],["Plants/Trees","CustomPlants"]];

CurrentCatIndex = -1;
BuildingsCatList = -1;
BuildingItemList = -1;

TraderCurrentCatIndex = -1;
TraderCatList = -1;
TraderItemList = -1;

EpochDeathBoardDialogSText = 21001;

BankDialogTransferAmount = 13000;
BankDialogPlayerBalance = 13001;
BankDialogBankBalance = 13002;
GivePlayerDialogTransferAmount = 14000;
GivePlayerDialogPlayerBalance = 14001;

dayz_resetSelfActions = {
	s_player_fire =			-1;
	s_player_cook =			-1;
	s_player_boil =			-1;
	s_player_fireout =		-1;
	s_player_butcher =		-1;
	s_player_packtent = 	-1;
	s_player_packvault = 	-1;
	s_player_lockvault = 	-1;
	s_player_unlockvault = 	-1;
	s_player_fillwater =	-1;
	s_player_fillwater2 = 	-1;
	s_player_fillfuel = 	-1;
	s_player_grabflare = 	-1;
	s_player_callzombies = 	-1;
	s_player_showname = 	-1;
	s_player_debuglootpos = 	-1;
	s_player_pzombiesattack = 	-1;
	s_player_pzombiesvision =	-1;
	s_player_pzombiesfeed = 	-1;
	s_player_removeflare = 	-1;
	s_player_painkiller =	-1;
	s_player_studybody = 	-1;
	s_player_tamedog =		-1;
	s_player_madsci_crtl =	-1;
	s_player_parts_crtl =	-1;
	s_build_Sandbag1_DZ = 	-1;
	s_build_Hedgehog_DZ =	-1;
	s_build_Wire_cat1 =		-1;
	s_player_deleteBuild =	-1;
	s_player_forceSave = 	-1;
	s_player_checkGear = 	-1;
	s_player_flipveh = 		-1;
	s_player_stats =		-1;
	s_player_sleep =		-1;
	s_player_movedog =		-1;
	s_player_speeddog =		-1;
	s_player_calldog = 		-1;
	s_player_feeddog = 		-1;
	s_player_waterdog = 	-1;
	s_player_staydog = 		-1;
	s_player_trackdog = 	-1;
	s_player_barkdog = 		-1;
	s_player_warndog = 		-1;
	s_player_followdog = 	-1;
	s_player_repair_crtl =  -1;
	s_player_information =  -1;
	s_player_fuelauto    =  -1;
	s_player_fuelauto2    =  -1;
	s_player_fillgen	 =  -1;
	s_player_upgrade_build	 =  -1;
	s_player_maint_build	 =  -1;
	s_player_downgrade_build	 =  -1;
	s_player_towing = -1;
	s_halo_action = -1;
	s_player_SurrenderedGear = -1;
	s_player_maintain_area = -1;
	s_player_maintain_area_preview = -1;
	s_player_heli_lift = -1;
	s_player_heli_detach = -1;
	s_player_lockUnlock_crtl = -1;
	/*** Added ***/
	s_player_clothes = -1;
	s_player_takecash = -1;
	s_building_snapping = -1;
	s_player_autorefuel = -1;
	s_givemoney_dialog = -1;
	s_bank_dialog2 = -1;
	s_player_plotpole_dialog = -1;
	s_player_garage = -1;
	s_player_packbike = -1;
	s_player_plrtraderdata = -1;
	s_player_twp = -1;
	s_player_specBuild = -1;
};
call dayz_resetSelfActions;

VGAllowedBuildList = [];
{
	private ["_cat","_obj"];
	_cat = (missionConfigFile >> "CfgBuildingCategory" >> (_x select 1));
	for "_i" from 0 to ((count _cat) - 1) do {
		if (getText ((_cat select _i) >> "type") == "CfgBuildings") then {
			_obj = configName (_cat select _i);
			VGAllowedBuildList set [count VGAllowedBuildList,_obj];
		};
	};
} count BuildingCategory;

dayz_allowedObjects = dayz_allowedObjects + VGAllowedBuildList;
DZE_maintainClasses = dayz_allowedObjects;

VGIndestructibles = 
[
	"CinderWallHalf_DZ",
	"CinderWall_DZ",
	"MetalFloor_DZ"
];
VGIndestructibles = VGIndestructibles + VGGarage;

if(isServer) then {
	VGAllowedVehList = [];
	{
		private ["_cat","_obj"];
		_cat = (missionConfigFile >> "CfgBuildingCategory" >> (_x select 1));
		for "_i" from 0 to ((count _cat) - 1) do {
			if (getText ((_cat select _i) >> "type") == "CfgVehicles") then {
				_obj = configName (_cat select _i);
				VGAllowedVehList set [count VGAllowedVehList,_obj];
			};
		};
	} count BuildingCategory;
	DZE_safeVehicle = DZE_safeVehicle + VGAllowedVehList + ["MMT_Civ"];
};
