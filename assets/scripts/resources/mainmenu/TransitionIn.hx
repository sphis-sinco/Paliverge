import events.StateSwitchEvent;
import modules.Module;
import states.mainmenu.MainMenuState;

class TransitionIn extends Module
{
	override public function new()
	{
		super('mainmenu-transitionIn');
	}

	override function onStateSwitchPost(event:StateSwitchEvent)
	{
		super.onStateSwitchPost(event);

		if (event.state == 'MainMenuState')
		{
			var menu = MainMenuState.instance;

			for (option in menu.menuOptions)
			{
				option.alpha = 0;
				option.y -= 50;
			}

			MainMenuState.defaultTransitionIn();
		}
	}
}
