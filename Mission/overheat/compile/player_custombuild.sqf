/***
	Original created for "Build Snapping - Extended v1.5" by Maca134 && OtterNas3
	
	Reworked for Custom Structures && Buildings
	by 0verHeaT
***/
private ["_result","_location","_dir","_classname","_item","_hasrequireditem","_missing","_hastoolweapon","_cancel","_reason","_started","_finished","_animState","_isMedic","_dis","_sfx","_hasbuilditem","_tmpbuilt","_onLadder","_isWater","_require","_text","_offset","_IsNearPlot","_isOk","_location1","_location2","_counter","_limit","_proceed","_num_removed","_position","_object","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_findNearestPoles","_findNearestPole","_distance","_classnametmp","_ghost","_isPole","_needText","_lockable","_zheightchanged","_rotate","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_combination_1_Display","_combinationDisplay","_zheightdirection","_abort","_isNear","_need","_objHupDiff","_needNear","_vehicle","_inVehicle","_requireplot","_objHDiff","_isLandFireDZ","_isTankTrap","_ownerPUID", "_playerUID","_isVehicle","_price"];

if(DZE_ActionInProgress) exitWith {cutText [(localize "str_epoch_player_40"),"PLAIN DOWN"]; BuildingTradeResult = false;};
DZE_ActionInProgress = true;

