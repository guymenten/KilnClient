package kiln.widgets;

import Date;
import DateTools;
import kiln.tools.DateFormat;
import org.aswing.ASColor;
//import events.PanelEvents;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.TimerEvent;
import flash.utils.Timer;
import org.aswing.JLabel;
import org.aswing.geom.IntRectangle;

/**
 * ...
 * @author GM
 */
class WTime extends Sprite
{
	var dateText		:JLabel;
	var timeText		:JLabel;
	var timerSeconds	:Timer;
	var w				:Float = 140;
	var h				:Float = 24;

	public function new(name:String, wIn:Float, hin:Float) 
	{
		super();

		dateText 	= new JLabel();
		timeText 	= new JLabel();

		dateText.setBounds(new IntRectangle(10, 22, cast w, cast h));
		dateText.setAlignmentX(0.5);
		dateText.setFont(timeText.getFont().changeSize(12));
		graphics.beginFill(ASColor.CLOUDS.getRGB());
		graphics.drawRoundRect(x, y, w, h * 2, 8, 8);
		graphics.endFill();
		addChild(dateText);

		timeText.setBounds(new IntRectangle(0, 0, 140, 32));
		dateText.setAlignmentX(0.5);
		timeText.setFont(timeText.getFont().changeSize(20));
		addChild(timeText);

		timerSeconds = new Timer(1000);
		timerSeconds.addEventListener(TimerEvent.TIMER, onTimer);

		timerSeconds.start();
	}

	/**
	 * 
	 * @param	e
	 */
	private function onTimer(e:Event):Void 
	{
		//Main.root1.dispatchEvent(new Event(PanelEvents.EVT_CLOCK)); // restart the BKG measurement
		var date:Date = Date.now();
		dateText.setText(DateFormat.getDateString(date));
		timeText.setText(DateTools.format(date, "%H:%M:%S"));
		//trace("Idle 			: " + NativeApplication.nativeApplication.timeSinceLastUserInput);
	}
}