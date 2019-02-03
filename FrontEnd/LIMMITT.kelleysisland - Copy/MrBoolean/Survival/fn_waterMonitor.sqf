
if(life_thirst < 2) exitWith {
	player setDamage 1;
	hint localize "STR_NOTF_DrinkMSG_Death";
};

if(!life_is_arrested) then { 
	
	life_thirst = life_thirst - 10;

	if(life_thirst < 2) exitWith {
		player setDamage 1;
		hint localize "STR_NOTF_DrinkMSG_Death";
	};
	
	switch(life_thirst) do {
		case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
		case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
		case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
	};
};