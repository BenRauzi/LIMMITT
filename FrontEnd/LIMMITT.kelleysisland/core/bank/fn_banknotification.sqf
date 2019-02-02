"bankNotification" cutRsc ["gm_pager", "PLAIN"];

disableSerializaiton;
_display = (findDisplay 2800123);
_pager = (_display displayCtrl 1200);

playSound "pager_sound";

sleep 5;

_layer = "bankNotification" cutFadeOut 2;

playSound "pager_sound"