/*
Function to epipen player by Koil
*/
private["_display","_curTarget"];

if(!life_action_inUse) then {
life_action_inUse = true;

if (vehicle player == player) then 
{
	player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
	[[player,"amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
	waitUntil{animationState player != "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";};
};
if(isPlayer player) then {
	player setVariable ["unconciouson",1,true]; 
}
else {
	["Error", "Target moved, procedure failed.", "Failure"] call Harris_Notifications;
};


};
life_action_inUse = false;	