_assigned = assignedVehicle player;

if (_assigned isEqualTo objNull) exitWith {["Error", "Your last vehicle does not exist?", "Failure"] call Harris_Notifications;};
if !(_assigned in life_vehicles) exitWith {["Error", "You don't have keys to your last vehicle!", "Failure"] call Harris_Notifications;};

_className = typeOf _assigned;

_supportedVehicles = getArray (missionConfigFile >> "paintSystem" >> "paintConfig" >> "supportedVehicles");


_path = _className + "_skins";

_vehicleTextures = getArray (missionConfigFile >> "paintSystem" >> "paintConfig" >> _path >>"allTextures");
_index = lbCurSel 1500;
_texture = _vehicleTextures select _index;

_texturePath = getText (missionConfigFile >> 'paintSystem' >> 'paintConfig' >> _path >>_texture);
_pboPath = getText (missionConfigFile >> 'paintSystem' >> 'paintConfig' >> _path >> "fileNamePrefix");
_texturePath = _pboPath + _texturePath;

selectedTextures = _vehicleTextures;

_assigned setObjectTextureGlobal [0, _texturePath];	

_assigned setVariable ["GM_Paint", _texture, true];