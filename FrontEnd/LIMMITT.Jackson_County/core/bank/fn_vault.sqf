if (side player isEqualTo civilian) then {
	if (gm_vault animationPhase "d_l_Anim" == 1 || gm_vault getVariable ["PlantCharged", false]) then {
		["This vault is already open, or a charge is planted.",5,"green"] call A3L_Fnc_Msg;
	} else {
		_cops = (west countSide playableUnits);
		if(_cops < 12) exitWith { hint "You need atleast 12 cops online to rob bank..."; }; 
		if (!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {["You don't have a satchel charge.",5,"red"] call A3L_Fnc_Msg;};
		["You have planted the charge! Move or be blown up! ETA 60 Seconds",10,"red"] call A3L_Fnc_Msg;
		[] remoteExec ["life_fnc_banknotification", -2]; 
		gm_vault setVariable ["PlantCharged", true, true];
		_totaltime = 60;

		[[player,"c4_planted"],"A3L_Fnc_NearestSound",false,false,false] call BIS_fnc_MP;
		[[_totaltime,gm_vault],"A3L_Fnc_Bankalarm",false,false,false] call BIS_fnc_MP;

		sleep _totaltime;

		_bomb = "HelicopterExploSmall" createVehicle getPos money1;

		gm_vault animate ["d_l_Anim",1];
		gm_vault animate ["d_o_Anim",1];
		gm_vault setVariable ["PlantCharged", false, true];
	};
};

if (side player isEqualTo west) then {
	if (gm_vault animationPhase "d_l_Anim" == 1) then {
		gm_vault setVariable ["hacked", false, true];
		gm_vault animate ["d_l_Anim",0];
		gm_vault animate ["d_o_Anim",0];
		["You have closed the vault!",5,"green"] call A3L_Fnc_Msg;
		sleep 30;
		_money = [money1, money2, money3, money4];
		{ _x setVariable ["robbed",false,true]; } forEach _money;
	} else {
		["The vault is already closed!",5,"green"] call A3L_Fnc_Msg;
	};
};