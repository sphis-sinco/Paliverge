package states.mainmenu;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;
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

	override public function create()
	{
		super.create();

		menuOptions = new FlxTypedGroup<MainMenuOption>();
		add(menuOptions);

		loadMenuOptions();

		camFollow = new FlxObject(FlxG.width / 2);
		add(camFollow);

		FlxG.camera.follow(camFollow, LOCKON, .2);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (ControlUtils.getControlJustReleased('ui_up'))
		{
			currentSelected--;
			if (currentSelected < 0)
				currentSelected = 0;

			menuOptions.members[currentSelected].onSelect.dispatch();
			menuOptions.members[currentSelected + 1].onUnselect.dispatch();
		}

		if (ControlUtils.getControlJustReleased('ui_down'))
		{
			currentSelected++;
			if (currentSelected >= menuOptions.members.length)
				currentSelected = menuOptions.members.length - 1;

			menuOptions.members[currentSelected].onSelect.dispatch();
			menuOptions.members[currentSelected - 1].onUnselect.dispatch();
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
		var scriptedMenuOptions = ScriptedMainMenuOption.listScriptClasses();
		trace('Found ${scriptedMenuOptions.length} main menu options to load');
		var i = 0;
		var y = 0.0;
		for (menuOption in scriptedMenuOptions)
		{
			var newmod = ScriptedMainMenuOption.init(menuOption, menuOption);
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
}
