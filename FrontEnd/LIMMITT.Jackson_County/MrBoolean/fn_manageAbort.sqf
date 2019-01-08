/*
*
*	Author: MrBoolean
*
*/

//Disable everything
cutText ["Saving and Aborting, Please Wait.","BLACK OUT",1];
1 fadeSound 0;
showChat false;
player enableSimulation false;

_handle = [] call SOCK_fnc_updateRequest;

["Abort", true, false] call BIS_fnc_endMission;