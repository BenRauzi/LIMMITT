_assigned = assignedVehicle player;

if (_assigned isEqualTo objNull) exitWith {["Error",  "Your last vehicle does not exist?", "Failure"] call Harris_Notifications; };
if !(_assigned in life_vehicles) exitWith {["Error",  "You don't have keys to your last vehicle!", "Failure"] call Harris_Notifications; };

_className = typeOf _assigned;
_supportedVehicles = getArray (missionConfigFile >> "paintSystem" >> "paintConfig" >> "supportedVehicles");

if !(_classname in _supportedVehicles) exitWith {["Error",  "This store does not paint your type of vehicle, Sorry! You can suggest your vehicle on the website under suggestions!", "Failure"] call Harris_Notifications; };

createDialog "gm_vehiclePainting";



_path = _className + "_skins";

_vehicleTextures = getArray (missionConfigFile >> "paintSystem" >> "paintConfig" >> _path >>"allTextures");
{lbAdd [1500, _x]} forEach _vehicleTextures;

selectedTextures = _vehicleTextures;

buttonSetAction [
2400, "[] call life_fnc_bodyPainting;
"];