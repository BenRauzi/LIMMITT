/*
	Author: Ben Harris
	Description: Seizes Weed
*/
Harris_seizeWeed = {
	params["_ct"];

	_ct setVariable ['growingPlant', nil, true];
	_ct setVariable ["seized",true,true];

	for "_i" from 1 to 8 do {
		_ct animate ["stage_%1", _i];
	};
};