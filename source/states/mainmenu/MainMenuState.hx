package states.mainmenu;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxSpriteGroup;

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

	public static var menuOptions:FlxTypedGroup<MainMenuOption>;

	override public function create()
	{
		super.create();

		if (menuOptions == null)
			loadMenuOptions();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	override function destroy()
	{
		super.destroy();

		instance = null;
	}

	public static function destroyMenuOptions()
	{
		if (menuOptions.length > 0)
			for (menuOption in menuOptions)
			{
				menuOption.destroy();
				menuOptions.remove(menuOption);
			}
	}

	public static function loadMenuOptions()
	{
		destroyMenuOptions();

		if (menuOptions == null)
			menuOptions = new FlxTypedGroup<MainMenuOption>();

		var newModules = ScriptedMainMenuOption.listScriptClasses();
		trace('Found ${newModules.length} main menu options to load');
		for (module in newModules)
		{
			var newmod = ScriptedMainMenuOption.init(module, module);
			menuOptions.add(newmod);
		}
	}
}
