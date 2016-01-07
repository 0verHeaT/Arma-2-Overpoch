private ["_dialog"];
_dialog = createdialog "GivePlayerDialog";
ctrlSetText [GivePlayerDialogPlayerBalance, format["%1 %2", (player getVariable ['cashMoney', 0] call BIS_fnc_numberText), CurrencyName]];
ctrlSetText [14003, format["%1", (name cursorTarget)]];
