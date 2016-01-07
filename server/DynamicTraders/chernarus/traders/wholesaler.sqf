private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["Land_bags_EP1",[-1.03772, 0.233032],359.865,1,0,{}],
	["Land_Crates_stack_EP1",[1.00647, 1.42542],341.811,1,0,{}],
	["Land_Misc_Garb_Heap_EP1",[-0.0321045, -2.95471],359.86,1,0,{}],
	["Land_cages_EP1",[-2.4635, -1.21399],0.0687284,1,0,{}],
	["Land_Campfire_burning",[-2.81445, -1.39124],359.993,1,0,{}],
	["Land_Misc_IronPipes_EP1",[1.35779, 3.52539],322.171,1,0,{}],
	["Land_Barrel_water",[-3.89954, -1.70508],0.0687284,1,0,{}],
	["Misc_TyreHeapEP1",[-4.79126, -3.03223],0.00383924,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;
["RU_Citizen1", [_x + 2.93359,_y + 0.119995], (284-180)] call DT_fnc_CreateTrader;
