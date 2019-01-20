/*
	Author: Ben Harris
	Description: Grows the Weed
	Harris_growTime = 5;
*/
Harris_growWeed = {
	params["_plant", "_ct"];
	_plantStages = 8;

	_stageTime = (Harris_growTime * 60) / _plantStages;
	for "_i" from 0 to _plantStages do {
			if (isNull _plant) exitwith {};
			if (_ct getVariable ["seized",false]) exitWith {_ct setVariable ["seized",nil,true];};
			_plant animate [format["stage_%1", _i - 1],0];
			_plant animate [format["stage_%1", _i],1];
			sleep _stageTime;
		};

	_ct setVariable ["weedReady",true,true];
};
