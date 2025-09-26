import events.StateSwitchEvent;
import modules.Module;
import states.levelselector.LevelSelectState;
import states.mainmenu.MainMenuState;

class LevelSelectTransitionIn extends Module
{
	override public function new()
	{
		super('levelselect-transitionIn');
	}

	override function onStateSwitchPost(event:StateSwitchEvent)
	{
		super.onStateSwitchPost(event);

		if (event.state == 'LevelSelectState')
		{
			var menu = LevelSelectState.instance;

			for (option in menu.levels)
			{
				option.alpha = 0;
				option.y -= 50;
			}

			LevelSelectState.defaultTransitionIn();
		}
	}
}
