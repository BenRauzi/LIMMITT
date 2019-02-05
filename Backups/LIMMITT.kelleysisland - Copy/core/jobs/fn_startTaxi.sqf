_fee = ctrlText 1400;
_feeNumber = parseNumber _fee;

hint format ["Taxi Journey Began, Your distance and fee will be tracked - $%1 per meter", _feeNumber];

gm_taxiStart = getPos player;
closeDialog 0;