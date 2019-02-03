/*
Search Words: 
RechargeStand
Recharge Stand
*/
_myposy = getPos player;

titleText["Charging Phone...","PLAIN"];

if(life_charging == 1) exitwith { 
titleText["Already Charging...","PLAIN"];
};
life_charging = 1;
while {life_charging == 1} do {
	uiSleep 0.2;
	if(life_battery > 99) exitwith { 
	life_charging = 2;
	titleText["You cant charge higher here...","PLAIN"];
	};
	if( player distance _myposy > 1 ) exitwith { 
			titleText["You moved to far away from charging zone","PLAIN"];
			life_charging = 2;
	};
	life_battery = life_battery + 2;
};

