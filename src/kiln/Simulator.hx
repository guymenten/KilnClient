package kiln;

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import flash.events.TimerEvent;
import flash.utils.Timer;
import kiln.tools.TTS;

/**
 * 
 */
class Simulator extends EventDispatcher
{
	var timerSeconds:Timer;
	public var tempRamp				:Float = 1;

	public function new(target:IEventDispatcher=null) 
	{
		super(target);
		
		Main.model.loadCurrentLanguage();
		timerSeconds = new Timer(1000);
		timerSeconds.addEventListener(TimerEvent.TIMER, onTimer);
	
		timerSeconds.start();
	}

	/**
	 * 
	 * @param	e
	 */
	private function onTimer(e:TimerEvent):Void 
	{
		//Main.model.measuredTemp += cast((cast(Main.model.powerRate, Float) * tempRamp), Int);
	}

	/**
	 * 
	 */
	public function run() 
	{
		if (cast(Main.model.measuredTemp, Int) > cast(Main.model.fusingCurveModel.setPointTemp, Int))
		{
			Main.model.powerRate = 0;
			Main.model.measuredTemp -= cast((cast(Main.model.powerRate, Float) * tempRamp), Int);

		}
		else
		{
			Main.model.powerRate = 1;
			Main.model.measuredTemp += cast((cast(Main.model.powerRate, Float) * tempRamp), Int);
		}
	}
}
