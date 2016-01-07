disableSerialization;
private ["_display","_viewDCtrl","_pinfoCtrl","_sinfoCtrl","_infoCtrl","_adminCtrl","_sliderCtrl","_editCtrl","_setRcsCtrl","_reqRcsCtrl"];

_display = (uiNamespace getVariable "SettingsDialog");
_viewDCtrl = _display displayCtrl 5101;
_pinfoCtrl = _display displayCtrl 5102;
_sinfoCtrl = _display displayCtrl 5103;
_infoCtrl = _display displayCtrl 5104;
_adminCtrl = _display displayCtrl 5105;
_sliderCtrl = _display displayCtrl 5106;
_editCtrl = _display displayCtrl 5107;
_setRcsCtrl = _display displayCtrl 5108;
_reqRcsCtrl = _display displayCtrl 5109;

_viewDCtrl ctrlSetStructuredText parseText format["<t align='left' color='#9F1B1B'>View Distance: </t><t align='right' color='#FFFFFF'>(%1m)  </t>",VGClientViewDistance];
_infoCtrl ctrlSetStructuredText parseText "<br/><t align='left' color='#9F1B1B'> Player Information</t><t align='right' color='#9F1B1B'>Server Information </t>";
_adminCtrl ctrlSetStructuredText parseText "<t align='left' size='0.9' color='#9F1B1B'>Contact an admin ingame (Use only in case of emergency)</t>";

VGPlyrClientstats = [_pinfoCtrl,_sinfoCtrl] spawn 
{
	while {true} do 
	{
		private ["_playerinfo","_serverinfo","_stime","_hours","_min","_minutes","_minutes2","_sec","_sec2","_dif","_humanityclr","_humaity"];
		_stime = 0;
		if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
		_hours = (_stime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = call compile (toString _hours);
		_min = floor(_stime/60);
		_minutes = ((_min - (_hours*60)) min 60) max 0;
		_minutes2 = if (_minutes < 10) then { format ['0%1',_minutes] } else { _minutes };
		_sec = floor _stime;
		_dif = _minutes*60 + _hours*3600;
		_sec2 = _sec - _dif;if (_sec2 < 10) then {_sec2 = format ['0%1',_sec2];}; 
	
		_humanityclr = "#FFFFFF";
		_humaity = round(player getVariable["humanity",0]);
		if (_humaity >= 5000) then {_humanityclr = "#0000FF"};
		if (_humaity <= -5000) then {_humanityclr = "#FF0000"};

		_playerinfo = "<br/>";
		_playerinfo = _playerinfo + format["<t size='0.75' align='left' color='#FFFFFF'>Money</t><t align='right' size='0.75' color='#FFFFFF'>%1 </t><img align='right' size='0.75' image='overheat\gui\dollars.paa' /><br/>",[(player getVariable["cashMoney",0])] call BIS_fnc_numberText];
		_playerinfo = _playerinfo + format["<t size='0.75' align='left' color='#FFFFFF'>Money (Bank)</t><t align='right' size='0.75' color='#FFFFFF'>%1 </t><img align='right' size='0.75' image='overheat\gui\dollars.paa' /><br/><br/>",[(player getVariable["bankMoney",0])] call BIS_fnc_numberText];
		_playerinfo = _playerinfo + format["<t size='0.75' align='left' color='#FFFFFF'>Humanity</t><t align='right' size='0.75' color='%1'>%2 </t><br/>",_humanityclr,_humaity];
		_playerinfo = _playerinfo + format["<t size='0.75' align='left' color='#FFFFFF'>Donator Level</t><t align='right' size='0.75' color='#FFFFFF'>%1 </t><br/><br/>",VGSubLvl];
		_playerinfo = _playerinfo + format["<t size='0.75' align='left' color='#FFFFFF'>Human Kills</t><t align='right' size='0.75' color='#FFFFFF'>%1 </t><br/>",(player getVariable["humanKills",0])];
		_playerinfo = _playerinfo + format["<t size='0.75' align='left' color='#FFFFFF'>Bandit Kills</t><t align='right' size='0.75' color='#FFFFFF'>%1 </t><br/>",(player getVariable["banditKills",0])];
		_playerinfo = _playerinfo + format["<t size='0.75' align='left' color='#FFFFFF'>Zombie Kills</t><t align='right' size='0.75' color='#FFFFFF'>%1 </t><br/>",(player getVariable["zombieKills",0])];
	
		_serverinfo = "<br/>";
		_serverinfo = _serverinfo + format["<t align='right' size='0.9' color='#9F1B1B'>%1   %2</t><br/><br/>",vgserver,worldName];
		_serverinfo = _serverinfo + format["<t align='left' size='0.75' color='#9F1B1B'> IP</t><t align='right' size='0.75' color='#FFFFFF'>%1</t><br/>",VGServerStats select 0];
		_serverinfo = _serverinfo + format["<t align='left' size='0.75' color='#9F1B1B'> Uptime</t><t align='right' size='0.75' color='#FFFFFF'>%1 hours %2 minutes %3 seconds</t><br/>",_hours,_minutes2,_sec2];
		_serverinfo = _serverinfo + format["<t align='left' size='0.75' color='#9F1B1B'> Players Online</t><t align='right' size='0.75' color='#FFFFFF'>(%1/50)</t><br/>",count playableUnits];
		_serverinfo = _serverinfo + format["<t align='right' size='0.75' color='#FFFFFF'>%1 Frames Per Second</t><br/><br/>",ceil diag_fps];
		_serverinfo = _serverinfo + "<t align='right' size='0.75' color='#9F1B1B'>Admins</t><br/>";
		{
			_serverinfo = _serverinfo + format ["<t align='right' size='0.75' color='#FFFFFF'>   %1</t>",_x];
		} forEach (VGServerStats select 1);
	
		(_this select 0) ctrlSetStructuredText parseText _playerinfo;
		(_this select 1) ctrlSetStructuredText parseText _serverinfo;
	
		uiSleep 1;
	};
};