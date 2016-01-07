/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: player_twp.sqf
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_target","_res","_i","_pending","_reason"];
_target = _this select 3;
_res = false;

cutText [format ["\n\nYou have send a trade offer to %1!",name _target],"PLAIN DOWN"];

[_target,format["\n\nYou have a pending trade offer from %1, press ""CTRL+T"" to accept!",name player],"rCut"] call vg_RE;

_target setVariable ["twprequest",getPlayerUID player,true];

_reason = "";
_pending = true;
_i = 1;
while {_pending} do
{
	private ["_var"];
	_var = _target getVariable ["twpaccept",false];
	_i = _i + 1;
	if (player distance _target > 5) then 
	{
		_pending = false;
		_reason = format ["\n\n%1 has moved more than 5 meters away!",name _target];
	};
	
	if (_i > 30) then 
	{
		_pending = false;
		_reason = format ["\n\n%1 did not accept your trade offer in time!",name _target];
	};
	
	if (_var) then {_res = true;_pending = false;};
	uiSleep 0.5;
};

if (_res) then
{
	_target spawn twp_init;
	player setVariable ["twpactive",true,true];
}
else
{
	cutText [_reason,"PLAIN DOWN"];
	_target setVariable ["twprequest","0",true];
};
