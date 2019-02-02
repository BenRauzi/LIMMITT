_hasDriver = _this select 0;
_suspect = _this select 1;

_index = lbAdd [1500, '----------------------'];
 lbSetColor [1500, _index, [0, 1, 0, 0.5]];

lbAdd [1500, 'DMV Information']

if (_hasDriver) then {
	lbAdd [1500, 'DMV Returns Individual has a valid license'];
} else {
	lbAdd [1500, 'No DMV Records found'];	
};

_index = lbAdd [1500, '----------------------'];
lbSetColor [1500, _index, [0, 1, 0, 0.5]];

lbAdd [1500, 'Tickets Information']

_founded1 = false;

{
	if ((getPlayerUID _suspect) isEqualTo (_x select 0)) then {
		lbAdd [1500, 'Ticket Logged:'];
		lbAdd [1500, format["Amount: %1", _x select 1]];
		lbAdd [1500, format["Reason: %1", _x select 2]];
		lbAdd [1500, format["Issuer: %1", _x select 3]];
		_founded1 = true;
	};
} forEach gm_ticketLog;

if (!_founded1) then {lbAdd [1500, 'No Recent Tickets Recorded'];};