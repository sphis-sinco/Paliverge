package states;

import flixel.FlxG;
import flixel.FlxState;
import modding.PolymodHandler;
import utils.ControlUtils;
import utils.PathUtils;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		ControlUtils.save = new ControlsSave(PathUtils.getDataPath('controls.xml'));
		ControlUtils.save.load(ControlUtils.save.publicPath);

		PolymodHandler.forceReloadAssets();
		FlxG.switchState(() -> new states.mainmenu.MainMenuState());
	}
}
