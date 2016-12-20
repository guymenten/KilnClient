package kiln.widgets;

//import events.PanelEvents;
import org.aswing.event.PropertyChangeEvent;
import comp.StatusText;

/**
 * ...
 * @author GM
 */
class WStatusText extends WBase
{
	var statusText:StatusText;

	public function new(name:String, wIn:Int = 100, hIn:Int = 20, cSize:Int = 18) 
	{
		super();

		Main.mainPane.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onStateRefresh);
		statusText = new StatusText(wIn, hIn, cSize); // Width as Input
		addChild(statusText);
	}

	/**
	 * 
	 * @param	evt
	 */
	function onStateRefresh(evt:PropertyChangeEvent):Void
	{
		if (statusText != null)
		{
			//statusText.setTextolor(Session.panelStateMachine.getStateTextColor());
			//statusText.setBackgroundColor(Session.panelStateMachine.getStateBackgroundColor());
			//statusText.setText(Session.panelStateMachine.getStatusTextLabel());
		}
	}
}