/*
[_objectID,_objectUID] call server_deleteObj;
*/
private["_id","_uid","_key","_proceed","_name","_puid"];
_id 	= _this select 0;
_uid 	= _this select 1;
_activatingPlayer = _this select 2;
_proceed = false;
if (count _this > 3) then {
	if (_this select 3 == "infistar") then {
		_proceed = true;
		_name = "Infistar";
		_puid = "Custom Delete";
	};
} else {
	if (isPlayer _activatingPlayer) then {
		_proceed = true;
		_name = (name _activatingPlayer);
		_puid = (getPlayerUID _activatingPlayer);
		_count = _activatingPlayer getVariable ["DelCount",0];
		_activatingPlayer setVariable ["DelCount",_count + 1,true];
		if (_count > 50) then {
			_log = format["%1  (%2)  deleted over 50 objects",_name,_puid];
			[_activatingPlayer,"KICK",toArray _log,toArray (format['%1PV',client_var])] call fnc_custom_AH_handle;
		};
	};
};
if !(_proceed) exitWith {
	_log = format["Hacker Delete Attempt  %1",_activatingPlayer];
	["","HLOG",toArray _log,toArray (format['%1PV',client_var])] call fnc_custom_AH_handle;
};

if (isServer) then {
	if (parseNumber _id > 0) then {
		_key = format["CHILD:304:%1:",_id];
		[_key,""+server_var+"HIVE"] call server_hiveWrite;
		diag_log format["DELETE: %1 (%2) Deleted by ID: %3",_name,_puid,_id];
	} else  {
		_key = format["CHILD:310:%1:",_uid];
		[_key,""+server_var+"HIVE"] call server_hiveWrite;
		diag_log format["DELETE: %1 (%2) Deleted by UID: %3",_name,_puid,_uid];
	};
};