package states.mainmenu;

import flixel.FlxSprite;
import flixel.util.FlxSignal;

class MainMenuOption extends FlxSprite
{
	public var id:String = 'default';

	public var onSelect:FlxSignal = new FlxSignal();
	public var onSelected:FlxSignal = new FlxSignal();
	public var onUnselect:FlxSignal = new FlxSignal();

	public function new(id:String)
	{
		super(0, 0);

		this.id = id;
	}

	override public function toString():String
		return 'MainMenuOption(id: $id)';
}
