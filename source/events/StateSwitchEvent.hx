package events;

class StateSwitchEvent extends StateEvent
{
	override public function toString():String
		return 'StateSwitchEvent(state: $state)';
}
