if(LIMMITTCASH < 5000) exitWith {hint "You do not have enough cash to join the game, you need $5000!.";};


if (joinmode==0) then {
	_PUID = getPlayerUID player;
	_spielerGeld = LIMMITTCASH;
	hint "A request has been sent to the server, please wait a moment.";
	[[_PUID,_spielerGeld],"TON_fnc_paintball",false,false] spawn bis_fnc_mp;
	joinmode = 1;
} else {
	hint "You are already in the lobby..!";
};