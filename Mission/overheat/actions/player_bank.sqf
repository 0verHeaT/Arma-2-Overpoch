private ["_dialog"];
_dialog = createdialog "BankDialog";
((uiNamespace getVariable "BankDialog") displayCtrl 13003) ctrlSetStructuredText parseText format["<t align='left' color='#FFFFFF'>Limit: %1 Gold Coins</t>",[MaxBankMoney] call BIS_fnc_numberText];
ctrlSetText [BankDialogPlayerBalance, format["%1 %2", (player getVariable ['cashMoney', 0] call BIS_fnc_numberText), CurrencyName]];
ctrlSetText [BankDialogBankBalance, format["%1 %2", (player getVariable ['bankMoney', 0] call BIS_fnc_numberText), CurrencyName]];
	
