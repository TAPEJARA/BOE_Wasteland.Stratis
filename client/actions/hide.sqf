// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: salvage.sqf
//	@file Author: Wiking, AgentRev
//	@file Created: 27/07/2014 13:04

// Salvaging of vehicle wrecks

#define GET_ONE_TENTH_PRICE(PRICE) ((ceil (((PRICE) / 10) / 5)) * 5)

// Check if mutex lock is active.
if (mutexScriptInProgress) exitWith
{
	["You are already performing another action.", 5] call mf_notify_client;
};

private ["_vehicle", "_vehClass", "_checks", "_firstCheck", "_time", "_money", "_success"];

_vehicle = cursorTarget;
_vehClass = typeOf _vehicle;

if (isNull _vehicle) exitWith {};

_checks =
{
	private ["_progress", "_object", "_failed", "_text"];
	_progress = _this select 0;
	_object = _this select 1;
	_failed = true;

	switch (true) do
	{
		case (!alive player): { _text = "" };
		case (vehicle player != player): { _text = "Falha na ação! Você não pode fazer isso em um veículo" };
		case (player distance _object > (sizeOf typeOf _object / 3) max 2): { _text = "Falha na ação! Você está muito longe do corpo" };
		case (isNull _object): { _text = "The body no longer exists" };
		case (alive _object || {alive _x} count crew _object > 0): { _text = "Falha na ação! Você não tem permissão para esconder esse corpo" };
		case (doCancelAction): { doCancelAction = false; _text = "Ocultação cancelada" };
		default
		{
			_failed = false;
			_text = format ["Ocultanto o corpo %1%2 completo", floor (_progress * 100), "%"];
		};
	};

	[_failed, _text];
};

_firstCheck = [0, _vehicle] call _checks;

if (_firstCheck select 0) exitWith
{
	[_firstCheck select 1, 5] call mf_notify_client;
};

mutexScriptInProgress = true;

// Salvage time and default money reward according to vehicle type
switch (true) do
{
	case (_vehClass isKindOf "Man"):
	{
		_time = 5;
		_money = 500;
	};
	default // Everything else
	{
		_time = 5;
		_money = 500;
	};
};

mutexScriptInProgress = true;

_success = [_time, format ["AinvPknlMstpSlayW%1Dnon_medic", [player, true] call getMoveWeapon], _checks, [_vehicle]] call a3w_actions_start;

mutexScriptInProgress = false;

if (_success) then
{
	deleteVehicle _vehicle;
	player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _money, true];
	[format ["Você recebeu $ %1 de recompensa por ocultar o corpo", [_money] call fn_numbersText], 5] call mf_notify_client;
};
