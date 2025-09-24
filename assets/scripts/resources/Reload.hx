import events.UpdateEvent;
import flixel.FlxG;
import modding.PolymodHandler;
import modules.Module;

class Reload extends Module
{
        public var canReload:Bool = true;

	override public function new()
	{
		super('reload-resource');
	}

	override function onUpdate(event:UpdateEvent)
	{
		super.onUpdate(event);

                if (canReload && (FlxG.keys.justReleased.F4 || FlxG.keys.pressed.SHIFT && FlxG.keys.justReleased.FOUR))
                {
                        PolymodHandler.forceReloadAssets();
                }
	}
}
