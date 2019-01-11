/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];

player setUnitLoadout gm_loadOut;
gm_loadOut = "";

_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn bis_fnc_mp;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];



closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if(gm_memecash > (call life_revive_fee)) then {
	gm_memecash = gm_memecash - (call life_revive_fee);
} else {
	gm_memecash = 0;
};



player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn bis_fnc_mp;
hideBody life_corpse;





	disableUserInput false;
	player allowDamage true;
	life_action_inUse = false;
	life_death = 2;
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["CPR",nil,TRUE];
player setVariable ["EMSON",2,true];

_chance = round (random 1000);
if(_chance > 850) then {
	player setVariable ["bleedingon",(round (random 5)),true];
};

_chance = round (random 1000);
if(_chance > 650) then {
	player setVariable ["woundedon",(round (random 5)),true];
};

_chance = round (random 1000);
if(_chance > 450) then {
	player setVariable ["fractureon",(round (random 7)),true];
};

_chance = round (random 1000);
if(_chance > 450) then {
	player setVariable ["unconciouson",(round (random 7)),true];
};

[] call life_fnc_hudUpdate; //Request update of hud.


//add freeze script on revive

disableUserInput true;
life_action_inUse = true;
[[player,"AinjPpneMstpSnonWnonDnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
uiSleep 15;

detach player;
deleteVehicle _obj;
disableUserInput false;
life_action_inUse = false;
deleteVehicle life_corpse;
life_corpse hideObject true;
[[player,"AmovPercMstpSnonWnonDnon"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;

[] call Life_fnc_removeNewLifePoint;

//[] call life_fnc_koilcombat;
