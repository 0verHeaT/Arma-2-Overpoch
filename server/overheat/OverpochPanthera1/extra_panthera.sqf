[[2811.24,8349.28,-5.99824],359.71,"Land_nav_pier_m_2",10,40,0,0] spawn {
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
		["Desk",[4415.9575,1621.6752,-0.10600268],-113.46485],
		["EvMoney",[4416.1709,1621.0682,0.7067095],0],
		["Laptop_EP1",[4415.8267,1622.1671,0.7050994],50.563984],
		["Desk",[8690.4043,3140.479,9.5367432e-006],-177.81683],
		["EvMoney",[8691.0488,3140.4089,0.81272125],-64.351852],
		["Laptop_EP1",[8689.9063,3140.571,0.81111145],-13.787894],
		["VaultStorageLocked",[8688.3877,3138.9888,0.001902936],-177.97612],
		["Desk",[4325.6665,6320.3467,-0.053824738],-360.50024],
		["EvMoney",[4325.0244,6320.3872,0.75700462],0],
		["Laptop_EP1",[4326.1704,6320.2764,0.75973594],-196.47115],
		["VaultStorageLocked",[4326.3247,6322.0205,0.068321474],-360.65952],
		["TK_WarfareBUAVterminal_EP1",[4396.8257,1647.3474],14.188705],
		["TK_WarfareBUAVterminal_EP1",[8698.4932,3105.8562,-0.32652664],-128.48105],
		["TK_WarfareBUAVterminal_EP1",[4345.8979,6301.1753,-0.12187573],-123.21037],
		["TK_WarfareBUAVterminal_EP1",[2253.5374,9486.7148,-0.32652664],-269.57367],
		["US_WarfareBContructionSite_Base_EP1",[543.66724,8953.1289,-1.1444092e-005],-300.77319],
		["US_WarfareBContructionSite1_Base_EP1",[549.31329,8951.8799,-1.9073486e-005],-90.399231],
		["US_WarfareBVehicleServicePoint_Base_EP1",[540.97498,8944.3193,-1.4305115e-005],-174.38213],
		["HeliHCivil",[567.12195,8942.0205,-1.9073486e-006],-51.341434],
		["MAP_USLaunchers",[546.04718,8949.9092],17.954481],
		["MAP_RUOrdnance",[544.56744,8950.832,-4.863739e-005],-36.939491],
		["MAP_USSpecialWeapons",[547.72083,8949.9873,-5.2452087e-005],0],
		["FlagCarrierNATO_EP1",[548.61682,8939.792,-1.1444092e-005],0],
		["FlagCarrierNATO_EP1",[542.10901,8940.7295,-1.9073486e-006],0],
		["Land_Fire_barrel",[2256.4856,9484.6543,0.021903992],-405.37302], 
		["Land_Fire_barrel",[544.81555,8948.2813,0.087058067],-235.89265], 
		["Land_Fire_barrel",[8694.9004,3105.6123,0.021901131],-264.28024],
		["Land_Fire_barrel",[4399.5752,1649.8181,0.022742009],-121.60996],	
		["Land_Fire_barrel",[4342.166,6301.1504,0.034606934],-263.20575],	
		["Land_Fire_barrel",[4427.2227,1634.8722,-2.2888184e-005],-232.26501],
		["Land_Fire_barrel",[9046.8604,4057.0906,2.6702881e-005],182.35988],
		["Land_Fire_barrel",[7223.8438,733.90039,-9.5367432e-007],0],
		["Land_Fire_barrel",[4409.0327,1627.9761,-1.5258789e-005],122.8466],
		["Land_Fire_barrel",[3794.4277,7652.9263,3.1340871],0],
		["Land_Fire_barrel",[1907.6559,3623.7019,8.5830688e-006],0],	
		["Land_Fire_barrel",[4330.9863,6315.1421,0],-36.874077],
		["Land_Fire_barrel",[8686.7412,3134.1001,-4.529953e-006],17.305855],	
		["Land_Fire_barrel",[4772.0981,7485.4399,2.1457672e-006],0],
		["Land_Fire_barrel",[2240.9014,9477.126,3.8146973e-006],185.18335],
		["Land_Fire_barrel",[5227.0308,8224.2168,-2.3126602e-005],108.42027],
		["Land_Fire_barrel",[3357.9116,2293.3701,1.7688445],-145.64645]
	];

	{
		_build = createVehicle [(_x select 0),(_x select 1),[],0,"CAN_COLLIDE"];
		_build setPos (_x select 1);
		_build setDir (_x select 2);
		_build enableSimulation false;
	} forEach VGNetworkBuildings;
};