/*
	Exclusively made for [VG] Servers
	https://vectiongaming.com/

	File: welcome.sqf
	Description:
	
	Author: 0verHeaT
	https://github.com/0verHeaT
*/
waitUntil {!isNil "dayz_animalCheck"};

sleep 5;
systemChat "Press ""INS"" to enable player stats! ""CTRL+I"" for advanced information!";
 
 _role1 = "Welcome..";
 _role1names = [(format["<br/>%1",(name player)])];
_role2 = "..to";
_role2names = ["VectionGaming", format ["DayZ Overpoch %1",worldName]];
_role3 = "Dedicated Server";
_role3names = ["Intel Xeon E3-1245 V2 @3.40GHz", "32GB RAM", "SSD", "for optimal performance"];
_role6 = "Teamspeak 3";
_role6names = ["ts.vectiongaming.com"];
_role7 = "Visit Our Website";
_role7names = ["VectionGaming.com"];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.45' color='#9F1B1B' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.60' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br/>", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	5 + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		7.5,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep 7.5;
} forEach [
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role6, _role6names],
	[_role7, _role7names]
];