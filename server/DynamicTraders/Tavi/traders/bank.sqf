private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["MAP_Shed_wooden",[-0.0513, -4.1787],267.9057,1,0,{}],
	["Land_Fire_barrel",[1.0874, -4.7246],344.58783,1,0,{}],
	["MAP_desk",[0.0459, -0.7549],357.40979,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;
["Functionary2_EP1", [_x,_y], 180] call DT_fnc_CreateTrader;