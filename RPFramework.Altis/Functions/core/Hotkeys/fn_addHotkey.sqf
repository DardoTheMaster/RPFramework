/*
    File : fn_addHotkey.sqf
    Author: Dardo
    Description:
    Add an hotkey

    Arguments:
        1 - Direct Input Keyboard Code <Int> ( https://community.bistudio.com/wiki/DIK_KeyCodes )
        2 - Statement to execute <Code>
        3 - Shift,Ctrl,alt or nothing <String>
*/
params [["_DIKKey",0,[0]],["_funcName","",["",true]],["_additionalKey","",["shift","ctrl","alt"]]];
private _condition;

//Initial check (Is function whitelisted?)
if (_funcName isEqualTo "") exitWith {};
private _allowedFuncs = (missionConfigFile >> "RPF_Hotkeys" >> "whitelist") call BIS_fnc_getCfgData;
if (typeName _funcName isEqualTo "STRING") then {
    if !(_funcName in _allowedFuncs) exitWith {
            diag_log format ["RPFramework error: Function %1 not whitelisted (Hotkeys module)",_funcName]
        }; //Function not whitelisted
} else {
    private _codeHolder = { _funcName };
    _funcName = str _codeHolder;
};
if not (_additionalKey in ["shift","ctrl","alt"]) then {
    _additionalKey = ""
};

//Manipulate _condition
if (_additionalKey isEqualTo "") then {
    _condition = format["if not((_this select 1) isEqualTo %1) exitWith {};",_DIKKey];
} else {
    private _condKeyHoldIdx = switch (_additionalKey) do
    {
        case "shift" : {2};
        case "ctrl" : {3};
        case "alt" : {4};
    };

     _condition = format["if not(((_this select 1) isEqualTo %1) && _this select %2) exitWith {};",_DIKKey,_condKeyHoldIdx];
};

private _finalStatement = compile(_condition + endl + "_this call " + str(compile(_funcName)));

_return = (findDisplay 46) displayAddEventHandler ["KeyDown",_finalStatement];

_return;
