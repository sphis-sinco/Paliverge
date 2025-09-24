package states;

class MainMenuState extends ModuleState
{
	public static var instance:MainMenuState = null;

	override public function new()
	{
		super('MainMenuState');
		
		if (instance != null)
			instance = null;
		instance = this;
	}

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	override function destroy()
	{
		super.destroy();

		instance = null;
	}
}
