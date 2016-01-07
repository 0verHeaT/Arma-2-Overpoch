private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["Base_WarfareBBarrier10x",[-3.05396, -1.1499],228.849,1,0,{}],
	["Land_Chest_EP1",[3.83643, 0.462646],316.474,1,0,{}],
	["FoldTable",[4.71484, 2.01929],315.577,1,0,{}],
	["FoldChair",[5.14209, 0.858032],134.911,1,0,{}],
	["Land_CamoNetVar_NATO",[5.30054,1.56702],319.145,1,0,{}],
	["Land_Crates_EP1",[6.60242, 2.8623],359.994,1,0,{}],
	["GunRack_DZ",[7.66138, 1.33508],135.409,1,0,{}],
	["Base_WarfareBContructionSite",[-4.57458, 6.35181],230.004,1,0,{}],
	["Base_WarfareBBarrier10x",[8.19495, -1.14429],319.542,1,0,{}],
	["FlagCarrierWhite_EP1",[-7.50269, 4.34875],0,1,0,{}],
	["Land_Barrel_water",[10.1661, 3.57239],359.99,1,0,{}],
	["Base_WarfareBContructionSite",[2.1178, 11.8541],48.7031,1,0,{}],
	["Base_WarfareBBarrier10x",[9.52515, 9.72095],46.9818,1,0,{}],
	["HeliHCivil",[-11.7673, -7.00061],0,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;

["GUE_Soldier_MG", [_x + 5.92017,_y + 1.44458], (135.159-180)] call DT_fnc_CreateTrader;
