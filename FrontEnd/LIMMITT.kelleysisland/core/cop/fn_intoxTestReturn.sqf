/*
	File: fn_intoxTestReturn.sqf
	@Deo	
	Description:
	Returns the Intox Results.
*/
private["_civ","_intox"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_intox = [_this,1,0,[0]] call BIS_fnc_param;
if(isnull _civ) exitWith {};

if(_intox > 0.08) then 
{
	 ["Warning", format["%1's Intox Level: %2\nThis person is over the legal limit to drive!",name _civ,_intox], "Warning"] call Harris_Notifications;
} 
else 
{
	["Info",  format["%1's Intox Level: %2",name _civ,_intox], "Info"] call Harris_Notifications;
};

if (_intox > 0.20) then 
{
	[[getPlayerUID _civ,name _civ,"647"],"life_fnc_wantedAdd",false,false] spawn bis_fnc_mp;
};