class ExtraRc 
{
	class ItemToolbox 
	{
		class BuildBike 
		{
			text = "Deploy Bike";
			script = "[] execVM 'overheat\actions\player_deploy.sqf'";
		};
	};
	class ItemRadio 
	{
		class GroupManagement 
		{
			text = "Group Management";
			script = "execVM 'overheat\actions\player_managegroup.sqf'";
		};
	};
	class PartOreGold 
	{
		class SmeltGoldOre 
		{
			text = "Smelt into Gold Coins";
			script = "[] spawn player_smeltcoins";
		};
	};
	class Skin_INS_Worker2_DZ { class changeskin1 { text = "GSC Scientist2"; script = "[""Skin_gsc_scientist2"", ""Skin_INS_Worker2_DZ""] call player_wearClothes"; }; };
	class Skin_INS_Bardak_DZ { class changeskin1 { text = "GSC Scientist1"; script = "[""Skin_gsc_scientist1"", ""Skin_INS_Bardak_DZ""] call player_wearClothes"; }; };
	class Skin_INS_Lopotev_DZ { class changeskin1 { text = "SAS1"; script = "[""Skin_SFSG_des_tl"", ""Skin_INS_Lopotev_DZ""] call player_wearClothes"; }; };
	class Skin_RU_Soldier_Crew_DZ { class changeskin1 { text = "SOF Desert Ranger"; script = "[""Skin_Desert_SOF_AC"", ""Skin_RU_Soldier_Crew_DZ""] call player_wearClothes"; }; };
	class Skin_TK_Commander_EP1_DZ { class changeskin1 { text = "SOF Desert Force"; script = "[""Skin_Desert_SOF_AT"", ""Skin_TK_Commander_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_TK_Soldier_Sniper_EP1_DZ { class changeskin1 { text = "FRB Marksman"; script = "[""Skin_frb_mark"", ""Skin_TK_Soldier_Sniper_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_TK_Special_Forces_MG_EP1_DZ { class changeskin1 { text = "FRB Special Force"; script = "[""Skin_frb_tl_mask"", ""Skin_TK_Special_Forces_MG_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_Soldier_TL_PMC_DZ { class changeskin1 { text = "SAS2"; script = "[""Skin_SFSG_mtp_tl"", ""Skin_Soldier_TL_PMC_DZ""] call player_wearClothes"; }; };
	class Skin_Soldier_Sniper_PMC_DZ { class changeskin1 { text = "SAS3"; script = "[""Skin_SFSG_wdl_tl"", ""Skin_Soldier_Sniper_PMC_DZ""] call player_wearClothes"; }; };
	class Skin_Graves_Light_DZ { class changeskin1 { text = "SpecOps"; script = "[""Skin_Mercenary_Default20b"", ""Skin_Graves_Light_DZ""] call player_wearClothes"; }; };
	/**/class Skin_INS_Soldier_CO_DZ { class changeskin1 { text = "Mercenary 1"; script = "[""Skin_FR_Assault_R"", ""Skin_INS_Soldier_CO_DZ""] call player_wearClothes"; }; };
	/**/class Skin_INS_Soldier_AR_DZ { class changeskin1 { text = "Mercenary 2"; script = "[""Skin_WDL_Mercenary_Default16"", ""Skin_INS_Soldier_AR_DZ""] call player_wearClothes"; }; };	
	/**/class Skin_CZ_Soldier_Sniper_EP1_DZ { class changeskin1 { text = "GER Desert"; script = "[""Skin_GER_Soldier_TL_EP1"", ""Skin_CZ_Soldier_Sniper_EP1_DZ""] call player_wearClothes"; }; };
	/**/class Skin_FR_Rodriguez_DZ { class changeskin1 { text = "Mercenary 3"; script = "[""Skin_Mercenary_Default27"", ""Skin_FR_Rodriguez_DZ""] call player_wearClothes"; }; };
	/**/class Skin_FR_OHara_DZ { class changeskin1 { text = "GER Medic"; script = "[""Skin_Ger_Soldier_Medic_EP1"", ""Skin_FR_OHara_DZ""] call player_wearClothes"; }; };
	/**/class Skin_Soldier_Bodyguard_AA12_PMC_DZ { class changeskin1 { text = "Gangster"; script = "[""Skin_Gangsta_merc5"", ""Skin_Soldier_Bodyguard_AA12_PMC_DZ""] call player_wearClothes"; }; };
	/**/class Skin_CZ_Special_Forces_GL_DES_EP1_DZ { class changeskin1 { text = "SEAL"; script = "[""Skin_Navy_SEAL_SD"", ""Skin_CZ_Special_Forces_GL_DES_EP1_DZ""] call player_wearClothes"; }; };
	/**/class Skin_TK_INS_Warlord_EP1_DZ { class changeskin1 { text = "CDF Commander"; script = "[""Skin_CDF_Commander"", ""Skin_TK_INS_Warlord_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_Drake_Light_DZ { class changeskin1 { text = "SEAL Marksman"; script = "[""Skin_Navy_SEAL_TL"", ""Skin_Drake_Light_DZ""] call player_wearClothes"; }; };
	class Skin_TK_INS_Soldier_EP1_DZ { class changeskin1 { text = "USMC Pilot"; script = "[""Skin_USMC_Soldier_Pilot"", ""Skin_TK_INS_Soldier_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_2_DZ { class changeskin1 { text = "Stalker Neutral"; script = "[""Skin_gsc_eco_stalker_head_neutral"", ""Skin_GUE_Soldier_2_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_CO_DZ { class changeskin1 { text = "Stalker Urban"; script = "[""Skin_gsc_eco_stalker_mask_camo"", ""Skin_GUE_Soldier_CO_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_Crew_DZ { class changeskin1 { text = "Stalker Elite"; script = "[""Skin_gsc_eco_stalker_mask_duty"", ""Skin_GUE_Soldier_Crew_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_Sniper_DZ { class changeskin1 { text = "Stalker Camo"; script = "[""Skin_gsc_eco_stalker_mask_fred"", ""Skin_GUE_Soldier_Sniper_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Soldier_MG_DZ { class changeskin1 { text = "Stalker Wood"; script = "[""Skin_gsc_eco_stalker_mask_neutral"", ""Skin_GUE_Soldier_MG_DZ""] call player_wearClothes"; }; };
	class Skin_Bandit2_DZ { class changeskin1 { text = "Urban Soldier"; script = "[""Skin_US_Delta_Force_Marksman_EP1"", ""Skin_Bandit2_DZ""] call player_wearClothes"; }; };
	class Skin_Bandit1_DZ { class changeskin1 { text = "SABASS US"; script = "[""Skin_arma1_us_soldier_sabass"", ""Skin_Bandit1_DZ""] call player_wearClothes"; }; };
	class Skin_Rocker4_DZ { class changeskin1 { text = "SFSG Woodland"; script = "[""Skin_SFSG_wdl_mrk"", ""Skin_Rocker4_DZ""] call player_wearClothes"; }; };
	class Skin_Rocker3_DZ { class changeskin1 { text = "Stalker"; script = "[""Skin_gsc_eco_stalker_head_fred"", ""Skin_Rocker3_DZ""] call player_wearClothes"; }; };
	class Skin_Rocker2_DZ { class changeskin1 { text = "GSC Scientist3"; script = "[""Skin_gsc_scientist1_head"", ""Skin_Rocker2_DZ""] call player_wearClothes"; }; };
	class Skin_Rocker1_DZ { class changeskin1 { text = "GSC Scientist4"; script = "[""Skin_gsc_scientist2_head"", ""Skin_Rocker1_DZ""] call player_wearClothes"; }; };
	class Skin_Priest_DZ { class changeskin1 { text = "SOF Desert"; script = "[""Skin_Desert_SOF_DA1a"", ""Skin_Priest_DZ""] call player_wearClothes"; }; };
	class Skin_Functionary1_EP1_DZ { class changeskin1 { text = "0verHeaT"; script = "[""Skin_UKSF_wdl_demo_l"", ""Skin_Functionary1_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_GUE_Commander_DZ { class changeskin1 { text = "RU Bodyguard"; script = "[""Skin_Soldier_Bodyguard_M4_PMC"", ""Skin_GUE_Commander_DZ""] call player_wearClothes"; }; };
	class Skin_Ins_Soldier_GL_DZ { class changeskin1 { text = "UKSF Desert"; script = "[""Skin_UKSF_des_mrk"", ""Skin_Ins_Soldier_GL_DZ""] call player_wearClothes"; }; };
	class Skin_Pilot_EP1_DZ { class changeskin1 { text = "UKSF Marksman"; script = "[""Skin_UKSF_des_mrk_l"", ""Skin_Pilot_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_Haris_Press_EP1_DZ { class changeskin1 { text = "UKSF Woodland"; script = "[""Skin_UKSF_wdl_mrk_l"", ""Skin_Haris_Press_EP1_DZ""] call player_wearClothes"; }; };
	class Skin_RU_Policeman_DZ { class changeskin1 { text = "UKSF Desert"; script = "[""Skin_UKSF_des_demo_l"", ""Skin_RU_Policeman_DZ""] call player_wearClothes"; }; };
	class Skin_Rocket_DZ { class changeskin1 { text = "UN Officier"; script = "[""Skin_UN_CDF_Soldier_Officer_EP1"", ""Skin_Rocket_DZ""] call player_wearClothes"; }; };
	class Skin_Soldier1_DZ { class changeskin1 { text = "UN Soldier"; script = "[""Skin_UN_CDF_Soldier_EP1"", ""Skin_Soldier1_DZ""] call player_wearClothes"; }; };
	class Skin_Camo1_DZ { class changeskin1 { text = "Winter Soldier"; script = "[""Skin_Winter_SOF_DA1b"", ""Skin_Camo1_DZ""] call player_wearClothes"; }; };
	class Skin_Sniper1_DZ { class changeskin1 { text = "Winter Sniper"; script = "[""Skin_Winter_SOF_Marksman"", ""Skin_Sniper1_DZ""] call player_wearClothes"; }; };
};