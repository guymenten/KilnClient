package kiln.tabs;
import haxe.remoting.HttpAsyncConnection;
import jsoni18n.I18n;
import kiln.tabs.TabsBase;
import org.aswing.JCheckBox;

/**
 * ...
 * @author GM
 */
class TabSounds extends TabsBase
{
	var chkTTS:JCheckBox;
	var chkOut:JCheckBox;

	public function new() 
	{
		super();

		chkTTS = new JCheckBox(I18n.tr("TabAlarms/Voice"));
		chkTTS.setModel(Main.model.chkTTSModel);
		chkTTS.setAwmlID_XYWH("sound", X1, Y2, butW, butH);
		addChild(chkTTS);

		chkOut = new JCheckBox(I18n.tr("TabAlarms/Voice"));
		chkOut.setAwmlID_XYWH("out", X1, Y4, butW, butH);
		addChild(chkOut);
		chkOut.addActionListener(onChkout);
		// Add Watchers here:
		Main.model.arduinoModel.pin2!.add(pin2Watcher);
	}

	/**
	 * 
	 * @param	value
	 */
	function pin2Watcher(value:Int) 
	{
		chkOut.setSelected(cast value);
	}

	function display(v) {
		trace(v);
	}

	function onChkout(e:Dynamic) 
	{
		trace("onChkout " + chkOut.isSelected() );
		var val:Int = cast(chkOut.isSelected());
		Main.controller.client.writeDigitalPin(2, val);
	}
}