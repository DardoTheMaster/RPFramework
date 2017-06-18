/*
Author: Kerkkoh
First Edit: 6.9.2016
*/
params ["_ct"];
_recursiveFind = {
    params["_array","_toFind"];
    {
        scopeName "searchLoop";
        private _idx = _x find _toFind;
        if (_idx != -1) then {
            _idx breakOut "searchLoop"
        }
    } forEach _array;
    -1;
};

private _idx = [RPF_Cars,_ct] call _recursiveFind;
if (_idx isEqualTo -1) exitWith {};
private _vehID = RPF_Cars select _idx select 1;
RPF_Cars deleteAt _idx;

[typeOf _ct, [_ct]call Client_fnc_vehicleHitGet, player, false, true, _vehID] remoteExecCall ["Server_fnc_handleVehicle", 2];

deleteVehicle _ct;