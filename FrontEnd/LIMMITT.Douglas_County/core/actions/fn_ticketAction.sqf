/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
disableSerialization;
if(!(createDialog "gm_ticketIssue")) exitWith {hint localize "STR_Cop_TicketFail"};
if(isNull _unit OR !isPlayer _unit) exitwith {};
life_ticket_unit = _unit;

_departments = ["Lakeside Patrol", "Department of Corrections", "Lakeside SWAT", "Lakeside State Troopers", "Lakeside CID", "Lakeside IA"];
{ lbAdd [2100, _x]; } forEach _departments;