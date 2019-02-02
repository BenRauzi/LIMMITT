if((player getVariable "EMSON") != 1) then {


	/***********************
	**	    BLEEDING 	  **
	***********************/

	_bleed = player getVariable "bleedingon";
	if(_bleed > 1) then {

		if(life_pizza) then {
			life_pizza = false;
		};

		if((round (random 1000)) > 980) then {
			player setDamage (damage player) + .01;
		};

		if(_bleed == 3) then {
			
			if((round (random 1000)) > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};

				[] call life_fnc_stage2pain;
			};
		};

		if(_bleed == 4) then {

			if((round (random 1000)) > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};
				[] call life_fnc_stage1pain;
			};
		};

		if(_bleed == 5) then {
			
			if((round (random 1000)) > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};	
				[] call life_fnc_stage2pain;
			};
		};

	};

	/***********************
	** 	     WOUNDS       **
	***********************/

	_wound = player getVariable "woundedon";
	if(_wound > 1) then {

		if(life_pizza) then {
			life_pizza = false;
		};

		if(_wound == 4) then {

			if((round (random 1000)) > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};	
				[] call life_fnc_stage1pain;
			};

		};

		if(_wound == 5) then {
			
			if((round (random 1000)) > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};	
				[] call life_fnc_stage2pain;
			};

		};

		if((round (random 1000)) > 980) then {
			player setDamage (damage player) + .01;
		};
	};

	/***********************
	**		FACTURES	  **
	***********************/

	_fracture = player getVariable "fractureon";
	if(_fracture > 1) then {

		if(life_pizza) then {
			life_pizza = false;
		};

		if((round (random 1000)) > 980) then {

			player setDamage (damage player) + .01;

			/* 

			TODO: Update cg_sndimg sounds

			switch (round (random 3)) do {
				case 0: {playSound3D ["cg_sndimg\sounds\cough1.ogg", player, false, getPosASL player, 3, 1, 45];};
				case 1: {playSound3D ["cg_sndimg\sounds\cough2.ogg", player, false, getPosASL player, 3, 1, 45];};
				case 2: {playSound3D ["cg_sndimg\sounds\cough3.ogg", player, false, getPosASL player, 3, 1, 45];};
				case 3: {playSound3D ["cg_sndimg\sounds\cough4.ogg", player, false, getPosASL player, 3, 1, 45];};
			};
			*/
		};

		if(_fracture == 4) then {

			if((round (random 1000)) > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};	
				[] call life_fnc_stage1pain;
			};
		};

		if(_fracture == 7) then {

			if((round (random 1000)) > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};	
				[] call life_fnc_stage1pain;
			};
		};
	};

	/***********************
	**	   UNCONCIOUS	  **
	***********************/

	koildebiii = player getVariable "unconciouson";
	if(koildebiii > 1) then {

		if(life_pizza) then {
			life_pizza = false;
		};
		_chancez = round (random 1000);
		if(_chancez > 980) then {
			player setDamage (damage player) + .01;
			_coughtype = round (random 3);
			if(_coughtype == 0) then {
				playSound3D ["cg_sndimg\sounds\cough1.ogg", player, false, getPosASL player, 3, 1, 45];	
			};
			if(_coughtype == 2) then {
				playSound3D ["cg_sndimg\sounds\cough2.ogg", player, false, getPosASL player, 3, 1, 45];
			};
			if(_coughtype == 3) then {
				playSound3D ["cg_sndimg\sounds\cough3.ogg", player, false, getPosASL player, 3, 1, 45];	
			};
			if(_coughtype == 1) then {
				playSound3D ["cg_sndimg\sounds\cough4.ogg", player, false, getPosASL player, 3, 1, 45];	
			};
		};

		if(koildebiii == 2) then {
			_unconciouson = "Left Leg Cuts";	
		};

		if(koildebiii == 3) then {
			_unconciouson = "Left Leg Wound";	

			_chancez = round (random 1000);
			if(_chancez > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};	
				[] call life_fnc_stage2pain;
			};


		};

		if(koildebiii == 4) then {
			player setFatigue 1; 
			_unconciouson = "Left Leg Fracture";	

			_chancez = round (random 1000);
			if(_chancez > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};	
				[] call life_fnc_stage1pain;
			};


		};

		if(koildebiii == 5) then {
			_unconciouson = "Right Leg Cuts";	
		};

		if(koildebiii == 6) then {
			_unconciouson = "Right Leg Wound";	

			_chancez = round (random 1000);
			if(_chancez > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};	
				[] call life_fnc_stage2pain;
			};

		};

		if(koildebiii == 7) then {
			player setFatigue 1; 
			_unconciouson = "Right Leg Fracture";


			_chancez = round (random 1000);
			if(_chancez > 990) then {
				if(vehicle player == player) then {
					[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
				};	
				[] call life_fnc_stage1pain;
			};

		};

	};

	/***********************
	**	    DISEASE 	  **
	***********************/

	koildebiiii = player getVariable "diseaseon";
	if(koildebiiii > 1) then {

		if(life_pizza) then {
			life_pizza = false;
		};
		if(koildebiiii == 2) then {
			_diseaseon = "Ebola Symptoms";	
		};

		if(koildebiiii == 3) then {
			_diseaseon = "Sars Symptoms";	
		};

		if(koildebiiii == 4) then {
			_diseaseon = "Heavy Infection";	
		};

		if(koildebiiii == 5) then {
			_diseaseon = "Small Pox";	
		};

		if(koildebiiii == 6) then {
			_diseaseon = "Influenza";	
		};

		if(koildebiiii > 6) then {
			_diseaseon = "Malaria";	
		};

		_chances = round (random 1000);
		if(_chances > 975) then {
			player enableFatigue true;
			player setFatigue 0;

			if(vehicle player == player) then {
				[[player,"AmovPpneMstpSrasWpstDnon_healed"],"life_fnc_animSync",true,false] spawn bis_fnc_mp;
			};	
			[] call life_fnc_stage1pain;

			_coughtype = round (random 4);
			if(_coughtype == 1) then {
				playSound3D ["cg_sndimg\sounds\cough1.ogg", player, false, getPosASL player, 3, 1, 45];		
			};
			if(_coughtype == 2) then {
				playSound3D ["cg_sndimg\sounds\cough2.ogg", player, false, getPosASL player, 3, 1, 45];
			};
			if(_coughtype == 3) then {
				playSound3D ["cg_sndimg\sounds\cough3.ogg", player, false, getPosASL player, 3, 1, 45];
			};
			if(_coughtype == 4) then {
				playSound3D ["cg_sndimg\sounds\cough4.ogg", player, false, getPosASL player, 3, 1, 45];
			};

			player setDamage (damage player) + .01;

		};
	};

};