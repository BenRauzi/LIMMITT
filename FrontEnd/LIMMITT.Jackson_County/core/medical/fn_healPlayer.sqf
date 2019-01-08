
while {true} do {


//waitUntil {isPlayer cursorTarget && cursorTarget isKindOf "Man" && Alive cursorTarget};
waitUntil {cursorTarget isKindOf "Man"};
_curTarget = cursorTarget;
_curTargetcheck = cursorTarget;
_myactionone = cursorTarget addAction ["<t color='#FF0000'>Bandage</t>", "

		if (vehicle player == player) then 
		{
		player switchMove "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";
		[[player,"amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		waitUntil{animationState player != "amovpknlmstpsraswlnrdnon_amovpknlmstpsnonwnondnon";};
		};
		cursorTarget setVariable ["bleedingon",1,true]; 
		cursorTarget setDamage (damage player) - .50;
		[[0,format["%1 is bandaging %2.",name player,name cursorTarget]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp; 
		cursorTarget removeAction _myactionone;
"];

_myactiontwo = cursorTarget addAction ["<t color='#FF0000'>Stitch</t>", "

		if (vehicle player == player) then 
		{
		player switchMove "AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWrflDnon";
		[[player,"AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWrflDnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		waitUntil{animationState player != "AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWrflDnon";};
		};
		cursorTarget setVariable ["woundedon",1,true]; 
		cursorTarget setDamage (damage player) - .80;
		[[0,format["%1 is applying open wound stitching to %2.",name player,name cursorTarget]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp; 
		cursorTarget removeAction _myactiontwo;
"];

_myactionthree = cursorTarget addAction ["<t color='#FF0000'>Splint</t>", "
		if (vehicle player == player) then 
		{
		player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
		[[player,"amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		waitUntil{animationState player != "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";};
		};
		cursorTarget setVariable ["fractureon",1,true]; 
		cursorTarget setDamage (damage player) - .10;
		[[0,format["%1 is applying a splint to %2.",name player,name cursorTarget]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp; 
		cursorTarget removeAction _myactionthree;
"];

_myactionfour = cursorTarget addAction ["<t color='#FF0000'>Epi-Pen</t>", "
		if (vehicle player == player) then 
		{
		player switchMove "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";
		[[player,"amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
		waitUntil{animationState player != "amovpknlmstpsnonwnondnon_amovpknlmstpsraswlnrdnon";};
		};
		cursorTarget setVariable ["unconciouson",1,true]; 
		cursorTarget setDamage (damage player) - .10;
		[[0,format["%1 is using an epi-pen on %2.",name player,name cursorTarget]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 10],false] spawn bis_fnc_mp; 
		cursorTarget removeAction _myactionfour;
"];

};

waitUntil {cursorTarget != _curTargetcheck};
_curTarget removeAction _myactionone;
_curTarget removeAction _myactiontwo;
_curTarget removeAction _myactionthree;
_curTarget removeAction _myactionfour;
uiSleep 0.1;
};


// "[life_vInact_curTarget] spawn life_fnc_pulloutAction;";