import events.CreateEvent;
import events.UpdateEvent;
import flixel.FlxG;
import modules.Module;
import states.BlankState;

class StateShit extends Module
{
	override public function new()
	{
		super('state-shit');
	}

	override function onCreate(event:CreateEvent) {
		super.onCreate(event);

		trace(BlankState.instance.id);
	}

	override function onUpdate(event:UpdateEvent)
	{
		super.onUpdate(event);

		if (BlankState.instance.id == 'default' && FlxG.keys.justReleased.R)
			FlxG.switchState(() -> new BlankState('not-default'));
		if (BlankState.instance.id == 'not-default' && FlxG.keys.justReleased.R)
			FlxG.switchState(() -> new BlankState('default'));
	}
}
