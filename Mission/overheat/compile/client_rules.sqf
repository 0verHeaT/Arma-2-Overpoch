private ["_rules","_brules","_tcrules","_txtmarks","_txtmarks2","_infotxt","_infoCtrl","_display"];

terminate VGPlyrClientstats;

_display = (uiNamespace getVariable "SettingsDialog");
_infoCtrl = _display displayCtrl 5104;

{
	ctrlShow [_x,false];
} forEach [5101,5102,5103,5105,5106,5107,5108,5109];

_infotxt = "<t align='center' color='#9F1B1B'>Server Information and Rules</t><br/>";

_rules = 
[
"Admin decisions are final",
"No voice or spam in side channel",
"No intentional glitch or bug exploiting",
"No racism, sexism or bullying",
"No combat logging",
"No kamikaze into Bases",
"Respect your fellow players, admins and moderators",
"Raiding in Pre-Built bases is allowed",
"Do not ask for help in-game, join our TeamSpeak",
"English only in sidechat!"
];

_brules =
[
"No bases in within 500 meters high loot areas",
" e.g. hospitals, barracks, fire stations anything like this",
"No bases on or above main roads",
"No bases within 1000 metres of trader cities",
"No bases within 750 meters of the coast (spawn points)",
"No building on custom / prefab bases"
];

_tcrules =
[
"No ramming or attempting to kill players",
"No Safezone Camping",
"Vehicles at safe zones will be deleted regularly",
"No stealing from locked vehicles",
"No Shooting into the traderzones",
"No Kamikaze or Vehicle destruction"
];

_txtmarks = "»";
_txtmarks2 = "«";

_infotxt = _infotxt + "<t align='left' size='0.9' color='#9F1B1B'>General Rules</t><br/>";
for "_i" from 0 to ((count _rules) - 1) do {
	_infotxt = _infotxt + format["<t align='left' size='0.8' color='#9F1B1B'>%1   </t><t align='left' size='0.8' color='#FFFFFF'>%2</t><br/>",_txtmarks,(_rules select _i)];
};

_infotxt = _infotxt + "<br/><br/>";

_infotxt = _infotxt + "<t align='left' size='0.9' color='#9F1B1B'>Building Rules</t><t align='right' size='0.9' color='#9F1B1B'>Trader City Rules</t><br/>";
for "_i" from 0 to ((count _brules) - 1) do {
	_infotxt = _infotxt + format["<t align='left' size='0.8' color='#9F1B1B'>%1   </t><t align='left' size='0.8' color='#FFFFFF'>%2</t><t align='right' size='0.8' color='#FFFFFF'>%4</t><t align='right' size='0.8' color='#9F1B1B'>   %3</t><br/>",_txtmarks,(_brules select _i),_txtmarks2,(_tcrules select _i)];
};

_infoCtrl ctrlSetStructuredText parseText _infotxt;