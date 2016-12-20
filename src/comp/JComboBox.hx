package comp;

import comp.CompDecorator;
import flash.display.Bitmap;
import kiln.tabs.TabsBase;
import org.aswing.JComboBox;
import org.aswing.geom.IntRectangle;

/**
 * ...
 * @author GM
 */
class JComboBox extends org.aswing.JComboBox
{
	var bg:CompDecorator;

	public function new(label:String, ?bmName:String)
	{
		super();
	
		setFont(getFont().changeSize(18));
		setScale(TabsBase.compScale);

		setClipMasked(false);

		bg = new CompDecorator(label, bmName);
		setForegroundDecorator(bg);
	}
	
	/**
	 * 
	 * @param	scale
	 */
	function setScale(scale:Float)
	{
		scaleX = scaleY = scale;
		//getPopupList().scaleX = scale;
		//getPopupList().scaleY = scale;
		
		getPopupList().font.changeSize(42);
	}

	/**
	 * 
	 * @param	b
	 */
	override function paint(b:IntRectangle):Void
	{
		super.paint(b);
	}
}