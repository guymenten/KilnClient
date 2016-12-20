package kiln.tabs;

import comp.JAdjuster;
import comp.JComboBox;
import flash.events.Event;
import jsoni18n.I18n;
import kiln.persistent.FusingCurves.FusingCurve;
import kiln.widgets.WPlot;
import org.aswing.JTextField;
import org.aswing.event.InteractiveEvent;
import org.aswing.event.ListItemEvent;

/**
 * ...
 * @author GM
 */
class TabSetPoints extends TabsBase
{
	private var plot		:WPlot;
	var cbCurves			:JComboBox;
	var txtComment			:JTextField;
	var adjDelay			:JAdjuster;
	var adjTemp				:JAdjuster;


	public function new() 
	{
		super();

		plot = new WPlot("plot");
		plot.x = X3;
		plot.y = Y4;
		addChild(plot);
		plot.init(400, 200, 0, 10000, 0, 1400);
		plot.drawGrid();
		/*
		 * Add Watchers here
		 */
		Main.model.fusingCurveModel.fusingCurve !.add(setPointsPlotWatcher);
		Main.model.timeElapsed 					!.add(measuredTemperaturesPlotWatcher);
		Main.model.currentSelectedTemperature 	!.add(currentSelectedTemperatureWatcher);
		Main.model.selectingPoint 				!.add(selectingPointWatcher);
		Main.model.selectionEnabled				!.add(selectionEnabled);
		//
		txtComment 	= new JTextField();
		txtComment.setComBoundsXYWH(cast plot.x, Y3, 400, 34);

		addChild(txtComment);

		cbCurves = new JComboBox(I18n.tr("TabSetPoints/Curve"), "curves.svg");
		addChild(cbCurves);
		cbCurves.setComBoundsXYWH(X1, Y3, cbW, butH);

		cbCurves.getPopupList().addEventListener(ListItemEvent.ITEM_ROLL_OVER, oncbCRollOver);
		cbCurves.getPopupList().addEventListener(ListItemEvent.ITEM_ROLL_OUT, oncbCReleaseout);
		cbCurves.addEventListener(InteractiveEvent.SELECTION_CHANGED, oncbCSetPoints);

		cbCurves.setModel(Main.model.fusingCurveModel.fusingCurves.vecNames);
	
		adjDelay = new JAdjuster("TabSetPoints/Duration",  "duration.svg");
		adjDelay.setComBoundsXYWH(X1, Y5, TabsBase.adjW, TabsBase.adjH);
		adjDelay.addActionListener(onDelayAdjusted);
		addChild(adjDelay);

		adjTemp = new JAdjuster("TabSetPoints/Temperature",  "temperature.svg");
		adjTemp.setComBoundsXYWH(X1, Y8, TabsBase.adjW, TabsBase.adjH);
		adjTemp.setValues(Main.model.kilnTempRangeModel.getMinimum(), Main.model.kilnTempRangeModel.getExtent(), Main.model.kilnTempRangeModel.getMinimum(), Main.model.kilnTempRangeModel.getMaximum());
		adjTemp.addActionListener(onTempAdjusted);
		adjTemp.stepSize = Main.model.kilnTempRangeStepSize;
		addChild(adjTemp);
	}

	/**
	 * 
	 * @param	selecting
	 */
	function selectingPointWatcher(selecting:Bool) 
	{
		adjTemp.setEnabled(selecting);
		adjDelay.setEnabled(selecting);
		cbCurves.setEnabled(!selecting);
	}

	/**
	 * 
	 * @param	value
	 */
	function onDelayAdjusted(value:Dynamic) 
	{
	}

	/**
	 * 
	 * @param	value
	 */
	function onTempAdjusted(value:Dynamic) 
	{
		Main.model.currentSelectedTemperature = adjTemp.getValue();
	}

	/**
	 * 
	 * @param	value
	 */
	function currentSelectedTemperatureWatcher(value:Int) 
	{
		adjTemp.setValue(value);
	}

	/**
	 * 
	 * @param	enabled
	 */
	function selectionEnabled(enabled) 
	{
		cbCurves.setEnabled(enabled);
	}

	/**
	 * 
	 * @param	e
	 */
	private function oncbCReleaseout(e:ListItemEvent):Void 
	{
		trace("Roll Out");
		oncbCSetPoints(e);
	}

	private function oncbCRollOver(e:ListItemEvent):Void 
	{
		selectSetPoints(e.getValue());
	}

	private function oncbCSetPoints(e:Event):Void 
	{
		var sel = cbCurves.getSelectedItem();
		trace("Select: " + sel);
		selectSetPoints(sel);
	}

	function selectSetPoints(sel:Dynamic) 
	{
		Main.model.fusingCurveModel.setFusingCurve(Main.model.fusingCurveModel.fusingCurves.getFusingCurve(sel));
	}

	function setPointsPlotWatcher(value:FusingCurve)
	{	
		cbCurves.setSelectedItem(Main.model.fusingCurveModel.fusingCurve.name, true);
		txtComment.setText(value.comment);
	}

	function measuredTemperaturesPlotWatcher(value)
	{	
		plot.graphMeasured.setSetPoints(Main.model.measuredTemps);
		plot.graphMeasured.drawValues();
	}

}