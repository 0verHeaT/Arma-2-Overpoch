private ["_body", "_hisMoney", "_myMoney", "_killsH", "_test2", "_headShots", "_test","_playeridke","_humanity"];
_body = _this select 3;

_PlayerNear = _body call dze_isnearest_player;
if (_PlayerNear) exitWith {cutText [localize "str_pickup_limit_4", "PLAIN DOWN"]};

_name = _body getVariable ["bodyName","unknown"];
_hisMoney = _body getVariable ["cashMoney",0];
if (_hisMoney == 0) exitWith {cutText [format["%1 did not have any Gold Coins!", _name], "PLAIN DOWN"];};
_myMoney = player getVariable ["cashMoney",0];
_myMoney = _myMoney + _hisMoney;
_body setVariable ["cashMoney", 0 , true];
player setVariable ["cashMoney", _myMoney , true];

PVDZE_plr_Save = [player,(magazines player),true,true] ;
publicVariableServer "PVDZE_plr_Save";

cutText [format["You took %1 Gold Coins from %2!", [_hisMoney] call BIS_fnc_numberText, _name], "PLAIN DOWN"];
PVDZE_deb = ["log",toArray(format["%3  (%4)  took  %1  Gold Coins from dead Player %2",_hisMoney,_name,name player,getPlayerUID player])];
publicVariableServer "PVDZE_deb";
