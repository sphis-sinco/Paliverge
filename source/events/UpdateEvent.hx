package events;

import modules.Module;
import modules.ModuleEvent;

class UpdateEvent extends ModuleEvent
{
	public var elapsed:Float;

	public function new(module:Module, elapsed:Float)
	{
                super(module);
		this.elapsed = elapsed;
	}

	override function toString():String
		return 'UpdateEvent(module: $module, elapsed: $elapsed)';
}
