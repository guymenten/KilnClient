package comp;

import comp.CompDecorator;
import kiln.tabs.TabsBase;
import org.aswing.ASColor;
import org.aswing.JAdjuster;
import org.aswing.geom.IntRectangle;

/**
 * ...
 * @author GM
 */
class JAdjuster extends org.aswing.JAdjuster
{
	var bg:CompDecorator;

	public function new(label:String, ?bmName:String)
	{
		super();
		setClipMasked(false);
		scaleX = scaleY = TabsBase.compScale;
		getInputText().setFont(getInputText().getFont().changeSize(36));
		getInputText().setForeground(ASColor.CLOUDS);
		getInputText().set_alignmentX(0.5);

		bg = new CompDecorator(label, bmName);
		bg.shape.x -= 12;
		setForegroundDecorator(bg);
	}
	//
	override function paint(b:IntRectangle):Void
	{
		super.paint(b);
	}
}