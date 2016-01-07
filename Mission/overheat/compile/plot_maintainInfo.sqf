/***
	All credits to maca134
	Display all objects in your area nicely
***/
private ["_target", "_objectClasses", "_range", "_ctrl", "_count", "_txt", "_cost", "_objects_filtered", "_objects_filtered_display", "_tax", "_object", "_price"];
disableSerialization;
_target = cursorTarget;
_objectClasses = DZE_maintainClasses;
_range = DZE_maintainRange;
_ctrl = ((uiNamespace getVariable "PlotPoleManager") displayCtrl 4502);

_objects_filtered_display = [];
{
	if (damage _x >= DZE_DamageBeforeMaint) then {
		_objects_filtered_display set [count _objects_filtered_display, _x];
	};
} count nearestObjects [_target, _objectClasses, _range];

_object = count _objects_filtered_display;

_price = 432;
_price = _price * _object;

_txt = "<t size='1.5' align='center'>Maintenance Bill</t><br/>";

if (_object == 0) exitWith {
	_txt = _txt + "<t align='center'>No maintenance is needed at the moment.</t><br/><br/>";
	_txt = _txt + format["<t align='center'>%1 Total Objects</t>",(count nearestObjects [_target,_objectClasses,_range])];
	_ctrl ctrlSetStructuredText parseText _txt;
};

_txt = _txt + format["<t align='left' size='0.8' >Total Objects:</t><t align='right' size='0.8' >%1</t><br/>",_object,[_price] call BIS_fnc_numberText];
_txt = _txt + "<t align='left' size='0.8'>Total Costs:</t>";
_txt = _txt + format["<t size='0.8'align='right'>%2 </t><img size='0.8' align='right' image='overheat\gui\dollars.paa'/><br/>",_object,[_price] call BIS_fnc_numberText];
_txt = _txt + "---------------------------------------<br/>";
	
_objects_filtered = [];
{
	private["_type", "_index"];
	if (_x getVariable["CharacterID", "0"] != "0" and {damage _x >= DZE_DamageBeforeMaint}) then {
		_type = typeOf _x;
		_index = _objects_filtered find _type;
		if (_index < 0) then {
			_objects_filtered set [count _objects_filtered, _type];
			_objects_filtered set [count _objects_filtered, 1];
		} else {
			_objects_filtered set [(_index + 1), ((_objects_filtered select (_index + 1)) + 1)];
		};
	};
} count nearestObjects [_target, _objectClasses, _range];
_txt = _txt + "<t align='left' size='0.65'>";
for "_i" from 0 to (count _objects_filtered) - 1 step 2 do {
	_txt = _txt + format["%1 x %2<br/>", (_objects_filtered select (_i + 1)), getText (configFile >> "CfgVehicles" >> (_objects_filtered select _i) >> "displayName")];
};
_txt = _txt + "</t>";
_ctrl ctrlSetStructuredText parseText _txt;