/*
	Author: Ben Harris
	Description: Sends systemChat message remotely. - Could do this with induvidual remoteExecCall's but setup like this in case I want to handle multiple sequential commands at once without multiple calls.
*/

Harris_serverMsg = {
	params["_msg"];

	systemChat _msg;

	["Warning", _msg, "Warning"] call Harris_Notifications;
};