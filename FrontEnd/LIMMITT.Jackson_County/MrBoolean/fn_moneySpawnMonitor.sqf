//TODO: Fix this.. it doesn't broadcast to anyone...

if(isNil "life_cash") exitWith {};
if(life_cash != 0) then {
	[[0,format["%2 just tried to spawn in %1 money.",life_cash,name player]],"life_fnc_broadcast",true,false] spawn bis_fnc_mp;
	life_cash = 0;	
};