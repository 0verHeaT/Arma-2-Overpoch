private ["_callerID","_friendlies","_rfriendlies","_targetID"];
_groupIds = [];

{
	if ((getPlayerUID _x) != (getPlayerUID player)) then
	{
		_groupIds set [count _groupIds,getPlayerUID _x];
	};
} count units group player;

PVDZE_plyr_group = [units group player,_groupIds,2,player];
publicVariableServer "PVDZE_plyr_group";

cutText ["\n\nYou have left the group! All members have been removed from your friendly list!","PLAIN DOWN"];