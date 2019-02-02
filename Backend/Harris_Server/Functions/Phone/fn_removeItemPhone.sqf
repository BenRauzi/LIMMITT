/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/


Harris_removeItemPhone = {
	private["_data","_obj","_pos","_ind"];
	disableSerialization;
	_data = lbData[2005,(lbCurSel 2005)];
	if(_data == "") exitWith { ["Error", "You didn't select anything to remove.", "Failure"] call Harris_Notifications;};
	_ind = [_data,life_illegal_items] call fnc_index;
	if(_ind != -1 && ([west,getPos player,100] call life_fnc_nearUnits)) exitWith {titleText["This is an illegal item and cops are near by, you cannot dispose of the evidence","PLAIN"]};
	if(player != vehicle player) exitWith {titleText["You cannot remove an item when you are in a vehicle.","PLAIN"]};
	if(!([false,_data,1] call life_fnc_handleInv)) exitWith { ["Error", "Couldn't remove that much of that item, maybe you don't have that amount?", "Failure"] call Harris_Notifications;};
	_type = [_data,0] call life_fnc_varHandle;
	_type = [_type] call life_fnc_varToStr;
	 ["Success", format["You have successfully removed %1 %2 from your inventory.",1, _type], "Success"] call Harris_Notifications;
		
	[] call Harris_updateVInventory;	
};