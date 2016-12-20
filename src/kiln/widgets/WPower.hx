package kiln.widgets;

import kiln.widgets.WBarGraph;

/**
 * ...
 * @author GM
 */
class  WPower extends WBarGraph
{

	public function new() 
	{
		super();
			
		setMinMax(0, 100, 0.1);
		scaleX = scaleY = 0.25;
		setPower(0);
	}
	
	/**
	 * 
	 * @param	object
	 */
	public function setPower(power:Float) 
	{
			setValue(cast power * 100);
	}
	
}