//Client Function for Airdrop Assistance (not really a function, as it is called via ExecVM from command menu)
//This takes values from command menu, and some passed variables, and interacts with client and sends commands to server
//Author: Apoc
//Credits: Some methods taken from Cre4mpie's airdrop scripts, props for the idea!
#define APOC_coolDownTimer (["APOC_coolDownTimer", 900] call getPublicVar)

scriptName "APOC_cli_startAirdrop";
private ["_type","_selection","_player","_coolDownTimer"]; //Variables coming from command menu
_type 				= _this select 0;
_selectionNumber 	= _this select 1;
_player 			= _this select 2;



_selectionArray = [];
switch (_type) do {
	case "vehicle": {_selectionArray = APOC_AA_VehOptions};
	case "supply": 	{_selectionArray = APOC_AA_SupOptions};
	case "picnic":	{_selectionArray = APOC_AA_SupOptions};
	case "base":	{_selectionArray = APOC_AA_SupOptions};
	case "base1":	{_selectionArray = APOC_AA_SupOptions};
	case "base2":	{_selectionArray = APOC_AA_SupOptions};
	default 		{_selectionArray = APOC_AA_VehOptions; diag_log "AAA - Default Array Selected - Something broke";};
};
_selectionName =(_selectionArray select _selectionNumber) select 0;
_price =(_selectionArray select _selectionNumber) select 2;
_coolDownTimer =(_selectionArray select _selectionNumber)select 4;

/////////////  Cooldown Timer ////////////////////////
if (!isNil "APOC_AA_lastUsedTime") then
{
if (isNil {_coolDownTimer}) then
{
	_coolDownTimer = APOC_coolDownTimer;
};

_timeRemainingReuse = _coolDownTimer - (diag_tickTime - APOC_AA_lastUsedTime); //time is still in s
if ((_timeRemainingReuse) > 0) then 
	{
		hint format["Negativo. DoMPSA offline. on-line em: %1", _timeRemainingReuse call fn_formatTimer];
		playSound "FD_CP_Not_Clear_F";
		player groupChat format ["Negativo. DoMPSA offline. on-line em %1 minutos",_timeRemainingReuse call fn_formatTimer];
		breakOut "APOC_cli_startAirdrop";
	};
};
////////////////////////////////////////////////////////

_playerMoney = _player getVariable ["bmoney", 0];
if (_price > _playerMoney) exitWith
	{
		hint format["Você não tem dinheiro suficiente no banco para solicitar DoMPSA!"];
		playSound "FD_CP_Not_Clear_F";
	};
			
_confirmMsg = format ["DoMPSA irá deduzir $%1 de sua conta bancária no momento da entrega<br/>",_price call fn_numbersText];
_confirmMsg = _confirmMsg + format ["<br/><t font='EtelkaMonospaceProBold'>1</t> x %1",_selectionName];
		
	// Display confirm message
	if ([parseText _confirmMsg, "Confirm", "DROP!", true] call BIS_fnc_guiMessage) then
	{
	_heliDirection = random 360;
	[[_type,_selectionNumber,_player,_heliDirection],"APOC_srv_startAirdrop",false,false,false] call BIS_fnc_MP;
	APOC_AA_lastUsedTime = diag_tickTime;
	playSound3D ["a3\sounds_f\sfx\radio\ambient_radio17.wss",player,false,getPosASL player,1,1,25];
	sleep 1;
	hint format ["DoMPSA lançando um %2, Vetor %1, 40s fora.",ceil _heliDirection,_selectionName];
	player groupChat format ["DoMPSA lançando um %2, Vetor %1, 40s fora.",ceil _heliDirection,_selectionName];
	sleep 20;
	hint format ["DoMPSA lançando um %2, Vetor %1, 20s fora.",ceil _heliDirection,_selectionName];
	player groupChat format ["DoMPSA lançando um %2, Vetor %1, 20s fora.",ceil _heliDirection,_selectionName];
	};
	