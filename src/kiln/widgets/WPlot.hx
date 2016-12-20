package kiln.widgets;

import kiln.calc.Enums.MinMax;
import kiln.tools.PlotGraph;
import openfl.display.BitmapData;
import openfl.events.MouseEvent;
import openfl.geom.Matrix;
import org.aswing.ASColor;
import org.aswing.Component;
import org.aswing.geom.IntRectangle;

/**
 * ...
 * @author GM
 */

class WPlot extends Component
{
	public var graphSetPoint:	PlotGraph;
	public var graphMeasured:	PlotGraph;
	public var XRange:		Int;
	public var drawAll		:Bool;

	var maxY:				Float;
	var minY:				Float;

	var iCount:				Int = 0;
	var rectPlot			:IntRectangle;

	public function new(name:String) 
	{
		super();

		XRange 		= 60;

		graphSetPoint 	= new PlotGraph();
		graphMeasured 	= new PlotGraph();

		graphSetPoint.setPlotColor(new ASColor(ASColor.PETER_RIVER.getRGB()));
		graphMeasured.setPlotColor(new ASColor(ASColor.ALIZARIN.getRGB()));
		
		this.cacheAsBitmap = true;
	}

	/**
	 * 
	 * @param	log
	 */
	public function setLinearYScale(linear:Bool):Void
	{
		graphSetPoint.setlinearScale(linear);
		graphMeasured.setlinearScale(linear);
	}

	/**
	 * 
	 */
	public function eraseValues():Void
	{
		graphMeasured.eraseValues();
		graphSetPoint.eraseValues();
		iCount = 0;
	}

	/**
	 * 
	 */
	public function resetMinAndMaxYValues() 
	{
		graphMeasured.resetMinAndMaxYValues();
		graphSetPoint.resetMinAndMaxYValues();
	}

	/**
	 * 
	 * @param	bmData
	 */
	public function drawBitmapObjectOnBm(bmData:BitmapData) 
	{
		//var mat:Matrix = new Matrix();
		//mat.translate(32, 32);
		//mat.scale(0.64, 0.64);
		
		graphMeasured.setDrawingOnPaper();
		drawOverlay(bmData);
		bmData.draw(graphMeasured, true);
		bmData.draw(graphSetPoint, true);
		graphMeasured.setDrawingOnScreen();
	}
	
	function drawOverlay(bmData:BitmapData, ?mat:Matrix) 
	{
		
	}

	/**
	 * 
	 */
	public function drawGrid():Void 
	{
		graphMeasured.drawGrid();
	}

	/**
	 * 
	 */
	public function pushValue(setPoint:SetPoint):MinMax
	{
		//graphMeasured.pushValue(setPoint.time, setPoint.temp,	false);
		//graphSetPoint.pushValue(setPoint.time, setPoint.temp, 	false);

		return new MinMax(Math.min(graphMeasured.minValueY, graphSetPoint.minValueY), Math.max(graphMeasured.maxValueY, graphSetPoint.maxValueY));
	}

	/**
	 * 
	 * @param	float
	 * @param	float1
	 * @param	float2
	 * @param	float3
	 */
	public function init(w:Int, h:Int, minX:Float, maxX:Float, minY:Float, maxY:Float) 
	{
		rectPlot = new IntRectangle(0, 0, w, h);

		/**
		 * Add watchers here
		 */
		Main.model.fusingCurveModel.fusingCurve !.add(refresh);
		//

		addChild(graphMeasured);
		addChild(graphSetPoint);

		graphMeasured.setLabels("T", "t°");
		graphSetPoint.setLabels("T", "t°");
		graphMeasured.x 	= rectPlot.x;
		graphSetPoint.x 	= rectPlot.x;

		graphMeasured.y 	= rectPlot.y;
		graphSetPoint.y 	= rectPlot.y;

		graphMeasured.init(0, 0, rectPlot.width, rectPlot.height, true);
		graphSetPoint.init(0, 0, rectPlot.width, rectPlot.height, false, mouseMoveFunc); // Overlay
		graphSetPoint.funcSetCursorText = funcSetCursorText;

		//setXYRange(minX, maxX, minY, maxY);
		//graphMeasured.setColorBackground(new ASColor(ASColor.MIDNIGHT_BLUE.getRGB()));
//
		//drawValues();
	}

	/**
	 * 
	 * @param	variable
	 */
	function refresh(variable:Dynamic)
	{
		graphSetPoint.setSetPoints(Main.model.fusingCurveModel.setPointTemps);
		setXYRange(0, Main.model.fusingCurveModel.timeSettingCurve, 20, Main.model.fusingCurveModel.maxTempFusingCurve + 100);
		drawValues();
	}

	/**
	 * 
	 * @param	value
	 * @return
	 */
	function funcSetCursorText(point:Points) :String
	{
		var str:String = cast (point.Y);
		str += '°, ' + Main.model.fusingCurveModel.setPointTemps.getDegreesPerhour(point.X) + '°/h';

		return str;
	}


	/**
	 * 
	 * @param	e
	 */
	function mouseMoveFunc(e:MouseEvent) 
	{
		//graphMeasured.showValuesUnderCursor(e);
		graphSetPoint.showValuesUnderCursor(e);
	}

	/**
	 * 
	 */
	public function drawValues():Void
	{
		graphMeasured.drawValues();
		graphSetPoint.drawValues();
	}

	public function setXRange(minXIn:Float, maxXIn:Float):Void
	{
		graphMeasured.setXRange(minXIn, maxXIn);
		graphSetPoint.setXRange(minXIn, maxXIn);
	}

	/**
	 * 
	 * @param	minXIn
	 * @param	maxXIn
	 */
	public function setYRange(minMax:MinMax):Void
	{
		graphMeasured.setYRange(minMax);
		graphSetPoint.setYRange(minMax);
	}

	/**
	 * 
	 * @param	rangeX
	 * @param	minY
	 * @param	maxY
	 */
	public function setXYRange(minXIn:Float, maxXIn:Float, minYIn:Float, maxYIn:Float):Void
	{
		setXRange(minXIn, maxXIn);
		setYRange(new MinMax(minYIn, maxYIn));
	}

}
	