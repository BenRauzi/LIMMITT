// Auto Switcher 
 

 
if (currentWeapon player isEqualTo "DDOPP_X26") exitWith { 
 if ("RH_g19" in (weapons player)) then { 
   player removeItem "RH_g19";

   player action ["SwitchWeapon", player, player, 99];
   uiSleep 1;
   
   player removeItem "DDOPP_X26";
   player addWeapon "RH_g19";
   player addItemToBackpack "DDOPP_X26";
 } else { 
  hint "Could not find Glock 17"; 
 }; 
}; 
 
if (currentWeapon player isEqualTo "RH_g19") exitWith { 
 if ("DDOPP_X26" in (weapons player)) then { 
  player removeItem "DDOPP_X26";

   player action ["SwitchWeapon", player, player, 99];
   uiSleep 1;
   
   player removeItem "RH_g19";
   player addWeapon "DDOPP_X26";
   player addItemToBackpack "RH_g19";
 } else { 
  hint "Could not find Taser"; 
 }; 
};