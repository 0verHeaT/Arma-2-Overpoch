private ["_player","_array","_vic","_kill","_wpn","_pic","_dis","_pkill","_kill_txt"];
_player = _this select 0;
_array = _player getVariable ["CollisonKilled",[]];

uiSleep 0.2;

if (isNil "_array") exitWith {};
if (count _array < 1) exitWith {diag_log format ["%1 died of unknown causes",_player];};

_vic = _array select 0;
_kill = _array select 1;
_wpn = _array select 2;
_pic = _array select 3;
_dis = _array select 4;
_pkill = _array select 6;

if ((count _vic < 2) || (count _kill < 2) || isNil "_wpn" || isNil "_dis") exitWith {};

if (_pkill) then {
	if ((owner(_vic select 0)) != (owner _player)) exitWith {};
	if ((owner(_vic select 0)) == (owner(_kill select 0))) exitWith {
		diag_log format["PSUICIDE: %1 has killed himself with weapon %2",(_vic select 1),_wpn];
	};
	_wpnname = getText(configFile >> "cfgWeapons" >> _wpn >> "displayName");
	diag_log format["PKILL: %1 was killed by %2 with weapon %3 from %4m",(_vic select 1),(_kill select 1),_wpn,_dis];
	
	if ((gettext (configFile >> "cfgWeapons" >> _wpn >> "displayName")) != "Throw") then {
		if !(isNil "_pic") then {
			_kill_txt = format ["<t size='0.75' color='#CCCCCC' align='left'>%1 </t>",(_kill select 1)];
			_kill_txt = _kill_txt + format ["<img size='0.9' align='left' image='%1'/>",_pic];
			_kill_txt = _kill_txt + format ["<t size='0.75' color='#CCCCCC' align='left'> %1 </t>",(_vic select 1)];
			_kill_txt = _kill_txt + format ["<t size='0.75' color='#CCCCCC' align='left'>[%1m]</t>",ceil _dis];
			[[""+server_var+"","all"],"rKM",_kill_txt] call server_sendremoteExe;
		};
	};	
	_death_record = [(_vic select 1),(_kill select 1),_wpnname,_pic,_dis,ServerCurrentTime];
	PV_DeathBoard set [count PV_DeathBoard,_death_record];
	publicVariable "PV_DeathBoard";
} else {
	if (typeName (_vic select 0) == "STRING") then {
		if ((_vic select 1) == "NPC") then {
			diag_log format["NPCKILL: %1 killed an AI with weapon %2 from %3m",(_kill select 1),_wpn,_dis];
			/*
			if ((gettext (configFile >> "cfgWeapons" >> _wpn >> "displayName")) != "Throw") then {
				if !(isNil "_pic") then {
					_kill_txt = format ["<t size='0.75' color='#CCCCCC' align='left'>%1 </t>",(_kill select 1)];
					_kill_txt = _kill_txt + format ["<img size='0.9' align='left' image='%1'/>",_pic];
					_kill_txt = _kill_txt + format ["<t size='0.75' color='#CCCCCC' align='left'> %1 </t>",(_vic select 1)];
					_kill_txt = _kill_txt + format ["<t size='0.75' color='#CCCCCC' align='left'>[%1m]</t>",ceil _dis];
					[[""+server_var+"","all"],"rKM",_kill_txt] call server_sendremoteExe;
				};
			};
			*/
		};
	} else {
		if (typeName (_kill select 0) == "STRING") then {
			if ((_kill select 1) == "NPC") then {
				diag_log format["NPCKILL: %1 was killed by NPC with weapon %2 from %3m",(_vic select 1),_wpn,_dis];
				if ((gettext (configFile >> "cfgWeapons" >> _wpn >> "displayName")) != "Throw") then {
					if !(isNil "_pic") then {
						_kill_txt = format ["<t size='0.75' color='#CCCCCC' align='left'>%1 </t>",(_kill select 1)];
						_kill_txt = _kill_txt + format ["<img size='0.9' align='left' image='%1'/>",_pic];
						_kill_txt = _kill_txt + format ["<t size='0.75' color='#CCCCCC' align='left'> %1 </t>",(_vic select 1)];
						_kill_txt = _kill_txt + format ["<t size='0.75' color='#CCCCCC' align='left'>[%1m]</t>",ceil _dis];
						[[""+server_var+"","all"],"rKM",_kill_txt] call server_sendremoteExe;
					};
				};
			};
		};
	};
};