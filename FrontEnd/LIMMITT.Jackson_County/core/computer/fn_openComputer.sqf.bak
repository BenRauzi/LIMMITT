createDialog "Life_ComputerPolice";

lbAdd [1500, 'LSPD Database Loaded. Type !help for command infomation.'];

moduleName_keyDownEHId = (findDisplay 270124) displayAddEventHandler ["KeyDown", " if (_this select 1 isEqualTo 28) then {

_originText = toLower (ctrlText 2201);

_inputText = format ['> %1', _originText];

ctrlShow [1900, true];

_index = lbAdd [1500, _inputText];
lbSetColor [1500, _index, [0, 1, 0, 0.5]];

	if (((_originText splitString ' ') select 0) == '!search') exitWith {

		_lookupArray = (_originText splitString ' ');
		_lookupArray deleteAt 0;
		_nameString = _lookupArray joinString ' ';

		lbAdd [1500, _nameString];

		_found = false;

		{ if ((name _x) == _nameString) then {

		  _index = lbAdd [1500, '----------------------'];
		  lbSetColor [1500, _index, [0, 1, 0, 0.5]];
		  lbAdd [1500, format ['Faction: %1', (side _x)]];
		  lbAdd [1500, format ['Citizen ID: %1', (getPlayerUID _x)]];
		  lbAdd [1500, format ['Occupation: %1', (_x getVariable ['GM_Job', 'Unemployed'])]];
		  gm_searchingWarrants = true;
		  [player, _x] remoteExecCall ['life_fnc_computerWarrants', 2];
		  _found = true;
		  computerUnit = _x;
		  _index = lbAdd [1500, '----------------------'];
		   lbSetColor [1500, _index, [0, 1, 0, 0.5]];
		   lbAdd [1500, 'Citation History:'];
		  {	
		  	if ((_x select 0) isEqualTo (getPlayerUID computerUnit)) then {_index = lbAdd [1500, '----------------------']; lbSetColor [1500, _index, [0, 1, 0, 0.5]];
		  	 lbAdd [1500, format ['Citation Found -']]; 
		  	 lbAdd [1500, format ['Citation Amount: $%1', _x select 1]]; 
		  	 lbAdd [1500, format ['Citation Reason: %1', _x select 2]]; 
		  	 lbAdd [1500, format ['Citation Notes: %1', _x select 3]]; 
		  	 lbAdd [1500, format ['Issuing Department: %1', _x select 4]]; 
		  	 lbAdd [1500, format ['Issuing Officer: %1', _x select 5]];
		  	};
		  } forEach ticketLog;
		};
		 } forEach allPlayers;

		if !(_found) then {lbAdd [1500, 'No Results Found!']};

		ctrlSetText [2201, ''];
		lbSetCurSel [1500, LbSize 1500];
	};

	if (((_originText splitString ' ') select 0) == '!cctv') exitWith {

		/*
		_lookupArray = (_originText splitString ' ');
		_lookupArray deleteAt 0;
		_nameString = _lookupArray joinString ' ';

		_found = false;

		if (_nameString isEqualTo 'doc checkpoint') then {
			_found = true;
			gm_cctv = 'CAMERA' camCreate getPos checkpointCamera1; 
			gm_cctv cameraEffect ['Internal', 'Back', 'cctvcamera']; 
			gm_cctv camSetTarget (getPos checkpointCamera2); 
			gm_cctv camSetPos (getPosATL checkpointCamera1); 
			gm_cctv camSetFOV 0.45; 
			gm_cctv camCommit 0;

			systemChat 'Displaying DOC CCTV';
			
			ctrlShow [1900, true];
			ctrlShow [1500, false];
			ctrlShow [2201, false];
			ctrlSetText [1900, '#(argb,1048,1048,1)r2t(cctvcamera,1.0);'];
			*/
		};

		lbAdd [1500, 'At the moment the CCTV System is down, It is undergoing repairs, Don't worry!'];
	};

	if (((_originText splitString ' ') select 0) == '!dmv') exitWith {

		_lookupArray = (_originText splitString ' ');
		_lookupArray deleteAt 0;
		_nameString = _lookupArray joinString ' ';

		lbAdd [1500, format['DMV Lookup - %1', _nameString]];

		_found = false;

		{ if ((name _x) == _nameString) then {

		  _index = lbAdd [1500, '----------------------'];
		  lbSetColor [1500, _index, [0, 1, 0, 0.5]];
		  _found = true;
		  _license = _x getVariable ['LicenseDriver', false];
		  if (_license isEqualTo true) then { lbAdd [1500, ""Fully Licensed Driver""]; };
		  if (_license isEqualTo false) then { lbAdd [1500, ""No Valid License on Record""]; };
		  gm_personLooked = _x;
		  _tickets = gm_personLooked getVariable ['GM_Tickets', []];
		  {
		  	lbAdd [1500, format['Issuer: %1 - Amount: $%2 - Reason: %3', _x select 2, _x select 0, _x select 1]]
		  } forEach _tickets;
		};
		 } forEach allPlayers;

		if !(_found) then {lbAdd [1500, 'No DMV Results Found - Negative Identity!']};

		ctrlSetText [2201, ''];
		lbSetCurSel [1500, LbSize 1500];
	};

	if (((_originText splitString ' ') select 0) == '!logticket') exitWith {

		_lookupArray = (ctrlText 2201 splitString ' ');
		_lookupArray deleteAt 0;
		_nameString = _lookupArray joinString ' ';

		_message = format ['%1 - %2 - Log Added', name player, _nameString];
		lbAdd [1500, _message];

		ctrlSetText [2201, ''];
		lbSetCurSel [1500, LbSize 1500];
	};

	if (((_originText splitString ' ') select 0) == '!changethreat') exitWith {

		_lookupArray = (ctrlText 2201 splitString ' ');
		_lookupArray deleteAt 0;
		_nameString = toLower (_lookupArray joinString ' ');

		if (_nameString isEqualTo 'red') then { missionNameSpace setVariable ['GM_ThreatLevel',2, true]; ['Threat Level is now Red',5,'red'] remoteExecCall ['A3L_Fnc_Msg', -2]; };
		if (_nameString isEqualTo 'green') then { missionNameSpace setVariable ['GM_ThreatLevel',0, true]; ['Threat Level is now Green',5,'green'] remoteExecCall ['A3L_Fnc_Msg', -2]; };
		if (_nameString isEqualTo 'amber') then { missionNameSpace setVariable ['GM_ThreatLevel',1, true]; ['Threat Level is now Amber',5,'yellow'] remoteExecCall ['A3L_Fnc_Msg', -2]; };
		if (_nameString isEqualTo 'martial law') then { missionNameSpace setVariable ['GM_ThreatLevel',3, true]; ['Threat Level is now Martial Law',5,'red'] remoteExecCall ['A3L_Fnc_Msg', -2]; };

		if !(_nameString in ['red', 'green', 'amber', 'martial law']) then { lbAdd [1500, 'Cannot change threat level, Please enter color after command.']} else {
			lbAdd [1500, 'Threat Level Changed.'];
		};

		ctrlSetText [2201, ''];
		lbSetCurSel [1500, LbSize 1500];
	};

	if (((_originText splitString ' ') select 0) == '!addnote') exitWith {

		_lookupArray = (ctrlText 2201 splitString ' ');
		_lookupArray deleteAt 0;
		_nameString = _lookupArray joinString ' ';

		_message = format ['Note Added - Note will be removed upon relog - %1', _nameString];

		lbAdd [1500, _message];
		notesArray pushBackUnique _nameString;
		ctrlSetText [2201, ''];
		lbSetCurSel [1500, LbSize 1500];
	};

	switch (_originText) do {
		case '!clear': {
				lbClear 1500;	
				ctrlSetText [2201, ''];
		};

		case '!notes': {
				lbAdd [1500, 'Loading Notes:'];
				{lbAdd [1500, format ['%1 - %2', (notesArray find _x) + 1, _x]]} forEach notesArray;
				ctrlSetText [2201, ''];
		};


		case '!date': {
				lbAdd [1500, 'System retrieved date'];
				lbAdd [1500, format ['Year: %1', date select 0]];
				lbAdd [1500, format ['Month: %1', date select 1]];
				lbAdd [1500, format ['Day: %1', date select 2]];
				lbSetCurSel [1500, LbSize 1500];
				ctrlSetText [2201, ''];
		};

		case '!help': {
				lbAdd [1500, 'LSPD Computer System V0.1 - EXPERIMENTAL'];
				lbAdd [1500, ''];
				lbAdd [1500, 'Here are commands for the computer system'];
				lbAdd [1500, '!date = returns the current date'];
				lbAdd [1500, '!clear = clear the logs'];
				lbAdd [1500, '!threatlevel = returns the threat level	'];
				lbAdd [1500, '!changethreat = change the state threat level	'];
				lbAdd [1500, '!search = provides infomation about citizens on the database	'];
				lbAdd [1500, '!dmv = provides dmv infomation about citizens	'];
				lbAdd [1500, '!addnote = add a note to your private note log'];
				lbAdd [1500, '!notes = view all of your notes'];
				lbSetCurSel [1500, LbSize 1500];
				ctrlSetText [2201, ''];
		};

		case '!crimes': {
				lbAdd [1500, 'Common Crimes and Times:'];
				_index = lbAdd [1500, '------ Common Crimes ------'];
				lbSetColor [1500, _index, [0.85,0.4,0,1]];
				lbAdd [1500, 'Bank/Fed/Casino: 15 minutes'];
				lbAdd [1500, 'Murder 1st: 15 minutes'];
				lbAdd [1500, 'Murder 2nd: 10 minutes'];
				lbAdd [1500, 'Murder can receive 5 minutes extra if on an LEO'];
				lbAdd [1500, 'Felony Evasion: 10 minutes'];
				lbAdd [1500, 'Assault: 5 minutes'];
				lbAdd [1500, 'Grand Theft Auto: 10 minutes'];
				lbAdd [1500, 'Class 2 Firearm: 15 minutes'];
				lbAdd [1500, 'Class 1 Firearm: 10 minutes'];
				lbAdd [1500, 'Abusing Job Paycheck (Fraud): 10 minutes'];
				lbAdd [1500, 'Obstruction of Justice: 10 minutes'];
				lbAdd [1500, 'Terrorism: Death Penalty'];
				lbAdd [1500, 'Hindering EMS Duties: $10,000'];
				_index = lbAdd [1500, '------ Traffic Laws ------'];
				lbSetColor [1500, _index, [0.85,0.4,0,1]];
				lbAdd [1500, 'In City - 60KMH'];
				lbAdd [1500, 'Two Lane(Out of City/Town) - 120KMH'];
				lbAdd [1500, 'Four Lane(Highways) - 160KMH'];
				lbAdd [1500, 'Speeding: $10,000'];
				lbAdd [1500, 'Reckless Driving: $5,000'];
				lbAdd [1500, 'Blocking Traffic: $7,500'];
				lbAdd [1500, 'Failure to Yield: $10,000'];

				lbSetCurSel [1500, LbSize 1500];
				ctrlSetText [2201, ''];
		};

		case '!threatlevel': {
			switch (missionNameSpace getVariable ['GM_ThreatLevel',0]) do { 
					case 0: {
						lbAdd [1500, 'The threat level is currently Green'];
					}; 
					case 1: {
						lbAdd [1500, 'The threat level is currently Amber'];
					}; 
					case 2: {
						lbAdd [1500, 'The threat level is currently Red'];
					}; 
					case 3: {
						lbAdd [1500, 'The threat level is currently Martial Law'];
					}; 
			};
	
			ctrlSetText [2201, ''];
		};

		default {
			lbAdd [1500, 'Error, Unknown Command, Type !help for more infomation'];
			ctrlSetText [2201, ''];
		};
	};

	lbSetCurSel [1500, LbSize 1500];

;} "];	