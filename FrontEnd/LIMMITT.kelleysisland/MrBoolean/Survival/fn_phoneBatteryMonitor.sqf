
if(life_battery > 2) then {
	
	_batloss = round (random 8);
	life_battery = life_battery - _batloss;

	if(life_battery < 1) then {
		hint "Your battery is empty.";
	};
	
	switch(life_battery) do {

		case 30: {
			hint "Battery 30%.";
		};
		case 20: {
			hint "Battery 20%.";
		};
		case 10: {
			hint "Battery 10%.";
			playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25];
		};
		case 5: {
			hint "Battery 5%.";
			playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25];
		};
		case 3: {
			hint "Battery 3%.";
			playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25];
		};
		case 1: {
			hint "Battery 1%.";
			playSound3D ["cg_sndimg\sounds\phoneSMS.ogg", player, false, getPosASL player, 1, 1, 25];
		};
	};
};