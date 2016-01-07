/***
	Custom Remove 
	for Custom Structures && Buildings
	
	Created by 0verHeaT
***/
private ["_objectname","_nearobj","_object","_objectID","_objectUID","_findNearestPoles","_findNearestPole","_nearestPole","_ownerID","_canremove","_friendlies","_fuid","_friendUID","_builder","_isOk","_proceed","_counter","_animState","_started","_finished","_isMedic","_proceed"];

if(DZE_ActionInProgress) exitWith {cutText [(localize "str_epoch_player_88"),"PLAIN DOWN"]; BuildingTradeResult = false;};
DZE_ActionInProgress = true;

if (dayz_isSwimming) exitWith {cutText [localize "str_player_26", "PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};
if (( vehicle player) != player) exitWith {cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};
if ((getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1) exitWith {cutText [localize "str_player_21", "PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};
if (player getVariable["combattimeout", 0] >= time) exitWith {cutText [(localize "str_epoch_player_43"), "PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};

_class = _this select 0;
_objectname = _this select 1;

_nearobj = nearestObjects [(getPosATL player),[_class],5];
if ((count _nearobj) < 1) exitWith {cutText ["Removing failed!","PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};

_object = _nearobj select 0;

if (_object getVariable["isTemp",false])	exitWith {cutText ["You cannot remove a temporary object!","PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;}; //Prevent duping

_objectID = _object getVariable ["ObjectID","0"];
_objectUID = _object getVariable ["ObjectUID","0"];
/*********************************************************************************************************************************************************/
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], (DZE_PlotPole select 0)];
if ((count _findNearestPoles) >= 1) then {
	_findNearestPole = [];
	{
		if (alive _x) then {
			_findNearestPole set [(count _findNearestPole),_x];
		};
	} foreach _findNearestPoles;
	_nearestPole = _findNearestPole select 0;
	_ownerID = _nearestPole getVariable ["ownerPUID","0"];
	if((getPlayerUID player) == _ownerID) then {
		_canremove = true;
	} else {
		_friendlies = _nearestPole getVariable ["plotfriends",[]];
		_fuid  = [];
		{
			_friendUID = _x select 0;
			_fuid  =  _fuid  + [_friendUID];
		} forEach _friendlies;
		_builder  = (getPlayerUID player);
		if(_builder in _fuid) then {_canremove = true;};
	};
};
if(!_canremove) exitWith {cutText [format[(localize "STR_EPOCH_PLAYER_135"),(localize "str_epoch_player_246"),(DZE_PlotPole select 0)] , "PLAIN DOWN"]; DZE_ActionInProgress = false; BuildingTradeResult = false;};
/*********************************************************************************************************************************************************/
_isOk = true;
_proceed = false;
_counter = 0;
while {_isOk} do {
	[1,1] call dayz_HungerThirst;
	player playActionNow "Medic";
	[player,20,true,(getPosATL player)] spawn player_alertZombies;
	r_interrupt = false;
	_animState = animationState player;
	r_doLoop = true;
	_started = false;
	_finished = false;
	while {r_doLoop} do {
		_animState = animationState player;
		_isMedic = ["medic",_animState] call fnc_inString;
		if (_isMedic) then {_started = true;};
		if (_started && !_isMedic) then {r_doLoop = false;_finished = true;[player,"repair",0,false,10] call dayz_zombieSpeak;};
		if (r_interrupt) then {r_doLoop = false;};
		sleep 0.1;
	};
	if(!_finished) exitWith {_isOk = false;_proceed = false;};

	if(_finished) then {_counter = _counter + 1;};
	cutText [format[(localize "str_epoch_player_163"),_objectname,_counter,3], "PLAIN DOWN"];
	if(_counter == 3) exitWith {_isOk = false;_proceed = true;};
};

if (_proceed) then {
	if(!isNull(_object)) then {
		deleteVehicle _object;
		
		PVDZE_obj_Delete = [_objectID,_objectUID,player];
		publicVariableServer "PVDZE_obj_Delete";
		
		cutText [format[(localize "str_epoch_player_165"),_objectname],"PLAIN DOWN"];
		
		BuildingTradeResult = true;
	} else {
		cutText [(localize "str_epoch_player_91"), "PLAIN DOWN"];
	};
} else {
	r_interrupt = false;
	if (vehicle player == player) then {
		[objNull, player, rSwitchMove,""] call RE;
		player playActionNow "stop";
	};
};
DZE_ActionInProgress = false;
sleep 1;
BuildingTradeResult = false;