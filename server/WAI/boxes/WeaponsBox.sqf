_box = _this;

_loot_list = [
	[
		[
			["RH_hk416sdeotech", 1],
			["vil_Mg3", 1],
			["skavil_M60", 1]
		],
		[
			["30Rnd_556x45_StanagSD", 4],
			["100Rnd_762x51_M240", 4],
			["100Rnd_127x99_M2", (floor(random 2))],
			["48Rnd_40mm_MK19", (floor(random 2))]
		]
	],
	[
		[
			["vil_Minimi", 1],
			["vil_MG4", 1],
			["RH_hk417acog", 1]
		],
		[
			["100Rnd_762x51_M240", 2],	
			["200Rnd_556x45_M249", 2],	
			["RH_20Rnd_762x51_hk417", 4],	
			["100Rnd_127x99_M2", (floor(random 2))],
			["48Rnd_40mm_MK19", (floor(random 2))]
		]
	],
	[
		[
			["skavil_M60e3", 1],
			["vil_MG4E", 1],
			["RH_hk417sd", 1]
		],
		[	
			["100Rnd_762x51_M240", 4],
			["RH_20Rnd_762x51_SD_hk417", 4],
			["100Rnd_127x99_M2", (floor(random 2))],
			["48Rnd_40mm_MK19", (floor(random 2))]
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

{
	_box addWeaponCargoGlobal [_x,1];
} count ammo_box_tools;