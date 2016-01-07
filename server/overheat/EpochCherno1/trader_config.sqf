private ["_serverTraders","_array","_bankTrader"];

_serverTraders = [
"RU_Functionary1",
"RU_Citizen3",
"Rocker4",
"Profiteer4",
"Rita_Ensler_EP1",
"CIV_EuroMan01_EP1",
"CIV_EuroMan02_EP1",
"TK_GUE_Soldier_5_EP1",
"GUE_Soldier_MG",
"Worker2",
"Worker3",
"Worker1",
"Woodlander1",
"UN_CDF_Soldier_Pilot_EP1",
"RU_WorkWoman1",
"Dr_Annie_Baker_EP1",
"RU_Citizen4",
"RU_WorkWoman5",
"RU_Citizen1",
"RU_Villager3",
"TK_CIV_Takistani04_EP1",
"Pilot_EP1",
"RU_Profiteer4",
"Woodlander3",
"Dr_Hladik_EP1",
"Doctor",
"HouseWife1",
"GUE_Woodlander2",
"GUE_Woodlander1"
//"Mercenary_Default18"
];

_bankTrader = ["Functionary2_EP1"];
_donatorTrader = ["TK_Soldier_Sniper_Night_EP1"];

menu_TK_Soldier_Sniper_Night_EP1 = [ // Donator
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns And Single Shot",641],["Sniper Rifle",640],["Submachine Guns",642],["Overwatch Vil",1002],["Overwatch Tar",1003],["Overwatch Sniper",1011],["Overwatch Scar",1004],["Overwatch Sidearm",1001],["Overwatch Mas",1007],["Overwatch Hk417",1009],["Overwatch Hk416",1008],["Overwatch Dmr",1010],["Overwatch Acr",1005],["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],["Pistol Ammo",611],["Shotguns And Single Shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612],["Overwatch Pistol Ammo",1012],["Overwatch Gun Ammo",1013],["Better Weapons",477],["Toolbelt Items",510],["Vehicle Parts",509],["Better Clothes",575],["Ammunition",478],["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Chemlites / Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Black Market Weapons",526],["Black Market Ammo",527],["Explosives",529],["Wood Buildables",901],["Cinder Buildables",902],["Crafting Stuff",903],["Storage",904],["Misc",905],["Money",700]],
	[],
	"neutral"
];
//Overwatch
/*
menu_Mercenary_Default18 = [
	[["Overwatch Pistol Ammo",2100],["Overwatch Gun Ammo",2101],["Overwatch Pistols",2000],["HK416 Variants",2001],
	["HK417 Variants",2002],["ACR Variants",2006],["TAR Variants",2003],["MAS Variants",2004],["G3 Variants",2008],["G36 Variants",2012],["AK Variants",2011],
	["DMR Variants",2005],["SMG Variants",2010],["LMG Variants",2009],["Spare Guns",2013],["Sniper Variants",2007]],
	[],
	"neutral"
];
*/
// For dynamic traders
menu_Worker1 = [
	[["Helicopters Unarmed",519]],
	[],
	"neutral"
];
//Gemtrader
menu_GUE_Woodlander1 = [
	[["SCAR Variants",700],["Weapons",706],["Ammunition",701],["Explosives",702],["Military Armed",703],["Helicopter Armed",704],["Vehicle Ammunition",705]],
	[],
	"neutral"
];
// Hero Vendor
menu_RU_Functionary1 = [
	[["Ammunition",478],["Clothes",476],["Helicopters Armed",493],["Military Armed",479],["Trucks Armed",562],["Weapons",477]],
	[],
	"hero"
];
// Ammunition Friendly
menu_RU_Citizen3 = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],
	["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612]],
	[],
	"neutral"
];
// Weapons Friendly
menu_Rocker4 = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]],
	[],
	"neutral"
];
// Friendly Vehicles
menu_Profiteer4 = [
	[/*["Sports Cars",2201],["Super Cars",2202],*/["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
// General Store
menu_Rita_Ensler_EP1 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Trade Metals",939]],
	[],
	"neutral"
];
// Weapons neutral
menu_CIV_EuroMan01_EP1 = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]],
	[],
	"neutral"
];
// Ammunition Neutral
menu_CIV_EuroMan02_EP1 = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],
	["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612]],
	[],
	"neutral"
];
// Neutral Building/Parts
menu_TK_GUE_Soldier_5_EP1 = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];
// Bandit Trader
menu_GUE_Soldier_MG = [
	[["Ammunition",577],["Clothing",575],["Helicopter Armed",512],["Military Armed",569],["Trucks Armed",534],["Weapons",627]],
	[],
	"hostile"
];
// Aircraft Dealer
menu_Worker2 = [
	[/*["Aircraft Armed",2200],*/["Aircraft Unarmed",517],["Helicopters Unarmed",519]],
	[],
	"neutral"
];
// Vehicles Neutral
menu_Worker3 = [
	[/*["Sports Cars",2201],["Super Cars",2202],*/["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
// Friendly Building/Parts
menu_Woodlander1 = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];
// Friendly Vehicles 2
menu_UN_CDF_Soldier_Pilot_EP1 = [
	[/*["Sports Cars",2201],["Super Cars",2202],*/["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
// General Store 2
menu_RU_WorkWoman1 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Trade Metals",939]],
	[],
	"neutral"
];
// Medical Supplies
menu_Dr_Annie_Baker_EP1 = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Trade Metals",939]],
	[],
	"neutral"
];
// East Wholesaler
menu_RU_Citizen4 = [
	[["Wood Buildables",901],["Cinder Buildables",902],["Crafting Stuff",903],["Storage",904],["Misc",905]],
	[],
	"neutral"
];
// General Store 3
menu_RU_WorkWoman5 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Trade Metals",939]],
	[],
	"neutral"
];
// West Wholesaler
menu_RU_Citizen1 = [
	[["Wood Buildables",901],["Cinder Buildables",902],["Crafting Stuff",903],["Storage",904],["Misc",905]],
	[],
	"neutral"
];
// Boat Vendor
menu_RU_Villager3 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
// Weapons neutral 2
menu_TK_CIV_Takistani04_EP1 = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]],
	[],
	"neutral"
];
// Ammunition Neutral 2
menu_Pilot_EP1 = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],
	["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612]],
	[],
	"neutral"
];
// Vehicles Neutral 2
menu_RU_Profiteer4 = [
	[/*["Sports Cars",2201],["Super Cars",2202],*/["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
// Neutral Building/Parts
menu_Woodlander3 = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];
// Medical Supplies 2
menu_Dr_Hladik_EP1 = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Trade Metals",939]],
	[],
	"neutral"
];
// Medical Supplies 3
menu_Doctor = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Trade Metals",939]],
	[],
	"neutral"
];
// Boat Trader 2
menu_HouseWife1 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
// Black market
menu_GUE_Woodlander2 = [
	[["Black Market Ammo",527],["Black Market Weapons",526],["Explosives",702]],
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