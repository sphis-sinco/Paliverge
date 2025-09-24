package events;

class StateEvent
{
	public var state:String;

	public function new(state:String)
	{
		this.state = state;
	}
        
	public function toString():String
		return 'StateEvent(state: $state)';
}
