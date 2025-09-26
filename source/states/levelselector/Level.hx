package states.levelselector;

import flixel.FlxSprite;
import flixel.util.FlxSignal;
import utils.PathUtils;

class Level extends FlxSprite
{
	public var id:String = 'default';

	public var onSelect:FlxSignal = new FlxSignal();
	public var onSelected:FlxSignal = new FlxSignal();
	public var onUnselect:FlxSignal = new FlxSignal();

	public function new(id:String, ?active:Bool = true)
	{
		super(0, 0);

		this.id = id;
		this.active = active;
		loadAsset();
	}

	public function loadAsset()
	{
		loadGraphic(PathUtils.getAssetPath('levels/$id', levelselect, png));
	}

	public function playAnimation(name:String)
		animation.play(name);

	override public function toString():String
		return 'LevelSelectOption(id: $id)';
}
