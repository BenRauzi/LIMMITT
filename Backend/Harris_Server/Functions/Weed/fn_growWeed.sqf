/*
	Author: Ben Harris
	Description: Grows the Weed
*/
Harris_growWeed = {
	params["_ct"];

	_plantStages = 8;

	_stageTime = (Harris_growTime * 60) / _plantStages;
	for "_i" from 0 to _plantStages do {
			if (_ct getVariable ["seized",false]) exitWith {_ct setVariable ["seized",nil,true];};
			_ct animate [format["stage_%1", _i - 1],0];
			_ct animate [format["stage_%1", _i],1];
			sleep _stageTime;
		};

	_ct setVariable ["weedReady",true,true];
};
