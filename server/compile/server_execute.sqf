private ['_type','_player','_isevent','_params'];
_player = _this select 0;
_type = _this select 1;
_isevent = _this select 2;
_params = _this select 3;

if (_isevent) then 
{
	switch (_type) do 
	{
		case 'default':{};
	};
	diag_log format ['Player %1 (%2) executed an Event manually!',(name _player),(getPlayerUID _player)];
} 
else 
{
	_params execVM format ['\z\addons\dayz_server\WAI\missions\%1.sqf',_type];
	diag_log format ['Player %1 (%2) executed a WAI Mission manually!',(name _player),(getPlayerUID _player)];
};