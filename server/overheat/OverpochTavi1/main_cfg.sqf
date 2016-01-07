/*
	Main Cfg for OverpochTavi1; instance 13
*/

// Map addons
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\bandit.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\bilgrad.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\branibor.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\hero.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\lyepestok.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\miscvendors.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\VGSabina.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\wholesalers.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\vgmission.sqf";
call compile preProcessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochTavi1\agents_tavi.sqf";

//Loadout
vg_loadout = compile preprocessFileLineNumbers "\z\addons\dayz_server\init\vg_loadout.sqf";

// Trader config
[] execVM "\z\addons\dayz_server\overheat\OverpochTavi1\trader_config.sqf";

// You need to configure each file at "\z\addons\dayz_server\DynamicTraders\"+woldName+"\traders\"
DynTraderCfg = 
[
	[4, "general.sqf", 		"General Traders", 	"ColorBlack",		"mil_triangle"],
	[2, "helicopters.sqf", "Helicopters", 			"ColorBlack",		"mil_triangle"],
	[4, "medical.sqf", 		"Medical Trader", 	"ColorBlack",		"mil_triangle"],
	[2, "vehicles.sqf", 		"Vehicle Trader", 	"ColorBlack",		"mil_triangle"],
	[2, "weapons.sqf", 		"Weapons Trader", 	"ColorBlack",		"mil_triangle"],
	[4, "wholesaler.sqf", 	"Wholesaler", 			"ColorBlack",		"mil_triangle"],
	[2, "boat.sqf", 				"Boat", 						"ColorBlack",		"mil_triangle"],
	[12, "bank.sqf", 			"Bank", 						"ColorRed",		"mil_triangle"]
]; 

// additional markers, which you can define here
// format: [position,name,colour,type]
//PV_TraderMarkers = [];