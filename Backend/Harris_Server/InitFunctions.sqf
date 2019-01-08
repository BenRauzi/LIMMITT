/*
  Author: Ben Harris
  Description: Initialises All Server-Side Functions, Meaning they can be saved server-side but accessed by the client
*/

TwitterDir = "\Harris_Server\Functions\Twitter\";
Twitter_Functions = 
[
  ["fn_addMessage", "Harris_addMessage"],
  ["fn_updateTwitter", "Harris_updateTwitter"],
  ["fn_openTwitterType", "Harris_openTwitterType"],
  ["fn_sendMessage", "Harris_sendMessage"]
];


functionArrays = 
  "[
    ['Twitter_Functions','TwitterDir']
  ]";

  functionArrays2 = call compile functionArrays;

  {
    Harris_Compile = _x select 0;
    Harris_File = call compile Harris_Compile;
    Harris_Directory = _x select 1;
    Harris_Dir = call compile Harris_Directory;

        {
      Harris_File2 = _x;
      Harris_File3 = Harris_File2 select 0;
      Harris_File4 = Harris_File2 select 1;
      Harris_Final = Harris_Dir + Harris_File3 + ".sqf";
      systemChat format ["Loading Function, Please Wait %1", Harris_Final];
      diag_log format ["Loading Function, Please Wait %1", Harris_Final];
      [] call compile preprocessFileLineNumbers Harris_Final;
      publicVariable Harris_File4;
      systemChat "Function Loaded";
      diag_log "Function Loaded";
    } foreach Harris_File;

  } foreach functionArrays2