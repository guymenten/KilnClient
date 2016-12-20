package comp;

import comp.CompDecorator;
import kiln.tabs.TabsBase;
import org.aswing.ASColor;
import org.aswing.JButton;
import org.aswing.geom.IntRectangle;

/**
 * ...
 * @author GM
 */
class JButton extends org.aswing.JButton
{
	var bg:CompDecorator;

	public function new(?label:String, ?bmName:String)
	{
		super(label);

		setClipMasked(false);
		scaleX = scaleY = TabsBase.compScale;
		
		setFont(getFont().changeSize(36));
		setForeground(ASColor.CLOUDS);
		set_alignmentX(0.5);

		bg = new CompDecorator(label, bmName);
		//bg.shape.x -= 12;
		setForegroundDecorator(bg);
		//setBackgroundDecorator(bg);
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