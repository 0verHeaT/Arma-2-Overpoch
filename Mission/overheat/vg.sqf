/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: vg.sqf
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

vgmiliterized = ["OverpochPanthera1"];

if (dayZ_instance in [11,111]) then
{
	spawnShoremode = 1;
	spawnArea= 1500;
	dayz_minpos = -1; 
	dayz_maxpos = 16000;
	dayz_MapArea = 14000;
	MaxVehicleLimit = 300;
	MaxDynamicDebris = 50;
	VGSafezones = 
	[
		[[1689.24,2347.96],75,true],
		[[12944.227,12766.889],75,true],
		[[4064.2258,11665.938],75,true],
		[[11447.91,11364.536],75,true],
		[[1606.6443,7803.5156],75,true],
		[[6326.4805,7809.4888],75,true]
	];
	VGMarkers = 
	[
		[[1689.24,2347.96],"Trader City Kamenka","ColorBlack","mil_circle"]
	];
	DZE_defaultSkin = [["Skin_Rocket_DZ","Skin_Haris_Press_EP1_DZ","Skin_Pilot_EP1_DZ","Skin_Survivor2_DZ"],["Skin_SurvivorW2_DZ","Skin_SurvivorW3_DZ","Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_SurvivorWpink_DZ"]];
	//if (dayZ_instance == 111) then {VGMarkers = VGMarkers + [[[533.692,13777.1],"NATO Supplies","ColorOrange","mil_box"]];VGSafezones = VGSafezones + [[[533.692,13777.1],50,true]];};
};

if (dayZ_instance == 16) then
{
	spawnShoremode = 1;
	spawnArea= 1500;
	dayz_minpos = -1; 
	dayz_maxpos = 14000;
	dayz_MapArea = 12000;
	MaxVehicleLimit = 150; 
	MaxDynamicDebris = 25; 
	VGSafezones = 
	[
		[[4426,1634.99,0],75,true],     //pikia
		[[8686.21,3140.79,0],75,true],  //selca 
		[[4338.05,6312.71,0],75,true],  //planica 
		[[2250.35,9475.07,0],40,true],  //vehicle/parts vendors 
		[[3358.38,2295.05,0],30,true],  //sams boats
		[[7220.09,734.313,0],30,true],  //south wholesaler 
		[[9051.32,4056.74,0],40,true],  //darrens hero vehicles 
		[[1909.35,3620.1,0],40,true],   //bandit trader 
		[[4768.11,7483.19,0],40,true],  //awols airfield 
		[[5223.92,8227.31,0],30,true],  //north wholesaler 
		[[3795.37,7650.69,0],40,true],  //north boat vendor
		[[544.51703,8944.8779],50,true]  
	];
	VGMarkers = 
	[
		[[544.51703,8944.8779],"NATO Supplies","ColorOrange","mil_box"]
	];
	DZE_defaultSkin = [["Skin_Rocket_DZ","Skin_Haris_Press_EP1_DZ","Skin_Pilot_EP1_DZ","Skin_Survivor2_DZ"],["Skin_SurvivorW2_DZ","Skin_SurvivorW3_DZ","Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_SurvivorWpink_DZ"]];
};

if (dayZ_instance == 13) then 
{
	spawnShoremode = 1;
	spawnArea = 2500;
	dayz_spawnselection = 0;
	dayz_minpos = -26000; 
	dayz_maxpos = 26000;
	dayz_MapArea = 20000;
	MaxVehicleLimit = 300; 
	MaxDynamicDebris = 25; 
	VGSafezones = 
	[
		[[15309.663, 9278.4912],50,true],
		[[11698.81, 15210.121],50,true],
		[[5538.7354, 8762.2695],50,true],
		[[7376.6084, 4296.5879],75,true],
		[[6811.8,8538.71],50,true],
		[[10387.196, 18226.186],50,true],
		[[16555.8,10162.5],50,true]
	];
	VGMarkers = 
	[
		[[10387.196, 18226.186],"Airfield","ColorGreen","mil_triangle"]
	];
	DZE_defaultSkin = [["Skin_Rocket_DZ","Skin_Haris_Press_EP1_DZ","Skin_Pilot_EP1_DZ","Skin_Survivor2_DZ"],["Skin_SurvivorW2_DZ","Skin_SurvivorW3_DZ","Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_SurvivorWpink_DZ"]];
};

