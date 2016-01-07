if((count PV_DeathBoard) > 0) then {
	call EpochDeathBoardLoad;
} else {
	cutText [(localize "str_epoch_player_36"), "PLAIN DOWN"];
};
