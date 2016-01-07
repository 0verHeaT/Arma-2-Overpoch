private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["Land_Chair_EP1",[-0.213745, -0.605469],229.88,1,0,{}],
	["FoldTable",[-0.776245, 0.545776],312.328,1,0,{}],
	["GunRack_DZ",[1.44763, -0.276489],135.399,1,0,{}],
	["DesertCamoNet_DZ",[0.388794, 1.88831],107.367,1,0,{}],
	["Land_transport_crates_EP1",[-0.346436, -3.45422],69.5449,1,0,{}],
	["GunRack_DZ",[-2.06934, -3.11096],0.019328,1,0,{}],
	["Land_Chair_EP1",[1.64856, 3.60083],191.566,1,0,{}],
	["FireBarrel_DZ",[-3.81396, -1.33459],0.0279023,1,0,{}],
	["FoldTable",[0.738525, 4.03589],273.994,1,0,{}],
	["GunRack_DZ",[3.02954, 3.86072],346.016,1,0,{}],
	["Base_WarfareBContructionSite",[-4.60632, -3.85571],318.953,1,0,{}],
	["Land_tires_EP1",[2.83777, 5.33301],0.00214843,1,0,{}],
	["Land_Barrel_water",[0.96228, 6.12561],0,1,0,{}],
	["Land_transport_crates_EP1",[1.05078, 7.396],359.489,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;

["US_Delta_Force_EP1", [_x + 0.322632,_y + 0.198853], (125-180)] call DT_fnc_CreateTrader;
["US_Delta_Force_TL_EP1", [_x + 1.67639,_y + 4.89258], (88-180)] call DT_fnc_CreateTrader;