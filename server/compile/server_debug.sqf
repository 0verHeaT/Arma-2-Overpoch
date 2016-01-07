private ["_player","_text","_debug","_REcode","_tolower","_log"];
_type = _this select 0;
_text = _this select 1;

call 
{
	if (_type == "log") exitWith {_text = toString _text;diag_log format ["<VG - LOG>:  %1",_text];};
	if (_type == "trade") exitWith {_text = toString _text;diag_log format ["EPOCH SERVERTRADE:  %1",_text];};
	if (_type == "twp") exitWith {_text = toString _text;diag_log format ["TRADEWITHPLAYERS:  %1",_text];};
	if (_type == "Hlog") exitWith {['','HLOG',_text,toArray (format['%1PV',client_var])] call fnc_custom_AH_handle;};
	if (_type == "adminskin") exitWith {_text setVehicleInit "this setObjectTexture [0,'overheat\gui\skin.jpg'];"; processInitCommands;};
	if (_type == "allmsg") exitWith {[[server_var,"all"],"rDyn",_text] call server_sendremoteExe;};
	if (_type == "pmsg") exitWith {[[server_var,_text select 0],"rCut",_text select 1] call server_sendremoteExe;};
	if (_type == "sync") exitWith {_log = format["CHILD:201:%1",toString _text];[_log,""+server_var+"HIVE"] call server_hiveWrite;};
};