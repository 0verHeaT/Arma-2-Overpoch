private ["_amount","_target","_wealth"];
_amount = parseNumber (_this select 0);
_target = cursorTarget;
_wealth = player getVariable["cashMoney",0];
_twealth = _target getVariable["cashMoney",0];
if (_amount < 1 or _amount > _wealth) exitWith {
	cutText ["You can not give more than you currently have.", "PLAIN DOWN"];
};
	
player setVariable["cashMoney",_wealth - _amount, true];
_target setVariable["cashMoney",_twealth + _amount, true];
	
PVDZE_plr_Save = [player,(magazines player),true,true] ;
publicVariableServer "PVDZE_plr_Save";
PVDZE_plr_Save = [_target,(magazines _target),true,true] ;
publicVariableServer "PVDZE_plr_Save";

cutText [format["You gave %1 %2 to %3.",[_amount] call BIS_fnc_numberText,CurrencyName,(name _target)], "PLAIN DOWN"];
	
[_target,format["You have received %1 %2 from %3.",[_amount] call BIS_fnc_numberText,CurrencyName,(name player)],"rCut"] call vg_RE;