createDialog "SettingsDialog";
call client_getInfo;

waitUntil { !dialog };

terminate VGPlyrClientstats;
