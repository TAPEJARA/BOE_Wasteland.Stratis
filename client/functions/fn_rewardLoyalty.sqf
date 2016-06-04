// @file Name: fn_rewardLoyalty.sqf
// @file Author: JoSchaap
// @file description: Rewards players for their loyalty (continued play without reconnecting) the reward multiplies!


multiPlyWith = 1;
_i=0;

while {_i < 3} do
{
	if ( _i == 1) then 
	{
		_reward = (2000 * multiPlyWith);
		player setVariable ["cmoney", ((player getVariable ["cmoney", 0]) + _reward), true];
		_msg = parseText format ["<t align='center' color='#FFFFFF' shadow='2' size='1.75'>Gift!</t><br/><t align='center' color='#17FF41'>------------------------------</t><br/><t align='center' color='#FFFFFF'>%1 Obrigado por jogar em nosso servidor! Quanto mais tempo jogar, mais vai ganhar: </t><t align='center' color='#40FF00'>%2$</t>", name player, _reward];
		hint _msg;
		multiPlyWith = multiPlyWith + 1;
		_i = 0;
	};
	sleep 3600;
	_i = _i + 1;
};