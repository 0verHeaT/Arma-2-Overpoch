[[13152,3829.95,-5.99845],54.6249,"Land_nav_pier_m_2",12,40,0,0] spawn {
    private ["_start","_obj"];
    _start = createVehicle [
        _this select 2,
        _this select 0,
        [],
        0,
        "CAN_COLLIDE"
    ];
    _start setVectorUp [0,0,1];
    _start setDir (_this select 1);
    _start setPosATL (_this select 0);
    for "_i" from 1 to (_this select 3) do {
        _obj = createVehicle [
            _this select 2,
            _this select 0,
            [],
            0,
            "CAN_COLLIDE"
        ];
        _obj attachTo [_start, [
            _i*(_this select 4),
            _i*(_this select 5),
            _i*(_this select 6)
        ]];
    };
};

[] spawn {
	VGNetworkBuildings = 
	[
		["RU_WarfareBUAVterminal",[4040.0623,11684.276,-0.072787017],90.146126],
		["RU_WarfareBUAVterminal",[11471.313,11346.501,0.059849553],40.092556],
		["RU_WarfareBUAVterminal",[6307.7524,7810.0903,-3.0517578e-005],-139.67674],
		["RU_WarfareBUAVterminal",[1685.2,2318.16,-0.113],317],
		["FireBarrel_DZ",[1684.04,2321.48,0.018],0],
		["Land_BagFenceRound",[6303.9604,7810.7163],124.85605],
		["MAP_RUBasicWeapons",[533.76727,13769.702,0.037342526],-193.15463],
		["MAP_USVehicleAmmo",[533.1958,13775.415,-0.13273187],-165.89403],
		["MAP_Ind_IlluminantTower",[527.59515,13772.063,-0.36239731],-322.00372],
		["FlagCarrierUSArmy_EP1",[533.89722,13773.327,0.1467357],-1.0585171,true],
		["HeliHCivil",[548.51654,13787.986,0.0049743652],51.307278]
	];

	{
		_build = createVehicle [(_x select 0),(_x select 1),[],0,"CAN_COLLIDE"];
		_build setPos (_x select 1);
		_build setDir (_x select 2);
		if (count _x > 3) then {_build setVehicleInit "this setObjectTexture [0,'overheat\gui\logo.paa'];"}; 
		_build enableSimulation false;
	} forEach VGNetworkBuildings;
	processInitCommands;
};