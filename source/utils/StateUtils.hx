package utils;

import flixel.FlxG;

class StateUtils
{
	public static function getCurrentState():String
	{
		if (FlxG.state == null)
			return 'Unknown';
		var cls = Type.getClass(FlxG.state);
		if (cls == null)
			return 'Unknown';
		var name = Type.getClassName(cls);
		return name != null ? name.split('.').pop() : 'Unknown';
	}
}
