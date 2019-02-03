_content = _this select 0;

_query = format["INSERT INTO gm_logs (content) VALUES ('%1')", _content];


waitUntil {sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;