private ["_target", "_objectClasses", "_range", "_count", "_player_wealth", "_needed", "_ctrl", "_txt", "_tax", "_objects_filtered_display", "_object", "_price"];
_target = cursorTarget;
_objectClasses = DZE_maintainClasses;
_range = DZE_maintainRange;

_objects_filtered_display = [];
	{
		if (damage _x >= DZE_DamageBeforeMaint) then {
			_objects_filtered_display set [count _objects_filtered_display, _x];
		};
	} count nearestObjects [_target, _objectClasses, _range];

_object = count _objects_filtered_display;

if (_object == 0) exitWith {};

if ((getPlayerUID player) in VGAdmins) then {
	_price = 0;
} else {
	_price = 432;
};

_price = _price * _object;

_player_wealth = player getVariable ["cashMoney",0];

if (_player_wealth < _price) exitWith {
	_needed =  _price - _player_wealth;
	cutText [format["You need another %1 %2",_needed,CurrencyName] , "PLAIN DOWN"];
};

player setVariable["cashMoney",(_player_wealth - _price),true];

PVDZE_plr_Save = [player,(magazines player),true,true];
publicVariableServer "PVDZE_plr_Save";

PVDZE_maintainArea = [player,1,_target];
publicVariableServer "PVDZE_maintainArea";
cutText ["Maintenance complete, please wait a few minutes for the objects to update.", "PLAIN DOWN"];

_ctrl = ((uiNamespace getVariable "PlotPoleManager") displayCtrl 4502);
_txt = "<t size='2' align='center'>Maintenance</t><br/><br/>";
_txt = _txt + "<t align='center' size='0.8' >All objects within your area have been maintained.</t>";
_ctrl ctrlSetStructuredText parseText _txt;