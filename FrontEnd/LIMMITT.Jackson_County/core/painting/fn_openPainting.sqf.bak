_assigned = assignedVehicle player;

if (_assigned isEqualTo objNull) exitWith {hint "Your last vehicle does not exist?"};
if !(_assigned in life_vehicles) exitWith {hint "You don't have keys to your last vehicle!"};

_className = typeOf _assigned;
_supportedVehicles = getArray (missionConfigFile >> "paintSystem" >> "paintConfig" >> "supportedVehicles");

if !(_classname in _supportedVehicles) exitWith {hint "This store does not paint your type of vehicle, Sorry! You can suggest your vehicle on the website under suggestions!"};

createDialog "gm_vehiclePainting";



_path = _className + "_skins";

_vehicleTextures = getArray (missionConfigFile >> "paintSystem" >> "paintConfig" >> _path >>"allTextures");
{lbAdd [1500, _x]} forEach _vehicleTextures;

selectedTextures = _vehicleTextures;

buttonSetAction [
2400, "[] call life_fnc_bodyPainting;
"];