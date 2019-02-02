createDialog "Life_ComputerTaxi";

_totalDistance = (player distance gm_taxiStart);
_distanceFormat = format ["Current Total Distance: %1M", _totalDistance];
ctrlSetText [1004, _distanceFormat];

_totalCost = ((player distance gm_taxiStart) * gm_taxiFee);
_distanceFormat = format ["Current Total Fee: $%1", _totalCost];
ctrlSetText [1003, _distanceFormat];