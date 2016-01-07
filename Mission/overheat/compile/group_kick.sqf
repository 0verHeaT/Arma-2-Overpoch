disableSerialization;
private ["_dialog","_groupIds","_target","_index","_playerData","_check"];

_dialog = (uiNamespace getVariable "GroupDialog");
_groupListBox = _dialog displayCtrl 5801;
_index = lbCurSel _groupListBox;
_playerData = _groupListBox lbData _index;
_check = 0;

{
	if (!isNull _x) then {
		if (isPlayer _x) then {
			if (str(_x) == _playerData) then {_target = _x;_check = 1;};
		};
	};
} count playableUnits;

if (_target == player) exitWith {cutText ["\n\nYou can not kick yourself!","PLAIN DOWN"];};
if (_check == 0) exitWith {cutText ["\n\nYou must select someone to kick first!","PLAIN DOWN"];};

_groupIds = [];

{
	if ((getPlayerUID _x) != (getPlayerUID player)) then
	{
		_groupIds set [count _groupIds,getPlayerUID _x];
	};
} count units group player;

PVDZE_plyr_group = [units group player,_groupIds,2,_target];
publicVariableServer "PVDZE_plyr_group";

[_target,"You have been kicked form your group!","rCut"] call vg_RE;

cutText [format["You have kicked %1 from the group! %1 has been removed from your friendly list!",name _target],"PLAIN DOWN"];