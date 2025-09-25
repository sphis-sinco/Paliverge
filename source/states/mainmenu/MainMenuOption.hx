package states.mainmenu;

import flixel.FlxSprite;
import flixel.util.FlxSignal;
import utils.PathUtils;

class MainMenuOption extends FlxSprite
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
		loadGraphic(PathUtils.getAssetPath('options/$id', mainmenu, png), true, 256, 256);

		animation.add('idle', [0]);
		animation.add('selected', [1]);
	}

	public function playAnimation(name:String)
		animation.play(name);

	override public function toString():String
		return 'MainMenuOption(id: $id)';
}
