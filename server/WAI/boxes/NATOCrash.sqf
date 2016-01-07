_box = _this;

_loot_list = [
	[
		[
			["USSR_cheytacM200", 1],
			["RH_hk417sp", 1]
		],
		[
			["USSR_5Rnd_408", 4],
			["RH_20Rnd_762x51_hk417", 4]
		]
	],
	[
		[
			["FHQ_MSR_NV_SD_DESERT", 1],
			["RH_hk417", 1]
		],
		[
			["FHQ_rem_7Rnd_338Lapua_MSR_NT_SD", 4],
			["PipeBomb", 1],
			["RH_20Rnd_762x51_hk417", 4]
		]
	],
	[
		[
			["FHQ_RSASS_SD_TAN", 1],
			["RH_hk417sgl", 1]
		],
		[	
			["FHQ_rem_20Rnd_762x51_PMAG_NT_SD", 4],
			["HandGrenade_West", 2],
			["RH_20Rnd_762x51_hk417", 4]
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

{_box addMagazineCargoGlobal [_x,2];} count ammo_smokes;

if ((floor(random 3)) == 1) then {
	{
		_box addMagazineCargoGlobal [_x,2];
	} count ammo_vehicle;
};

if ((floor(random 5)) == 1) then {
	{
		_box addWeaponCargoGlobal [(_x select 0),1];
		_box addMagazineCargoGlobal [(_x select 1),(ceil(random 3))];
	} count ammo_box_guns;
};

{
	_box addWeaponCargoGlobal [_x,2];
} count ammo_box_tools;