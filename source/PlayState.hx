package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	public var mainItem:FlxSprite;
	public var subItem1:FlxSprite;
	public var subItem2:FlxSprite;
	public var subItem3:FlxSprite;
	public var subItem4:FlxSprite;
	public var subItem5:FlxSprite;
	public var subItem6:FlxSprite;

	public var greyButton:FlxButtonPlus;
	public var greenButton:FlxButtonPlus;
	public var redButton:FlxButtonPlus;
	public var yellowButton:FlxButtonPlus;
	public var lunarButton:FlxButtonPlus;
	public var equipButton:FlxButtonPlus;
	public var voidButton:FlxButtonPlus;

	public var curItem:Int = 0;
	public var globalOffset:Int = 100;

	public static var items:FlxText;
	public static var pick:FlxText;
	public static var choose:FlxText;

	public var dlcToggle:Bool = FlxG.save.data.dlcToggle;
	public var ranToggle:Bool = FlxG.save.data.ranToggle;
	public var choosingThree:Bool = false;

	public var rarities:Array<String> = ["grey", "green", "red", "yellow", "lunar", "equip"];

	public var greyItems:Array<String> = [
		"armor", "backupMag", "bear", "bossDamage", "crowbar", "drink", "firework", "fungus", "gasoline", "glasses", "goat", "medkit", "monsterTooth",
		"redCrystal", "shield", "shieldBrooch", "slug", "steak", "stickyBomb", "stunGrenade", "syringe", "tritip", "warbanner"
	];

	public var greenItems:Array<String> = [
		"bandolier", "bauble", "berzerk", "buckler", "cell", "deathMark", "feather", "fireRing", "goldBook", "guillotine", "hat", "healFlower", "iceRing",
		"infusion", "missile_mk", "phasing", "quail", "razorHeadband", "scythe", "seed", "squidTurret", "ukulele", "warHorn", "whip", "wisp"
	];

	public var redItems:Array<String> = [
		"alien", "behemoth", "brain", "burner", "clover", "cuffs", "dagger", "deskPlant", "dio", "disc", "fullBarrier", "hammer", "headhunter", "hook",
		"horn", "ice", "mask", "microbot", "opinion", "soul", "tesla"
	];

	public var yellowItems:Array<String> = [
		"beetle", "critBleed", "doubleDrone", "goldenSeed", "knurl", "magmaEgg", "magmaTooth", "sprintingWisp", "tarUrn", "weirdTail", "whiteHook"
	];

	public var voidItems:Array<String> = [];

	public var lunarItems:Array<String> = [
		"beads", "burn", "crown", "flower", "fossil", "meteorite", "ocarina", "orb", "purpleBlade", "slow", "snowflake", "spin", "sword", "tonic", "tools",
		"transc", "weirdArm", "weirdOrb"
	];

	public var equipItems:Array<String> = [
		"beam", "blackhole", "drone", "drum", "egg", "elephant", "fruit", "gatling", "hud", "larva", "leech", "lightning", "metalSpin", "missile", "potThing",
		"radar", "recycler", "spirit", "vase", "voodoo"
	];

	override public function create()
	{
		var goBack = new FlxText(700, 900, 1000, "Press ESC/BACKSPACE to return to the menu", 16, true);
		add(goBack);
		items = new FlxText(0, 300, 1000, "Your Items", 46, true);
		items.visible = false;
		items.screenCenter(X);
		add(items);
		addDLCToArrayList();
		if (!ranToggle)
		{
			if (!dlcToggle)
			{
				mainItem = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem] + "/" + greyItems[FlxG.random.int(0, 22)] + ".jpg"); // (0, 27)
				mainItem.screenCenter();
				mainItem.setGraphicSize(Std.int(mainItem.width * 2));
				add(mainItem);
				subItem1 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 1] + "/" + greenItems[FlxG.random.int(0,
					24)] + ".jpg"); // (0, 28)
				subItem1.screenCenter();
				subItem1.setGraphicSize(Std.int(subItem1.width * 2));
				add(subItem1);
				subItem2 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 2] + "/" + redItems[FlxG.random.int(0, 20)] + ".jpg"); // (0, 26)
				subItem2.screenCenter();
				subItem2.setGraphicSize(Std.int(subItem2.width * 2));
				add(subItem2);
				subItem3 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 3] + "/" + yellowItems[FlxG.random.int(0,
					10)] + ".jpg"); // (0, 11)
				subItem3.screenCenter();
				subItem3.setGraphicSize(Std.int(subItem3.width * 2));
				add(subItem3);
				subItem4 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 4] + "/" + lunarItems[FlxG.random.int(0,
					17)] + ".jpg"); // (0, 21)
				subItem4.screenCenter();
				subItem4.setGraphicSize(Std.int(subItem4.width * 2));
				add(subItem4);
				subItem5 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 5] + "/" + equipItems[FlxG.random.int(0,
					19)] + ".jpg"); // (0, 24)
				subItem5.screenCenter();
				subItem5.setGraphicSize(Std.int(subItem5.width * 2));
				add(subItem5);
				invisAll();
			}
			else
			{
				mainItem = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem] + "/" + greyItems[FlxG.random.int(0, 27)] + ".jpg"); // (0, 27)
				mainItem.screenCenter();
				mainItem.setGraphicSize(Std.int(mainItem.width * 2));
				add(mainItem);
				subItem1 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 1] + "/" + greenItems[FlxG.random.int(0,
					28)] + ".jpg"); // (0, 28)
				subItem1.screenCenter();
				subItem1.setGraphicSize(Std.int(subItem1.width * 2));
				add(subItem1);
				subItem2 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 2] + "/" + redItems[FlxG.random.int(0, 26)] + ".jpg"); // (0, 26)
				subItem2.screenCenter();
				subItem2.setGraphicSize(Std.int(subItem2.width * 2));
				add(subItem2);
				subItem3 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 3] + "/" + yellowItems[FlxG.random.int(0,
					11)] + ".jpg"); // (0, 11)
				subItem3.screenCenter();
				subItem3.setGraphicSize(Std.int(subItem3.width * 2));
				add(subItem3);
				subItem4 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 4] + "/" + lunarItems[FlxG.random.int(0,
					21)] + ".jpg"); // (0, 21)
				subItem4.screenCenter();
				subItem4.setGraphicSize(Std.int(subItem4.width * 2));
				add(subItem4);
				subItem5 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 5] + "/" + equipItems[FlxG.random.int(0,
					24)] + ".jpg"); // (0, 24)
				subItem5.screenCenter();
				subItem5.setGraphicSize(Std.int(subItem5.width * 2));
				add(subItem5);
				subItem6 = new FlxSprite().loadGraphic("assets/images/" + rarities[curItem + 6] + "/" + voidItems[FlxG.random.int(0, 12)] + ".jpg"); // void
				subItem6.screenCenter();
				subItem6.setGraphicSize(Std.int(subItem6.width * 2));
				add(subItem6);
				invisAll();
			}
		}
		if (ranToggle)
		{
			choose = new FlxText(0, 100, 1000, "Choose the rarity you need using the buttons below", 44, true);
			choose.screenCenter(X);
			choose.alignment = CENTER;
			add(choose);
			pick = new FlxText(300, 200, 1000, "Pick one of the 3\nafter you do hit enter", 46, true);
			pick.visible = false;
			add(pick);
			greyButton = new FlxButtonPlus(300, 300, function()
			{
				hideAllButtons();
				choosingThree = true;
				choose.visible = false;
				pick.visible = true;
				if (!dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/grey/" + greyItems[FlxG.random.int(0, 22)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/grey/" + greyItems[FlxG.random.int(0, 22)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/grey/" + greyItems[FlxG.random.int(0, 22)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
				if (dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/grey/" + greyItems[FlxG.random.int(0, 27)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/grey/" + greyItems[FlxG.random.int(0, 27)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/grey/" + greyItems[FlxG.random.int(0, 27)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
			}, "Get a random grey item", 200, 40);
			greenButton = new FlxButtonPlus(600, 300, function()
			{
				hideAllButtons();
				choosingThree = true;
				choose.visible = false;
				pick.visible = true;
				if (!dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/green/" + greenItems[FlxG.random.int(0, 24)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/green/" + greenItems[FlxG.random.int(0, 24)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/green/" + greenItems[FlxG.random.int(0, 24)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
				if (dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/green/" + greenItems[FlxG.random.int(0, 28)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/green/" + greenItems[FlxG.random.int(0, 28)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/green/" + greenItems[FlxG.random.int(0, 28)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
			}, "Get a random green item", 200, 40);
			redButton = new FlxButtonPlus(900, 300, function()
			{
				hideAllButtons();
				choosingThree = true;
				choose.visible = false;
				pick.visible = true;
				if (!dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/red/" + redItems[FlxG.random.int(0, 20)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/red/" + redItems[FlxG.random.int(0, 20)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/red/" + redItems[FlxG.random.int(0, 20)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
				if (dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/red/" + redItems[FlxG.random.int(0, 26)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/red/" + redItems[FlxG.random.int(0, 26)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/red/" + redItems[FlxG.random.int(0, 26)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
			}, "Get a random red item", 200, 40);
			yellowButton = new FlxButtonPlus(300, 500, function()
			{
				hideAllButtons();
				choosingThree = true;
				choose.visible = false;
				pick.visible = true;
				if (!dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/yellow/" + yellowItems[FlxG.random.int(0, 10)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/yellow/" + yellowItems[FlxG.random.int(0, 10)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/yellow/" + yellowItems[FlxG.random.int(0, 10)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
				if (dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/yellow/" + yellowItems[FlxG.random.int(0, 11)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/yellow/" + yellowItems[FlxG.random.int(0, 11)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/yellow/" + yellowItems[FlxG.random.int(0, 11)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
			}, "Get a random yellow item", 200, 40);
			lunarButton = new FlxButtonPlus(600, 500, function()
			{
				hideAllButtons();
				choosingThree = true;
				choose.visible = false;
				pick.visible = true;
				if (!dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/lunar/" + lunarItems[FlxG.random.int(0, 17)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/lunar/" + lunarItems[FlxG.random.int(0, 17)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/lunar/" + lunarItems[FlxG.random.int(0, 17)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
				if (dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/lunar/" + lunarItems[FlxG.random.int(0, 21)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/lunar/" + lunarItems[FlxG.random.int(0, 21)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/lunar/" + lunarItems[FlxG.random.int(0, 21)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
			}, "Get a random lunar item", 200, 40);
			equipButton = new FlxButtonPlus(900, 500, function()
			{
				hideAllButtons();
				choosingThree = true;
				choose.visible = false;
				pick.visible = true;
				if (!dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/equip/" + equipItems[FlxG.random.int(0, 19)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/equip/" + equipItems[FlxG.random.int(0, 19)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/equip/" + equipItems[FlxG.random.int(0, 19)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
				if (dlcToggle)
				{
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/equip/" + equipItems[FlxG.random.int(0, 24)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/equip/" + equipItems[FlxG.random.int(0, 24)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/equip/" + equipItems[FlxG.random.int(0, 24)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}
			}, "Get a random equipment", 200, 40);
			if (dlcToggle)
			{
				voidButton = new FlxButtonPlus(600, 700, function()
				{
					hideAllButtons();
					choosingThree = true;
					choose.visible = false;
					pick.visible = true;
					mainItem = new FlxSprite(300, 400).loadGraphic("assets/images/void/" + voidItems[FlxG.random.int(0, 12)] + ".jpg");
					mainItem.setGraphicSize(Std.int(mainItem.width * 2));
					add(mainItem);
					subItem1 = new FlxSprite(600, 400).loadGraphic("assets/images/void/" + voidItems[FlxG.random.int(0, 12)] + ".jpg");
					subItem1.setGraphicSize(Std.int(subItem1.width * 2));
					add(subItem1);
					subItem2 = new FlxSprite(900, 400).loadGraphic("assets/images/void/" + voidItems[FlxG.random.int(0, 12)] + ".jpg");
					subItem2.setGraphicSize(Std.int(subItem2.width * 2));
					add(subItem2);
				}, "Get a random void item", 200, 40);
				add(voidButton);
			}
			add(greyButton);
			add(greenButton);
			add(redButton);
			add(yellowButton);
			add(lunarButton);
			add(equipButton);
		}

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			if (!ranToggle)
				nextItem();
			if (choosingThree)
				ranSwitch();
		}
		if (FlxG.keys.justPressed.ESCAPE || FlxG.keys.justPressed.BACKSPACE)
			FlxG.switchState(new TitleState());
		super.update(elapsed);
	}

	function addDLCToArrayList()
	{
		// putting all this here to keep it away from the more readable code
		if (dlcToggle)
		{
			rarities.insert(6, "void");
			greyItems.insert(0, "brokenWatch");
			greyItems.insert(0, "mocha");
			greyItems.insert(0, "opal");
			greyItems.insert(0, "elixir");
			greyItems.insert(0, "pennies");
			greenItems.insert(0, "harpoon");
			greenItems.insert(0, "tank");
			greenItems.insert(0, "form");
			greenItems.insert(0, "shuriken");
			yellowItems.insert(0, "triangleSummon");
			redItems.insert(0, "rainCoat");
			redItems.insert(0, "bottle");
			redItems.insert(0, "scope");
			redItems.insert(0, "hugeMissile");
			redItems.insert(0, "droneBox");
			redItems.insert(0, "scorpion");
			lunarItems.insert(0, "whiteBall");
			lunarItems.insert(0, "domino");
			lunarItems.insert(0, "coolJacket");
			lunarItems.insert(0, "pauldron");
			equipItems.insert(0, "creditCard");
			equipItems.insert(0, "goobo");
			equipItems.insert(0, "molotov");
			equipItems.insert(0, "oldGun");
			equipItems.insert(0, "fridge");
			voidItems.insert(0, "corruptedBear");
			voidItems.insert(0, "corruptedClover");
			voidItems.insert(0, "corruptedGlasses");
			voidItems.insert(0, "corruptedScorpion");
			voidItems.insert(0, "corruptedThing");
			voidItems.insert(0, "flame");
			voidItems.insert(0, "hauntedBear");
			voidItems.insert(0, "needletick");
			voidItems.insert(0, "plantTentacle");
			voidItems.insert(0, "purpleCell");
			voidItems.insert(0, "superMissile");
			voidItems.insert(0, "superRing");
			voidItems.insert(0, "weirdShroom");
			trace("added all dlc to the arrays");
		}
		else
			trace("dlc is off");
		/*trace("grey " + greyItems);
			trace("green " + greenItems);
			trace("red" + redItems);
			trace("yellow " + yellowItems);
			trace("lunar " + lunarItems);
			trace("void " + voidItems);
			trace("equip " + equipItems); */
	}

	function nextItem()
	{
		curItem = curItem + 1;
		if (curItem == 1)
		{
			mainItem.setGraphicSize(Std.int(mainItem.width * 1));
			mainItem.x = globalOffset;
			mainItem.y = 100;
			subItem1.visible = true;
		}
		else if (curItem == 2)
		{
			subItem1.setGraphicSize(Std.int(subItem1.width * 1));
			subItem1.x = globalOffset;
			subItem1.y = 100;
			subItem2.visible = true;
		}
		else if (curItem == 3)
		{
			subItem2.setGraphicSize(Std.int(subItem2.width * 1));
			subItem2.x = globalOffset;
			subItem2.y = 100;
			subItem3.visible = true;
		}
		else if (curItem == 4)
		{
			subItem3.setGraphicSize(Std.int(subItem3.width * 1));
			subItem3.x = globalOffset;
			subItem3.y = 100;
			subItem4.visible = true;
		}
		else if (curItem == 5)
		{
			subItem4.setGraphicSize(Std.int(subItem4.width * 1));
			subItem4.x = globalOffset;
			subItem4.y = 100;
			subItem5.visible = true;
		}
		else if (curItem == 6)
		{
			subItem5.setGraphicSize(Std.int(subItem5.width * 1));
			subItem5.x = globalOffset;
			subItem5.y = 100;
			if (dlcToggle)
				subItem6.visible = true;
			if (!dlcToggle)
				moveToCenter();
		}
		else if (curItem == 7)
			if (dlcToggle)
			{
				subItem6.setGraphicSize(Std.int(subItem5.width * 1));
				subItem6.x = globalOffset;
				subItem6.y = 100;
				moveToCenter();
			}
		globalOffset = curItem * 100 + 100;
	}

	function invisAll()
	{
		subItem1.visible = false;
		subItem2.visible = false;
		subItem3.visible = false;
		subItem4.visible = false;
		subItem5.visible = false;
		if (dlcToggle)
			subItem6.visible = false;
	}

	function moveToCenter()
	{
		if (dlcToggle)
		{
			mainItem.setGraphicSize(Std.int(mainItem.width * 1.5));
			subItem1.setGraphicSize(Std.int(subItem1.width * 1.5));
			subItem2.setGraphicSize(Std.int(subItem2.width * 1.5));
			subItem3.setGraphicSize(Std.int(subItem3.width * 1.5));
			subItem4.setGraphicSize(Std.int(subItem4.width * 1.5));
			subItem5.setGraphicSize(Std.int(subItem5.width * 1.5));
			subItem6.setGraphicSize(Std.int(subItem6.width * 1.5));
			mainItem.x = 150;
			mainItem.y = 400;
			subItem1.x = 300;
			subItem1.y = 400;
			subItem2.x = 450;
			subItem2.y = 400;
			subItem3.x = 600;
			subItem3.y = 400;
			subItem4.x = 750;
			subItem4.y = 400;
			subItem5.x = 900;
			subItem5.y = 400;
			subItem6.x = 1050;
			subItem6.y = 400;
		}
		if (!dlcToggle)
		{
			mainItem.setGraphicSize(Std.int(mainItem.width * 1.5));
			subItem1.setGraphicSize(Std.int(subItem1.width * 1.5));
			subItem2.setGraphicSize(Std.int(subItem2.width * 1.5));
			subItem3.setGraphicSize(Std.int(subItem3.width * 1.5));
			subItem4.setGraphicSize(Std.int(subItem4.width * 1.5));
			subItem5.setGraphicSize(Std.int(subItem5.width * 1.5));
			mainItem.x = 150;
			mainItem.y = 400;
			subItem1.x = 300;
			subItem1.y = 400;
			subItem2.x = 450;
			subItem2.y = 400;
			subItem3.x = 600;
			subItem3.y = 400;
			subItem4.x = 750;
			subItem4.y = 400;
			subItem5.x = 900;
			subItem5.y = 400;
		}
		items.visible = true;
	}

	function ranSwitch()
	{
		choose.visible = true;
		pick.visible = false;
		greyButton.visible = true;
		greenButton.visible = true;
		redButton.visible = true;
		yellowButton.visible = true;
		lunarButton.visible = true;
		voidButton.visible = true;
		equipButton.visible = true;
		mainItem.destroy();
		subItem1.destroy();
		subItem2.destroy();
	}

	function hideAllButtons()
	{
		greyButton.visible = false;
		greenButton.visible = false;
		redButton.visible = false;
		yellowButton.visible = false;
		lunarButton.visible = false;
		voidButton.visible = false;
		equipButton.visible = false;
	}
}
