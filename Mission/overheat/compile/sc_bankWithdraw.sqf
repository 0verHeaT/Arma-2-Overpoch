private ["_amount","_bank","_wealth"];
_amount = parseNumber (_this select 0);	
_bank = player getVariable ["bankMoney", 0];
_wealth = player getVariable["cashMoney",0];
	
if(_amount > 500000) exitWith { cutText ["You can not withdraw more then 500,000 Gold Coins at once.", "PLAIN DOWN"]; };
if(_amount < 1 or _amount > _bank) exitWith { cutText ["You can not withdraw more than is in your bank.", "PLAIN DOWN"]; };

player setVariable["cashMoney",(_wealth + _amount),true];
player setVariable["bankMoney",(_bank - _amount),true];
	
PVDZE_plr_Save = [player,(magazines player),true,true] ;
publicVariableServer "PVDZE_plr_Save";
PVDZE_bank_Save = [player];
publicVariableServer "PVDZE_bank_Save";

cutText [format["You have withdrawn %1 %2.", [_amount] call BIS_fnc_numberText, CurrencyName], "PLAIN DOWN"];