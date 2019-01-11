/*
	File: fn_callBackup.sqf
	Author: Cobra
	
	Description:
	Allows members with the panic button to call for backup.
*/
if(playerSide != west) exitWith {}; 
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"; 
_Pos = position player; 
_marker = createMarker ["Marker", _Pos]; 
"Marker" setMarkerColor "ColorRed";  
"Marker" setMarkerText "**PANIC BUTTON**"; 
"Marker" setMarkerType "mil_warning";	
[[1,format["911 DISPATCH: PANIC BUTTON USED BY %1",name player]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
[[0,format["911 DISPATCH: PANIC BUTTON USED BY %1", name player]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
[[0,format["911 DISPATCH: PANIC BUTTON USED BY %1", name player]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
[[0,format["911 DISPATCH: PANIC BUTTON USED BY %1", name player]],"life_fnc_broadcast",west,false] spawn bis_fnc_mp;
uiSleep 100;
deleteMarker "Marker"; 
