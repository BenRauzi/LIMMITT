/*
	File: fn_ticketPay.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(LIMMITTCASH < life_ticket_val) exitWith
{
	if(gm_memecash < life_ticket_val) exitWith 
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[[1,format[localize "STR_Cop_Ticket_NotEnoughNOTF",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn bis_fnc_mp;
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
	gm_memecash = gm_memecash - life_ticket_val;
	life_ticket_paid = true;
	[[0,format[localize "STR_Cop_Ticket_PaidNOTF",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
	closeDialog 0;
};

LIMMITTCASH = LIMMITTCASH - life_ticket_val;
life_ticket_paid = true;

[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn bis_fnc_mp;
[[0,format[localize "STR_Cop_Ticket_PaidNOTF",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
closeDialog 0;
[[1,format[localize "STR_Cop_Ticket_PaidNOTF_2",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn bis_fnc_mp;
[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn bis_fnc_mp;

_ticketArray = format [life_ticket_val, "Undefined", name life_ticket_cop];
_lol = player getVariable ["GM_Tickets", []];

_lol pushBack _ticketArray;
player setVariable ["GM_Tickets", _lol, true];