package events;

class FocusEvent
{
	public var focus_type:FocusEventTypeEnum;

	public function new(focus_type:FocusEventTypeEnum)
	{
		this.focus_type = focus_type;
	}

	public function toString():String
		return 'FocusEvent(focus_type: $focus_type)';
}

enum abstract FocusEventTypeEnum(String)
{
	var LOST = 'lost';
	var GAINED = 'gained';
}

class FocusEventType
{
	public static var LOST = FocusEventTypeEnum.LOST;
	public static var GAINED = FocusEventTypeEnum.GAINED;
}
