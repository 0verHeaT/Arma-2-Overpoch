private ["_isIsland","_pos","_findSpot","_mkr","_position","_isNear","_isZero","_counter","_DRNLocs","_DRNloc"];
_DRNLocs = [
	//Byelov
	[[17471.7,5239.7,230.049], [16778.7,6308.6,151.993], [17890,5747.92,167.251], [16285.5,7424.76,396.825], [17614.8,7834.89,261.943]],
	//Sabina
	[[15381.7,8395.57,87.6772], [16472.3,9163.9,119.374], [16037.2,10031.2,36.1822], [14472.9,10700.6,21.4281], [14493.7,9200.24,126.867]],
	//Etanovsk
	[[14499.2,12362.8,86.9139], [13434.3,11698.1,85.3361], [13745.9,12248.4,63.8834], [12151.4,12853.8,233.966], [12359.3,12430.1,111.949]],
	//Lyepestok
	[[11237.6,14413.2,105.549], [11868.8,14156.2,293.846], [12655.3,15389.2,108.404], [12021.7,15939.5,114.001], [11217.5,16047.8,114.001]],
	//Martin
	[[17069,12300.4,43.5294], [16738.1,13978.6,56.9753], [15240.9,14005.2,60.342], [16264.4,15420.1,28.2671], [14902.5,15232.1,46.6703]],
	//Dalnogorsk
	[[15693.2,16882.5,131.85], [14414.9,17488.4,171.399], [13742.7,19072.6,55.5006], [14839.8,16583.1,80.5402],[16042.8,16100.7,7.50033]],
	//Yaroslav
	[[11684.3,18379.2,46.0772], [10158.6,17676.4,90.3028], [10454.7,19612.3,56.9962], [9402.78,15928.5,105.941], [10450.7,19417.3,61.5052]],
	//Kameni
	[[8350.45,18936.8,122.77], [9711.87,20179.9,69.5927], [8193.27,21405.5,153.653], [8607.75,20548.9,178.285], [8072.49,19927.1,112.192]],
	//Seven
	[[10183.8,1541.89,26.493], [10807.8,1100.28,27.3607], [11404,806.905,23.4282], [11521.4,1606.74,48.3487], [9198.37,2514.65,28.741]],
	//Branibor
	[[8225.28,3073.61,10.4816], [8917.26,4271.81,80.3664], [8228.37,5491.64,100.734], [7069.92,4880.18,34.7772], [5719.95,5951.77,37.2921]],
	//Shtangrad
	[[1528.68,7270.51,36.3004], [3122.7,6819.02,81.765], [4703.43,6447.21,37.6225], [4101.24,7890.2,36.6137], [4721.14,7146.57,287.936]],
	//Vedich
	[[5903.94,10519.4,91.9985], [6678.8,10050.2,93.6081], [6439.7,9333.18,217.558], [6107.62,8824.15,35.7552], [5067.08,8301.84,36.8271]],
	//Krazno
	[[10238.2,7319.2,149.359], [9264.65,6540.16,143.436], [8197.54,7717.57,76.0581], [7949.59,8585.13,102.284], [8711.17,8695.79,146.269]]
	];
drnspawn = -1;
cutText ["","BLACK OUT"];
_ok = createDialog "DRN_DIALOG";
waitUntil { drnspawn != -1};
if (drnspawn == 13) then {drnspawn = floor (random 12)};
_DRNloc = _DRNLocs select drnspawn;
	//Spawn modify via mission init.sqf
	if(isnil "spawnArea") then {
		spawnArea = 1500;
	};
	if(isnil "spawnShoremode") then {
		spawnShoremode = 1;
	};
	//spawn into random
	_findSpot = true;
	_mkr = "";
	while {_findSpot} do {
		_counter = 0;
		while {_counter < 20 && _findSpot} do {
			// switched to floor
			_mkr = _DRNLoc select(floor(random (count _DRNLoc)));
			_position = ([(_mkr),0,spawnArea,10,0,2000,spawnShoremode] call BIS_fnc_findSafePos);
			_isNear = count (_position nearEntities ["Man",100]) == 0;
			_isZero = ((_position select 0) == 0) && ((_position select 1) == 0);
			//Island Check
			_pos 		= _position;
			_isIsland	= false;		//Can be set to true during the Check
			for [{_w=0},{_w<=150},{_w=_w+2}] do {
				_pos = [(_pos select 0),((_pos select 1) + _w),(_pos select 2)];
				if(surfaceisWater _pos) exitWith {
					_isIsland = true;
				};
			};
			
			if ((_isNear && !_isZero) || _isIsland) then {_findSpot = false};
			_counter = _counter + 1;
		};
	};
	_isZero = ((_position select 0) == 0) && ((_position select 1) == 0);
	_position = [_position select 0,_position select 1,0];
	//diag_log("DEBUG: spawning new player at" + str(_position));
	if (!_isZero) then {
		player setPosATL _position;
	};
cutText ["","BLACK IN"];
drnspawn = nil;