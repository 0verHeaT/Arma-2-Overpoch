/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: twp_init.sqf
	Description: Trade with Players (P2P Trade)
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
private ["_index"];
TWPTarget = _this;
TWPPlayerGearList = [];TWPPlayerList = [];TWPTargetList = [];

player setVariable ["twpitems",[],true];

createDialog "TradeWithPlayersDialog";

((uiNamespace getVariable "TradeWithPlayersDialog") displayCtrl 9009) ctrlSetStructuredText parseText format ["<t align='center'>Your Offers (%1/10)</t>",count TWPPlayerList];

{
	_index = lbAdd [9000,_x];
} count ["All","Magazines","Weapons"];

{
	_index = lbAdd [9001,_x];
} count ["All","Magazines","Weapons"];

lbSetCurSel [9000,0];lbSetCurSel [9001,0];
ctrlSetText[9005,"0"];

uiSleep 4;

while {true} do
{
	private ["_var"];
	_var = TWPTarget getVariable ["twpactive",false];
	if ((getPlayerUID TWPTarget == "") || !(isPlayer TWPTarget) || !(_var)) then 
	{
		closeDialog 50011;
		cutText [format ["\n\n%1 has aborted!",name TWPTarget],"PLAIN DOWN"];
	};
	if !(dialog) exitWith 
	{
		player setVariable ["twpactive",false,true];
		player setVariable ["twpitems",[],true];
		player setVariable ["twpaccept",false,true];
		player setVariable ["twprequest","0",true];
		TWPTarget = nil;
		TWPPlayerGearList = [];TWPPlayerList = [];TWPTargetList = [];
	};
	uiSleep 0.5;
};