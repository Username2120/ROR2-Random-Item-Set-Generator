package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.input.mouse.FlxMouse;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;

class TitleState extends FlxState
{
	public var usingdlc:FlxText;
	public var changeText:FlxTimer;
	public var usingran:FlxText;

	public var openedOptions = false;

	public var dlcToggle:Bool = FlxG.save.data.dlcToggle;
	public var ranToggle:Bool = FlxG.save.data.ranToggle;

	override public function create()
	{
		var titleText = new FlxText(0, 300, 0, "Risk of Rain 2 Random Item Generator", 46, true);
		titleText.screenCenter(X);
		add(titleText);

		var enter = new FlxText(0, 500, 0, "Press Enter To Begin", 32, true);
		enter.screenCenter(X);
		add(enter);

		var optionsButton = new FlxButton(900, 700, "Options Button", function()
		{
			openedOptions = true;
			openSubState(new OptionSubState());
		});
		add(optionsButton);

		if (!dlcToggle || FlxG.save.data.dlcToggle == null)
		{
			usingdlc = new FlxText(0, 400, 0, "You are not using the dlc", 24, true);
			usingdlc.screenCenter(X);
			add(usingdlc);
		}
		else if (dlcToggle && FlxG.save.data.dlcToggle != null)
		{
			usingdlc = new FlxText(0, 400, 0, "You are using the dlc", 24, true);
			usingdlc.screenCenter(X);
			add(usingdlc);
		}
		if (!ranToggle || FlxG.save.data.ranToggle == null)
		{
			usingran = new FlxText(0, 450, 0, "You are not using random items", 24, true);
			usingran.screenCenter(X);
			add(usingran);
		}
		else if (ranToggle && FlxG.save.data.ranToggle != null)
		{
			usingran = new FlxText(0, 450, 0, "You are using random items", 24, true);
			usingran.screenCenter(X);
			add(usingran);
		}

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ENTER)
			FlxG.switchState(new PlayState());
		if (openedOptions)
		{
			changeText = new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				dlcToggle = OptionSubState.get_dlcToggle();
				ranToggle = OptionSubState.get_ranToggle();
				if (dlcToggle)
				{
					usingdlc.text = "You are using the dlc";
					usingdlc.screenCenter(X);
				}
				else if (!dlcToggle)
				{
					usingdlc.text = "You are not using the dlc";
					usingdlc.screenCenter(X);
				}
				if (ranToggle)
				{
					usingran.text = "You are using random items";
					usingran.screenCenter(X);
				}
				else if (!ranToggle)
				{
					usingran.text = "You are not using random items";
					usingran.screenCenter(X);
				}
			}, 9999);
		}
		super.update(elapsed);
	}
}
