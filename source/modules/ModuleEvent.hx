package modules;

class ModuleEvent
{
	public var module:Module;

	public function new(module:Module)
	{
		this.module = module;
	}
        
	public function toString():String
		return 'ModuleEvent(module: $module)';
}
