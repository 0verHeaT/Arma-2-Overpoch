private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["Land_Misc_Cargo2E_EP1",[0.377686, -0.973145],41.0781,1,0,{}],
	["Land_Chair_EP1",[0.240601, 1.99756],212.815,1,0,{}],
	["LADAWreck",[-3.74255, 0.219238],91.8888,1,0,{}],
	["UAZWreck",[4.99353, -0.489014],350.508,1,0,{}],
	["Land_Bag_EP1",[1.07373, 4.9679],0.0021485,1,0,{}],
	["Land_Misc_Cargo2E",[3.03943, 5.19653],359.995,1,0,{}],
	["Land_Misc_Coil_EP1",[-5.4989, -3.08826],359.995,1,0,{}],
	["Land_fort_bagfence_long",[-5.48096, 3.073],260.568,1,0,{}],
	["FireBarrel_DZ",[0.859863, 6.45325],359.995,1,0,{}],
	["Land_Barrel_water",[0.750977, 7.22827],359.998,1,0,{}],
	["Land_fort_bagfence_long",[-4.53149, 8.03711],305.929,1,0,{}],
	["HMMWVWreck",[-0.536865, 9.54321],115.428,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;

["RU_Profiteer4", [_x + -0.261108,_y + 2.24292], (113.948-180)] call DT_fnc_CreateTrader;
