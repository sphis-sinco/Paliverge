package utils;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

class PathUtils
{
	public static function getAssetPath(path:String, folder:AssetFolders = blank, filetype:AssetTypes = none):String
		return 'assets/$folder$path$filetype';

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

enum abstract AssetFolders(String)
{
	var blank = '';
	var general = 'general/';
	var mainmenu = 'mainmenu/';
	var levelselect = 'levelselect/';
}

enum abstract AssetTypes(String)
{
	var none = '';

	var png = '.png';

	var txt = '.txt';
	var json = '.json';
	var xml = '.xml';

	var hx = '.hx';
	var hxc = '.hxc';
}
