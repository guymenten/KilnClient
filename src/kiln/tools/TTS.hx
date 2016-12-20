package kiln.tools;

import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import kiln.state.State;
import openfl.Assets;
import openfl.media.Sound;
import openfl.Lib;
import org.aswing.event.PropertyChangeEvent;
import org.aswing.event.StateChangeEvent;

/**
 * ...
 * @author GM
 */
class TTS extends EventDispatcher
{
	public function new(target:IEventDispatcher=null) 
	{
		super(target);
	}

	/**
	 * 
	 * @param	text
	 */
	public static function playSound(text:String)
	{
		if (Main.model.soundEnabled)
		{
			var sound:Sound = Assets.getSound("audio/" + text + ".wav");
		}
	}

	/**
	 * 
	 * @param	text
	 */
	public static function setText(text:String)
	{
		if (Main.model.chkTTSModel.voiceEnabled)
		{
			var sound:Sound = Assets.getSound("audio/" + text + '_' + Main.model.getLanguageExtensionName() + ".wav");

			trace(text);

			if(sound != null)
				sound.play();
			
			//var args:String =  " -f 10 -v 0 " + "\"" + text + "\"";
			//Lib.fscommand("tts.exe" , args);
			//Lib.fscommand("exec", "fscommand\\tts.exe" + args);
		}
	}

}