disableSerialization;
private ["_dialog","_playerListBox","_groupInvite","_target","_index","_playerData","_check","_unitCount"];

_dialog = (uiNamespace getVariable "GroupDialog");
_playerListBox = _dialog displayCtrl 5800;
_groupInvite = _dialog displayCtrl 5809;
_index = lbCurSel _playerListBox;
_playerData = _playerListBox lbData _index;
_check = 0;
{
	if (!isNull _x) then {
		if (getPlayerUID _x != "") then {
			if (str(_x) == _playerData) then {_target = _x;_check = 1;};
		};
	};
} count playableUnits;
if (_check == 0) exitWith {};

_unitCount = count units group _target;

if (_unitCount == 1) then {
    if (player == leader group player) then {
		_groupInvite ctrlShow true;
	} else {
		_groupInvite ctrlShow false;
		cutText ["\n\nYou must be the group leader to invite people!","PLAIN DOWN"];
	};	    
} else {
	_groupInvite ctrlShow false;	   
	cutText ["\n\nThe selected player is already in a group!","PLAIN DOWN"];
};