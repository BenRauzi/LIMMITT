
// Make sure they're not starved to death - if they are, kill them and exit
if(life_hunger < 2) exitWith {

	player setDamage 1;
	hint localize "STR_NOTF_EatMSG_Death";
};

//Make sure they're not arrested, if they are, we won't starve them
if(!life_is_arrested) then {

	life_hunger = life_hunger - 10;
	
	//Now that we've reduced their hunger, lets make sure they don't need to die.
	if(life_hunger < 2) exitWith {

		player setDamage 1;
		hint localize "STR_NOTF_EatMSG_Death";
	};
};

//If they're one of the following, display a message.
switch(life_hunger) do {
	case 30: {
		hint localize "STR_NOTF_EatMSG_1";
	};
	case 20: {
		hint localize "STR_NOTF_EatMSG_2";
	};
	case 10: {
		hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;
	};
};