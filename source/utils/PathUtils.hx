package utils;

class PathUtils
{
        public static function getAssetPath(path:String):String
                return 'assets/$path';

        public static function getDataPath(path:String):String
                return getAssetPath('data/$path');

        public static function getImagePath(path:String):String
                return getAssetPath('images/$path.png');
}