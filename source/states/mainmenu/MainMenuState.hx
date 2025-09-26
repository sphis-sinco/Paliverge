package states.mainmenu;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import utils.ControlUtils;

class MainMenuState extends ModuleState
{
	public static var instance:MainMenuState = null;

	override public function new()
	{
		super('MainMenuState');

		if (instance != null)
			instance = null;
		instance = this;
	}

	public var menuOptions:FlxTypedGroup<MainMenuOption>;

	public var camFollow:FlxObject;

	public var currentSelected:Int = 0;
	public var canSelect:Bool = true;

	public var noMenuOptionsText:FlxText;

	override public function create()
	{
		super.create();

		menuOptions = new FlxTypedGroup<MainMenuOption>();
		add(menuOptions);

		loadMenuOptions();

		camFollow = new FlxObject(FlxG.width / 2);
		add(camFollow);

		FlxG.camera.follow(camFollow, LOCKON, .2);

		noMenuOptionsText = new FlxText(0, 0, 0, "/!\\ No Menu Options /!\\", 16);
		noMenuOptionsText.scrollFactor.set();
		noMenuOptionsText.color = FlxColor.RED;
		noMenuOptionsText.screenCenter();
		add(noMenuOptionsText);

		noMenuOptionsText.visible = menuOptions.length < 1;

		menuOptions.members[currentSelected].onSelect.dispatch();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (ControlUtils.getControlJustReleased('ui_up') && canSelect)
		{
			currentSelected--;
			if (currentSelected < 0)
				currentSelected = 0;

			menuOptions.members[currentSelected].onSelect.dispatch();
			menuOptions.members[currentSelected + 1].onUnselect.dispatch();
		}

		if (ControlUtils.getControlJustReleased('ui_down') && canSelect)
		{
			currentSelected++;
			if (currentSelected >= menuOptions.members.length)
				currentSelected = menuOptions.members.length - 1;

			menuOptions.members[currentSelected].onSelect.dispatch();
			menuOptions.members[currentSelected - 1].onUnselect.dispatch();
		}

		if (ControlUtils.getControlJustReleased('ui_accept') && canSelect)
		{
			menuOptions.members[currentSelected].onSelected.dispatch();
		}

		for (option in menuOptions.members)
		{
			if (option != null)
			{
				try
				{
					option.playAnimation((option.ID == currentSelected) ? 'selected' : 'idle');

					if (option.ID == currentSelected)
						camFollow.y = (FlxG.height / 2) + option.y - (option.height / 2);
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

	public function loadMenuOptions()
	{
		final customParams = {customParams: ['[Scriptloader // MainMenuOption]']};

		var scriptedMenuOptions = ScriptedMainMenuOption.listScriptClasses();
		trace('Found ${scriptedMenuOptions.length} main menu options to load', customParams);
		var i = 0;
		var y = 0.0;
		for (menuOption in scriptedMenuOptions)
		{
			var newmod = ScriptedMainMenuOption.init(menuOption, menuOption);
			trace('* $menuOption (${(newmod.active) ? 'actived: added' : 'in-active: not added'})', customParams);
			newmod.y = y;
			if (newmod.active)
			{
				y += newmod.height + (i * 32);
				newmod.ID = i;
				menuOptions.add(newmod);
				i++;
			}
		}
	}

	public static function clearAllOptionTweens()
	{
		for (option in instance.menuOptions)
			FlxTween.cancelTweensOf(option);
	}

	public static function defaultTransitionIn(?endCallback:Void->Void)
	{
		var i = 0;
		var y = 0.0;
		for (option in instance.menuOptions)
		{
			FlxTween.tween(option, {alpha: 1, y: y}, 1);
			y += option.height + (i * 32);
			i++;
		}

		if (endCallback != null)
			endCallback();
	}

	public static function defaultTransitionOut(?endCallback:Void->Void)
	{
		for (option in instance.menuOptions)
			FlxTween.tween(option, {alpha: 0, y: option.y - 25}, 1);

		if (endCallback != null)
			endCallback();
	}
}
