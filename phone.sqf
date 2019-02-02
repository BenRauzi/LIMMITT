

















// InitServer


// Initclient



//








Harris_blockedCall = {
	Harris_Calling = false;
	closeDialog 5011;
	Harris_inCall = "Blocked";
};



Harris_openPhoneWhileCalling = {
	if (!isNull (findDisplay 5011)) exitWith {};
	createDialog "Harris_Phone_outgoingCall";

	_callerID = Harris_numberToCall;
		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

	if (_callerID == Harris_numberToCall) then {
		_number = [_callerID] call Harris_phoneNumberText;
	};
	ctrlSetText [1400, _number];
};


Harris_openPhoneInCalling = {
	if (!isNull (findDisplay 5010)) exitWith {};
	createDialog "Harris_Phone_inComingCall";

	_callerID = Harris_numberToCall;
		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

	if (_callerID == Harris_numberToCall && !(_callerID == "Anonymous Caller ID")) then {
		_callerID = [_callerID] call Harris_phoneNumberText;
	};

	ctrlSetText [1400, _callerID];
};


Harris_declineCall = {
	[] remoteExecCall ["HarriS_declinedCall", Harris_Caller];	
	Harris_receivingCall = nil;
};

Harris_declinedCall = {
	Harris_Calling = nil;
	closeDialog 5011;
	Harris_inCall = "Declined";
	["Call Declined", "You call has been Declined", "Info"] spawn Harris_Notifications;
};


