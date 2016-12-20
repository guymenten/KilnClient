package kiln.widgets;

import flash.events.Event;
import kiln.state.MainEvents;
import flash.display.Sprite;
import comp.StatusText;
import org.aswing.event.PropertyChangeEvent;

/**
 * ...
 * @author GM
 */
class WTempText extends WStatusText
{
	/**
	 * 
	 * @param	wIn
	 * @param	hIn
	 * @param	cSize
	 */
	public function new(wIn:Int = 100, hIn:Int = 20, cSize:Int = 18) 
	{
		super(wIn, hIn, cSize);
	}

	/**
	 * 
	 * @param	evt
	 */
	override function onPropertyChange(e:PropertyChangeEvent):Void
	{
		if (statusText != null)
		{
			statusText.setTextolor(Controller.statusTextColor);
			statusText.setBackgroundColor(Controller.statusBackColor);
			statusText.setText(cast Controller.measuredTemp + '°');
		}
	}
}