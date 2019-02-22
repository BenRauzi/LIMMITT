/*
	Author: Nicholas Jo'Foski
	Description: Automatically restarts the server every 6 hours
	Usuage: ["SERVER_COMMAND_PASSWORD",true] spawn Foski_serverRestarter;
*/

Foski_serverRestarter ={
	params ["_cmdPswd", ["_restart", false]];
	if ((typename _cmdPswd != "STRING") || (typename _restart != "BOOL")) exitWith {};
	if (isNil "_cmdPswd") exitWith {
		["Server Restart","The server command password hasn't been included, please contact an admin.", "Failure"] remoteExecCall ["Harris_Notifications", 0];
	};
	if (_restart) then {
		diag_log "Foski's Server Restarter: The Server restarter function has started.";
		sleep 300;
		["Server Restart","This server will automatically restart in precisely 6 hours.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 10800}; // Wait until the server has been up for 3 hours
		["Server Restart","This server will automatically restart in precisely 3 hours.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 14400}; // Wait until the server has been up for 4 hours
		["Server Restart","This server will automatically restart in precisely 2 hours.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 18000}; // Wait until the server has been up for 5 hours
		["Server Restart","This server will automatically restart in precisely 1 hours.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 19800}; // Wait until the server has been up for 5 and a half hours (5 hours and 30 minutes)
		["Server Restart","This server will automatically restart in precisely 30 minutes.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 20400}; // Wait until the server has been up for 5 hours and 40 minutes
		["Server Restart","This server will automatically restart in precisely 20 minutes.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21000}; // Wait until the server has been up for 5 hours and 50 minutes
		["Server Restart","This server will automatically restart in precisely 10 minutes.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21300}; // Wait until the server has been up for 5 hours and 55 minutes
		["Server Restart","This server will automatically restart in precisely 5 minutes.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21540}; // Wait until the server has been up for 5 hours and 58 minutes
		["Server Restart","This server will automatically restart in precisely 1 minute.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21570}; // Wait until the server has been up for 5 hours, 59 minutes and 30 seconds
		["Server Restart","This server will automatically restart in precisely 30 seconds.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21580}; // Wait until the server has been up for 5 hours, 59 minutes and 40 seconds
		["Server Restart","This server will automatically restart in precisely 20 seconds.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21590}; // Wait until the server has been up for 5 hours, 59 minutes and 50 seconds
		["Server Restart","This server will automatically restart in precisely 10 seconds.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21595}; // Wait until the server has been up for 5 hours, 59 minutes and 55 seconds
		["Server Restart","This server will automatically restart in precisely 5 seconds.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21596}; // Wait until the server has been up for 5 hours, 59 minutes and 56 seconds
		["Server Restart","This server will automatically restart in precisely 4 seconds.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21597}; // Wait until the server has been up for 5 hours, 59 minutes and 57 seconds
		["Server Restart","This server will automatically restart in precisely 3 seconds.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21598}; // Wait until the server has been up for 5 hours, 59 minutes and 58 seconds
		["Server Restart","This server will automatically restart in precisely 2 seconds.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21599}; // Wait until the server has been up for 5 hours, 59 minutes and 59 seconds
		["Server Restart","This server will automatically restart in precisely 1 seconds.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		waitUntil {serverTime >= 21600}; // Wait until the server has been up for 6 hours
		["Server Restart","This server will automatically restart now.", "Info"] remoteExecCall ["Harris_Notifications", 0];
		// Actually shut down the server
		sleep 5;
		diag_log "Foski's Server Restarter: This Server has been automatically restarted after 6 hours of uptime.";
		_cmdPswd serverCommand "#shutdown";
		// Check if the server has been shut down
		sleep 5;
		["Server Restart","This server has failed to automatically restart, please contact a server administrator.", "Failure"] remoteExecCall ["Harris_Notifications", 0];
		diag_log "Foski's Server Restarter: This Server has failed to automatically restart, the server command password configured is possibly incorrect.";
	};
};