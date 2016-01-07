private ["_serverTraders","_array","_bankTrader","_donatorTrader"];

_serverTraders = [
"Tanny_PMC",
"BAF_Soldier_AMG_W",
"BAF_Soldier_AAA_DDPM",
"CZ_Special_Forces_MG_DES_EP1",
"Damsel5",
"GUE_Commander",
"GUE_Woodlander1",
"GUE_Woodlander3",
"GUE_Soldier_Sab",
"GUE_Soldier_Pilot",
"GUE_Soldier_2",
"Soldier_PMC",
"Citizen2_EP1",
"Rita_Ensler_EP1",
"RU_Farmwife1",
"US_Soldier_Medic_EP1",
"USMC_Soldier_TL",
"USMC_SoldierS_Engineer",
"UN_CDF_Soldier_AAT_EP1",
"ValentinaVictim",
"UN_CDF_Soldier_MG_EP1",
"GUE_Soldier_1",
"FR_Corpsman",
"GUE_Soldier_AR",
"Dr_Hladik_EP1",
"RU_Villager1",
"Reynolds_PMC",
"US_Army_Soldier_AA",
"Worker1",
"Mercenary_Default18"
];

_bankTrader = ["Functionary2_EP1"];
_donatorTrader = ["TK_Soldier_Sniper_Night_EP1"];

menu_TK_Soldier_Sniper_Night_EP1 = [ // Donator
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns And Single Shot",641],["Sniper Rifle",640],["Submachine Guns",642],["Overwatch Vil",1002],["Overwatch Tar",1003],["Overwatch Sniper",1011],["Overwatch Scar",1004],["Overwatch Sidearm",1001],["Overwatch Mas",1007],["Overwatch Hk417",1009],["Overwatch Hk416",1008],["Overwatch Dmr",1010],["Overwatch Acr",1005],["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],["Pistol Ammo",611],["Shotguns And Single Shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612],["Overwatch Pistol Ammo",1012],["Overwatch Gun Ammo",1013],["Better Weapons",477],["Toolbelt Items",510],["Vehicle Parts",509],["Better Clothes",575],["Ammunition",478],["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Chemlites / Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Black Market Weapons",526],["Black Market Ammo",527],["Explosives",529],["Wood Buildables",901],["Cinder Buildables",902],["Crafting Stuff",903],["Storage",904],["Misc",905],["Money",700]],
	[],
	"neutral"
];
menu_Mercenary_Default18 = [
	[["Overwatch Pistol Ammo",2100],["Overwatch Gun Ammo",2101],["Overwatch Pistols",2000],["SCAR Variants",700],["HK416 Variants",2001],
	["HK417 Variants",2002],["ACR Variants",2006],["TAR Variants",2003],["MAS Variants",2004],["G3 Variants",2008],["G36 Variants",2012],["AK Variants",2011],
	["DMR Variants",2005],["SMG Variants",2010],["LMG Variants",2009],["Spare Guns",2013],["Sniper Variants",2007]],
	[],
	"neutral"
];
//NATO Supplies
menu_US_Army_Soldier_AA = [
	[["Weapons",706],["Ammunition",701],["Explosives",707],["Military Armed",703],["Helicopter Armed",704],["Vehicle Ammunition",705]],
	[],
	"neutral"
];
// For dynamic traders
menu_Worker1 = [
	[["Helicopters Unarmed",519]],
	[],
	"neutral"
];
// Hero Vendor P - DARRENS'S HERO VEHICLES
menu_Tanny_PMC = [
	[["Ammunition",478],["Clothes",476],["Helicopter Armed",493],["Military Armed",562],["Trucks Armed",479],["Weapons",477]],
	[],
	"hero"
];
// Ammunition Neutral P
menu_BAF_Soldier_AMG_W = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],
	["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612]],
	[],
	"neutral"
];
// Weapons Neutral P
menu_BAF_Soldier_AAA_DDPM = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]],
	[],
	"neutral"
];
// Neutral Vehicles P - TRADER CITY SELCA
menu_CZ_Special_Forces_MG_DES_EP1 = [
	[["Sports Cars",2201],["Super Cars",2202],["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
// General Store P
menu_Damsel5 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Trade Metals",939]],
	[],
	"neutral"
];
// Weapons neutral 1P
menu_GUE_Commander = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]],
	[],
	"neutral"
];
// Ammunition Neutral 1P
menu_GUE_Woodlander1 = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],
	["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612]],
	[],
	"neutral"
];
// Neutral Building/Parts P - TRADER CITY SELCA
menu_GUE_Woodlander3 = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];
// Bandit Trader P - BANDIT TRADER
menu_GUE_Soldier_Sab = [
	[["Ammunition",577],["Clothing",575],["Helicopter Armed",512],["Military Armed",569],["Trucks Armed",534],["Weapons",627]],
	[],
	"hostile"
];
// Aircraft Dealer P - AWOLS'S AIRFIELD
menu_GUE_Soldier_Pilot = [
	[["Aircraft Armed",2200],["Aircraft Unarmed",517],["Helicopters Unarmed",519]],
	[],
	"neutral"
];
// Vehicles Neutral 1P - TRADER CITY PIKIA
menu_GUE_Soldier_2 = [
	[["Sports Cars",2201],["Super Cars",2202],["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
// Black Market Vendor 1P
menu_Soldier_PMC = [
	[["Black Market Ammo",527],["Black Market Weapons",526],["Explosives",702]],
	[],
	"neutral"
];
// Neutral Building/Parts 1P - TRADER CITY PIKIA
menu_Citizen2_EP1 = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];
// Neutral Vehicle 2P - TRADER CITY PLANICA
menu_Rita_Ensler_EP1 = [
	[["Sports Cars",2201],["Super Cars",2202],["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
// Neutral General Store 1P
menu_RU_Farmwife1 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Trade Metals",939]],
	[],
	"neutral"
];
// Medical Supplies P
menu_US_Soldier_Medic_EP1 = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Trade Metals",939]],
	[],
	"neutral"
];
// Weapons Neutral 2P
menu_USMC_Soldier_TL = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]],
	[],
	"neutral"
];
// Ammunition Neutral 2P
menu_USMC_SoldierS_Engineer = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],
	["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612]],
	[],
	"neutral"
];
// East Wholesaler P
menu_UN_CDF_Soldier_AAT_EP1 = [
	[["Wood Buildables",901],["Cinder Buildables",902],["Crafting Stuff",903],["Storage",904],["Misc",905]],
	[],
	"neutral"
];
// General Store 2P
menu_ValentinaVictim = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Trade Metals",939]],
	[],
	"neutral"
];
// North Wholesaler P
menu_UN_CDF_Soldier_MG_EP1 = [
	[["Wood Buildables",901],["Cinder Buildables",902],["Crafting Stuff",903],["Storage",904],["Misc",905]],
	[],
	"neutral"
];
// Boat Vendor South P
menu_GUE_Soldier_1 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
// Vehicles Neutral 3p - MELLO
menu_FR_Corpsman = [
	[["Sports Cars",2201],["Super Cars",2202],["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
// Neutral Building/Parts 3P - MELLO
menu_GUE_Soldier_AR = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];
// Medical Supplies 1P
menu_Dr_Hladik_EP1 = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Trade Metals",939]],
	[],
	"neutral"
];
// Medical Supplies 3
menu_RU_Doctor = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Trade Metals",939]],
	[],
	"neutral"
];
// Boat Trader 1P
menu_RU_Villager1 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
// Neutral Building/Parts 4p - TRADER CITY PLANICA
menu_Reynolds_PMC = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];

