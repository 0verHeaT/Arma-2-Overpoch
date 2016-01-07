private ["_groupExists","_inviterUID","_inviter","_groupIds"];
_groupIds = [];
_groupExists = false;

{
	if (getPlayerUID player == _x select 1) then 
	{
    	_inviterUID = _x select 0;
        currentInvites set [_forEachIndex,"REMOVETHISCRAP"];
        currentInvites = currentInvites - ["REMOVETHISCRAP"];
        publicVariableServer "currentInvites";
	};
} forEach currentInvites;

{
	if (!isNull _x) then 
	{
		if (getPlayerUID _x == _inviterUID) then 
		{
			_inviter = _x;
			_groupExists = true;	    
		};
	};
} count playableUnits;

if (_groupExists) then
{
	{
		_groupIds set [count _groupIds,getPlayerUID _x];
	} count (units group _inviter);
	
	PVDZE_plyr_group = [(units group _inviter),_groupIds,0,player];
	publicVariableServer "PVDZE_plyr_group";
	
	cutText ["\n\nYou have accepted the invite! You are now friends with all group members!","PLAIN DOWN"];
	
	[_inviter,format["\n\n%1 has accepted your invite!",name player],"rCut"] call vg_RE;
}
else 
{
	cutText ["\n\nThe group does not longer exist!","PLAIN DOWN"];
};