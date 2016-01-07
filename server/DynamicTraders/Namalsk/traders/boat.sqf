private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["FoldTable",[-0.365112, 0.862915],42.2214,1,0,{}],
	["Land_Chair_EP1",[-1.50012, -0.369385],319.774,1,0,{}],
	["Land_BoatSmall_1",[2.31323, -1.04761],1.27523e-005,1,0,{}],
	["Land_BoatSmall_2a",[-1.55994, 3.21301],289.058,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;
["GUE_Woodlander2", [_x + -1.10339,_y + 0.0600586], (220-180)] call DT_fnc_CreateTrader;
