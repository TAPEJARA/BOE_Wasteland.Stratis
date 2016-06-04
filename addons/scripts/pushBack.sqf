// PUSH AND KILL SCRIPT BY FEINT
// VERSION 2.0
// © 2013 ALL RIGHTS RESERVED
// TO MODIFY OR COPY FROM THIS FILE - CONTACT JON HILLENBRAND THROUGH HIS WEBSITE - WWW.JONHILLENBRAND.COM


private ["_caller","_thingToPush","_dir","_speed","_vel","_thingToPushType","_nameOfThingToPush","_textString","_targetDistance","_dist","_relativePosModel","_minSetBoxLimits","_maxSetBoxLimits","_minX","_minY","_minZ","_maxX","_maxY","_maxZ","_xRPM","_yRPM","_zRPM","_thingToPushLimits","_posCaller","_headPos","_headDir","_cantPushPeople","_cantKillPeople"];
_caller = player;
_cantKillPeople = _caller getVariable "cantKillPeople";
_cantPushPeople = _caller getVariable "cantPushPeople";

if !(isNil{_caller getVariable "pushScriptRunning"}) then
{
         // ONLY RUN THE SCRIPT ONCE EVERY 1 SECOND
}
else
{
         _caller setVariable ["pushScriptRunning",1,false];
         _thingToPush = cursorTarget;
         // _distanceFromTarget = _caller distance _thingToPush;
         _thingToPushType = typeOf _thingToPush;
         _nameOfThingToPush = (getText (configFile >> "cfgVehicles" >> (_thingToPushType) >> "displayname"));
         // _weightOfThing = (getText (configFile >> "cfgVehicles" >> (_thingToPushType)  >> "weight"));
         
         if (!(isNull _thingToPush) and ((_thingToPush isKindOf "AllVehicles") or (_thingToPush isKindOf "Thing") or (_thingToPush isKindOf "Object") ))
         then
         {
                  
                  _targetDistance = _caller distance _thingToPush;
                  
                  // ***************************** RELATIVE MODEL POSITION CODE****************************************
                  
                  _thingToPushLimits = boundingBox _thingToPush;
                  
                  _posCaller = getPos _caller;
                  _dist = 2;
                  _dir = getDir _caller;
                  
                  _posCaller = [(_posCaller select 0) + _dist*sin _dir, (_posCaller select 1) + _dist*cos _dir, _posCaller select 2];
                  
                  _relativePosModel = _thingToPush worldToModel _posCaller;
                  
                  
                  // hint format ["Position of _mineHead = %1\nSpawn distance from _mineHead = %2\nPlayer direction = %3\nModel offset = %4\nNearest Ship = %5\nShip Distance = %6\nBounding Box = %7",_pos,_dist,_dir,_relativePosModel,_nearestVehicle,_vehicleDistance,_boxLimits];
                  
                  // boundingBox returns the following [[minX, minY, minZ], [maxX, maxY, maxZ]]
                  
                  // boundingBoxReal returns the following [[minX, minZ, minY], [maxX, maxZ, maxY]]
                  
                  _minSetBoxLimits = _thingToPushLimits select 0;
                  _maxSetBoxLimits = _thingToPushLimits select 1;
                  _minX = _minSetBoxLimits select 0;
                  _minY = _minSetBoxLimits select 1;
                  _minZ = _minSetBoxLimits select 2;
                  _maxX = _maxSetBoxLimits select 0;
                  _maxY = _maxSetBoxLimits select 1;
                  _maxZ = _maxSetBoxLimits select 2;
                  
                  
                  // RELATIVE OFFSET POSITION OF _mineHead FROM NEAREST VEHICLE IN MODEL SPACE
                  _xRPM = _relativePosModel select 0;
                  _yRPM = _relativePosModel select 1;
                  _zRPM = _relativePosModel select 2;
                  
                  
                  // hint format ["minX: %1 \nminY: %2 \nminZ: %3 \nmaxX: %4 \nmaxY: %5\nmaxZ: %6 \n_mineHead: %7 , %8 , %9 \n_mineHead: %10",_minX,_minY,_minZ,_maxX,_maxY,_maxZ,_xRPM,_yRPM,_zRPM,_relativePosModel];
                  
                  if (((_xRPM > _minX) and (_xRPM < _maxX) and (_yRPM > _minY) and (_yRPM < _maxY) and (_zRPM > _minZ) and (_zRPM < _maxZ)) or (_targetDistance <= 3.5)) then
                  
                  {

                           // TO KILL A PERSON
                           if ((_thingToPush isKindOf "man") and (isNil{_cantKillPeople}) and (alive _thingToPush) and !(side _thingToPush == sideLogic)) then 
                           {
                                    
                                     _textString = format ["Executando %1",_nameOfThingToPush];
                                    6000 cutText [_textString,"PLAIN DOWN",0];
                                    
                                    // MOVE FROM WHATEVER TO KNEELING AND FIRING LEFT
                                    _caller switchMove "acts_CrouchingFiringLeftRifle02";
                                    sleep 1;
                                    _soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
									_soundToPlay = _soundPath + "sounds\stab_and_pull.ogg";
									playSound3D [_soundToPlay,player,false,getPosASL _thingToPush,1,1,0];
									[100] call BIS_fnc_bloodEffect;
                                    
                                    
                                    _headPos=screenToWorld [0.5,0.5];
                                    
                                    _headDir=[
                                             (_headPos select 0)-(getPos _caller select 0),
                                             (_headPos select 1)-(getPos _caller select 1),
                                             (_headPos select 2)-(getPos _caller select 2)
                                    ];
      
                                    _dir = getDir _caller - 90;
                     
                                    _speed = 8;
                                    
                                    _vel = velocity _thingToPush;
   
                                    _thingToPush setVelocity
                                    [
                                             (_vel select 0)+((sin _dir)*_speed),
                                             (_vel select 1)+((cos _dir)*_speed),
                                             0
                                    ];
									
									GLB_Notice= "humiliation";
									publicvariable "GLB_Notice";
									playSound GLB_Notice;
									
									CHT_Notice= "=======================================";
									publicvariable "CHT_Notice";
									systemChat CHT_Notice;
									
									CHT_Notice= format ["%1 levou FACADA do %2", name _thingToPush, name _caller];
									publicvariable "CHT_Notice";
									systemChat CHT_Notice;
									 
					
                                    _thingToPush setDammage 1;
									
																		
                                    sleep 1.5;
                                    
                                    // MOVE FROM KNEELING TO STANDING
                                    _caller switchMove "AmovPknlMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon";									

									// contar Score
									_victimSide = side group _thingToPush;
									_killerSide = side group _caller;
									_indyIndyKill = ((_victimSide == _killerSide) && !(_victimSide in [BLUFOR,OPFOR]) && (group _thingToPush != group _caller));
									_enemyKill = (_killerSide getFriend _victimSide < 0.6 || _indyIndyKill);
								
									_scoreColumn = if (_enemyKill) then { "playerKills" } else { "teamKills" };
									_scoreValue = 1;
								
									[_caller, _scoreColumn, _scoreValue] call fn_addScore;
                                    
                           } else
                           {
                                    if ((_thingToPush isKindOf "man") and !(isNil{_cantPushPeople})) then 
                                    {
                                             _textString = format ["Não pode empurrar %1",_nameOfThingToPush];
                                             6000 cutText [_textString,"PLAIN DOWN",0];
                                    } else
                                    {
                                             _textString = format ["Empurrando %1",_nameOfThingToPush];
                                             6000 cutText [_textString,"PLAIN DOWN",0];
                                             
                                             _headPos=screenToWorld [0.5,0.5];
                                             
                                             _headDir=[
                                                      (_headPos select 0)-(getPos _caller select 0),
                                                      (_headPos select 1)-(getPos _caller select 1),
                                                      (_headPos select 2)-(getPos _caller select 2)
                                             ];
                                             
                                             _dir = (_headDir select 0) atan2 (_headDir select 1);
                                             
                                             //_headAngle = (_headDir select 2) atan2 (_headDir select 2);
                                             //if(_headAngle < 0) then {_headAngle = _headAngle + 360};
                                             
                                             // _thingToPush setDir _dir;
                                             
                                             _speed = 6;
                                             
                                             _vel = velocity _thingToPush;
                                             
                                             
                                             _thingToPush setVelocity
                                             [
                                                      (_vel select 0)+((sin _dir)*_speed),
                                                      (_vel select 1)+((cos _dir)*_speed),
                                                      1
                                             ];
                                    };
                                    
                           };
                           
                           
                           
                           // IF OBJECT IS A KIND OF BOAT, THEN SLOW IT DOWN OR IT WILL FLOAT AWAY FOREVER
                           
                           if (_thingToPush isKindOf "Ship") then
                           {
                                    //hint "vehicle is kind of ship...slowing down";
                                    sleep 1;
                                    _thingToPush setVelocity [0,0,0];
                           };
                           
                  } else
                  {
                           _textString = format ["Aproxime-se um pouco mais empurrar %1",_nameOfThingToPush,_targetDistance];
                           // hint format ["weight: %1",_weightOfThing];
                           6000 cutText [_textString,"PLAIN DOWN",0];
                  };
                  
                  
                  // *****************************RELATIVE MODEL POSITION CODE END************************************
                  
         }
         else
         {
                  _textString = format ["Não pode empurrar %1",_nameOfThingToPush];
                  // hint format ["weight: %1",_weightOfThing];
                  6000 cutText [_textString,"PLAIN DOWN",0];
				  
         };
         sleep 1;
         _caller setVariable ["pushScriptRunning",nil,false];
};

