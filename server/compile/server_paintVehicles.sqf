private["_position","_worldspace","_fuel","_key","_colour","_colour2","_object","_objectID","_PUID","_clrinit","_clrinit2","_pname","_name"];
_object = _this select 0;
_colour = _this select 1;
_colour2 = _this select 2;

_clrinit = format ["#(argb,8,8,3)color(%1)",_colour];
_clrinit2 = format ["#(argb,8,8,3)color(%1)",_colour2];
_object setVehicleInit "this setObjectTexture [0,"+str _clrinit+"];";
_object setVehicleInit "this setObjectTexture [1,"+str _clrinit2+"];";

processInitCommands;

if ((count _this) > 3) then 
{
	_object setVariable["Colour",_colour,true];
	_object setVariable["Colour2",_colour2,true];

	_name = getText(configFile >> "cfgVehicles" >> (typeOf _object) >> "displayName");

	_PUID = (getPlayerUID (_this select 3));
	_pname = (name (_this select 3));
	
	diag_log format ["VEHICLE PAINT: Player %1 (%2) has painted a %3!",_pname,_PUID,_name];
	
	_position = getPosATL _object;
	
	_worldspace = 
	[
		round(direction _object),
		_position,
		_colour,
		_colour2
	];
	
	_fuel = 0;
	_fuel = fuel _object;
	
	_objectID =	_object getVariable ["ObjectID","0"];
	
	_key = format["CHILD:305:%1:%2:%3:",_objectID,_worldspace,_fuel];
	[_key,""+server_var+"HIVE"] call server_hiveWrite;
};