waituntil { sleep 1; !isNil "DynamicTraderInitialized" };

diag_log "VG: Starting to set the Traderdata Variables.";
_array = [];
{
	private ["_x"];
	if ((typeOf _x) in _serverTraders || (typeOf _x) in _bankTrader || (typeOf _x) in _donatorTrader) then 
	{
		_array set [count _array,_x];
	};
} count (allMissionObjects "Man");

_z = 0;
{
	private ["_name"];
	_z = _z + 1;
	_name = typeOf _x;
	if (_name in _serverTraders) then 
	{
		private ["_data"];
		_data = call compile format ["menu_%1",_name];
		_x setVariable ["TraderHumanity",(_data select 2),true];
		_x setVariable ["TraderData",(_data select 0),true];
		diag_log format ["VG: (%4)Set Tradervariable for %1 | %2 | %3",_name,(_data select 0),(_data select 2),_z];
	} 
	else 
	{
		if (_name in _bankTrader) then 
		{
			_x setVariable ["BankTrader",true,true];
			diag_log format ["VG: (%2)Set BankTradervariable for %1",_name,_z];
		}
		else
		{
			if (_name in _donatorTrader) then 
			{
				private ["_data"];
				_data = call compile format ["menu_%1",_name];
				_x setVariable ["DonatorTrader",(_data select 0),true];
				diag_log format ["VG: (%2)Set BankTradervariable for %1",_name,_z];
			};
		};
	};
} count _array;

_serverTraders = _serverTraders + _bankTrader;
serverTraders = _serverTraders;
publicVariable "serverTraders";