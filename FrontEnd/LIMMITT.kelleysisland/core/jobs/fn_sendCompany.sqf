_index = lbCurSel 2100;
_message = ctrlText 1400;

if (player getVariable "restrained" || player getVariable "tied") exitWith {hint "You cannot do that as you are restrained!"};

_available = false;

if (_index isEqualTo 0) then {
	{
		if ((_x getVariable ["GM_Job", "Unemployed"]) isEqualTo "Lakeside Valley Taxi Company") then {

			format["%1 has requested a taxi at %2. Message: %3.", name player, mapGridPosition player, _message] remoteExec ["systemChat",_x];
			  parseText format["<t size='1.5' color='#ffffff'>New Taxi Request:</t><br /><t size='1.2' color='#ffffff'>%1 has requested a taxi at %2<br /><br /> Message: %3"
			 ,name player, mapGridPosition player, _message] remoteExec ["hint", _x];


			_available = true;
		};
	} forEach allPlayers;	

	if (!_available) then {systemChat "There are no taxis available at the moment."} else {systemChat "You have sent a taxi request"};
};

if (_index isEqualTo 1) then {
	{
		if ((_x getVariable ["GM_Job", "Unemployed"]) isEqualTo "Lakeside 7 News") then {

			format["%1 has requested a journalist at %2. Message: %3.", name player, mapGridPosition player, _message] remoteExec ["systemChat",_x];
			 parseText format["<t size='1.5' color='#ffffff'>New Journalist Request:</t><br /><t size='1.2' color='#ffffff'>%1 has requested a journalist at %2<br /><br /> Message: %3"
			 ,name player, mapGridPosition player, _message] remoteExec ["hint", _x];


			_available = true;
		};
	} forEach allPlayers;	

	if (!_available) then {systemChat "There are no journalists available at the moment."} else {systemChat "You have sent a journalist request"};
};

if (_index isEqualTo 2) then {
	{
		if ((_x getVariable ["GM_Job", "Unemployed"]) isEqualTo "Private Repairs Contractor") then {

			format["%1 has requested a journalist at %2. Message: %3.", name player, mapGridPosition player, _message] remoteExec ["systemChat",_x];
			 parseText format["<t size='1.5' color='#ffffff'>New Repairman Request:</t><br /><t size='1.2' color='#ffffff'>%1 has requested a repairman at %2<br /><br /> Message: %3"
			 ,name player, mapGridPosition player, _message] remoteExec ["hint", _x];


			_available = true;
		};
	} forEach allPlayers;	

	if (!_available) then {systemChat "There are no repairmen available at the moment."} else {systemChat "You have sent a repairman request"};
};

closeDialog 0;