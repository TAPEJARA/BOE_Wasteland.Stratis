// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HackLaptop.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_positions", "_camonet", "_laptop", "_obj1", "_obj2", "_obj3", "_obj4", "_obj5", "_obj6", "_obj7", "_vehicleName","_table"];

_setupVars =
{
	_missionType = "Hackers";
	_locationsArray = MissionSpawnMarkers;
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	//delete existing base parts and vehicles at location
	_baseToDelete = nearestObjects [_missionPos, ["All"], 25];
	{ deleteVehicle _x } forEach _baseToDelete; 
	
	_camonet = createVehicle ["CamoNet_INDP_big_F", [_missionPos select 0, _missionPos select 1], [], 0, "CAN COLLIDE"];
	_camonet allowdamage false;
	_camonet setDir random 360;
	_camonet setVariable ["R3F_LOG_disabled", false];

	_missionPos = getPosATL _camonet;

	_table = createVehicle ["Land_WoodenTable_small_F", _missionPos, [], 0, "CAN COLLIDE"];
	_table setPosATL [_missionPos select 0, _missionPos select 1, _missionPos select 2];
	
	_laptop = createVehicle ["Land_Laptop_unfolded_F", _missionPos, [], 0, "CAN COLLIDE"];
	_laptop attachTo [_table,[0,0,0.60]];

	_obj1 = createVehicle ["I_GMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj1 setPosATL [(_missionPos select 0) - 2, (_missionPos select 1) + 2, _missionPos select 2];
	
	_obj2 = createVehicle ["I_GMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj2 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) + 2, _missionPos select 2];
	
	_obj3 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj3 setPosATL [(_missionPos select 0) - 2, (_missionPos select 1) - 2, _missionPos select 2];
	
	_obj4 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj4 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) - 2, _missionPos select 2];
	
	//_obj5 = createVehicle ["I_Mortar_01_F", _missionPos,[], 10,"None"]; 
	//_obj5 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) - 2, _missionPos select 2];
	
	_obj6 = createVehicle ["I_static_AA_F", _missionPos,[], 10,"None"]; 
	_obj6 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) - 2, _missionPos select 2];
	
	_obj7 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj7 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) - 2, _missionPos select 2];
	
	_obj8 = createVehicle ["I_HMG_01_high_F", _missionPos,[], 10,"None"]; 
	_obj8 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) - 2, _missionPos select 2];

	_obj9 = createVehicle ["I_static_AA_F", _missionPos,[], 10,"None"]; 
	_obj9 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) - 2, _missionPos select 2];
	
	//_obj10 = createVehicle ["I_Mortar_01_F", _missionPos,[], 10,"None"]; 
	//_obj10 setPosATL [(_missionPos select 0) + 2, (_missionPos select 1) - 2, _missionPos select 2];		

	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";

	_laptop setVariable [ "Done", false, true ];

	_aiGroup = createGroup CIVILIAN;
	[_aiGroup,_missionPos,24,20] spawn createCustomGroup3;

	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";	
	
	_vehicleName = "Laptop";
	_missionHintText = format ["<t color='%2'>Hackers</t> estão usando um laptop para hackear suas contas bancárias. Hackear o laptop com sucesso vai roubar 1,5 por cento de cada conta bancária dos jogadores on-line! SEJA RÁPIDO PARA DEFENDER SUA CONTA ou ROUBE AS CONTAS BANCÁRIAS DOS OUTROS JOGADORES!", _vehicleName, mainMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec =
{
	AddLaptopHandler = _laptop;
	publicVariable "AddLaptopHandler";
};
_waitUntilCondition = nil;
_waitUntilSuccessCondition = { _laptop getVariable ["Done", false] };
_ignoreAiDeaths = true;

_failedExec =
{
	// Mission failed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_camonet, _obj1, _obj2, _obj3, _obj4, _obj5, _obj6, _obj7, _obj8, _obj9,_obj10, _laptop, _table];
};

_successExec =
{
	// Mission completed
	RemoveLaptopHandler = _laptop;
	publicVariable "RemoveLaptopHandler";
	{ deleteVehicle _x } forEach [_camonet, _laptop, _table];
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_obj1, _obj2, _obj3, _obj4, _obj5, _obj6, _obj7, _obj8, _obj9,_obj10];
	{ _x setVariable ["allowDamage", true, true] } forEach [_obj1, _obj2, _obj3, _obj4, _obj5, _obj6, _obj7, _obj8, _obj9,_obj10];

	_successHintMessage = format ["As contas foram hackeadas. Vá e mate o hacker para obter o seu dinheiro de volta!"];
};

_this call mainMissionProcessor;