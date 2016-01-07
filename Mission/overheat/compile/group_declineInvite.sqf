private ["_inviterUID","_inviter"];
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
		};
	};
} count playableUnits;

cutText[format["\n\nYou have declined the invite from % 1!",name _inviter],"PLAIN DOWN"];

[_inviter,format["\n\n%1 has declined your invite!",name player],"rCut"] call vg_RE;