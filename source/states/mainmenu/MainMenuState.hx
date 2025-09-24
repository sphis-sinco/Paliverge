package states.mainmenu;

import flixel.FlxG;
import flixel.FlxObject;
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

	public var safeMenuOptions:FlxTypedGroup<MainMenuOption>;

	public var camFollow:FlxObject;

	public var currentSelected:Int = 0;

	override public function create()
	{
		super.create();

		if (menuOptions == null)
			loadMenuOptions();

		safeMenuOptions = new FlxTypedGroup<MainMenuOption>();
		for (option in menuOptions.members)
			safeMenuOptions.add(option);

		camFollow = new FlxObject(FlxG.width / 2);
		add(camFollow);

		FlxG.camera.follow(camFollow, LOCKON, .1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		for (option in safeMenuOptions.members)
		{
			option.playAnimation((option.ID == currentSelected) ? 'selected' : 'idle');

			if (option.ID == currentSelected)
				camFollow.y = option.y;
		}
	}

	override function destroy()
	{
		super.destroy();

		instance = null;
	}

	public static function destroyMenuOptions()
	{
		if (menuOptions == null)
			return;

		if (menuOptions.members.length > 0)
			for (menuOption in menuOptions)
			{
				menuOption.destroy();
				menuOptions.members.remove(menuOption);
			}
	}

	public static function loadMenuOptions()
	{
		destroyMenuOptions();

		if (menuOptions == null)
			menuOptions = new FlxTypedGroup<MainMenuOption>();

		var scriptedMenuOptions = ScriptedMainMenuOption.listScriptClasses();
		trace('Found ${scriptedMenuOptions.length} main menu options to load');
		var i = 0;
		for (menuOption in scriptedMenuOptions)
		{
			var newmod = ScriptedMainMenuOption.init(menuOption, menuOption);
			newmod.ID = i;
			menuOptions.add(newmod);
			i++;
		}
	}
}
