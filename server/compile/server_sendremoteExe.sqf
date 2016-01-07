/*
	Made for Arma 2 DayZ Epoch

	File: server_sendremoteExe.sqf
	Description: 
	Allows to send anything from server to clients, in a secure way
	e.g. [[sendPlyr,targetPlyr],"rDyn","Sample Text"] call server_sendremoteExe;
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_array","_type","_code","_send","_target","_i","_nodebug"];
_array = _this select 0;
_type = _this select 1;
_code = _this select 2;
if (count _array != 2 || isNil "_code" || isNil "_type") exitWith {diag_log "ERROR: Remote Execution wrong called!"};
_send = _array select 0;
_target = _array select 1;
_nodebug = false;

if ((count _this) > 3) then {
	if ((_this select 3) == ""+server_var+"NODEBUG") then {
		_nodebug = true;
	};
};

call compile ("
if ((typeName _send) == 'STRING') then {
	comment 'Send from server to client only';
	if (_send == server_var) then { 
		if ((typeName _target) == 'STRING') then {
			comment 'Send from server to a group of clients';
			if (_target == 'admin') then {
				{
					if ((getPlayerUID _x) in "+server_var+"ADMIS) then {
						"+vg_var1+" = [_code,_type];
						(owner _x) publicVariableClient '"+vg_var1+"';
					};
				} forEach playableUnits;
			} else {
				if (_target == 'all') then {
					"+vg_var1+" = [_code,_type];
					publicVariable '"+vg_var1+"';
				};
			};
		} else {
			comment 'Send from server to specific clients';
			if (isPlayer _target) then {
				"+vg_var1+" = [_code,_type,_target];
				(owner _target) publicVariableClient '"+vg_var1+"';
			};
		};
	};
} else {
	comment 'Send from player or admins to anyone';
	if ((typeName _target) == 'STRING') then {
		if (_target == 'all') then {
			if !(getPlayerUID _send in "+server_var+"ADMIS) exitWith {
				_log = format['%1  (%2)  attempt to use RE',name _send,getPlayerUID _send];
				[_send,'BAN',toArray _log,toArray (format['%1PV',client_var])] call fnc_custom_AH_handle;
			};
			_i = 0;
			{
				"+vg_var1+" = [_code,_type];
				(owner _x) publicVariableClient '"+vg_var1+"';
				_i = _i + 1;
			} forEach playableUnits;
			diag_log format ['REMOTE: %1 to All Clients (%2) | %3 | %4',_send,_i,_type,_code];
		};
	} else {
		if ((isPlayer _send) && (isPlayer _target)) then {
			"+vg_var1+" = [_code,_type,_target];
			(owner _target) publicVariableClient '"+vg_var1+"';
			if !(_nodebug) then {
				diag_log format ['REMOTE: %1 to %2 | %3 | Success',_send,_target,_type];
			};
		};
	};
};
");