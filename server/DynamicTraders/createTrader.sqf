private ["_trader"];
_trader = createAgent [(_this select 0), (_this select 1), [], 0, "CAN_COLLIDE"];
_trader setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
_trader setUnitAbility 0.60000002;
_trader allowDammage false; 
_trader disableAI 'FSM'; 
_trader disableAI 'MOVE'; 
_trader disableAI 'AUTOTARGET'; 
_trader disableAI 'TARGET'; 
_trader setBehaviour 'CARELESS';
_trader forceSpeed 0;
_trader enableSimulation false;
_trader setDir (_this select 2);
_trader