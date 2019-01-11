// Auto Switcher 
 

 
if (currentWeapon player isEqualTo "JD_Taser") exitWith { 
 if ("RH_g19" in (weapons player)) then { 
   player removeItem "RH_g19";

   player action ["SwitchWeapon", player, player, 99];
   uiSleep 1;
   
   player removeItem "JD_Taser";
   player addWeapon "RH_g19";
   player addItemToBackpack "JD_Taser";
 } else { 
  hint "Could not find Glock 17"; 
 }; 
}; 
 
if (currentWeapon player isEqualTo "RH_g19") exitWith { 
 if ("JD_Taser" in (weapons player)) then { 
  player removeItem "JD_Taser";

   player action ["SwitchWeapon", player, player, 99];
   uiSleep 1;
   
   player removeItem "RH_g19";
   player addWeapon "JD_Taser";
   player addItemToBackpack "RH_g19";
 } else { 
  hint "Could not find Taser"; 
 }; 
};