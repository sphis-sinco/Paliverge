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

		Log.trace = function(v, ?infos)
		{
			var customParams = '';

			if (infos.customParams != null)
			{
				var i = 1;
				for (param in infos.customParams)
				{
					customParams += '$param';
					if (i < infos.customParams.length)
						customParams += '';
					i++;
				}
			}

			var str = '${(infos.customParams == null) ? '[${infos.fileName}:${infos.lineNumber}] ' : '[${customParams}] '}$v';
			#if js
			if (js.Syntax.typeof(untyped console) != "undefined" && (untyped console).log != null)
				(untyped console).log(str);
			#elseif lua
			untyped __define_feature__("use._hx_print", _hx_print(str));
			#elseif sys
			Sys.println(str);
			#else
			throw new haxe.exceptions.NotImplementedException()
			#end
		}
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
