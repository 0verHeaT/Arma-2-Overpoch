/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: init.sqf
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
player setVariable ["BIS_noCoreConversations", true];
enableRadio false;
enableSentences false;

#include "overheat\vgserver.sqf"

call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";	
call compile preprocessFileLineNumbers "overheat\init\variables.sqf";	
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "overheat\init\compiles.sqf";
call compile preprocessFileLineNumbers "overheat\init\custom_compiles.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then 
{
	call compile preprocessFileLineNumbers format ["\z\addons\dayz_server\overheat\%1\dynamic_vehicle.sqf",vgserver];
	_serverMonitor = [] execVM "\z\addons\dayz_server\system\server_monitor.sqf";
};

if (!isDedicated && hasInterface) then 
{
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = [] execVM "overheat\system\player_monitor.sqf";
	#include "overheat\client_init.sqf"
};

if (dayz_instance != 16) then 
{
	[] spawn 
	{
		waitUntil {!isNil "PV_weather";};
		if (PV_weather > 7) then 
		{
			execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";
		};
	};
};

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"
