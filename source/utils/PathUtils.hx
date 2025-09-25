package utils;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

class PathUtils
{
	public static function getAssetPath(path:String):String
		return 'assets/$path';

	public static function getDataPath(path:String):String
		return getAssetPath('data/$path');

	public static function getImagePath(path:String):String
		return getAssetPath('images/$path.png');

	public static function saveContent(path:String, content:String)
	{
		#if sys
		File.saveContent(path, content);
		#end
	}

	public static function pathExists(id:String):Bool
	{
		#if sys
		return FileSystem.exists(id);
		#else
		return Assets.exists(id);
		#end
	}

	public static function getText(id:String):String
	{
		#if sys
		return File.getContent(id);
		#else
		return Assets.getText(id);
		#end
	}
}
