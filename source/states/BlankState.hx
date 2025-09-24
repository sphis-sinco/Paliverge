package states;

import events.CreateEvent;
import events.UpdateEvent;
import flixel.FlxG;
import flixel.FlxState;
import modules.ModuleHandler;

class BlankState extends FlxState
{
	public static var instance:BlankState = null;

	public var id:String = 'default';

	override public function new(id:String)
	{
		super();

		this.id = id;
	}

	override public function create()
	{
		super.create();

		id ??= 'default';

		if (instance != null)
			instance = null;
		instance = this;

		ModuleHandler.callEvent(module ->
		{
			module.onCreate(new CreateEvent(module));
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		ModuleHandler.callEvent(module ->
		{
			module.onUpdate(new UpdateEvent(module, elapsed));
		});
	}

	override function destroy()
	{
		super.destroy();

		instance = null;
		id = 'default';
	}
}
