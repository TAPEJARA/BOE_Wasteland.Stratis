//******************************//
//** RAVEN B CAMERA CONTROLS **//
//****************************//

private ["_handled","_caller","_key","_key11"];

_handled = false;
_caller = player;
_key = _this select 1;
_key11 = actionKeys "User11";

if (_key in _key11) then{_caller execVM "addons\scripts\pushBack.sqf";};
_handled;