if((count ((getPosATL player) nearObjects ["All",30])) >= DZE_BuildingLimit) exitWith {cutText [(localize "str_epoch_player_41"), "PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};
if (dayz_isSwimming) exitWith {cutText [localize "str_player_26", "PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};
if (( vehicle player) != player) exitWith {cutText [(localize "str_epoch_player_42"),"PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};
if ((getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1) exitWith {cutText [localize "str_player_21", "PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};
if (player getVariable["combattimeout", 0] >= time) exitWith {cutText [(localize "str_epoch_player_43"),"PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};

_offset = [0,1.5,1];
/********************************************************************************************/
_classname = _this select 0;
_text = _this select 1;
_limit = _this select 2;
_isAllowedUnderGround = _this select 3;
_isVehicle = _this select 4;
_offset = _this select 5;
_price = _this select 6;
/********************************************************************************************/

_cancel = false;
_reason = "";
_canBuildOnPlot = false;

_playerUID = (getPlayerUID player);

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;

DZE_cancelBuilding = false;

call gear_ui_init;
closeDialog 1;

_distance = DZE_PlotPole select 0;
_needText = localize "str_epoch_player_246";

_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
if ((count _findNearestPoles) >= 1) then {
	_findNearestPole = [];
	{
		if (alive _x) then {
			_findNearestPole set [(count _findNearestPole),_x];
		};
	} foreach _findNearestPoles;

	_nearestPole = _findNearestPole select 0;

	_ownerID = _nearestPole getVariable ["ownerPUID","0"];

	if(_playerUID == _ownerID) then {
		_canBuildOnPlot = true;
	} else {
		_friendlies = _nearestPole getVariable ["plotfriends",[]];
		_fuid  = [];
		{
			_friendUID = _x select 0;
			_fuid  =  _fuid  + [_friendUID];
		} forEach _friendlies;
		_builder  = getPlayerUID player;
		if(_builder in _fuid) then {_canBuildOnPlot = true;};
	};
};
if(!_canBuildOnPlot) exitWith { cutText [format[(localize "STR_EPOCH_PLAYER_135"),_needText,_distance] , "PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_location = [0,0,0];
_isOk = true;

_location1 = getPosATL player;
_dir = getDir player;

_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
_object setDir _dir;
_object attachTo [player,_offset];
	
_position = getPosATL _object;

_object setVariable ["isTemp",true,true];

cutText [(localize "str_epoch_player_45"), "PLAIN DOWN"];

player allowDamage false;
SnappingOffset = _offset;
SnappingDir = 0;
SnappingSpotMarkers = [];
SnappingEnabled = false;
SnappedOffsetZ = 0;
SnappingResetPos = false;

if (isClass (missionConfigFile >> "SnapPoints" >> _classname)) then {
	if (s_building_snapping < 0) then {
		s_building_snapping = player addAction ["<t color=""#0000ff"">Toggle Snapping</t>", "OcgMods\buildsnapp\player_toggleSnapping.sqf",_classname, 3, true, false, "",""];
	};
} else {
	player removeAction s_building_snapping;
	s_building_snapping = -1;
};
	
_snapper = [_object, _classname] spawn snap_object_custom;
_key_monitor = [] spawn player_buildControls_custom;
	
while {_isOk} do {
	sleep 1;
	_location2 = getPosATL player;

	if(DZE_5) exitWith {
		_isOk = false;
		detach _object;
		_dir = getDir _object;
		_position = getPosATL _object;
	};
	if(_location1 distance _location2 > 5) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "You've moved to far away from where you started building (within 5 meters)"; 
		detach _object;
	};	
	if(((SnappingOffset select 2) > 5) or ((SnappingOffset select 2) < -5)) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Cannot move up or down more than 5 meters"; 
		detach _object;
	};
	if (player getVariable["combattimeout", 0] >= time) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = (localize "str_epoch_player_43");
		detach _object;
	};
	if (DZE_cancelBuilding) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Cancelled building.";
		detach _object;
	};
};

terminate _snapper;
terminate _key_monitor;
player removeAction s_building_snapping;
s_building_snapping = -1;
player allowDamage true;

if (!DZE_BuildOnRoads) then {if (isOnRoad _position) then { _cancel = true; _reason = "Cannot build on a road."; };};
if(!canbuild) then { _cancel = true; _reason = "Cannot build in a city."; };

if(!_cancel) then {
	_location = _position;
	if((_isAllowedUnderGround == 0) and ((_location select 2) < 0)) then {_location set [2,0];};
	
	_object setPosATL _location;
	cutText [format[(localize "str_epoch_player_138"),_text], "PLAIN DOWN"];

	_isOk = true;
	_proceed = false;
	_counter = 0;

	while {_isOk} do {
		[10,10] call dayz_HungerThirst;
		player playActionNow "Medic";
		
		_dis = 20;
		_sfx = "repair";
		[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
		[player,_dis,true,(getPosATL player)] spawn player_alertZombies;
	
		r_interrupt = false;
		_animState = animationState player;
		r_doLoop = true;
		_started = false;
		_finished = false;
	
		while {r_doLoop} do {
			_animState = animationState player;
			_isMedic = ["medic",_animState] call fnc_inString;
			if (_isMedic) then {
				_started = true;
			};
			if (_started and !_isMedic) then {
				r_doLoop = false;
				_finished = true;
			};
			if (r_interrupt or (player getVariable["combattimeout", 0] >= time)) then {
				r_doLoop = false;
			};
			if (DZE_cancelBuilding) exitWith {
				r_doLoop = false;
			};
			sleep 0.1;
		};
		r_doLoop = false;
		if(!_finished) exitWith {
			_isOk = false;
			_proceed = false;
		};
		if(_finished) then {
			_counter = _counter + 1;
		};
		cutText [format[(localize "str_epoch_player_139"),_text, _counter,_limit], "PLAIN DOWN"];
		if(_counter == _limit) exitWith {
			_isOk = false;
			_proceed = true;
		};
	};
	if (_proceed) then {
		if ((_price select 1) == "Coins") then {
			private ["_wealth"];
			_wealth = player getVariable ["cashMoney",0];
			if (_wealth >= (_price select 0)) then {
				cutText [format[localize "str_build_01",_text], "PLAIN DOWN"];
				if (_isVehicle) then {
					_mags = _object magazinesTurret [0];
					{_object removeMagazinesTurret [_x,[0]];} forEach _mags;
					_mags = _object magazinesTurret [-1];
					{_object removeMagazinesTurret [_x,[-1]];} forEach _mags;
					PVDZE_veh_Publish = [_object,[_dir,_location],_classname,false,"0"];
					publicVariableServer "PVDZE_veh_Publish";
				} else {
					_object setVariable ["ownerPUID",_playerUID,true];
					PVDZE_obj_Publish = [dayz_characterID,_object,[_dir,_location,_playerUID],_classname];
					publicVariableServer "PVDZE_obj_Publish";
				};
				BuildingTradeResult = true;
				_object setVariable ["isTemp",false,true];
			} else {
				deleteVehicle _object;
				cutText [format["\n\nCould not remove %1 Gold Coins. Trading failed!",[(_price select 0)] call BIS_fnc_numberText],"PLAIN DOWN"];
			};
		} else {
			private ["_check","_currencyname"];
			_currencyname = getText(configFile >> "CfgMagazines" >> (_price select 1) >> "displayName");
			_check = {_x == (_price select 1)} count magazines player;
			if (_check >= (_price select 0)) then {
				cutText [format[localize "str_build_01",_text], "PLAIN DOWN"];
				if (_isVehicle) then {
					_mags = _object magazinesTurret [0];
					{_object removeMagazinesTurret [_x,[0]];} forEach _mags;
					_mags = _object magazinesTurret [-1];
					{_object removeMagazinesTurret [_x,[-1]];} forEach _mags;
					PVDZE_veh_Publish = [_object,[_dir,_location],_classname,false,"0"];
					publicVariableServer "PVDZE_veh_Publish";
				} else {
					_object setVariable ["ownerPUID",_playerUID,true];
					PVDZE_obj_Publish = [dayz_characterID,_object,[_dir,_location,_playerUID],_classname];
					publicVariableServer "PVDZE_obj_Publish";
				};
				BuildingTradeResult = true;
				_object setVariable ["isTemp",false,true];
			} else {
				deleteVehicle _object;
				cutText [format["\n\nCould not remove %1 %2. Trading failed!",(_price select 0),_currencyname],"PLAIN DOWN"];
			};
		};
	} else {
		r_interrupt = false;
		if (vehicle player == player) then {
			[objNull, player, rSwitchMove,""] call RE;
			player playActionNow "stop";
		};
		deleteVehicle _object;
		cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
	};
} else {
	deleteVehicle _object;
	cutText [format[(localize "str_epoch_player_47"),_text,_reason], "PLAIN DOWN"];
};
DZE_ActionInProgress = false;
sleep 1;
BuildingTradeResult = false;