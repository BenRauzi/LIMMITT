#include "\life_server\script_macros.hpp"

/*
	Heisen
	Retrieving Custom Colors from DB.
*/


svr_retrieveNametagColors = {
	params [
		"_player"
	];
	
	_queryStart = diag_tickTime;
	
	_query = format["SELECT nametagcustomarray FROM players WHERE playerid='%1'",(getPlayerUID _player)];
	_queryResult = [_query,2] call DB_fnc_asyncCall;
	
	_queryEnd = diag_tickTime;
	diag_log format ["QUERY: nametagcustomarray: %1 [%2]",(_queryEnd - _queryStart),_query];
	
	[_queryResult select 0] remoteExec ["fnc_recieveNametagColors",remoteExecutedOwner];
};