/*
	Main Cfg for chernaurs; instance 111
*/

// Map addons
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochCherno1\balota.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochCherno1\cherno.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochCherno1\kamenka.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochCherno1\nwaf.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochCherno1\starry.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochCherno1\extra_chernarus.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochCherno1\agents_chernarus.sqf";
call compile preprocessFileLineNumbers "\z\addons\dayz_server\overheat\OverpochCherno1\vgmission.sqf";

//Loadout
vg_loadout = compile preprocessFileLineNumbers "\z\addons\dayz_server\init\vg_loadout.sqf";

// Trader config
[] execVM "\z\addons\dayz_server\overheat\OverpochCherno1\trader_config.sqf";

// You need to configure each file at "\z\addons\dayz_server\DynamicTraders\"+woldName+"\traders\"
DynTraderCfg = 
[
	[4, "general.sqf", 		"General Traders", 	"ColorBlack",		"mil_triangle"],
	[1, "helicopters.sqf", "Helicopters", 			"ColorBlack",		"mil_triangle"],
	[2, "medical.sqf", 		"Medical Trader", 	"ColorBlack",		"mil_triangle"],
	[1, "vehicles.sqf", 		"Vehicle Trader", 	"ColorBlack",		"mil_triangle"],
	[1, "weapons.sqf", 		"Weapons Trader", 	"ColorBlack",		"mil_triangle"],
	[3, "wholesaler.sqf", 	"Wholesaler", 			"ColorBlack",		"mil_triangle"],
	[1, "boat.sqf", 				"Boat", 						"ColorBlack",		"mil_triangle"],
	[8, "bank.sqf", 				"Bank", 						"ColorRed",		"mil_triangle"]
]; 

// additional markers, which you can define here
// format: [position,name,colour,type]
//PV_TraderMarkers = [];