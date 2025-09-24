package events;

import modules.Module;
import modules.ModuleEvent;

class UpdateEvent extends ModuleEvent
{
	public var elapsed:Float;

	public function new(module:Module, state:String, elapsed:Float)
	{
		super(module, state);
		this.elapsed = elapsed;
	}

	override function toString():String
		return 'UpdateEvent(module: $module, state: $state, elapsed: $elapsed)';
}
