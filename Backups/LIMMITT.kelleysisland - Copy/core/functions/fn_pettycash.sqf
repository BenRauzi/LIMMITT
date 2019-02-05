// petty cash piles
if ( cgbankvault animationPhase "d_o_Anim" != 1 ) exitWith {
	["The vault door is closed, you cant grab cash right now...",30,"red"] call A3L_Fnc_Msg;
};

if ((_this select 3) getVariable "robbed") exitwith {["This stash of cash was recently robbed.",30,"red"] call A3L_Fnc_Msg;};
(_this select 3) setVariable ["robbed",true,true];
_funds = 5000 + round(random 35000); 

["Picked Up", format ["You picked up %1 in petty cash..",_funds], "Success"] call Harris_Notifications;

LIMMITTCASH = LIMMITTCASH + _funds;