/*
	Author: Ben Harris
	Description: Phone - Read Function Name
*/

Harris_informationOpened = {
	waitUntil {!isNull (findDisplay 5032)};
	ctrlSetText [1600, format["Current Police: %1", west countside allPlayers]];
	ctrlSetText [1601, format["Current Paramedics: %1", independent countside allPlayers]];
	ctrlSetText [1602, format["Current Civilians: %1", civilian countside allPlayers]];
};