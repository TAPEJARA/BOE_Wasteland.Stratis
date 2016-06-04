// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#include "genstoreDefines.sqf"

#define GenStoreButton_textSize (0.04 * TEXT_SCALE)

class genstored
{
	idd = genstore_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[[0], populateGeneralStore] execFSM 'call.fsm'";

	class ControlsBackground
	{
		#define GenStoreMainBG_W (0.7333 * SZ_SCALE)
		#define GenStoreMainBG_H (0.65 * SZ_SCALE)
		#define GenStoreMainBG_X CENTER(1, GenStoreMainBG_W)
		#define GenStoreMainBG_Y CENTER(1, GenStoreMainBG_H)

		class MainBackground: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.6};
			moving = true;

			x = GenStoreMainBG_X;
			y = GenStoreMainBG_Y;
			w = GenStoreMainBG_W;
			h = GenStoreMainBG_H;
		};

		class TopBar: IGUIBack
		{
			idc = -1;
			colorBackground[] = {A3W_UICOLOR_R, A3W_UICOLOR_G, A3W_UICOLOR_B, A3W_UIFILL};

			#define GenStoreTopBar_H (0.05 * SZ_SCALE)

			x = GenStoreMainBG_X;
			y = GenStoreMainBG_Y;
			w = GenStoreMainBG_W;
			h = GenStoreTopBar_H;
		};

		class DialogTitleText: w_RscTextCenter
		{
			idc = -1;
			text = "General Store";
			sizeEx = 0.06 * TEXT_SCALE;

			x = GenStoreMainBG_X;
			y = GenStoreMainBG_Y;
			w = GenStoreMainBG_W;
			h = GenStoreTopBar_H;
		};

		/*
		class PlayerMoneyText: w_RscText
		{
			idc = genstore_money;
			text = "Cash:";
			sizeEx = 0.04 * TEXT_SCALE;

			x = GenStoreMainBG_X + (0.6033 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.005 * SZ_SCALE);
			w = 0.1126 * SZ_SCALE;
			h = 0.0448 * SZ_SCALE;
		};
		*/

		class ItemSelectedPrice: w_RscStructuredTextLeft
		{
			idc = genstore_item_TEXT;
			size = 0.04 * TEXT_SCALE;

			x = GenStoreMainBG_X + (0.15 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.514 * SZ_SCALE);
			w = 0.119 * SZ_SCALE;
			h = 0.0689 * SZ_SCALE;
		};

		class SellSelectedPrice: w_RscStructuredTextLeft
		{
			idc = genstore_sell_TEXT;
			size = 0.04 * TEXT_SCALE;

			x = GenStoreMainBG_X + (0.439 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.514 * SZ_SCALE);
			w = 0.119 * SZ_SCALE;
			h = 0.0689 * SZ_SCALE;
		};
	};

	class Controls
	{
		class SelectionList: w_RscList
		{
			idc = genstore_item_list;
			onLBSelChanged = "[] execVM 'client\systems\generalStore\itemInfo.sqf'";
			sizeEx = 0.04 * TEXT_SCALE;
			rowHeight = 0.05 * TEXT_SCALE;

			x = GenStoreMainBG_X + (0.1533 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.3382 * SZ_SCALE;
		};

		class ItemDescription: w_RscStructuredTextLeft
		{
			idc = genstore_item_desc;
			size = 0.04 * TEXT_SCALE;
			colorBackground[] = {0, 0, 0, 0.3};

			x = GenStoreMainBG_X + (0.1533 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.417 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.088 * SZ_SCALE;
		};

		class SellList: w_RscList
		{
			idc = genstore_sell_list;
			onLBSelChanged = "[] execVM 'client\systems\generalStore\sellInfo.sqf'";
			sizeEx = 0.04 * TEXT_SCALE;
			rowHeight = 0.05 * TEXT_SCALE;

			x = GenStoreMainBG_X + (0.4433 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.4222 * SZ_SCALE;
		};

		class BuyItem: w_RscButton
		{
			idc = -1;
			action = "[0] execVM 'client\systems\generalStore\buyItems.sqf'";
			text = "Comprar";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.334 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.507 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellItem: w_RscButton
		{
			idc = genstore_sell;
			action = "[0] execVM 'client\systems\generalStore\sellItems.sqf'";
			text = "Vender";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.6233 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.507 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton0: w_RscButton
		{
			idc = -1;
			action = "[0] call populateGeneralStore";
			text = "Capacetes";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton1: w_RscButton
		{
			idc = -1;
			action = "[1] call populateGeneralStore";
			text = "Uniformes";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.125 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton2: w_RscButton
		{
			idc = -1;
			action = "[2] call populateGeneralStore";
			text = "Coletes";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.175 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton3: w_RscButton
		{
			idc = -1;
			action = "[3] call populateGeneralStore";
			text = "Mochilas";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.225 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton4: w_RscButton
		{
			idc = -1;
			action = "[4] call populateGeneralStore";
			text = "Itens";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.275 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton5: w_RscButton
		{
			idc = -1;
			action = "[5] call populateGeneralStore";
			text = "Suprimentos";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.325 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton6: w_RscButton
		{
			idc = -1;
			action = "[6] call populateGeneralStore";
			text = "Objetos";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.375 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};
		
		class StoreButton7: w_RscButton
		{
			idc = -1;
			action = "closeDialog 0;[] execVM 'addons\UniformPainter\UniformPainter_Menu.sqf'";
			text = "Pintar Uniforme";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.425 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellWeapon: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellWeapon.sqf'";
			text = "Vender Arma";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.23 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellUniform: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellUniform.sqf'";
			text = "Vender Uniforme";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + ((0.604 - 0.25) * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellVest: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellVest.sqf'";
			text = "Vender Colete";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.478 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellBackpack: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellBackpack.sqf'";
			text = "Vender Mochila";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.602 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class CancelButton: w_RscButton
		{
			idc = -1;
			action = "closeDialog 0";
			text = "Cancelar";
			sizeEx = GenStoreButton_textSize;

			x = GenStoreMainBG_X + (0.0167 * SZ_SCALE);
			y = GenStoreMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};
	};
};

