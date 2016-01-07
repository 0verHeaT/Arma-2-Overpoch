private ["_head","_body","_msg","_colour"];
_head = _this select 0;
_body = _this select 1;
_colour = _this select 2;

if (isNil "_colour") then {_colour = "#088A85"};
_msg = format ["
	<br/><img align='left' size='0.8' image='\CA\misc\data\icons\picture_notebook_ca.paa' />
	<t size='0.6' color='#999999' align='left'>   [Mission] </t>
	<t size='0.6' color='%3' align='left'>%1</t><br/>
	<t size='0.3' color='#FFFFFF' align='left'>̚</t><br/>
	<t size='0.55' color='#CCCCCC' align='left'>%2</t><br/>",
	_head,_body,_colour
];
[[""+server_var+"","all"],"rMsg",_msg] call server_sendremoteExe;