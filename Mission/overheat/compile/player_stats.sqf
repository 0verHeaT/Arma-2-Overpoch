/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: player_stats.sqf
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
disableSerialization;
private ["_display","_stats"];
_display = uiNameSpace getVariable "VgStatsDisplay";
_stats = _display displayCtrl 10001;
while {1 == 1} do
{
	private ["_stime","_hours","_minutes","_minutes2","_pic","_txt"];
	_stime = 0;
	if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
	_hours = (_stime/60/60);
	_hours = toArray (str _hours);
	_hours resize 1;
	_hours = toString _hours;
	_hours = compile _hours;
	_hours = call  _hours;
	_minutes = floor(_stime/60);
	_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if (_minutes2 < 10) then {_minutes2 = format ['0%1',_minutes2];};
	
	/*
	if (player == vehicle player) then 
	{
		_pic = (gettext (configFile >> 'cfgWeapons' >> (currentWeapon player) >> 'picture'));
	} 
	else 
	{
		_pic = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle player) >> 'picture'));
	};
	*/
	_txt = "<img size='2.5' image='overheat\gui\dc.paa' align='Center'/><br/><br/>";
	//_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>Name: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1</t><br/>",name player];
	_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>Blood: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1</t><br/>",r_player_blood];
	_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>Humanity: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1</t><br/><br/>",player getVariable["humanity",0]];
	_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>Cash: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1 </t><img size='1' align='right' image='overheat\GUI\dollars.paa'/><br/>",[player getVariable ["cashMoney",0]] call BIS_fnc_numberText];
	_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>Bank: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1 </t><img size='1' align='right' image='overheat\GUI\dollars.paa'/><br/><br/>",[player getVariable ["bankMoney",0]] call BIS_fnc_numberText];
	_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>Zombie Kills: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1</t><br/>",player getVariable["zombieKills",0]];
	_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>Murders: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1</t><br/>",player getVariable["humanKills",0]];
	_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>Bandits Killed: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1</t><br/><br/>",player getVariable["banditKills",0]];
	_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>FPS: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1</t><br/>",round diag_fps];
	_txt = _txt + format ["<t size='1' font='Bitstream' align='left' color='#9F1B1B'>Server Uptime: </t><t size='1' font='Bitstream' align='right' color='#FFFFFF'>%1h %2min</t><br/><br/>",_hours,_minutes2];
	//_txt = _txt + format ["<img size='3' image='%1' align='Center'/><br/>",_pic];
	_txt = _txt + "<t size='1' font='Bitstream' align='center' color='#FFFFFF'>VectionGaming.com</t><br/>";
	_txt = _txt + "<t size='1' font='Bitstream' align='center' color='#FFFFFF'>ts3.vectionGaming.com</t><br/>";
		
	_stats ctrlSetStructuredText parseText _txt;
	uiSleep 2;
};