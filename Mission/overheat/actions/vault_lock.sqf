private ["_obj","_msg"];
disableuserinput true;disableuserinput true;disableuserinput true;
_msg = 'You may not move while locking this.';
hint _msg;
sleep 0.1;
_obj = _this select 3;
_obj spawn player_lockVault;
sleep 6;
disableuserinput false;disableuserinput false;disableuserinput false;