if (vgserver == "devserver") then {MaxVehicleLimit = 0;};

DefaultMagazines = ["ItemBandage","ItemBandage","ItemMorphine","ItemPainkiller","ItemWaterbottleBoiled","FoodSteakCooked"];
DefaultWeapons = ["ItemFlashlight","ItemHatchet","ItemMap","ItemToolbox","ItemRadio"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";
DefaultBackpackWeapon = "";

VGAdmins = [];

VGGarage = ["Land_MBG_Garage_Single_A","Land_MBG_Garage_Single_B","Land_MBG_Garage_Single_C","Land_MBG_Garage_Single_D"];
VGStatic = ["M2StaticMG","DSHKM_TK_INS_EP1","BAF_L2A1_Tripod_D"];
VGVehRemoveAmmo = ["BAF_Jackal2_L2A1_W","HMMWV_M998_crows_M2_DES_EP1","BTR90_HQ_DZE","LAV25_HQ_DZE","GAZ_Vodnik_HMG","Ka52","Mi171Sh_CZ_EP1","UH1H_TK_EP1","UH60M_MEV_EP1","AH64D_EP1","AH1Z"];

dayz_maxZeds = 400;
dayz_maxGlobalZombiesIncrease = 16;
dayz_zedsAttackVehicles = false;
dayz_antihack = 0;
dayz_REsec = 0;
dayz_paraSpawn = false;
dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;
dayz_maxAnimals = 10;
MaxMineVeins = 50;
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; 
DynamicVehicleDamageHigh = 100;
VGClientViewDistance = 1400;
setViewDistance VGClientViewDistance;

MaxBankMoney = 350000;
CurrencyName = "Gold Coins";
DZE_PlotPole = [60,60];
DZE_BuildOnRoads = false;
DZE_BuildingLimit = 500;
DZE_ConfigTrader = true;
DZE_MissionLootTable = if (dayZ_instance == 11) then { false } else { true };
DZE_DeathMsgGlobal = false;
DZE_SelfTransfuse = true;
DZE_R3F_WEIGHT = false;
DZE_PlayerZed = false;
dayz_fullMoonNights = true;
canbuild = true;

DZE_noRotate = ["VaultStorageLocked","Plastic_Pole_EP1_DZ","LockboxStorageLocked"];
DZE_curPitch = 45;


EpochEvents = 
[
	["any","any","any","any",0,"supply_drop"],
	["any","any","any","any",10,"weapon_drop"],
	["any","any","any","any",20,"crash_spawner"],
	["any","any","any","any",30,"supply_drop"],
	["any","any","any","any",40,"weapon_drop"],
	["any","any","any","any",50,"crash_spawner"]
];

VGColourVehicles = 
[
	"ATV_CZ_EP1",
	"ATV_US_EP1",
	"SUV_TK_CIV_EP1",
	"Mi17_Civilian_DZ",
	"UH60M_EP1_DZE",
	"Ka52",
	"Ka52Black",
	"UH1H_TK_EP1",
	"UH60M_MEV_EP1",
	"HMMWV_M998A2_SOV_DES_EP1_DZE",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
	"UAZ_MG_TK_EP1_DZE",
	"Ural_CDF",
	"Ural_TK_CIV_EP1",
	"Ural_UN_EP1",
	"V3S_Open_TK_CIV_EP1",
	"Kamaz",
	"MTVR_DES_EP1",
	"MH6J_DZ",
	"AH6X_DZ",
	"HMMWV_M1035_DES_EP1",
	"HMMWV_Ambulance",
	"HMMWV_Ambulance_CZ_DES_EP1",
	"HMMWV_DES_EP1",
	"HMMWV_DZ",
	"hilux1_civil_3_open_EP1",
	"hilux1_civil_1_open",
	"datsun1_civil_1_open",
	"Pickup_PK_GUE_DZE",
	"Pickup_PK_INS_DZE",
	"Pickup_PK_TK_GUE_EP1_DZE",
	"Offroad_DSHKM_Gue_DZE",
	"LAV25_HQ",
	"BTR90_HQ_DZE",
	"M1133_MEV_EP1",
	"pook_H13_amphib",
	"pook_H13_civ",
	"pook_H13_medevac_CIV",
	"pook_H13_transport",
	"pook_H13_gunship_PMC",
	"pook_H13_transport_INS",
	"VWGolf"
];