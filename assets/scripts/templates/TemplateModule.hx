import events.CreateEvent;
import events.UpdateEvent;
import modules.Module;

class TemplateModule extends Module
{
	override public function new()
	{
		super('template-module');
	}

	override function onCreate(event:CreateEvent)
	{
		super.onCreate(event);

		trace(event.module);
	}

	override function onUpdate(event:UpdateEvent)
	{
		super.onUpdate(event);
	}
}
