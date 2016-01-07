private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["Land_CamoNet_NATO",[-1.71228, 1.7384],287.865,1,0,{}],
	["Land_transport_kiosk_EP1",[0.473389, -2.69116],333.022,1,0,{}],
	["Land_fort_bagfence_long",[1.26685, -3.82056],330.865,1,0,{}],
	["Land_stand_small_EP1",[-3.82654, -1.9436],49.2822,1,0,{}],
	["Land_tires_EP1",[1.27551, 4.58777],359.926,1,0,{}],
	["Land_fort_bagfence_long",[-2.27539, -4.37036],6.5585,1,0,{}],
	["Land_transport_crates_EP1",[-0.600708, 5.06482],359.868,1,0,{}],
	["Land_Barrel_water",[2.68433, 4.59949],359.926,1,0,{}],
	["Land_Crates_stack_EP1",[-3.51868, 4.41162],359.907,1,0,{}],
	["FireBarrel_DZ",[3.8728, 4.32898],359.926,1,0,{}],
	["Land_fort_bagfence_long",[-5.49988, -2.9823],39.9216,1,0,{}],
	["Land_fort_bagfence_long",[3.23352, 5.61804],212.992,1,0,{}],
	["Land_fort_bagfence_long",[-6.54724, 0.209717],95.9298,1,0,{}],
	["Land_fort_bagfence_long",[-5.51428, 3.65967],298.618,1,0,{}],
	["Land_fort_bagfence_long",[-0.0332031, 6.9032],194.651,1,0,{}],
	["Land_fort_bagfence_long",[-3.30127, 6.52722],142.145,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;
["Woodlander1", [_x + -2.13013,_y + 3.48193], (328-180)] call DT_fnc_CreateTrader;
["RU_WorkWoman1", [_x + -1.88525,_y + -1.82776], (218-180)] call DT_fnc_CreateTrader;

