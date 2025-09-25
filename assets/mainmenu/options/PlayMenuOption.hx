import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import states.mainmenu.MainMenuOption;
import states.mainmenu.MainMenuState;
import states.play.PlayState;

class PlayMenuOption extends MainMenuOption
{
	public var description:FlxText;

	override public function new()
	{
		super('play');

		description = new FlxText(0, 0, FlxG.width, "Jump right into gameplay", 16);
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

		onSelected.add(() ->
		{
			MainMenuState.instance.canSelect = false;
			MainMenuState.defaultTransitionOut(() ->
			{
				FlxG.switchState(() -> new PlayState());
			});
		});

		description.alpha = 0;
	}
}
