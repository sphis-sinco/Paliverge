package modules;

class ModuleEvent
{
	public var module:Module;
	public var state:String;

	public function new(module:Module, state:String)
	{
		this.module = module;
		this.state = state;
	}
        
	public function toString():String
		return 'ModuleEvent(module: $module, state: $state)';
}
