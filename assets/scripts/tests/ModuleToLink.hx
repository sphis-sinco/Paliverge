import events.CreateEvent;
import events.FocusEvent;
import events.UpdateEvent;
import modules.Module;

class ModuleToLink extends Module
{
	public var linked:Bool = false;

	override public function new()
	{
		super('module-to-link');
	}

	override function onFocusGained(event:FocusEvent)
	{
		super.onFocusGained(event);

		trace('Linked: ' + linked);
	}
}
