import states.mainmenu.MainMenuOption;

class TemplateMainMenuOption extends MainMenuOption
{
	override public function new()
	{
		var option_id = 'test'; // this controls the img it looks for
		var option_active = false; // this controls if it actually is added to the list

		super(option_id, option_active);
	}

	override function loadAsset()
	{
		super.loadAsset();
	}

	override function playAnimation(name:String)
	{
		super.playAnimation(name);
	}

	override function toString():String
	{
		return super.toString();
	}
}
