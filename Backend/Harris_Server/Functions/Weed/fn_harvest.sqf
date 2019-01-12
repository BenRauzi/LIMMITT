/*
	Author: Ben Harris
	Description: Harvest Your Crops
*/

Harris_Harvest = {
	params["_ct"];
	_timeLeft = _ct getVariable "growTime";
	test = _timeLeft;
	if (_timeLeft < 100) exitWith {	_msg = format ["This plant is only %1 percent grown, wait until it is finished.", _timeLeft]; ["Error", _msg, true] spawn Harris_Notifications; };

	_type = _ct getVariable "plantType";
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	switch (_type) do
	{
		case "Wheat": 
		{
			_valueArray = ["1","2","3","4","5"];
			_value = selectRandom _valueArray;
			_value = call compile _value;
			_msg = format ["You collected %1 wheat from this plant, your investment paid off.", _value];
			["Wheat Gathered", _msg, true] spawn Harris_Notifications;
			deleteVehicle _ct;

			while {_value > 0} do
				{
					player addItem "Harris_Wheat";
					_value = _value - 1;
				};
		};
	};
};