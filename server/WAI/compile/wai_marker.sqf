private ["_pos","_type","_name","_marker","_dot","_displayname"];
_pos = _this select 0;
_color = _this select 1;
_name = _this select 2;
_displayname = _this select 3;

_marker = createMarker [format["mission%1",_name],_pos];
_marker setMarkerColor _color;
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Solid";
_marker setMarkerSize [400,400];
_marker setMarkerText "";

_dot = createMarker [format["missiondot%1",_name],_pos];
_dot setMarkerColor "ColorBlack";
_dot setMarkerType "mil_dot";
_dot setMarkerText _displayname;