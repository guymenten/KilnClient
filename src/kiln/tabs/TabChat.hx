package kiln.tabs;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.text.TextField;
import jsoni18n.I18n;
import kiln.Model.ClientModel;
import openfl.Lib;
import org.aswing.JTextArea;
import org.aswing.JTextField;

/**
 * ...
 * @author GM
 */
class TabChat extends TabsBase
{
	var tf 	:JTextField;
	var log :JTextArea;
	var model:ClientModel;

	public function new() 
	{
		super();
		
		init();
		
		model = Main.model.clientModel;
			
		/**
		 * Add watchers here
		 */
		model.connected 			!.add(onClientConnectedWatcher);
		model.textToDisplayNumber 	!.add(onTextDisplayWatcher);
		model.textIdentify		 	!.add(onTextIdentifyWatcher);
		//
	}
	
	/**
	 * 
	 * @param	value
	 */
	function onTextDisplayWatcher(number:Int) 
	{
		display(model.textToDisplay);
	}

	/**
	 * 
	 * @param	text
	 */
	function onTextIdentifyWatcher(text:String) 
	{
		display(text);
	}

	/**
	 * 
	 * @param	event
	 */
	function onClientConnectedWatcher(connected:Bool):Void
	{
		tf.setEnabled(connected);
		log.setEnabled(connected);
		display(connected ? I18n.tr("TabChat/EnterName") : I18n.tr("TabChat/Disconnected"));
	}
	
	/**
	 * 
	 * @param	event
	 */
	function init():Void
	{
		// create an input textfield
		tf 					= new JTextField();
		tf.setComBoundsXYWH(X1, Y9, TabsBase.xWidth - X1 * 2, butH);
		tf.setFont(tf.getFont().changeSize(24));

		addChild(tf);
		addEventListener(flash.events.KeyboardEvent.KEY_DOWN, onKeyDown);
		
		log 					= new JTextArea();
		log.setEditable(false);
		log.setWordWrap(true);
		log.setComBoundsXYWH(X1, Y2, TabsBase.xWidth - X1 * 2, Y7);
		log.setFont(tf.getFont().changeSize(fontSize));
		tf.fontValidated = true;

		addChild(log);
		onClientConnectedWatcher(false);
	}
	
	function onKeyDown(event:flash.events.KeyboardEvent):Void
	{
		// ENTER pressed ?
		if( event.keyCode == 13 ) {
			var text = tf.text;
			tf.text = "";
			send(text);
		}
	}

	function send( text : String )
	{
		if( model.userName == "" ) {
			model.userName = text;
			model.textIdentify = text;
			return;
		}
		model.textToSay = text;
		model.textToSayNumber ++;
	}

	function display( line : String )
	{
		//var bottom = (log.scrollV == log.maxScrollV);
		log.htmlText += line + "<br>";
		log.scrollToBottomLeft();
		//if( bottom )
			//log.scrollV = log.maxScrollV;
	}

}