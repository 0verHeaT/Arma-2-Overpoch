disableSerialization;
private ["_dialog","_playerListBox","_target","_index","_playerData","_check","_hasInvite"];
if (player != leader group player) exitWith {cutText ["\n\nYou are not the leader and can not invite people!","PLAIN DOWN"];};

_dialog = (uiNamespace getVariable "GroupDialog");
_playerListBox = _dialog displayCtrl 5800;
_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_hasInvite = false;
_check = 0;

{
	if (!isNull _x) then {
		if (isPlayer _x) then {
			if (str(_x) == _playerData) then {_target = _x;_check = 1;};
		};
	};
} count playableUnits;

if (_check == 0) exitWith {cutText ["\n\nYou must select someone to invite first!","PLAIN DOWN"];};
if (_target == player) exitWith {cutText ["\n\nYou can not invite yourself!","PLAIN DOWN"];};
if (count units group _target > 1) exitWith {cutText ["\n\nThis player is already in a group!","PLAIN DOWN"];};

{if (_x select 1 == getPlayerUID _target) then {_hasInvite = true;};} forEach currentInvites;
if (_hasInvite) exitWith {cutText ["\n\nThis player already has a pending invite!","PLAIN DOWN"];};

currentInvites set [count currentInvites,[getPlayerUID player,getPlayerUID _target]];
publicVariableServer "currentInvites";

[_target,format["\n\nYou have received a group invite from %1! Right click on radio to view!",name player],"rCut"] call vg_RE;

cutText [format["\n\nYou have invited %1 to join the group",name _target],"PLAIN DOWN"];