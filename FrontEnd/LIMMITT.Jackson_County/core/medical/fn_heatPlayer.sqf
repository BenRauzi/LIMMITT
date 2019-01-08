/*
Function to heat player by Koil
*/
private["_display","_curTarget"];
if (vehicle player == player) then 
{
	closeDialog 0;
	[[player,"amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
	waitUntil{animationState player != "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";};
	[[player,"amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
	waitUntil{animationState player != "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";};
};
if(isPlayer cursorTarget) then {
	 _koildebiiii = cursorTarget getVariable "diseaseon";
	 [[0,format["%1 is using heat packs on %2.",name player,name cursorTarget]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp;
	if(_koildebiiii == 5) then {
	cursorTarget setVariable ["diseaseon",1,true]; 
	} else {
	cursorTarget setDamage 1;
	player setVariable ["diseaseon",_koildebiiii,true]; 
	[[0,format["%1 just gave the wrong medication to %2.",name player,name cursorTarget]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp; 
	};
}

else {
	_blah = "Target moved, procedure failed.";
	hint format["%1", _blah];
};

