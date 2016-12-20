package kiln.state;

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import hxfsm.integrations.callback.ICallbackState;
import kiln.Model;

/**
 * ...
 * @author GM
 */
class State extends EventDispatcher implements ICallbackState
{
	public function new(target:IEventDispatcher=null) 
	{
		super(target);
	}

	public function enter()
	{
		Main.model.startButtonActions !.add(startButtonWatcher);

	}
		
	public function exit()
	{
		
	}

	/**
	 * 
	 * @param	variable
	 */
	function startButtonWatcher(variable:Int) 
	{
		Main.model.startButtonActions !.remove(startButtonWatcher);
	}
	
}