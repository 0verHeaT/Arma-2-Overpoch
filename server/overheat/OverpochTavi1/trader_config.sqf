private ["_serverTraders","_array","_bankTrader"];

_serverTraders = [
"GUE_Worker2",
"Soldier_Sniper_KSVK_PMC",
"Soldier_GL_PMC",
"GUE_Soldier_Pilot",
"GUE_Woodlander3",
"Worker4",
"Reynolds_PMC",
"Soldier_Sniper_PMC",
"GUE_Soldier_3",
"RU_Doctor",
"Doctor",
"UN_CDF_Soldier_Pilot_EP1",
"RU_Worker4",
"RU_Woodlander4",
"Citizen3",
"RU_Damsel5",
"Dr_Hladik_EP1",
"GUE_Commander",
"GUE_Soldier_CO",
"Profiteer2_EP1",
"RU_Farmwife5",
"GUE_Woodlander1",
"RU_Worker1",
"GUE_Soldier_2",
"BAF_Pilot_DDPM",
"Mercenary_Default18"
];

_bankTrader = ["Functionary2_EP1"];

//op
menu_GUE_Worker2 = [
	[["Origin Cars",100],["Sports Cars",2201],["Super Cars",2202],["Overwatch Pistol Ammo",2100],["Overwatch Gun Ammo",2101],["Overwatch Pistols",2000],["SCAR Variants",700],["HK416 Variants",2001],
	["HK417 Variants",2002],["ACR Variants",2006],["TAR Variants",2003],["MAS Variants",2004],["G3 Variants",2008],["G36 Variants",2012],["AK Variants",2011],
	["DMR Variants",2005],["SMG Variants",2010],["LMG Variants",2009],["Spare Guns",2013],["Sniper Variants",2007]],
	[],
	"neutral"
];
//Origins
menu_Mercenary_Default18 = [
	[["Origin Cars",100],["Sports Cars",2201],["Super Cars",2202],["Overwatch Pistol Ammo",2100],["Overwatch Gun Ammo",2101],["Overwatch Pistols",2000],["SCAR Variants",700],["HK416 Variants",2001],
	["HK417 Variants",2002],["ACR Variants",2006],["TAR Variants",2003],["MAS Variants",2004],["G3 Variants",2008],["G36 Variants",2012],["AK Variants",2011],
	["DMR Variants",2005],["SMG Variants",2010],["LMG Variants",2009],["Spare Guns",2013],["Sniper Variants",2007]],
	[],
	"neutral"
];
//Aircraft
menu_BAF_Pilot_DDPM = [
	[["Aircraft Armed",2200],["Aircraft Unarmed",517],["Helicopters Unarmed",519],["Origin Aircraft",101]],
	[],
	"neutral"
];
//NATO
/*
menu_US_Army_Soldier_AA = [
	[["SCAR Variants",700],["Weapons",706],["Ammunition",701],["Explosives",702],["Military Armed",703],["Helicopter Armed",704],["Vehicle Ammunition",705]],
	[],
	"neutral"
];
*/
//COMBINATION VENDOR
menu_Soldier_Sniper_PMC = [
	[["Ammunition",478],["Clothes",476],["Helicopters Armed",493],["Military Armed",562],["Trucks Armed",479],["Weapons",477]],
	[],
	"hero"
];
//SUPPLIES
menu_GUE_Woodlander3 = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];
//MEDICAL
menu_RU_Doctor = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Trade Metals",939]],
	[],
	"neutral"
];
//FOOD & DRINK
menu_RU_Damsel5 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Trade Metals",939]],
	[],
	"neutral"
];
//COMBINATION VENDOR
menu_GUE_Woodlander1 = [
	[["Ammunition",577],["Clothing",575],["Helicopter Armed",512],["Military Armed",569],["Trucks Armed",534],["Weapons",627]],
	[],
	"hostile"
];
//SUPPLIES
menu_RU_Worker1 = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];
//MEDICAl
menu_Dr_Hladik_EP1 = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Trade Metals",939]],
	[],
	"neutral"
];
//FOOD & DRINK
menu_RU_Farmwife5 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Trade Metals",939]],
	[],
	"neutral"
];
//MEDICAL
menu_Doctor = [
	[["Chem-lites/Flares",669],["Medical Supplies",670],["Smoke Grenades",671],["Trade Metals",939]],
	[],
	"neutral"
];
//SUPPLIES
menu_RU_Worker4 = [
	[["Storage",904],["Crafting Stuff",903],["Misc",905],["Toolbelt Items",510],["Vehicle Parts",509],["Trade Metals",939]],
	[],
	"neutral"
];
//WEAPONS
menu_Soldier_Sniper_KSVK_PMC = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]],
	[],
	"neutral"
];
//AMMUNITION
menu_Soldier_GL_PMC = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],
	["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612]],
	[],
	"neutral"
];
//FOOD & DRINK
menu_Citizen3 = [
	[["Backpacks",496],["Clothes",497],["Cooked Meats",580],["Drinks",498],["Packaged Food",579],["Trade Metals",939]],
	[],
	"neutral"
];
menu_GUE_Soldier_3 = [
	[["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
menu_RU_Woodlander4 = [
	[["Bikes and ATV",587],["Buses and Vans",588],["Cargo Trucks",586],["Fuel Trucks",589],["Military Unarmed",598],["Trucks",590],["Used Cars",520],["Utility Vehicles",591]],
	[],
	"neutral"
];
menu_Worker4 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
menu_Profiteer2_EP1 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
menu_GUE_Soldier_Pilot = [
	[["Helicopters Unarmed",519]],
	[],
	"neutral"
];
menu_UN_CDF_Soldier_Pilot_EP1 = [
	[["Aircraft Armed",2200],["Aircraft Unarmed",517],["Helicopters Unarmed",519],["Origin Aircraft",101]],
	[],
	"neutral"
];
//WEAPONS
menu_GUE_Commander = [
	[["Assault Rifle",637],["Light Machine Gun",638],["Pistols",674],["Shotguns and Single-shot",641],["Sniper Rifle",640],["Submachine Guns",642]],
	[],
	"neutral"
];
//AMMUNITION
menu_GUE_Soldier_CO = [
	[["Assault Rifle Ammo",609],["Light Machine Gun Ammo",610],
	["Pistol Ammo",611],["Shotguns and Single-shot Ammo",613],["Sniper Rifle Ammo",614],["Submachine Gun Ammo",612]],
	[],
	"neutral"
];
//EAST BRIDGE
menu_GUE_Soldier_2 = [
	[["Wood Buildables",901],["Cinder Buildables",902],["Crafting Stuff",903],["Storage",904],["Misc",905]],
	[],
	"neutral"
];
//WEST BRIDGE
menu_Reynolds_PMC = [
	[["Wood Buildables",901],["Cinder Buildables",902],["Crafting Stuff",903],["Storage",904],["Misc",905]],
	[],
	"neutral"
];

waituntil { sleep 1; !isNil "DynamicTraderInitialized" };

diag_log "VG: Starting to set the Traderdata Variables.";
_array = [];
{
	private ["_x"];
	if ((typeOf _x) in _serverTraders || (typeOf _x) in _bankTrader) then {
		_array set [count _array,_x];
	};
} count (allMissionObjects "Man");

_z = 0;
{
	private ["_name"];
	_z = _z + 1;
	_name = typeOf _x;
	if (_name in _serverTraders) then {
		private ["_data"];
		_data = call compile format ["menu_%1",_name];
		_x setVariable ["TraderHumanity",(_data select 2),true];
		_x setVariable ["TraderData",(_data select 0),true];
		diag_log format ["VG: (%4)Set Tradervariable for %1 | %2 | %3",_name,(_data select 0),(_data select 2),_z];
	} else {
		if (_name in _bankTrader) then {
			_x setVariable ["BankTrader",true,true];
			diag_log format ["VG: (%2)Set BankTradervariable for %1",_name,_z];
		};
	};
} count _array;

_serverTraders = _serverTraders + _bankTrader;
serverTraders = _serverTraders;
publicVariable "serverTraders";