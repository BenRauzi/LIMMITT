/*
	File: fn_ticketGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
_reason = ctrlText 1400;
_notes = ctrlText 1402;	

_departments = ["Lakeside Patrol", "Department of Corrections", "Lakeside SWAT", "Lakeside State Troopers", "Lakeside CID", "Lakeside IA"];
_department = (_departments select (lbCurSel 2100));

if(!([_val] call fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if((parseNumber _val) > 100000) exitWith {hint localize "STR_Cop_TicketOver100"};
[[0,format[localize "STR_Cop_TicketGive",profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]],"life_fnc_broadcast",true,false] spawn bis_fnc_mp;
[[player,(parseNumber _val)],"life_fnc_ticketPrompt",life_ticket_unit,false] spawn bis_fnc_mp;

[[player,"CL3_anim_Ticket"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
closeDialog 0;

ticketLog pushBackUnique [getPlayerUID life_ticket_unit, _val, _reason, _notes, _department, name player];
publicVariable "ticketLog";