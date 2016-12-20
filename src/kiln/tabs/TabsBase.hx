package kiln.tabs;

import flash.events.Event;
import org.aswing.Component;

/**
 * ...
 * @author ^GM
 */
class TabsBase extends Component 
{
	static public inline var adjH			:Int = 40;
	static public inline var adjW			:Int = 120;
	static public inline var compScale		:Float = 1;
	static public inline var xWidth			:Float = 800;

	private var X1				:Int = 10;
	private var X2				:Int = 220;
	private var X3				:Int = 320;
	private var X4				:Int = 420;
	private var X5				:Int = 520;
	private var X6				:Int = 540;
	private var X7				:Int = 660;

	private var Y1				:Int = 8;
	private var Y2				:Int = 48;
	private var Y3				:Int = 88;
	private var Y4				:Int = 128;
	private var Y5				:Int = 168;
	private var Y6				:Int = 208;
	private var Y7				:Int = 248;
	private var Y8				:Int = 288;
	private var Y9				:Int = 328;
	private var Y10				:Int = 368;
	private var Y11				:Int = 408;
	private var Y12				:Int = 448;

	private var bottomY			:Int = 420;
	private var butH			:Int = 44;
	private var butD			:Int = 48;
	private var butW			:Int = 100;
	private var cbW				:Int = 180;
	var butY					:Int = 20;
	var fontSize				:Int = 18;

	public function new() 
	{
		super();
		
		setVisible(false);
		
		addEventListener(Event.ADDED, onAdded);
	}
	
	private function onAdded(e:Event):Void 
	{
		
	}
	
}