Harris_acceptCall = {

	Harris_oldFrequency = [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_GetChannelFrequency;
	if ("tf_anprc152" in (assignedItems player)) then {
		player unassignItem "tf_anprc152";
		
		if !("LIMMITT_Network_Phone" in items player) then {
			player addItem "LIMMITT_Network_Phone";
		};
			player assignItem "LIMMITT_Network_Phone";
		Harris_hadRadio = true;
	};

	[(call TFAR_fnc_activeSwRadio), 1, Harris_CallerFreq] call TFAR_fnc_SetChannelFrequency;

	[Harris_CallerFreq, (profileNamespace getVariable "yourNumber"), player] remoteExecCall ["Harris_acceptedCall", Harris_Caller];
	Harris_inCurrentCall = true;
	Harris_receivingCall = nil;

	[] call Harris_openPhoneInCall;
};


Harris_acceptedCall = {
	params["_freq", "_callerID", "_caller"];

	Harris_Calling = nil;
	closeDialog 5011;
	createDialog "Harris_Phone_inCall";
	Harris_Caller = _caller;
	Harris_CallerID = _callerID;

	Harris_inCall = "Accepted";

	Harris_oldFrequency = [(call TFAR_fnc_activeSwRadio), 1] call TFAR_fnc_GetChannelFrequency;
	if ("tf_anprc152" in (assignedItems player)) then {
		player unassignItem "tf_anprc152";
		
		if !("LIMMITT_Network_Phone" in items player) then {
			player addItem "LIMMITT_Network_Phone";
		};
		player assignItem "LIMMITT_Network_Phone";
		Harris_hadRadio = true;
	};
	

	[(call TFAR_fnc_activeSwRadio), 1, _freq] call TFAR_fnc_SetChannelFrequency;
	Harris_inCurrentCall = true;

	

	_callerID = Harris_CallerID;
		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

	if (_callerID == Harris_numberToCall &&  !(_callerID == "Anonymous Caller ID")) then {
		_callerID = [_callerID] call Harris_phoneNumberText;
	};

	ctrlSetText [1601, _callerID];

	["Call Accepted", "You call has been Accepted", true] spawn Harris_Notifications; 
};

Harris_openPhoneInCall = {
	createDialog "Harris_Phone_inCall";

	
	_callerID = Harris_CallerID;
		{
			if (_callerID == _x select 0) then {
				_callerID = _x select 1;
			}
		} forEach (profileNamespace getVariable ["contactList", []]);

	if (_callerID == Harris_numberToCall && !(_callerID == "Anonymous Caller ID")) then {
		_callerID = [_callerID] call Harris_phoneNumberText;
	};

	ctrlSetText [1601, _callerID];
};


Harris_hangUp = {

	if ("tf_anprc152" in (items player) && Harris_hadRadio) then {
		player unassignItem "Harris_CellPhone";
		player assignItem "tf_anprc152";
		Harris_hadRadio = nil;
	};

	[] remoteExecCall ["Harris_hungUp", Harris_Caller];
	
	[(call TFAR_fnc_activeSwRadio), 1, Harris_oldFrequency] call TFAR_fnc_SetChannelFrequency;
	Harris_inCurrentCall = nil;
	Harris_Calling = nil;
};

Harris_hungUp = {
	
	if ("tf_anprc152" in (items player) && Harris_hadRadio) then {
		player unassignItem "LIMMITT_Network_Phone";
		player assignItem "tf_anprc152";
		Harris_hadRadio = nil;
	};

	[(call TFAR_fnc_activeSwRadio), 1, Harris_oldFrequency] call TFAR_fnc_SetChannelFrequency;
	["Hung Up", "You have been hung up on", "Info"] spawn Harris_Notifications;
	Harris_inCurrentCall = nil;
	Harris_Calling = nil;

	if (!isNull (findDisplay 5020)) then {
		closeDialog 5020;
	};
};




Harris_cancelCall = {
	Harris_inCall = "Cancelled";
	Harris_Calling = nil;
	[Harris_numberToCall] remoteExecCall ["Harris_canceledCall", 0];
};


Harris_canceledCall = {
	params["_id"];

	if (_id == profileNamespace getVariable "yourNumber") then {
		Harris_receivingCall = nil;

		if (!isNull (findDisplay 5010)) then { closeDialog 5010; };
	};
};

Harris_openSettings = {
	waitUntil {!isNull (findDisplay 5008)};
	settingsLoad = true;

	{
		_index = lbAdd [2100, _x select 0];
		lbSetData [2100, _index, _x select 1];

		if (_x select 1 isEqualTo (profileNamespace getVariable ["ringTone", "iphone_ringtone"])) then {
			lbSetCurSel [2100, _forEachIndex];
		};
	} forEach Harris_ringtones;

	if (profileNamespace getVariable ["anonCalling", false]) then {
		ctrlShow [1203, true];
		ctrlShow [1604, false];
		ctrlShow [1205, false];
		ctrlShow [1605, true];
	} else {
		ctrlShow [1203, false];
		ctrlShow [1604, true];
		ctrlShow [1205, true];
		ctrlShow [1605, false];
	};

	if (profileNamespace getVariable ["blockingCalls", false]) then {
		ctrlShow [1202, true];
		ctrlShow [1606, false];
		ctrlShow [1204, false];
		ctrlShow [1607, true];
	} else {
		ctrlShow [1202, false];
		ctrlShow [1606, true];
		ctrlShow [1204, true];
		ctrlShow [1607, false];
	};

	{
		if (_x select 2) then {
			_index = lbAdd [2101, _x select 0];
			lbSetData [2101, _index, _x select 1];
		};
		if (_x select 1 == profileNamespace getVariable ["colour", "Default"]) then {
			lbSetCurSel [2101, _forEachIndex];
		};
	} forEach Harris_twitterColours;

	if (lbCurSel 2101 == -1) then {
		profileNamespace setVariable ["colour", "Default"];
		lbSetCurSel [2101, 0];
	};
};

Harris_changeRingTone = {
	params["_index"];

	_ringTone = lbData [2100, _index];
	
	if (isNil "settingsLoad") then {
		playSound _ringTone;
	} else {
		settingsLoad = nil;
	};	

	if (_ringTone != profileNamespace getVariable ["ringTone", ""]) then {
		profileNamespace setVariable ["ringTone", _ringTone];
		saveProfileNamespace;	
	};
};

Harris_switchAnonCalling = {
	params["_type"];

	if (_type) then {
		profileNamespace setVariable ["anonCalling", true];
		ctrlShow [1203, true];
		ctrlShow [1604, false];
		ctrlShow [1205, false];
		ctrlShow [1605, true];
	} else {
		profileNamespace setVariable ["anonCalling", false];
		ctrlShow [1203, false];
		ctrlShow [1604, true];
		ctrlShow [1205, true];
		ctrlShow [1605, false];
	};
};


Harris_switchBlockCalling = {
	params["_type"];

	if (_type) then {
		profileNamespace setVariable ["blockingCalls", true];
		ctrlShow [1202, true];
		ctrlShow [1606, false];
		ctrlShow [1204, false];
		ctrlShow [1607, true];
	} else {
		profileNamespace setVariable ["blockingCalls", nil];
		ctrlShow [1202, false];
		ctrlShow [1606, true];
		ctrlShow [1204, true];
		ctrlShow [1607, false];
	};
};

Harris_updateVInventory = {
	waitUntil {!isNull (findDisplay 5001)};

	_dialog = findDisplay 5001;

	_inv = _dialog displayCtrl 2005;

	lbClear _inv;

	{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
	};
	} foreach asdih_inv_items;

};

