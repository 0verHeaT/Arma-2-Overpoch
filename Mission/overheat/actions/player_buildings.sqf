private ["_findNearestPoles","_accessmenu","_findNearestPole","_nearestPole","_ownerID","_friendlies","_fuid","_friendUID"];
if (dayz_combat == 1) exitwith {cutText["\n\nYou are in combat and cannot access the Special Buildings Menu!","PLAIN DOWN"]};
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], (DZE_PlotPole select 0)];
_accessmenu = false;
if ((count _findNearestPoles) >= 1) then {
	_findNearestPole = [];
	{
		if (alive _x) then {
			_findNearestPole set [(count _findNearestPole),_x];
		};
	} foreach _findNearestPoles;
	_nearestPole = _findNearestPole select 0;
	_ownerID = _nearestPole getVariable ["ownerPUID","0"];
	if((getPlayerUID player) == _ownerID) then {
		_accessmenu = true;
	} else {
		_friendlies = _nearestPole getVariable ["plotfriends",[]];
		_fuid  = [];
		{
			_friendUID = _x select 0;
			_fuid  =  _fuid  + [_friendUID];
		} forEach _friendlies;
		if((getPlayerUID player) in _fuid) then {_accessmenu = true;};
	};
};
if (!_accessmenu) exitWith {cutText["\n\nYou need to be within your plot pole area to access the Special Buildings Menu!","PLAIN DOWN"]};
createdialog "BuildingsTraderDialog";
lbClear 72000;
lbClear 72001;
CurrentCatIndex = -1;
BuildingItemList = -1;

BuildingsCatList = [];
{
	private ["_index", "_x"];
	_index = lbAdd [72000, _x select 0];
	BuildingsCatList set [count BuildingsCatList, _x select 1];
} count BuildingCategory;
waitUntil { !dialog };
BuildingsCatList = -1;
