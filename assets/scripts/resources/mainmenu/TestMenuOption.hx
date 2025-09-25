import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import states.mainmenu.MainMenuOption;

class TestMenuOption extends MainMenuOption
{
	public var description:FlxText;

	override public function new()
	{
		super('test');

		description = new FlxText(0, 0, FlxG.width, "This is a test Menu Option", 16);
		description.scrollFactor.set();
		description.color = FlxColor.WHITE;
		description.alignment = 'right';
		FlxG.state.add(description);

		onSelect.add(() ->
		{
			FlxTween.cancelTweensOf(description);
			FlxTween.tween(description, {alpha: 1}, .25);
		});

		onUnselect.add(() ->
		{
			FlxTween.cancelTweensOf(description);
			FlxTween.tween(description, {alpha: 0}, .25);
		});

		description.alpha = 0;
	}
}
