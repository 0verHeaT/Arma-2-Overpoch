/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: client_init.sqf
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
execVM "overheat\marker.sqf";
execVM "overheat\init\welcome.sqf";
execVM "overheat\external\logistic\init.sqf";
execVM "overheat\external\service_point\service_point.sqf";

[] spawn group_3dicons;

1000 cutRsc ["VgLogo","PLAIN"];

/*
[] spawn
{
	while {1 == 1} do
	{
		if (visibleMap || (!isNull (findDisplay 88890))) then 
		{
			{
				if ((isPlayer _x) && (alive _x)) then 
				{
					_name = name _x;
					_str = "";
					_clr = "ColorYellow";
					if (vehicle _x != _x) then {_str = format[" %1",typeOf (vehicle _x)];_clr = "ColorOrange";};
					if (_x == player) then {_clr = "ColorGreen"};
					_pPos = getPosATL _x;
					if (surfaceIsWater _pPos) then {_pPos = getPosASL _x;};
					deleteMarkerLocal _name;
					_mrkr = createMarkerLocal [_name,_pPos];
					_mrkr setMarkerTypeLocal "DestroyedVehicle";
					_mrkr setMarkerColorLocal _clr;
					_mrkr setMarkerTextLocal format ["%1",(_name + _str)];
				}
				else
				{
					deleteMarkerLocal _name;
				};
			} count (units group player);
		};
		uiSleep 1;
	};
};
*/

diag_log format ["<VG>: Successfully Loaded Client Init on %1",player];