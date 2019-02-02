if (isServer) then {
	_handle = [] execVM "\Harris_Server\InitFunctions.sqf";
	waitUntil {isNull _handle};
};

tf_no_auto_long_range_radio = true; 
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;

if (isServer) then {
	racemachine setVariable["start",false,true];
	racemachine2 setVariable["start",false,true];
	cgbankvault setvariable ["robbed",false,true];
	stash1 setvariable ["robbed",false,true];
	stash2 setvariable ["robbed",false,true];
	stash3 setvariable ["robbed",false,true];
	stash4 setvariable ["robbed",false,true];
	stash5 setvariable ["robbed",false,true];
	stash6 setvariable ["robbed",false,true];
	stash7 setvariable ["robbed",false,true];
	stash8 setvariable ["robbed",false,true];
	stash9 setvariable ["robbed",false,true];
	pstash1 setvariable ["robbed",false,true];
	pstash2 setvariable ["robbed",false,true];
	pstash3 setvariable ["robbed",false,true];
	pstash4 setvariable ["robbed",false,true];
	pstash5 setvariable ["robbed",false,true];
	pstash6 setvariable ["robbed",false,true];
	pstash7 setvariable ["robbed",false,true];
	pstash8 setvariable ["robbed",false,true];
	pstash9 setvariable ["robbed",false,true];
	pstash10 setvariable ["robbed",false,true];
};

enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;
introSpawn = nil;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "LIMMITT 1.0";
[] execVM "KRON_Strings.sqf";

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call bis_fnc_mpexec};

fences = [1015426, 1015443, 1015440, 1015438, 1015447, 1015453, 1015450, 1015434,1015349, 1015390, 1015430, 1015417, 1015418, 1015448, 1015425, 1015445, 1015413, 1015435, 1015427, 1015423, 1015421, 1015436, 1015410, 1015437, 1015449, 1015416, 1015457, 1005593, 1005590, 1015441, 1015444, 1015420, 346196, 1005587, 1015350, 1015351, 1005433, 1005438];    { _fence = ([0,0,0] nearestObject _x); _fence hideObject true; deletevehicle _fence; _fence enableSimulation false;  _fence allowDamage true; _fence hideobjectglobal true; } foreach fences;
fds = [1008267, 1015587, 1008269, 1008250, 1015165, 1008268, 1008236, 1008235, 1008234, 1015158, 1015159, 1015590, 1015589, 1016118, 1016120, 363148, 363144, 363150, 1016119, 1021715, 1018600, 1015153, 1015152, 1018749, 1008237, 1015164, 1015151, 1015150, 1008188, 1015161, 363149, 1021613, 1016121, 363146, 363131, 363147, 363139, 1018758, 1018759, 1015160, 1015163, 1015162, 1008188, 363151, 363135, 363136, 363140, 363142, 363137, 363133, 363132, 363134, 363145, 363141, 363143, 1015147];    { _fd = ([0,0,0] nearestObject _x); _fd hideObject true; deletevehicle _fd; _fd enableSimulation false;   _fd allowDamage true;  _fd hideobjectglobal true;} foreach fds;


disableSerialization;
Harris_twitterMessages = [];
Harris_twitterUI = displayNull;
colour = "";


//(findDisplay 46) displaySetEventHandler ["KeyDown","if((_this select 1) isEqualTo 28) then {if (isNull (findDisplay 5002)) then { [] call Harris_openTwitterType; } else { [] call Harris_sendMessage }; };"];
