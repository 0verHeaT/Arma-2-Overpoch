diag_log "WAI TIMER: Starting AI Missions Moniter";

WAI_MISSIONS_RUNNING = 0;

while {true} do
{
	private["_mission","_name","_slots","_sleep","_loot","_chance"];
	_mission = WAI_MISSIONS call BIS_fnc_selectRandom;
	_name = _mission select 0;
	_slots = _mission select 1;
	_loot = _mission select 2;
	_chance = 1;
	if (count _mission > 3) then {_chance = _mission select 3;};
	
	_sleep = 60;
	
	if (((WAI_MISSIONSLOTS - _slots) >= 0) && ((random 1) <= _chance) && !(_name in WAI_CURRENT_MISSIONS)) then
	{
		[_name,_slots,_loot] execVM format ["\z\addons\dayz_server\WAI\missions\%1.sqf",_name];
		_sleep = ((call WAI_MISSION_TIMER) + floor(random 60));
		diag_log format["WAI TIMER: Starting Mission %1. Timer sleep for %2 sec.",_mission select 0,_sleep];
	}
	else
	{
		_sleep = 70 - (count playableUnits);
		if ((count WAI_CURRENT_MISSIONS) < 1) then {_sleep = 5;};
		diag_log format ["WAI TIMER: Sleep for %1 sec.",_sleep];
	};
	uiSleep _sleep;
};