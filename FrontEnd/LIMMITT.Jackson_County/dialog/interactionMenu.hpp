class radialMenu 
{
	idd = 1723;
	class controls
	{	
		// Defines
			class Harris_radial_button: RscButton {
				idc = -1;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				colorBackgroundActive[] = {0,0,0,0};
				colorBackgroundDisabled[] = {0,0,0,0};
				colorDisabled[] = {0,0,0,0};
				colorFocused[] = {0,0,0,0};
	  			colorShadow[] = {0,0,0,0};
	   			colorBorder[] = {0,0,0,0};
			};

			class Harris_radial: RscPicture {
				idc = -1;
				x = 0 * safezoneW + safezoneX;
				y = -0.05 * safezoneH + safezoneY;
				w = 1 * safezoneW;
				h = 1 * safezoneH;
				colorText[] = {0, 0, 0, 0.66};
				colorBackground[] = {0, 0, 0, 0.66};
			};
		// Centre
			class radial_centre: Harris_radial
			{
				idc = 1999;
				text = "\Harris_Client\radial\radial_centre.paa";
			};

		// Inner 1 (Top Centre)
			class radial_centretop_i: Harris_radial
			{
				idc = 1110;
				text = "\Harris_Client\radial\radial_centretop_i.paa";
			};
			class Icon_1_i: RscPicture
			{
				idc = 1111;
				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.484531 * safezoneW + safezoneX;
				y = 0.347 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class Text_1_i: RscText
			{
				idc = 1112;
				text = "Handcuff";
				style = ST_CENTER;
				x = 0.476531 * safezoneW + safezoneX;
				y = 0.36 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};

			class Button_1_i: Harris_radial_button
			{
				idc = 1113;
				x = 0.463906 * safezoneW + safezoneX;
				y = 0.346 * safezoneH + safezoneY;
				w = 0.06 * safezoneW;
				h = 0.09 * safezoneH;
				action = "[0] call Harris_interactionExecute;";
			};
		// Outer 1 (Top Centre)
			class radial_outer_1: Harris_radial
			{
				idc = 1210;
				text = "\Harris_Client\radial\radial_centretop_o.paa";
			};

			
			class Icon_1_o_1: RscPicture
			{
				idc = 1211;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.422656 * safezoneW + safezoneX;
				y = 0.322 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_1_o_2: RscPicture
			{
				idc = 1212;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.463906 * safezoneW + safezoneX;
				y = 0.276 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_1_o_3: RscPicture
			{
				idc = 1213;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.510312 * safezoneW + safezoneX;
				y = 0.276 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_1_o_4: RscPicture
			{
				idc = 1214;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.551562 * safezoneW + safezoneX;
				y = 0.302 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class Text_1_o_1: RscText
			{
				idc = 1215;

				text = "Handcuff";
				style = ST_CENTRE;
				x = 0.414656 * safezoneW + safezoneX;
				y = 0.305 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			
			class Text_1_o_2: RscText
			{
				idc = 1216;

				text = "Handcuff";
				style = ST_CENTRE;
				x = 0.455906 * safezoneW + safezoneX;
				y = 0.279 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_1_o_3: RscText
			{
				idc = 1217;

				text = "Handcuff";
				style = ST_CENTER;
				x = 0.508312 * safezoneW + safezoneX;
				y = 0.279 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_1_o_4: RscText
			{
				idc = 1218;

				text = "Handcuff";
				style = ST_CENTER;
				x = 0.543562 * safezoneW + safezoneX;
				y = 0.305 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};


			class Button_1_o_1: Harris_radial_button
			{
				idc = 1219;

				x = 0.4175 * safezoneW + safezoneX;
				y = 0.302 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.055 * safezoneH;
				action = "[1,1] call Harris_interactionExecute;";
			};
			
			class Button_1_o_2: Harris_radial_button
			{
				idc = 1220;

				x = 0.45875 * safezoneW + safezoneX;
				y = 0.28 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.055 * safezoneH;
				action = "[2,1] call Harris_interactionExecute;";
			};
			class Button_1_o_3: Harris_radial_button
			{
				idc = 1221;

				x = 0.507291 * safezoneW + safezoneX;
				y = 0.27963 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.055 * safezoneH;
				action = "[3,1] call Harris_interactionExecute;";
			};
			class Button_1_o_4: Harris_radial_button
			{
				idc = 1222;

				x = 0.545312 * safezoneW + safezoneX;
				y = 0.301851 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.055 * safezoneH;
				action = "[4,1] call Harris_interactionExecute;";
			};

		// Inner 2 (Top Right)

			class radial_topright_i: Harris_radial
			{
				idc = 2110;
				text = "\Harris_Client\radial\radial_topright_i.paa";
			};


			class Icon_2_i: RscPicture
			{
				idc = 2111;
				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.530937 * safezoneW + safezoneX;
				y = 0.39 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class Text_2_i: RscText
			{
				idc = 2112;
				text = "Handcuff";

				style = ST_CENTER;
				x = 0.522937 * safezoneW + safezoneX;
				y = 0.393 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;


			};

			class Button_2_i: Harris_radial_button
			{
				idc = 2113;
				x = 0.520625 * safezoneW + safezoneX;
				y = 0.368 * safezoneH + safezoneY;
				w = 0.06 * safezoneW;
				h = 0.1 * safezoneH;
				action = "[1] call Harris_interactionExecute;";
			};
		// Outer 2 (Top Right)
			class radial_outer_2: Harris_radial
			{
				idc = 2210;

				text = "\Harris_Client\radial\radial_topright_o.paa";
			};
			class Icon_2_o_1: RscPicture
			{
				idc = 2211;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.505156 * safezoneW + safezoneX;
				y = 0.274556 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_2_o_2: RscPicture
			{
				idc = 2212;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.554687 * safezoneW + safezoneX;
				y = 0.30374 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_2_o_3: RscPicture
			{
				idc = 2213;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.5825 * safezoneW + safezoneX;
				y = 0.360593 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_2_o_4: RscPicture
			{
				idc = 2214;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.59849 * safezoneW + safezoneX;
				y = 0.428444 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Text_2_o_1: RscText
			{
				idc = 2215;

				text = "Handcuff";
				style = ST_CENTER;
				x = 0.497156 * safezoneW + safezoneX;
				y = 0.277556 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_2_o_2: RscText
			{
				idc = 2216;

				text = "Handcuff";
				style = ST_CENTER;
				x = 0.546687 * safezoneW + safezoneX;
				y = 0.30674 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_2_o_3: RscText
			{
				idc = 2217;

				text = "Handcuff";
				style = ST_CENTER;
				x = 0.5745 * safezoneW + safezoneX;
				y = 0.363593 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_2_o_4: RscText
			{
				idc = 2218;
				text = "Handcuff";
				style = ST_CENTER;
				x = 0.59049 * safezoneW + safezoneX;
				y = 0.431444 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Button_2_o_1: Harris_radial_button
			{
				idc = 2219;

				x = 0.5 * safezoneW + safezoneX;
				y = 0.269 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[1,1] call Harris_interactionExecute;";
			};
			class Button_2_o_2: Harris_radial_button
			{
				idc = 2220;

				x = 0.546406 * safezoneW + safezoneX;
				y = 0.298296 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[2,1] call Harris_interactionExecute;";
			};
			class Button_2_o_3: Harris_radial_button
			{
				idc = 2221;

				x = 0.577344 * safezoneW + safezoneX;
				y = 0.36337 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[3,1] call Harris_interactionExecute;";
			};
			class Button_2_o_4: Harris_radial_button
			{
				idc = 2222;

				x = 0.592812 * safezoneW + safezoneX;
				y = 0.434 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[4,1] call Harris_interactionExecute;";
			};

		// Inner 3 (Centre Right)

			class radial_centreright_i: Harris_radial
			{
				idc = 3110;
				text = "\Harris_Client\radial\radial_centreright_i.paa";
			};

			class Icon_3_i: RscPicture
			{
				idc = 3111;
				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.554 * safezoneW + safezoneX;
				y = 0.478 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class Text_3_i: RscText
			{
				idc = 3112;
				text = "Handcuff";
				style = ST_CENTER;
				x = 0.546 * safezoneW + safezoneX;
				y = 0.481 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};

			class Button_3_i: Harris_radial_button
			{
				idc = 3113;
				x = 0.536094 * safezoneW + safezoneX;
				y = 0.467 * safezoneH + safezoneY;
				w = 0.06 * safezoneW;
				h = 0.09 * safezoneH;
				action = "[2] call Harris_interactionExecute;";
			};
		// Outer 3 (Centre Right)
			class radial_outer_3: Harris_radial
			{
				idc = 3210;

				text = "\Harris_Client\radial\radial_centreright_o.paa";
			};
			class Icon_3_o_1: RscPicture
			{
				idc = 3211;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.591824 * safezoneW + safezoneX;
				y = 0.382704 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_3_o_2: RscPicture
			{
				idc = 3212;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.605728 * safezoneW + safezoneX;
				y = 0.449075 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_3_o_3: RscPicture
			{
				idc = 3213;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.600521 * safezoneW + safezoneX;
				y = 0.51389 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_3_o_4: RscPicture
			{
				idc = 3214;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.58802 * safezoneW + safezoneX;
				y = 0.576851 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Text_3_o_1: RscText
			{
				idc = 3215;
				style = ST_CENTER;

				text = "Handcuff";
				x = 0.576824 * safezoneW + safezoneX;
				y = 0.385704 * safezoneH + safezoneY;
				w = 0.05 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_3_o_2: RscText
			{
				idc = 3216;
				style = ST_CENTER;

				text = "Handcuff";
				x = 0.589728 * safezoneW + safezoneX;
				y = 0.452075 * safezoneH + safezoneY;
				w = 0.05 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_3_o_3: RscText
			{
				idc = 3217;
				style = ST_CENTER;
				text = "Handcuff";
				x = 0.584521 * safezoneW + safezoneX;
				y = 0.51689 * safezoneH + safezoneY;
				w = 0.05 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_3_o_4: RscText
			{
				idc = 3218;
				style = ST_CENTER;

				text = "Handcuff";
				x = 0.57202 * safezoneW + safezoneX;
				y = 0.579851 * safezoneH + safezoneY;
				w = 0.05 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Button_3_o_1: Harris_radial_button
			{
				idc = 3219;

				x = 0.587656 * safezoneW + safezoneX;
				y = 0.379 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[1,1] call Harris_interactionExecute;";

			};
			class Button_3_o_2: Harris_radial_button
			{
				idc = 3220;

				x = 0.597969 * safezoneW + safezoneX;
				y = 0.445 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[2,1] call Harris_interactionExecute;";
			};
			class Button_3_o_3: Harris_radial_button
			{
				idc = 3221;

				x = 0.592812 * safezoneW + safezoneX;
				y = 0.511 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[3,1] call Harris_interactionExecute;";
			};
			class Button_3_o_4: Harris_radial_button
			{
				idc = 3222;

				x = 0.5825 * safezoneW + safezoneX;
				y = 0.577 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[4,1] call Harris_interactionExecute;";
			};

		// Inner 4 (Bottom Right)

				class radial_bottomright_i: Harris_radial
				{
					idc = 4110;
					text = "\Harris_Client\radial\radial_bottomright_i.paa";
				};


				class Icon_4_i: RscPicture
				{
					idc = 4111;
					text = "\Harris_Client\radial\icons\050-money.paa.paa";
					x = 0.530937 * safezoneW + safezoneX;
					y = 0.555 * safezoneH + safezoneY;
					w = 0.0257812 * safezoneW;
					h = 0.044 * safezoneH;
				};

				class Text_4_i: RscText
				{
					idc = 4112;
					text = "Handcuff";
					x = 0.523937 * safezoneW + safezoneX;
					y = 0.558 * safezoneH + safezoneY;
					w = 0.04 * safezoneW;
					h = 0.05 * safezoneH;
					style = ST_RIGHT;
				};

				class Button_4_i: Harris_radial_button
				{
					idc = 4113;
					x = 0.520625 * safezoneW + safezoneX;
					y = 0.544 * safezoneH + safezoneY;
					w = 0.05 * safezoneW;
					h = 0.09 * safezoneH;
					action = "[3] call Harris_interactionExecute;";
				};
		// Outer 4 (Bottom Right)
			class radial_outer_4: Harris_radial
			{
				idc = 4210;

				text = "\Harris_Client\radial\radial_bottomright_o.paa";
			};
			class Icon_4_o_1: RscPicture
			{
				idc = 4211;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.600052 * safezoneW + safezoneX;
				y = 0.52837 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_4_o_2: RscPicture
			{
				idc = 4212;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.583854 * safezoneW + safezoneX;
				y = 0.592593 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_4_o_3: RscPicture
			{
				idc = 4213;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.548436 * safezoneW + safezoneX;
				y = 0.651852 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_4_o_4: RscPicture
			{
				idc = 4214;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.510832 * safezoneW + safezoneX;
				y = 0.678667 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Text_4_o_1: RscText
			{
				idc = 4215;

				text = "Handcuff";
				stlye = ST_CENTER;
				x = 0.592052 * safezoneW + safezoneX;
				y = 0.53137 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_4_o_2: RscText
			{
				idc = 4216;

				text = "Handcuff";
				stlye = ST_CENTER;
				x = 0.576854 * safezoneW + safezoneX;
				y = 0.595593 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_4_o_3: RscText
			{
				idc = 4217;

				text = "Handcuff";
				stlye = ST_CENTER;
				x = 0.540436 * safezoneW + safezoneX;
				y = 0.654852 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_4_o_4: RscText
			{
				idc = 4218;

				text = "Handcuff";
				stlye = ST_CENTER;
				x = 0.502832 * safezoneW + safezoneX;
				y = 0.681667 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Button_4_o_1: Harris_radial_button
			{
				idc = 4219;

				x = 0.592812 * safezoneW + safezoneX;
				y = 0.522 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[1,1] call Harris_interactionExecute;";
			};
			class Button_4_o_2: Harris_radial_button
			{
				idc = 4220;

				x = 0.577344 * safezoneW + safezoneX;
				y = 0.588 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[2,1] call Harris_interactionExecute;";
			};
			class Button_4_o_3: Harris_radial_button
			{
				idc = 4221;

				x = 0.54125 * safezoneW + safezoneX;
				y = 0.654 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[3,1] call Harris_interactionExecute;";
			};
			class Button_4_o_4: Harris_radial_button
			{
				idc = 4222;

				x = 0.505156 * safezoneW + safezoneX;
				y = 0.676 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[4,1] call Harris_interactionExecute;";
			};

		// Inner 5 (Bottom Centre)

			class radial_centrebottom_i: Harris_radial
			{
				idc = 5110;
				text = "\Harris_Client\radial\radial_centrebottom_i.paa";
			};

			class Icon_5_i: RscPicture
			{
				idc = 5111;
				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.484531 * safezoneW + safezoneX;
				y = 0.588 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class Text_5_i: RscText
			{
				idc = 5112;
				text = "Handcuff";
				x = 0.476531 * safezoneW + safezoneX;
				y = 0.591 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
				style = ST_CENTER;
			};

			class Button_5_i: Harris_radial_button
			{
				idc = 5113;
				x = 0.469062 * safezoneW + safezoneX;
				y = 0.577 * safezoneH + safezoneY;
				w = 0.05 * safezoneW;
				h = 0.09 * safezoneH;
				action = "[4] call Harris_interactionExecute;";
			};
		// Outer 5 (Bottom Centre)
			class radial_centrebottom_o: Harris_radial
			{
				idc = 5210;

				text = "\Harris_Client\radial\radial_centrebottom_o.paa";
			};
			class Icon_5_o_1: RscPicture
			{
				idc = 5211;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.546406 * safezoneW + safezoneX;
				y = 0.654 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_5_o_2: RscPicture
			{
				idc = 5212;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.514948 * safezoneW + safezoneX;
				y = 0.681556 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_5_o_3: RscPicture
			{
				idc = 5213;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.458229 * safezoneW + safezoneX;
				y = 0.681555 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_5_o_4: RscPicture
			{
				idc = 5214;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.422187 * safezoneW + safezoneX;
				y = 0.652148 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Text_5_o_1: RscText
			{
				idc = 5215;

				text = "Handcuff";
				stlye = ST_CENTER;
				x = 0.538406 * safezoneW + safezoneX;
				y = 0.657 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_5_o_2: RscText
			{
				idc = 5216;

				text = "Handcuff";
				stlye = ST_CENTER;
				x = 0.506948 * safezoneW + safezoneX;
				y = 0.684556 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_5_o_3: RscText
			{
				idc = 5217;

				text = "Handcuff";
				stlye = ST_CENTER;
				x = 0.454229 * safezoneW + safezoneX;
				y = 0.684555 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_5_o_4: RscText
			{
				idc = 5218;

				text = "Handcuff";
				stlye = ST_CENTER;
				x = 0.414187 * safezoneW + safezoneX;
				y = 0.655148 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Button_5_o_1: Harris_radial_button
			{
				idc = 5219;

				x = 0.545313 * safezoneW + safezoneX;
				y = 0.649074 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[1,1] call Harris_interactionExecute;";
			};
			class Button_5_o_2: Harris_radial_button
			{
				idc = 5220;

				x = 0.509791 * safezoneW + safezoneX;
				y = 0.677852 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[2,1] call Harris_interactionExecute;";
			};
			class Button_5_o_3: Harris_radial_button
			{
				idc = 5221;

				x = 0.454167 * safezoneW + safezoneX;
				y = 0.677778 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[3,1] call Harris_interactionExecute;";
			};
			class Button_5_o_4: Harris_radial_button
			{
				idc = 5222;

				x = 0.4175 * safezoneW + safezoneX;
				y = 0.654 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[4,1] call Harris_interactionExecute;";
			};

		// Inner 6 (Bottom Left)


			class radial_bottomleft_i: Harris_radial
			{
				idc = 6110;
				text = "\Harris_Client\radial\radial_bottomleft_i.paa";
			};

			class Icon_6_i: RscPicture
			{
				idc = 6111;
				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.438125 * safezoneW + safezoneX;
				y = 0.555 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class Text_6_i: RscText
			{
				idc = 6112;
				text = "Handcuff";
				x = 0.430969 * safezoneW + safezoneX;
				y = 0.558 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
				style = ST_CENTER;
			};

			class Button_6_i: Harris_radial_button
			{
				idc = 6113;
				x = 0.430125 * safezoneW + safezoneX;
				y = 0.558 * safezoneH + safezoneY;
				w = 0.06 * safezoneW;
				h = 0.09 * safezoneH;
				action = "[5] call Harris_interactionExecute;";
			};
		// Outer 6 (Bottom Left)
			class radial_bottomleft_o: Harris_radial
			{
				idc = 6210;

				text = "\Harris_Client\radial\radial_bottomleft_o.paa";
			};
			class Icon_6_o_1: RscPicture
			{
				idc = 6211;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.371354 * safezoneW + safezoneX;
				y = 0.527777 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_6_o_2: RscPicture
			{
				idc = 6212;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.386093 * safezoneW + safezoneX;
				y = 0.589037 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_6_o_3: RscPicture
			{
				idc = 6213;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.419166 * safezoneW + safezoneX;
				y = 0.642074 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_6_o_4: RscPicture
			{
				idc = 6214;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.45625 * safezoneW + safezoneX;
				y = 0.680555 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
		
			class Text_6_o_1: RscText
			{
				idc = 6215;

				text = "Handcuff";
				x = 0.366666 * safezoneW + safezoneX;
				y = 0.528519 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_6_o_2: RscText
			{
				idc = 6216;

				text = "Handcuff";
				x = 0.381771 * safezoneW + safezoneX;
				y = 0.591482 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
				class Text_6_o_3: RscText
			{
				idc = 6217;

				text = "Handcuff";
				x = 0.411979 * safezoneW + safezoneX;
				y = 0.643334 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_6_o_4: RscText
			{
				idc = 6218;

				text = "Handcuff";
				x = 0.448958 * safezoneW + safezoneX;
				y = 0.681296 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};

			class Button_6_o_1: Harris_radial_button
			{
				idc = 6219;

				x = 0.365938 * safezoneW + safezoneX;
				y = 0.522 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[1,1] call Harris_interactionExecute;";
			};
			class Button_6_o_2: Harris_radial_button
			{
				idc = 6220;

				x = 0.383489 * safezoneW + safezoneX;
				y = 0.588 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[2,1] call Harris_interactionExecute;";
			};
			class Button_6_o_3: Harris_radial_button
			{
				idc = 6221;

				x = 0.412344 * safezoneW + safezoneX;
				y = 0.643 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[3,1] call Harris_interactionExecute;";
			};
			class Button_6_o_4: Harris_radial_button
			{
				idc = 6222;

				x = 0.453125 * safezoneW + safezoneX;
				y = 0.676852 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				action = "[4,1] call Harris_interactionExecute;";
			};

		// Inner 7 (Centre Left)
			class radial_centreleft_i: Harris_radial
			{
				idc = 7110;
				text = "\Harris_Client\radial\radial_centreleft_i.paa";
			};

			class Icon_7_i: RscPicture
			{
				idc = 7111;
				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.418344 * safezoneW + safezoneX;
				y = 0.478 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class Text_7_i: RscText
			{
				idc = 7112;
				text = "Handcuff";
				style = ST_CENTER;
				x = 0.410344 * safezoneW + safezoneX;
				y = 0.481 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};

			class Button_7_i: Harris_radial_button
			{
				idc = 7113;
				x = 0.396875 * safezoneW + safezoneX;
				y = 0.456 * safezoneH + safezoneY;
				w = 0.06 * safezoneW;
				h = 0.09 * safezoneH;
				action = "[6] call Harris_interactionExecute;";
			};
		// Outer 7 (Centre Left)
			class radial_centreleft_o: Harris_radial
			{
				idc = 7210;

				text = "\Harris_Client\radial\radial_centreleft_o.paa";
			};
			class Icon_7_o_1: RscPicture
			{
				idc = 7211;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.384531 * safezoneW + safezoneX;
				y = 0.373444 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_7_o_2: RscPicture
			{
				idc = 7212;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.370313 * safezoneW + safezoneX;
				y = 0.431481 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_7_o_3: RscPicture
			{
				idc = 7213;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.368541 * safezoneW + safezoneX;
				y = 0.492815 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_7_o_4: RscPicture
			{
				idc = 7214;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.378853 * safezoneW + safezoneX;
				y = 0.559629 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Text_7_o_1: RscText
			{
				idc = 7215;

				text = "Handcuff";
				x = 0.372917 * safezoneW + safezoneX;
				y = 0.375742 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_7_o_2: RscText
			{
				idc = 7216;

				text = "Handcuff";
				x = 0.363541 * safezoneW + safezoneX;
				y = 0.437779 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_7_o_3: RscText
			{
				idc = 7217;

				text = "Handcuff";
				x = 0.36198 * safezoneW + safezoneX;
				y = 0.497037 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_7_o_4: RscText
			{
				idc = 7218;

				text = "Handcuff";
				x = 0.37396 * safezoneW + safezoneX;
				y = 0.562778 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Button_7_o_1: Harris_radial_button
			{
				idc = 7219;
				x = 0.37625 * safezoneW + safezoneX;
				y = 0.379 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.055 * safezoneH;
				action = "[1,1] call Harris_interactionExecute;";
			};
			class Button_7_o_2: Harris_radial_button
			{
				idc = 7220;
				x = 0.365937 * safezoneW + safezoneX;
				y = 0.434 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.055 * safezoneH;
				action = "[2,1] call Harris_interactionExecute;";
			};
			class Button_7_o_3: Harris_radial_button
			{
				idc = 7221;
				x = 0.365937 * safezoneW + safezoneX;
				y = 0.5 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.055 * safezoneH;
				action = "[3,1] call Harris_interactionExecute;";
			};
			class Button_7_o_4: Harris_radial_button
			{
				idc = 7222;
				x = 0.37625 * safezoneW + safezoneX;
				y = 0.566 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.055 * safezoneH;
				action = "[4,1] call Harris_interactionExecute;";
			};

		// Inner 8 (Top Left)

			class radial_topleft_i: Harris_radial
			{
				idc = 8110;
				text = "\Harris_Client\radial\radial_topleft_i.paa";
			};

			class Icon_8_i: RscPicture
			{
				idc = 8111;
				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.438125 * safezoneW + safezoneX;
				y = 0.39 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};

			class Text_8_i: RscText
			{
				idc = 8112;
				text = "Handcuff";
				style = ST_CENTER;
				x = 0.430125 * safezoneW + safezoneX;
				y = 0.393 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			

			class Button_8_i: Harris_radial_button
			{
				idc = 8113;
				x = 0.412344 * safezoneW + safezoneX;
				y = 0.368 * safezoneH + safezoneY;
				w = 0.06 * safezoneW;
				h = 0.09 * safezoneH;
				action = "[7] call Harris_interactionExecute;";
			};
		// Outer 8 (Top Left)
			class radial_topleft_o: Harris_radial
			{
				idc = 8210;

				text = "\Harris_Client\radial\radial_topleft_o.paa";
			};
			class Icon_8_o_1: RscPicture
			{
				idc = 8211;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.467187 * safezoneW + safezoneX;
				y = 0.271296 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_8_o_2: RscPicture
			{
				idc = 8212;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.424479 * safezoneW + safezoneX;
				y = 0.296297 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_8_o_3: RscPicture
			{
				idc = 8213;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.390104 * safezoneW + safezoneX;
				y = 0.350926 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Icon_8_o_4: RscPicture
			{
				idc = 8214;

				text = "\Harris_Client\radial\icons\050-money.paa.paa";
				x = 0.371874 * safezoneW + safezoneX;
				y = 0.423147 * safezoneH + safezoneY;
				w = 0.0257812 * safezoneW;
				h = 0.044 * safezoneH;
			};
			class Text_8_o_1: RscText
			{
				idc = 8215;
				style = 1;

				text = "Handcuff";
				x = 0.458855 * safezoneW + safezoneX;
				y = 0.273889 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_8_o_2: RscText
			{
				idc = 8216;
				style = 1;

				text = "Handcuff";
				x = 0.416666 * safezoneW + safezoneX;
				y = 0.299814 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_8_o_3: RscText
			{
				idc = 8217;
				style = ST_LEFT;

				text = "Handcuff";
				x = 0.390104 * safezoneW + safezoneX;
				y = 0.354445 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Text_8_o_4: RscText
			{
				idc = 8218;
				style = 1;

				text = "Handcuff";
				x = 0.363542 * safezoneW + safezoneX;
				y = 0.424814 * safezoneH + safezoneY;
				w = 0.04 * safezoneW;
				h = 0.05 * safezoneH;
			};
			class Button_8_o_1: Harris_radial_button
			{
				idc = 8219;

				x = 0.45875 * safezoneW + safezoneX;
				y = 0.269 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[1,1] call Harris_interactionExecute;";
			};
			class Button_8_o_2: Harris_radial_button
			{
				idc = 8220;

				x = 0.418229 * safezoneW + safezoneX;
				y = 0.290741 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[2,1] call Harris_interactionExecute;";
			};
			class Button_8_o_3: Harris_radial_button
			{
				idc = 8221;

				x = 0.382813 * safezoneW + safezoneX;
				y = 0.350926 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[3,1] call Harris_interactionExecute;";
			};
			class Button_8_o_4: Harris_radial_button
			{
				idc = 8222;

				x = 0.365104 * safezoneW + safezoneX;
				y = 0.419445 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.066 * safezoneH;
				colorBackground[] = {0,0,0,0};
				colorActive[] = {0,0,0,0};
				action = "[4,1] call Harris_interactionExecute;";
			};

	};
};