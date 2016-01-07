_box = _this;

_loot_list = [
	[
		[
			["BAF_AS50_scoped", 1],
			["USSR_cheytacM200_sd", 1],
			["RH_tec9", 2],
			["M14_EP1", (ceil(random 3))],
			["Mk_48_DZ", (ceil(random 3))],
			["M4A3_CCO_EP1", (ceil(random 3))],
			["M4SPR", (ceil(random 3))],
			["M4A1_AIM_SD_camo", (ceil(random 3))],
			["M40A3", (ceil(random 3))],
			["M24_des_EP1", (ceil(random 3))],
			["DMR_DZ", (ceil(random 3))],
			["Binocular_Vector", 4],
			["NVGoggles", 2],
			["ItemGPS", 2]
		],
		[
			["5Rnd_127x99_as50", 4],
			["USSR_5Rnd_408", 4],
			["RH_30Rnd_9x19_tec", 8],
			["20Rnd_762x51_DMR", 20],
			["30Rnd_556x45_Stanag", 20],
			["5Rnd_762x51_M24", 20],
			["30Rnd_556x45_StanagSD", 20],
			["100Rnd_127x99_M2", (floor(random 5))],
			["50Rnd_127x107_DSHKM", (floor(random 5))],
			["2000Rnd_762x51_M134", (floor(random 5))]
		]
	],
	[
		[
			["Vil_RPG29", 1],
			["RH_tec9", 2],
			["M14_EP1", (ceil(random 3))],
			["Mk_48_DZ", (ceil(random 3))],
			["M4A3_CCO_EP1", (ceil(random 3))],
			["M4SPR", (ceil(random 3))],
			["M4A1_AIM_SD_camo", (ceil(random 3))],
			["M40A3", (ceil(random 3))],
			["M24_des_EP1", (ceil(random 3))],
			["DMR_DZ", (ceil(random 3))],
			["Binocular_Vector", 4],
			["NVGoggles", 2],
			["ItemGPS", 2]
		],
		[
			["Vil_PG29_HEAT", 1],
			["RH_30Rnd_9x19_tec", 8],
			["PipeBomb", 2],
			["20Rnd_762x51_DMR", 20],
			["30Rnd_556x45_Stanag", 20],
			["5Rnd_762x51_M24", 20],
			["30Rnd_556x45_StanagSD", 20],
			["HandGrenade_West", 5],
			["HandGrenade_East", 5],
			["SmokeShell", 5],
			["SmokeShellGreen", 5],
			["SmokeShellRed", 5],		
			["SmokeShellYellow", 5],		
			["SmokeShellOrange", 5],		
			["SmokeShellPurple", 5],		
			["SmokeShellBlue", 5],
			["100Rnd_127x99_M2", (floor(random 5))],
			["50Rnd_127x107_DSHKM", (floor(random 5))],
			["2000Rnd_762x51_M134", (floor(random 5))]			
		]
	],
	[
		[
			["M107_DZ", 1],
			["USSR_cheytacM200_sd", 1],
			["SCAR_L_CQC", 1],
			["SCAR_L_CQC_Holo", 1],
			["SCAR_L_STD_Mk4CQT", 1],
			["SCAR_L_STD_EGLM_RCO", 1],
			["SCAR_L_CQC_EGLM_Holo", 1],
			["SCAR_L_STD_HOLO", 1],
			["SCAR_L_CQC_CCO_SD", 1],
			["SCAR_H_CQC_CCO", 1],
			["SCAR_H_CQC_CCO_SD", 1],
			["SCAR_H_STD_EGLM_Spect", 1],
			["SCAR_H_LNG_Sniper", 1],
			["SCAR_H_LNG_Sniper_SD", 1],
			["RH_tec9", 2],
			["Binocular_Vector", 4],
			["NVGoggles", 2],
			["ItemGPS", 2]
		],
		[	
			["10Rnd_127x99_m107", 4],
			["RH_30Rnd_9x19_tec", 8],
			["20Rnd_762x51_B_SCAR", 15],
			["20rnd_762x51_SB_SCAR", 15],
			["30Rnd_556x45_Stanag", 15],
			["30Rnd_556x45_StanagSD", 15],
			["100Rnd_127x99_M2", (floor(random 5))],
			["50Rnd_127x107_DSHKM", (floor(random 5))],
			["2000Rnd_762x51_M134", (floor(random 5))]
		]	
	],	
	[
		[
			["SMAW", 1],
			["RH_tec9", 2],
			["M14_EP1", (ceil(random 3))],
			["Mk_48_DZ", (ceil(random 3))],
			["M4A3_CCO_EP1", (ceil(random 3))],
			["M4SPR", (ceil(random 3))],
			["M4A1_AIM_SD_camo", (ceil(random 3))],
			["M40A3", (ceil(random 3))],
			["M24_des_EP1", (ceil(random 3))],
			["DMR_DZ", (ceil(random 3))],
			["Binocular_Vector", 4],
			["NVGoggles", 2],
			["ItemGPS", 2]
		],
		[
			["SMAW_HEAA", 1],
			["RH_30Rnd_9x19_tec", 8],
			["20Rnd_762x51_DMR", 20],
			["30Rnd_556x45_Stanag", 20],
			["5Rnd_762x51_M24", 20],
			["30Rnd_556x45_StanagSD", 20],			
			["PipeBomb", 2],
			["HandGrenade_West", 5],
			["HandGrenade_East", 5],
			["SmokeShell", 5],
			["SmokeShellGreen", 5],
			["SmokeShellRed", 5],
			["SmokeShellYellow", 5],		
			["SmokeShellOrange", 5],		
			["SmokeShellPurple", 5],		
			["SmokeShellBlue", 5],
			["100Rnd_127x99_M2", (floor(random 5))],
			["50Rnd_127x107_DSHKM", (floor(random 5))],
			["2000Rnd_762x51_M134", (floor(random 5))]			
		]
	]
];

_loot = _loot_list call BIS_fnc_selectRandom;

{
	_box addWeaponCargoGlobal [(_x select 0),(_x select 1)];
} count (_loot select 0);

{
	_box addMagazineCargoGlobal [(_x select 0),(_x select 1)];
} count (_loot select 1);