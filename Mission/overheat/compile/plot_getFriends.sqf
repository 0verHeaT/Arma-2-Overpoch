private ["_plots","_friendlies","_thePlot"];
lbClear 4501;
_plots = nearestObjects [player, ["Plastic_Pole_EP1_DZ"],15];	
_thePlot = _plots select 0;
_friendlies =  _thePlot getVariable ["plotfriends", []];
{
	lbAdd [4501, (_x select 1)];
} forEach _friendlies;