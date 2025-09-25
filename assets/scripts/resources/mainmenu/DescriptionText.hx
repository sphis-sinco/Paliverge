import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import modules.Module;

class DescriptionText extends Module
{
	public var textField:FlxText;

	override public function new()
	{
		super('mainmenu-description-text');
	}

	public function initTextField()
	{
		textField = new FlxText(0, 0, FlxG.width, "", 16);
		textField.scrollFactor.set();
		textField.color = FlxColor.WHITE;
		textField.alignment = 'right';
		textField.alpha = 0;
	}

	public function displayTextField()
	{
		FlxTween.cancelTweensOf(textField);
		FlxTween.tween(textField, {alpha: 1}, .25);
	}

	public function hideTextField()
	{
		FlxTween.cancelTweensOf(textField);
		FlxTween.tween(textField, {alpha: 0}, .25);
	}
}
