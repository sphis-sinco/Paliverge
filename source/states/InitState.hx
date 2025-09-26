package states;

import flixel.FlxG;
import flixel.FlxState;
import haxe.Log;
import modding.PolymodHandler;
import utils.ControlUtils;
import utils.PathUtils;

class InitState extends FlxState
{
	override function create()
	{
		super.create();

		ControlUtils.save = new ControlsSave(PathUtils.getAssetPath('controls', general, xml));
		ControlUtils.save.load(ControlUtils.save.publicPath);

		PolymodHandler.forceReloadAssets();

		#if (starting_state == "gameplay")
		FlxG.switchState(() -> new states.mainmenu.MainMenuState());
		#else
		FlxG.switchState(() -> new states.mainmenu.MainMenuState());
		#end
	}
}
