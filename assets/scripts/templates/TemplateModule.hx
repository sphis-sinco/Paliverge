import events.CreateEvent;
import events.FocusEvent;
import events.StateSwitchEvent;
import events.UpdateEvent;
import modules.Module;

class TemplateModule extends Module
{
	override public function new()
	{
		super('template-module');
	}

	override function destroy()
	{
		super.destroy();
	}

	override function onCreate(event:CreateEvent)
	{
		super.onCreate(event);
	}

	override function onUpdate(event:UpdateEvent)
	{
		super.onUpdate(event);
	}

	override function onFocusGained(event:FocusEvent)
	{
		super.onFocusGained(event);
	}

	override function onFocusLost(event:FocusEvent)
	{
		super.onFocusLost(event);
	}

	override function onStateSwitchPre(event:StateSwitchEvent)
	{
		super.onStateSwitchPre(event);
	}

	override function onStateSwitchPost(event:StateSwitchEvent)
	{
		super.onStateSwitchPost(event);
	}

	override function toString():String
	{
		return super.toString();
	}
}
