/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: server_playerGroup.sqf
	Description: Persisten Groups using extDB
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_groupmembers","_groupIDs","_tPlyr","_dummy"];
_groupmembers = _this select 0;
_groupIDs = _this select 1;
_type = _this select 2;

_dummy = [];

diag_log format ["<VG - Group>: SERVER: %1",_this];

switch (_type) do
{
	case 0: 
	{
		private ["_tPlyr","_tID","_tPlyrarrdb","_tPlyrarr","_tPlyrquery"];
		_tPlyr = _this select 3;
		_tID = getPlayerUID _tPlyr;
		[_tPlyr] join (_groupmembers select 0);
		
		_tPlyrarrdb = [];
		{
			_tPlyrarrdb set [count _tPlyrarrdb,toArray _x];
			_tPlyrarr set [count _tPlyrarr,_x];
		} count _groupIDs;
		
		_curPlyr setVariable ["groupfriends",_tPlyrarr,true];
		_tPlyrquery = format["UPDATE player_data SET PlayerGroup='%1' WHERE PlayerUID='%2'",_tPlyrarrdb,_tID];
		_result = [_tPlyrquery,2,false] call extDB_async;
		
		_groupIDs = _groupIDs + [_tID];
		
		uiSleep 0.4;
		
		for [{_i=0},{_i<=((count _groupmembers)-1)},{_i=_i+1}] do
		{
			private ["_curarr","_curID","_curPlyr","_query","_result","_curarrdb"];
			_curarr = [];
			_curarrdb = [];
			_curPlyr = _groupmembers select _i;
			_curID = getPlayerUID _curPlyr;
			{
				if (_x != _curID) then
				{
					_curarr set [count _curarr,_x];
					_curarrdb set [count _curarrdb,toArray _x];
				};
			} count _groupIDs;
			_curPlyr setVariable ["groupfriends",_curarr,true];
			_query = format["UPDATE player_data SET PlayerGroup='%1' WHERE PlayerUID='%2'",_curarrdb,_curID];
			_result = [_query,2,false] call extDB_async;
			diag_log format ["<VG - Group>: UPDATE: %1 (%2) join %3/%4",_curPlyr,_curID,_curarr,_curarrdb];
			uiSleep 0.4;
		};
	};
	case 1: 
	{
		for [{_i=0},{_i<=((count _groupmembers)-1)},{_i=_i+1}] do
		{
			private ["_curID","_curPlyr","_query","_result"];
			_curPlyr = _groupmembers select _i;
			_curID = getPlayerUID _curPlyr;
			_curPlyr setVariable ["groupfriends",[],true];
			[_curPlyr] join grpNull;
			_query = format["UPDATE player_data SET PlayerGroup='%1' WHERE PlayerUID='%2'",_dummy,_curID];
			_result = [_query,2,false] call extDB_async;
			diag_log format ["<VG - Group>: UPDATE: %1 (%2) join %3/%4",_curPlyr,_curID,[],[]];
			uiSleep 0.4;
		};	
	};
	case 2: 
	{
		_tPlyr = _this select 3;
		_tID = getPlayerUID _tPlyr;
		for [{_i=0},{_i<=((count _groupmembers)-1)},{_i=_i+1}] do
		{
			private ["_curarr","_curID","_curPlyr","_query","_result","_curarrdb"];
			_curarr = [];
			_curarrdb = [];
			_curPlyr = _groupmembers select _i;
			_curID = getPlayerUID _curPlyr;
			if (_curID != _tID) then
			{
				{
					if (_x != _curID) then
					{
						_curarr set [count _curarr,_x];
						_curarrdb set [count _curarrdb,toArray _x];
					};
				} count _groupIDs;
				_curPlyr setVariable ["groupfriends",_curarr,true];
				_query = format["UPDATE player_data SET PlayerGroup='%1' WHERE PlayerUID='%2'",_curarrdb,_curID];
				_result = [_query,2,false] call extDB_async;
			}
			else
			{
				_tPlyr setVariable ["groupfriends",[],true];
				[_tPlyr] join grpNull;
				_query = format["UPDATE player_data SET PlayerGroup='%1' WHERE PlayerUID='%2'",_dummy,_tID];
				_result = [_query,2,false] call extDB_async;
			};
			diag_log format ["<VG - Group>: UPDATE: %1 (%2) join %3/%4",_curPlyr,_curID,_curarr,_curarrdb];
			uiSleep 0.4;
		};
	};
};