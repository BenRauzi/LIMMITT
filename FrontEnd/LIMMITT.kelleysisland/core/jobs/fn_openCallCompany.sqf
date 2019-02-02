if (dialog) exitWith {};

createDialog "callCompany";
_companyOptions = ["Lakeside Taxi Company", "Lakeside 7 News", "Private Repair Contractors"];

{ lbAdd [2100, _x]; } forEach _companyOptions;