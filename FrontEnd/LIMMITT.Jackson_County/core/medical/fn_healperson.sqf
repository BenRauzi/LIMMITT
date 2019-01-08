/*
Function to heal self
*/
private["_display","_curTarget"];

_curTarget = cursorTarget;

if(!life_action_inUse) then {
life_action_inUse = true;

if (vehicle player == player) then 
{
	player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
	[[player,"amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
	waitUntil{animationState player != "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";};
};

if( side player == west || side player == civilian ) then {
	asdih_inv_bandage = asdih_inv_bandage - 1;
	_curTarget setdamage 0.2;
}
else {
	_curTarget setdamage 0;
};



};
life_action_inUse = false;	