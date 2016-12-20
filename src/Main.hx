package;

import bindx.IBindable;
import comp.FlatLookAndFeel;
import flash.events.Event;
import kiln.Controller;
import kiln.Model;
import kiln.Simulator;
import kiln.View;
import org.aswing.AsWingManager;
import org.aswing.Component;
import org.aswing.UIManager;
import utest.Runner;
import utest.ui.Report;


/**
 * ...
 * @author GM
 */
class Main  extends Component implements IBindable
{
	public static var runner		:Runner;
	public static var model			:Model;
	public static var view			:View;
	public static var controller	:Controller;
	public static var simulator		:Simulator;

	public function new() 
	{
		super();

		AsWingManager.initAsStandard(stage);
		UIManager.setLookAndFeel(new FlatLookAndFeel());
		stage.addEventListener(Event.RESIZE, onResize);
		stage.addEventListener(Event.CLOSE, onClose);
		stage.application.onExit.add(onExit);

		runner 		= new Runner();
		model 		= new Model();
		view 		= new View();
		controller	= new Controller(model);
		simulator	= new Simulator();

		onResize(null);
		stage.color = 0x2c3e50;

		Report.create(runner);

		addChild(view);
		view.startView();
		controller.startController();

		runner.run();
	}
	
	private function onClose(e:Event):Void 
	{
		trace("Saving Default Values...");
	}
	/**
	 * 
	 * @param	code
	 */
	function onExit(code:Int):Void
	{
		trace("Saving Default Values...");
		//save();
	}
	
	/**
	 * 
	 * @param	e
	 */
	private function onResize(e:Event):Void 
	{
		var scaleX = stage.stageWidth / 800;
		var scaleY = stage.stageHeight / 480;

		var scale = Math.min(scaleX, scaleY);

		view.scaleX = scale;
		view.scaleY = scale;

		x = (stage.stageWidth - 800 * scale) / 2;
		y = (stage.stageHeight - 480 * scale) / 2;
	
	}

}
