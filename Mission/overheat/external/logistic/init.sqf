if (!isDedicated) then {	
	LOG_READY = false;
	call compile preprocessFileLineNumbers "overheat\external\logistic\compiles.sqf";
	waitUntil{LOG_READY};
	[] spawn MONI_OBJECT;
	sleep 0.1;
	[] spawn MONI_ACTION;
};

