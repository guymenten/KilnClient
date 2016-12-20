package kiln.state;

import haxe.Timer;
import org.aswing.ASColor;

/**
 * 
 */
class StateColor
{
	static var alpha:Float = 1;
	
	static public var IdleStateText:ASColor 		= new ASColor(ASColor.MIDNIGHT_BLUE.getRGB(), alpha);
	static public var IdleStateBack:ASColor 		= new ASColor(ASColor.CLOUDS.getRGB(), alpha);

	static public var InitialisingStateText:ASColor = new ASColor(ASColor.MIDNIGHT_BLUE.getRGB(), alpha);
	static public var InitialisingStateBack:ASColor = new ASColor(ASColor.ORANGE.getRGB(), alpha);
	
	static public var StartingTextCol:ASColor 		= new ASColor(ASColor.MIDNIGHT_BLUE.getRGB(), alpha);
	static public var StartingBackCol:ASColor 		= new ASColor(ASColor.ORANGE.getRGB(), alpha);

	static public var RunningTextCol:ASColor 		= new ASColor(ASColor.ALIZARIN.getRGB(), alpha);
	static public var RunningBackCol:ASColor 		= new ASColor(ASColor.CLOUDS.getRGB(), alpha);

	static public var StoppingTextCol:ASColor 		= new ASColor(ASColor.MIDNIGHT_BLUE.getRGB(), alpha);
	static public var StoppingBackCol:ASColor 		= new ASColor(ASColor.MIDNIGHT_BLUE.getRGB(), alpha);

	static public var StoppedTextCol:ASColor 		= new ASColor(ASColor.CLOUDS.getRGB(), alpha);
	static public var StoppedBackCol:ASColor 		= new ASColor(ASColor.EMERALD.getRGB(), alpha);
	
	static public var InErrorTextCol:ASColor 		= new ASColor(ASColor.CLOUDS.getRGB(), alpha);
	static public var InErrorBackCol:ASColor 		= new ASColor(ASColor.ALIZARIN.getRGB(), alpha);

}

/**
 * ...
 * @author GM
 */
class Commands 
{

}
