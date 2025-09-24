package;

import flixel.FlxGame;
import modding.PolymodHandler;
import modules.ModuleHandler;
import openfl.display.Sprite;
#if sys
import sys.FileSystem;
#end

class Main extends Sprite
{
	public function new()
	{
		super();

		addChild(new FlxGame(0, 0, states.InitState));
	}
}
