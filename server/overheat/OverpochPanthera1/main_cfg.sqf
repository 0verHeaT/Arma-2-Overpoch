/*
	Main Cfg for panthera2; instance 16
*/

// Map addons
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochPanthera1\extra_panthera.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochPanthera1\vgmission.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochPanthera1\agents_panthera.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochPanthera1\Lukes_PreFab.sqf";

//Loadout
vg_loadout = compile preprocessFileLineNumbers "\z\addons\dayz_server\init\vg_loadout.sqf";

// Trader config
[] execVM "\z\addons\dayz_server\overheat\OverpochPanthera1\trader_config.sqf";

// You need to configure each file at "\z\addons\dayz_server\DynamicTraders\"+woldName+"\traders\"
DynTraderCfg = 
[
	[2, "general.sqf", 		"General Traders", 	"ColorBlack",		"mil_triangle"],
	[1, "helicopters.sqf", "Helicopters", 			"ColorBlack",		"mil_triangle"],
	[1, "medical.sqf", 		"Medical Trader", 	"ColorBlack",		"mil_triangle"],
	[1, "vehicles.sqf", 		"Vehicle Trader", 	"ColorBlack",		"mil_triangle"],
	[1, "weapons.sqf", 		"Weapons Trader", 	"ColorBlack",		"mil_triangle"],
	[2, "wholesaler.sqf", 	"Wholesaler", 			"ColorBlack",		"mil_triangle"],
	[1, "boat.sqf", 				"Boat", 						"ColorBlack",		"mil_triangle"],
	[4, "bank.sqf", 				"Bank", 						"ColorRed",		"mil_triangle"]
]; 

// additional markers, which you can define here
// format: [position,name,colour,type]
PV_TraderMarkers = [];