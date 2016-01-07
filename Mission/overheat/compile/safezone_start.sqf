private ["_txt","_veh","_szs","_vehicle","_curspeed","_vel","_dir","_speed"];
canbuild = false;

hintSilent "You entered a Safe Zone!";
_txt = "<br/><img size='3' image='overheat\gui\logo.paa' align='Center'/><br/><t size='0.65' color='#999999' align='center'>You have entered a Trader Zone. Killing people on purpose near a Safe Zone will be punished!</t><br/><t size='0.65' color='#999999' align='center'>Vehicles left here over restart will be unlocked!</t>";
[_txt,[safezoneX,safezoneW],[0.65 * safezoneH + safezoneY,0.3 * safezoneH],20,0.5] spawn BIS_fnc_dynamicText;

player_fired = 
{
	deleteVehicle (nearestObject [_this select 0,_this select 4]);
	cutText ['You can not fire in a SafeZone!','PLAIN'];
};

player_zombieCheck = {};
player_zombieAttack = {};
	
fnc_usec_damageHandler = {};
player removeAllEventHandlers 'handleDamage';
player addEventHandler ['handleDamage', {false}];
player allowDamage false;

_veh = vehicle player;
_szs = _veh getVariable ['inSafeZone',0];
if (_szs == 0) then
{
	_veh setVariable ['inSafeZone',1,true];
	if (player != _veh) then
	{
		_veh removeAllEventHandlers 'Fired';
		_veh addEventHandler ['Fired', {_this call player_fired;}];
		{
			_x removeAllEventHandlers 'Fired';
			_x addEventHandler ['Fired', {_this call player_fired;}];
		} forEach (crew _veh);
		vehicle_handleDamage = {false};
		_veh removeAllEventHandlers 'HandleDamage';
		_veh addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
		_veh allowDamage false;
	};
};

SafezoneSpeedLimit = [] spawn 
{
	while {true} do 
	{
		waitUntil {vehicle player != player and !((vehicle player) isKindOf 'Air')};
		_vehicle = vehicle player;
		_curspeed = speed _vehicle;
		if (_curspeed > 30) then 
		{
			_vel = velocity _vehicle;
			_dir = direction _vehicle;
			_speed = _curspeed - 30;
			_vehicle setVelocity [(_vel select 0)-((sin _dir)*_speed),(_vel select 1)- ((cos _dir)*_speed),(_vel select 2)];
		};
		sleep 0.1;
	};
};