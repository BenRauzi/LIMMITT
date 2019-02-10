// Physical Items
class CfgWeapons
{
	class ToolKit;

	// Coal
	class Harris_coalOre: ToolKit
	{
		displayName = "Coal Ore";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 15;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_coalOre.p3d";
		picture = "\Harris_Client\Data\icon_coalOre.paa";
		descriptionShort = "The extraction and use of coal causes many premature deaths and much illness.";
	};
	class Harris_coal: ToolKit
	{
		displayName = "Piece of Coal";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 15;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_coal.p3d";
		picture = "\Harris_Client\Data\icon_coal.paa";
		descriptionShort = "A combustible black or brownish-black sedimentary rock.";
	};

	// Iron
	class Harris_ironOre: ToolKit
	{
		displayName = "Iron Ore";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 15;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_ironOre.p3d";
		picture = "\Harris_Client\Data\icon_ironOre.paa";
		descriptionShort = "The ores are usually rich in iron oxides.";
	};
	class Harris_ironIngot: ToolKit
	{
		displayName = "Iron Ingot";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 15;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_ironIngot.p3d";
		picture = "\Harris_Client\Data\icon_ironIngot.paa";
		descriptionShort = "Casted out of pure molten iron.";
	};

	// Gold
	class Harris_goldOre: ToolKit
	{
		displayName = "Gold Ore";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 15;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_goldOre.p3d";
		picture = "\Harris_Client\Data\icon_goldOre.paa";
		descriptionShort = "A rock that contains gold which can be extracted.";
	};
	class Harris_goldIngot: ToolKit
	{
		displayName = "Gold Ingot";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 15;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_goldIngot.p3d";
		picture = "\Harris_Client\Data\icon_goldIngot.paa";
		descriptionShort = "Casted out of pure molten gold.";
	};

	// Diamond
	class Harris_diamondOre: ToolKit
	{
		displayName = "Uncut Diamond";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 15;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_diamondOre.p3d";
		picture = "\Harris_Client\Data\icon_diamondOre.paa";
		descriptionShort = "A stone that has not been shaped in any particular form or undergone any polishing.";
	};
	class Harris_diamond: ToolKit
	{
		displayName = "Cut Diamond";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 15;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_diamond.p3d";
		picture = "\Harris_Client\Data\icon_diamond.paa";
		descriptionShort = "The cut of a diamond greatly affects a diamond's brilliance.";
	};

	// Steel
	class Harris_steelIngot: ToolKit
	{
		displayName = "Steel Ingot";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 15;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_steelIngot.p3d";
		picture = "\Harris_Client\Data\icon_steelIngot.paa";
		descriptionShort = "An alloy of iron and carbon, and sometimes other elements.";
	};

	// Wood
	class Harris_woodLog: ToolKit
	{
		displayName = "Wooden Log";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 70;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_woodLog.p3d";
		picture = "\Harris_Client\Data\icon_woodLog.paa";
		descriptionShort = "A subpart of a felled tree trunk.";
	};

	// Workbench
	class Harris_Workbench: ToolKit
	{
		displayName = "Workbench";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 100;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_workbench.p3d";
		picture = "\Harris_Client\Data\icon_workbench.paa";
		descriptionShort = "A sturdy table at which manual work is done.";
	};

	// Pot
	class Harris_Pot: ToolKit
	{
		displayName = "Plant Pot";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 100;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_pot.p3d";
		picture = "\Harris_Client\Data\icon_pot.paa";
		descriptionShort = "A Pot used to grow some legal plants, and some illegal ones.";
	};

	// C4
	class Harris_c4: ToolKit
	{
		displayName = "C4 Explosive";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 100;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\Harris_Client\Models\model_c4.p3d";
		picture = "\Harris_Client\Data\icon_c4.paa";
		descriptionShort = "A common variety of the plastic explosive family known as Composition C.";
	};

	class Harris_blueprintnotes : Toolkit {
		displayName = "Crafting Notes";
		descriptionShort = "A notepad containing notes used for crafting";
		picture = "\cg_Items\custom\tuna_ca.paa";
		model = "\Harris_Client\Crafting\Blueprint.p3d";
		class ItemInfo
		{
			allowedSlots[] = {701, 801, 901};
			mass = 6;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
	};
	class Harris_weedBag: ToolKit
	{
		displayName = "Bag of Weed";
		count = 1;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 4;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\a3l_drugs\weed_bag.p3d";
		picture = "\a3l_drugs\weedbag_icon.paa";
		descriptionShort = "Bag of Weed";
	};

	class Harris_weedSeeds: ToolKit
	{
		displayName = "Weed Seeds";
		count = 1;
		class ItemInfo
		{
			mass = 2;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\cl3_objects\cl3_objects_pack\cl_hemp_seeds.p3d";
		picture = "\Harris_Client\Crafting\seeds.paa";
		descriptionShort = "Weed Seeds";
	};
	class Harris_Toolbox: ToolKit
	{
		displayName = "Toolbox";
		count = 10;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 20;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\cl3_objects\cl3_objects_pack\cl_toolbox.p3d";
		picture = "\Harris_Client\Crafting\Toolbox.paa";
		descriptionShort = "Can be used a repairkit to fix vehicles";
	};
	class Harris_medKit: ToolKit
	{
		displayName = "CPR Medkit";
		count = 10;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 20;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\cl3_objects\cl3_objects_pack\cl_toolbox.p3d";
		picture = "\Harris_Client\Crafting\Toolbox.paa";
		descriptionShort = "CPR Medkit";
	};
	class Harris_handcuff: ToolKit
	{
		displayName = "Handcuffs";
		count = 10;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 6;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\cl3_objects\cl3_objects_pack\cl_handcuffs.p3d";
		picture = "\cl3_objects\cl3_objects_pack\icons\cl_handcuffs_icon.paa";
		descriptionShort = "A pair of handcuffs used to restrain people's hands";
	};
	class Harris_cuffkeys: ToolKit
	{
		displayName = "Cuff Keys";
		count = 10;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 2;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\MM_objects\keys.p3d";
		picture = "\MM_objects\images\keychain.paa";
		descriptionShort = "A pair of keys used to unlock leg shackles or Handcuffs";
	};
	class Harris_burlap: ToolKit
	{
		displayName = "Burlap";
		count = 10;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 2;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\a3l_boxes\box_small.p3d";
		picture = "Harris_Client\Crafting\burlap.paa";
		descriptionShort = "Burlap";
	};
	class Harris_rope: ToolKit
	{
		displayName = "Rope";
		count = 10;
		class ItemInfo
		{
			allowedSlots[] = {701,801,901};
			mass = 2;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
		model = "\a3l_boxes\box_small.p3d";
		picture = "\Harris_Client\Crafting\Rope.paa";
		descriptionShort = "Rope";
	};
	class Harris_RDX : Toolkit {
		displayName = "RDX Compound";
		descriptionShort = "A modern compound used for controlled detonations.";
		picture = "\Harris_Client\Crafting\RDX.paa";
		model = "\a3l_boxes\box_small.p3d";
		class ItemInfo
		{
			allowedSlots[] = {701, 801, 901};
			mass = 4;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
	};
	class Harris_keyCard : Toolkit {
		displayName = "Police KeyCard";
		descriptionShort = "This is used to gain police access to secure facilities.";
		picture = "Harris_Client\radial\icons\002_Tag.paa";
		model = "\MM_objects\keys.p3d";
		class ItemInfo
		{
			allowedSlots[] = {701, 801, 901};
			mass = 4;
			scope = 0;
			type = 620;
			uniformModel = "\A3\Weapons_F\Items\Toolkit";
		};
	};
};