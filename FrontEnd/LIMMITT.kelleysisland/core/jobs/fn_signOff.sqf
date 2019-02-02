_job = player getVariable ["GM_Job", "Unemployed"];
if (_job isEqualTo "Unemployed") exitWith {hint "You are already unemployed!"};

player setVariable ["GM_Job", "Unemployed", true];

if (alive gm_playerJobVehicle) then {deleteVehicle gm_playerJobVehicle};