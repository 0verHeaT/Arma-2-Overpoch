private ["_abort","_reason","_isOk","_proceed","_counter","_animState","_started","_finished","_isMedic","_wealth"];
closeDialog 106;
_abort = false;
if(({inflamed _x} count (getPosATL player nearObjects 3)) == 0) then {_abort = true; _reason = "fire";};
if((count(nearestObjects [player,["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"],3])) == 0) then {_abort = true; _reason = "workshop";};
	
if(_abort) exitWith {cutText [format["\n\nSmelting needs a %1 within %2 meters!",_reason,3], "PLAIN DOWN"];};

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
	cutText ["\n\nSmelting Gold Ore, move to cancel!","PLAIN DOWN"];
	if(_counter == 1) exitWith {_isOk = false;_proceed = true;};
};

if (_proceed) then {
	if ("PartOreGold" in magazines player) then {
		player removeMagazine "PartOreGold";
		_wealth = player getVariable ["cashMoney",0];
		player setVariable ["cashMoney",(_wealth + 900),true];
		PVDZE_plr_Save = [player,(magazines player),true,true];
		publicVariableServer "PVDZE_plr_Save";
		cutText ["\n\nYou have smelted a Gold Ore and received 900 Gold Coins!","PLAIN DOWN"];
	} else {
		cutText ["\n\nSmelting Failed!","PLAIN DOWN"];
	};
} else {
	cutText ["\n\nCanceled Smelting!","PLAIN DOWN"];
};
