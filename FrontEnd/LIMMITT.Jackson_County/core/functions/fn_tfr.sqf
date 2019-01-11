#define __GETC__(var) (call var)

[] spawn
{
while {true} do {
                _ChannelName = call TFAR_fnc_getTeamSpeakChannelName;
                _ServerName = call TFAR_fnc_getTeamSpeakServerName;
                _isTeamSpeakPluginEnabled = call TFAR_fnc_isTeamSpeakPluginEnabled;

                if !(_ChannelName isEqualTo "In-game") then {
                    if !(__GETC__(life_adminlevel) >= 3) then {
                        cutText["Wrong Channel/Server/TFR Plugin Disabled. Ensure you are on the correct TS: ts.limmitt-network.co.uk","BLACK IN"];
                    };
                } else {
                    cutText ["","PLAIN"];
                };

                _lockedFreq = ["33.1", "33.2", "33.3", "33.4", "33.5", "33.6", "33.7", "33.8", "33.9"];

                if(side player isEqualTo civilian) then {
                        if (call TFAR_fnc_haveSWRadio) then {
                            _frequency = (call TFAR_fnc_ActiveSwRadio) call TFAR_fnc_getSwFrequency;
                            if( _frequency in _lockedFreq ) then {
                                hintSilent "33.1 - 33.9 are blocked frequencies.";
                                [(call TFAR_fnc_activeSwRadio), 1, "40"] call TFAR_fnc_SetChannelFrequency;
                                 [(call TFAR_fnc_activeSwRadio), 2, "40"] call TFAR_fnc_SetChannelFrequency;
                                  [(call TFAR_fnc_activeSwRadio), 3, "40"] call TFAR_fnc_SetChannelFrequency;
                                   [(call TFAR_fnc_activeSwRadio), 4, "40"] call TFAR_fnc_SetChannelFrequency;
                                    [(call TFAR_fnc_activeSwRadio), 5, "40"] call TFAR_fnc_SetChannelFrequency;
                                     [(call TFAR_fnc_activeSwRadio), 6, "40"] call TFAR_fnc_SetChannelFrequency;
                                      [(call TFAR_fnc_activeSwRadio), 7, "40"] call TFAR_fnc_SetChannelFrequency;
                                       [(call TFAR_fnc_activeSwRadio), 9, "40"] call TFAR_fnc_SetChannelFrequency;
                                        [(call TFAR_fnc_activeSwRadio), 8, "40"] call TFAR_fnc_SetChannelFrequency;

                            };
                        };

                        if (call TFAR_fnc_haveLRRadio) then {

                            _lfrequency = (call TFAR_fnc_ActiveLrRadio) call TFAR_fnc_getLrFrequency;
                            if( _lfrequency in _lockedFreq ) then {
                                hintSilent "33.1 - 33.9 are blocked frequencies.";
                                [(call TFAR_fnc_activeLrRadio), 1, "40"] call TFAR_fnc_SetChannelFrequency;
                                [(call TFAR_fnc_activeLrRadio), 2, "40"] call TFAR_fnc_SetChannelFrequency;
                                [(call TFAR_fnc_activeLrRadio), 3, "40"] call TFAR_fnc_SetChannelFrequency;
                                [(call TFAR_fnc_activeLrRadio), 4, "40"] call TFAR_fnc_SetChannelFrequency;
                                [(call TFAR_fnc_activeLrRadio), 5, "40"] call TFAR_fnc_SetChannelFrequency;
                                [(call TFAR_fnc_activeLrRadio), 6, "40"] call TFAR_fnc_SetChannelFrequency;
                                [(call TFAR_fnc_activeLrRadio), 7, "40"] call TFAR_fnc_SetChannelFrequency;
                                [(call TFAR_fnc_activeLrRadio), 8, "40"] call TFAR_fnc_SetChannelFrequency;
                                [(call TFAR_fnc_activeLrRadio), 9, "40"] call TFAR_fnc_SetChannelFrequency;
                            };
                        };
                };
      uiSleep 2;
};
};