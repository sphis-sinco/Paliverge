package states.levelselector;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import utils.ControlUtils;

class LevelSelectState extends ModuleState
{
	public static var instance:LevelSelectState = null;

	override public function new()
	{
		super('LevelSelectState');

		if (instance != null)
			instance = null;
		instance = this;
	}

	public var levels:FlxTypedGroup<Level>;

	public var camFollow:FlxObject;

	public var currentSelected:Int = 0;
	public var canSelect:Bool = true;

	public var noLevelsText:FlxText;

	override public function create()
	{
		super.create();

		levels = new FlxTypedGroup<Level>();
		add(levels);

		loadlevels();

		camFollow = new FlxObject(FlxG.width / 2);
		add(camFollow);

		FlxG.camera.follow(camFollow, LOCKON, .2);

		noLevelsText = new FlxText(0, 0, 0, "/!\\ No Levels /!\\", 16);
		noLevelsText.scrollFactor.set();
		noLevelsText.color = FlxColor.RED;
		noLevelsText.screenCenter();
		add(noLevelsText);

		noLevelsText.visible = levels.length < 1;

		levels.members[currentSelected].onSelect.dispatch();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (ControlUtils.getControlJustReleased('ui_up') && canSelect)
		{
			currentSelected--;
			if (currentSelected < 0)
				currentSelected = 0;

			levels.members[currentSelected].onSelect.dispatch();
			levels.members[currentSelected + 1].onUnselect.dispatch();
		}

		if (ControlUtils.getControlJustReleased('ui_down') && canSelect)
		{
			currentSelected++;
			if (currentSelected >= levels.members.length)
				currentSelected = levels.members.length - 1;

			levels.members[currentSelected].onSelect.dispatch();
			levels.members[currentSelected - 1].onUnselect.dispatch();
		}

		if (ControlUtils.getControlJustReleased('ui_accept') && canSelect)
		{
			levels.members[currentSelected].onSelected.dispatch();
		}

		for (level in levels.members)
		{
			if (level != null)
			{
				try
				{
					if (level.ID == currentSelected)
						camFollow.y = (FlxG.height / 2) + level.y - (level.height / 2);
				}
				catch (_) {}
			}
		}
	}

	override function destroy()
	{
		super.destroy();

		instance = null;
	}

	public function loadlevels()
	{
		var scriptedlevels = ScriptedLevel.listScriptClasses();
		trace('Found ${scriptedlevels.length} levels to load');
		var i = 0;
		var y = 0.0;
		for (level in scriptedlevels)
		{
			var newmod = ScriptedLevel.init(level, level);
			trace('* $level (${(newmod.active) ? 'actived: added' : 'in-active: not added'})');
			newmod.screenCenter(X);
			newmod.y = y;
			if (newmod.active)
			{
				y += newmod.height + (i * 32);
				newmod.ID = i;
				levels.add(newmod);
				i++;
			}
		}
	}

	public static function clearAllOptionTweens()
	{
		for (option in instance.levels)
			FlxTween.cancelTweensOf(option);
	}

	public static function defaultTransitionIn(?endCallback:Void->Void)
	{
		var i = 0;
		var y = 0.0;
		for (level in instance.levels)
		{
			FlxTween.tween(level, {alpha: 1, y: y}, 1);
			y += level.height + (i * 32);
			i++;
		}

		if (endCallback != null)
			endCallback();
	}

	public static function defaultTransitionOut(?endCallback:Void->Void)
	{
		for (level in instance.levels)
			FlxTween.tween(level, {alpha: 0, y: level.y - 25}, 1);

		if (endCallback != null)
			endCallback();
	}
}