Harris_updateKeys = {
	waitUntil {!isNull (findDisplay 5003)};

	_dialog = findDisplay 5003;
	_vehicles = _dialog displayCtrl 2701;
	lbClear _vehicles;
	_plist = _dialog displayCtrl 2702;
	lbClear _plist;
	_near_units = [];

	{ if(player distance _x < 20) then {_near_units set [count _near_units,_x];};} foreach playableUnits;

	for "_i" from 0 to (count life_vehicles)-1 do
	{
		_veh = life_vehicles select _i;
		if(!isNull _veh && alive _veh) then
		{
			_color = [(typeOf _veh),(_veh getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
			_text = format["(%1)",_color];
			if(_text == "()") then
			{
				_text = "";
			};
			
			_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
			_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
			_vehicles lbAdd format["%1 %3 - [Distance: %2m]",_name,round(player distance _veh),_text];
			if(_pic != "pictureStaticObject") then {
				_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
			};
			_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
		};
	};

	{
		if(!isNull _x && alive _x && player distance _x < 20 && _x != player) then
		{
			_plist lbAdd format["%1",_x getVariable["realname",name _x]];
			_plist lbSetData [(lbSize _plist)-1,str(_x)];
		};
	} foreach _near_units;

	if(((lbSize _vehicles)-1) == -1) then
	{
		_vehicles lbAdd "You don't own any vehicles";
		_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
	};
};


Harris_updateBanking = {
	waitUntil {!isNull (findDisplay 5015)};

	_dialog = findDisplay 5015;
	_units = _dialog displayCtrl 2703;

	ctrlSetText [1400,format["$%1",[gm_memecash] call life_fnc_numberText]];
	ctrlSetText [1401,format["$%1",[gm_memecash] call life_fnc_numberText]];
	ctrlSetText [1402,format["$%1",[LIMMITTCASH] call life_fnc_numberText]];

	_type = "Civ";
	{
		if(alive _x) then
		{
			switch (side _x) do
			{
				case west: {_type = "Cop"};
				case civilian: {_type = "Civ"};
				case independent: {_type = "EMS"};
			};
			_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
			_units lbSetData [(lbSize _units)-1,str(_x)];
		};
	} foreach playableUnits;

	lbSetCurSel [2703, 0];
};

Harris_updateLicenses = {
	waitUntil {!isNull (findDisplay 5022)};

	_dialog = findDisplay 5022;
	_licenses = [];
	_side = str (playerSide);
	{
		if((_x select 1) == _side) then
		{
			_str = [_x select 0] call life_fnc_varToStr;
			_val = missionNamespace getVariable (_x select 0);
			if(_val) then
			{
				_licenses pushBack _str;
			};
		};
	} foreach life_licenses;

	if(str _licenses == "[]") then
	{
		_licenses = ["No Licenses"];
	};
	
	{
		lbAdd [2702, _x];
	} forEach _licenses;
};

Harris_useItemPhone= {
	[] call life_fnc_useItem;
};

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

Harris_giveKeyPhone = {
	private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
	disableSerialization;

	_dialog = findDisplay 5003;
	_list = _dialog displayCtrl 2701;
	_plist = _dialog displayCtrl 2702;

	_sel = lbCurSel _list;
	_vehicle = _list lbData _sel;
	_vehicle = life_vehicles select parseNumber(_vehicle);

	_sel = lbCurSel _plist;
	_unit = _plist lbData _sel;
	_unit = call compile format["%1", _unit];
	if(isNull _unit OR isNil "_unit") exitWith {}; 

	_uid = getPlayerUID _unit;
	_owners = _vehicle getVariable "vehicle_info_owners";
	_index = [_uid,_owners] call fnc_index;
	if(_index == -1) then 
	{
		_owners set[count _owners,[_uid,_unit getVariable["realname",name _unit]]];
		_vehicle setVariable["vehicle_info_owners",_owners,true];
	};

	["Success",  format["You have given %1 keys to your %2",_unit getVariable["realname",name _unit],typeOf _vehicle], "Success"] call Harris_Notifications;
	[[_vehicle,_unit,profileName], "clientGetKey",_unit,false] spawn bis_fnc_mp;
};

Harris_keyDropPhone = {
	private["_dialog","_list","_sel","_vehicle","_impounded","_owners","_index","_index2","_i"];
	disableSerialization;

	_dialog = findDisplay 5003;
	_list = _dialog displayCtrl 2701;
	_sel = lbCurSel _list;
	if(_sel == -1) exitWith {["Error",  "No Data Selected", "Failure"] call Harris_Notifications;};
	_index = (parseNumber(_list lbData _sel));
	_vehicle = life_vehicles select _index;
	if(_vehicle isKindOf "House_F") exitWith {["Error",  "You can't remove the keys to your house!", "Failure"] call Harris_Notifications;};
	_owners = _vehicle getVariable "vehicle_info_owners";

	_index2 = [(getPlayerUID player),_owners] call fnc_index;
	life_vehicles = life_vehicles - [_vehicle];
	_owners set[_index,-1];
	_owners = _owners - [-1];
	_vehicle setVariable["vehicle_info_owners",_owners,true];

	[] spawn Harris_updateKeys;
};

Harris_uberOpened = {
	waitUntil {!isNull (findDisplay 5027)};
	lbClear 1500;

	{
		_index = lbAdd[1500,name (_x select 0)];
		lbSetData [1500, _index, str _forEachIndex];
	} forEach (missionNamespace getVariable "uberDrivers");

	ctrlSetText[1602, "N/A"];
	ctrlSetText[1603, "None"];

	if (!isNil "isUber") then {
		ctrlShow [1203, true];
		ctrlShow [1604, false];
		ctrlShow [1205, false];
		ctrlShow [1605, true];
	} else {
		ctrlShow [1203, false];
		ctrlShow [1604, true];
		ctrlShow [1205, true];
		ctrlShow [1605, false];
	};

	if (count (missionNamespace getVariable 'uberDrivers') == 0) exitWith {};
	lbSetCurSel [1500,0];

	
};

Harris_onUberLbChanged = {
	params["_index"];
	_uberID = ((missionNamespace getVariable "uberDrivers") select _index);
	_uber = _uberID select 0;
	Harris_numberToCall = _uberID select 1;
	

	ctrlSetText[1602, str (player distance _uber)];
	_vehicle = vehicle _uber;
	if (_vehicle == _uber) then {
		_vehicle = "None";
	} else {
		_vehicle = [typeOf _vehicle] call Harris_getVehicleName;
	};

	ctrlSetText[1603, _vehicle];
};

Harris_onDutyUber = {
	_ubers = missionNamespace getVariable "uberDrivers";
	_ubers pushBack [player, profileNamespace getVariable "yourNumber"];
	missionNamespace setVariable ["uberDrivers", _ubers, true];	
	isUber = true;

	[] call Harris_uberOpened;
};

Harris_offDutyUber = {
	_ubers = missionNamespace getVariable "uberDrivers";
	_ubers deleteAt (_ubers find [player, profileNamespace getVariable "yourNumber"]);
	missionNamespace setVariable ["uberDrivers", _ubers, true];	
	isUber = nil;

	[] call Harris_uberOpened;
};


Harris_openSendMessageUber = {
	waitUntil {!isNull (findDisplay 5031)};

	_id = Harris_numberToCall;
	{
		if (_id == _x select 0) then {
			_id = _x select 1;
		};
	} forEach (profileNamespace getVariable ["contactList", []]);

	if (_id == Harris_numberToCall) then {
		ctrlSetText [1400, [Harris_numberToCall] call Harris_phoneNumberText];
	} else {
		ctrlSetText [1400, _id];
	};
};

Harris_getVehicleName = {
	params ["_class"];

	_return = getText(configFile >> "CfgVehicles" >> _class >> "displayName");

	_return;
};

Harris_informationOpened = {
	waitUntil {!isNull (findDisplay 5032)};
	ctrlSetText [1600, format["Current Police: %1", west countside allPlayers]];
	ctrlSetText [1601, format["Current Paramedics: %1", independent countside allPlayers]];
	ctrlSetText [1602, format["Current Civilians: %1", civilian countside allPlayers]];
};