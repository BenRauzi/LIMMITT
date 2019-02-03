/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(LIMMITTCASH > 0) then
{
	[[LIMMITTCASH],"life_fnc_robReceive",_robber,false] spawn bis_fnc_mp;
	[[1,format[localize "STR_NOTF_Robbed",_robber getVariable["realname",name _robber],profileName,[LIMMITTCASH] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn bis_fnc_mp;
	_content = format ["%1 [%2] Just robbed %3 for $%4", name _robber, getPlayerUID _robber, name player,LIMMITTCASH];
	[[_content],"DB_fnc_logToLogs",false,false] spawn bis_fnc_mp;

	LIMMITTCASH = 0;
}
	else
{
	[[2,format[localize "STR_NOTF_RobFail",profileName]],"life_fnc_broadcast",_robber,false] spawn bis_fnc_mp;
};