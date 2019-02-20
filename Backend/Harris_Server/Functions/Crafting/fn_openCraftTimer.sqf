/*
	Author: Ben Harris
	Description: Opens Crafting Timer and handles (Dialog)
*/

Harris_openCraftTimer = {
	params["_time", "_item", "_itemType","_displayName", "_bool"];
	player forceWalk true;
	19 cutRsc ["Harris_Progress","PLAIN"];
	_progressUI = uiNamespace getVariable ["Harris_Progress",displayNull];
	_progressBar = _progressUI displayCtrl 1400;
	_itemText = _progressUI displayCtrl 1000;
	_progressBar progressSetPosition 0.01;

	Harris_sleepTime = (_time * 60) / 100;
	_progressPosition = 0;

	_itemText ctrlSetText _displayName;
	while {true} do
	{
		_progressPosition = _progressPosition + 0.01;
		_progressBar progressSetPosition _progressPosition;
		sleep Harris_sleepTime;
		Harris_Time = _progressPosition;

		if (animationState player != "ainvpknlmstpsnonwnondnon_medic_1") then {
			player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
		};

		if (_progressPosition >= 1 && count Harris_craftSchedule > 1) exitWith {

			Harris_craftSchedule deleteAt 0;
		
			if (player canAdd _item) then {
				player addItem _item;
			} else {
				_holder = "groundWeaponHolder" createVehicle position player;
				_holder setPos (getpos Player);
				_holder addItemCargoGlobal [_item, 1];
			};

			_item = (Harris_craftSchedule select 0) select 1;
			_time = (Harris_craftSchedule select 0) select 5;
			_itemType = (Harris_craftSchedule select 0) select 4;
			_displayName = (Harris_craftSchedule select 0) select 0;

			[_time, _item, _itemType, _displayName] spawn Harris_openCraftTimer;

			19 cutText ["","PLAIN"];
		};
		if (_progressPosition >= 1) exitWith {
			Harris_craftSchedule deleteAt 0;
			["Success", "Item Crafted", "Success"] spawn Harris_Notifications;
			if (player canAdd _item) then {
				player addItem _item;
			} else {
				_holder = "groundWeaponHolder" createVehicle position player;
				_holder setPos (getpos Player);
				_holder addItemCargoGlobal [_item, 1];
			};
			
			19 cutText ["","PLAIN"];
			player forceWalk false;
		};
	};
};