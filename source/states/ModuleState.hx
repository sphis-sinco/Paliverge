package states;

import events.CreateEvent;
import events.UpdateEvent;
import flixel.FlxState;
import modules.ModuleHandler;

class ModuleState extends FlxState
{
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

		ModuleHandler.callEvent(module ->
		{
			module.onCreate(new CreateEvent(module, id));
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		ModuleHandler.callEvent(module ->
		{
			module.onUpdate(new UpdateEvent(module, id, elapsed));
		});
	}

	override function destroy()
	{
		super.destroy();

		id = 'default';
	}
}
