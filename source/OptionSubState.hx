package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.ui.FlxUICheckBox;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxSave;

class OptionSubState extends FlxSubState
{
	public var dlcToggleCheckBox:FlxUICheckBox;
	public var randomToggleCheckBox:FlxUICheckBox;

	public static var dlcToggle(get, null):Bool = false;
	public static var ranToggle(get, null):Bool = false;

	override public function create()
	{
		if (FlxG.save.data.ranToggle != null && FlxG.save.data.dlcToggle != null)
		{
			dlcToggle = FlxG.save.data.dlcToggle;
			ranToggle = FlxG.save.data.ranToggle;
			trace("dlc save is " + dlcToggle);
			trace("ran save is " + ranToggle);
		}
		// this is more or less a fall back to prevent null object references
		else if (FlxG.save.data.ranToggle == null || FlxG.save.data.dlcToggle == null)
		{
			FlxG.save.data.dlcToggle = dlcToggle;
			FlxG.save.data.ranToggle = ranToggle;
			trace("fresh save");
		}
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.8;
		add(bg);

		var optionsText = new FlxText(0, 200, 0, "Options", 46, true);
		optionsText.screenCenter(X);
		add(optionsText);

		dlcToggleCheckBox = new FlxUICheckBox(0, 400, null, null, "", 100, null, function()
		{
			if (dlcToggle)
			{
				dlcToggle = false;
				dlcToggleCheckBox.mark.visible = false;
				trace("dlc is false");
			}
			else if (!dlcToggle)
			{
				dlcToggle = true;
				dlcToggleCheckBox.mark.visible = true;
				trace("dlc is true");
			}
			FlxG.save.data.dlcToggle = dlcToggle;
		});
		if (dlcToggle)
			dlcToggleCheckBox.mark.visible = true;
		dlcToggleCheckBox.screenCenter(X);
		dlcToggleCheckBox.box.setGraphicSize(Std.int(dlcToggleCheckBox.box.width * 2.2));
		dlcToggleCheckBox.mark.setGraphicSize(Std.int(dlcToggleCheckBox.mark.width * 2.2));
		add(dlcToggleCheckBox);

		randomToggleCheckBox = new FlxUICheckBox(0, 500, null, null, "", 100, null, function()
		{
			if (ranToggle)
			{
				ranToggle = false;
				randomToggleCheckBox.mark.visible = false;
				trace("ran is false");
			}
			else if (!ranToggle)
			{
				ranToggle = true;
				randomToggleCheckBox.mark.visible = true;
				trace("ran is true");
			}
			FlxG.save.data.ranToggle = ranToggle;
		});
		if (ranToggle)
			randomToggleCheckBox.mark.visible = true;
		randomToggleCheckBox.screenCenter(X);
		randomToggleCheckBox.box.setGraphicSize(Std.int(randomToggleCheckBox.box.width * 2.2));
		randomToggleCheckBox.mark.setGraphicSize(Std.int(randomToggleCheckBox.mark.width * 2.2));
		add(randomToggleCheckBox);

		// had to make this seperate text to scale it properly with the boxes
		var dlcText = new FlxText(dlcToggleCheckBox.box.x + 30, dlcToggleCheckBox.box.y - 20, 230, "Are you using dlc?", 20, true);
		add(dlcText);

		var ranText = new FlxText(randomToggleCheckBox.box.x + 30, randomToggleCheckBox.box.y - 20, 330,
			"Has you choose between 3 random items when you get a drop", 20, true);
		add(ranText);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ESCAPE || FlxG.keys.justReleased.BACKSPACE)
		{
			FlxG.save.flush();
			trace("flushed");
			close();
		}
		super.update(elapsed);
	}

	public static function get_dlcToggle():Bool
		return dlcToggle;

	public static function get_ranToggle():Bool
		return ranToggle;
}
