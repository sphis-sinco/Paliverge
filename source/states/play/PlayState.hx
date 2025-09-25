package states.play;

class PlayState extends ModuleState
{
	public static var instance:PlayState = null;

	override public function new()
	{
		super('PlayState');

		if (instance != null)
			instance = null;
		instance = this;
	}

	override function create()
	{
		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
