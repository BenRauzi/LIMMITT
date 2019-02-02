private["_respondmode","_message"];

_respondmode = [_this,0,0,[0]] call BIS_fnc_param;

if (_respondmode==1) then {
    _message = [_this,1,"",[""]] call BIS_fnc_param;
    hint format ["%1",_message];
};

if (_respondmode==2 && alive player) then {

    player addEventHandler ["handleDamage", {false}];
    hint "Welcome to the Paintball Arena! The upcoming game is 5 minutes.";
    meinePos = getPos player;
    [] call life_fnc_saveGear;
    player enableFatigue false;
    meingear = life_gear;
    life_gear set [16,[]];
    RemoveAllWeapons player;
    {player removeMagazine _x;} foreach (magazines player);
    removeUniform player;
    removeVest player;
    removeBackpack player;
    removeGoggles player;
    removeHeadGear player;
    life_paintball = true;
    player forceAddUniform "U_I_Protagonist_VR";
    player addWeaponGlobal "RH_gsh18";
    player addHeadgear "H_PilotHelmetFighter_B";
    player addGoggles "A3L_PaintBallHelmet_yellow";
    player addBackpack "kaelmario";
    player addMagazines ["RH_18Rnd_9x19_gsh" , 25];
    {
        player unassignItem _x;
        player removeItem _x;
    } foreach (assignedItems player);
    _wohin = round(random (count pb_positionen));
    if (_wohin==count pb_positionen) then {_wohin=_wohin-1;};
    _position = pb_positionen select _wohin;

    if (vehicle player != player) then {
        _vehicle = vehicle player;
        _vehicle setVelocity [0, 0, 0];
        hint "Stopping vehicle and ejecting for paintball.";
        player action ["Eject", vehicle player];
    };
    player switchmove "";
    detach player;
    uiSleep 3;
    player switchmove "";
    detach player;
    player setPos _position;
    tode = 0;
    player addEventHandler ["Hit", {
        _wohin = round(random (count pb_positionen));
        if (_wohin==count pb_positionen) then {_wohin=_wohin-1;};
        player switchmove "";
        detach player;
        _position = pb_positionen select _wohin;
        player setPos _position;
        tode = tode+1;
        _maxGeld = 15000;
        _grenzeAusz = 30;
        _geldTod = _maxGeld/_grenzeAusz;
        _punkte = _grenzeAusz-tode;
        hintSilent parseText format ["<t align='center' color='#00E500' size='1.3'>Statistics</t><br/><br/><t align='left'>Deaths</t><t align='right'>%1</t><br/><t align='left'>Kills</t><t align='right'>%2</t>",tode,_punkte];
    }];
};

if (_respondmode==3) then {
    life_gear = meingear;
    [] spawn life_fnc_Loadgear;
    player switchmove "";
    detach player;
    uiSleep 0.05;
    life_paintball = false;
    player setPos meinePos;
    player allowDamage true;
    player removeAllEventHandlers "handleDamage";
    player removeAllEventHandlers "Hit";
    player addEventHandler["handleDamage",{_this call life_fnc_handleDamage;}];
    player enableFatigue true;

    _grenzeAusz = 30;
    if (tode>=_grenzeAusz) then {
        hint "The game was stopped. Unfortunately, you have not earned enough points to receive a cash prize!";
    } else {
        _maxGeld = 15000;
        _geldTod = _maxGeld/_grenzeAusz;
        _punkte = _grenzeAusz-tode;
        _geldMin= _geldTod*tode;
        _gesamt = _maxGeld-_geldMin;
        _gesamt = _gesamt + 500;
        LIMMITTCASH = LIMMITTCASH + _gesamt;
        hint format ["You earned ($%2) !",_punkte,_gesamt];
    };
};

if (_respondmode==4) then {playMusic "LeadTrack06_F";};

if (_respondmode==5) then {
    _message = [_this,1,"",[""]] call BIS_fnc_param;
    hint format ["%1",_message];
    LIMMITTCASH = LIMMITTCASH - 5000;
};