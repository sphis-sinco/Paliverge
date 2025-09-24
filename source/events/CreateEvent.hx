package events;

import modules.ModuleEvent;

class CreateEvent extends ModuleEvent
{
	override function toString():String
		return 'CreateEvent(module: $module, state: $state)';
}
