package comp;
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.display.Sprite;
import format.SVG;
import haxe.ds.StringMap;
import openfl.Assets;
import org.aswing.ASColor;
import org.aswing.Component;
import org.aswing.GroundDecorator;
import org.aswing.geom.IntRectangle;
import org.aswing.graphics.Graphics2D;

//import text.JTextHBase;
//import util.Images;

/**
 * ...
 * @author GM
 */
class CompDecorator implements GroundDecorator
{
	//public var tfTitle	:JLabel;
	public var bmLeft	:Bitmap;
	public var shape	:Sprite;

	public function new(label:String = "", ?bmName:String) 
	{
		shape = new Sprite();
		
		if (bmName != null)
		{
			var styles:StringMap<String> = new StringMap<String>();
			styles.set("fill", "#ffffff");
			//styles.set("stroke-opacity", "#0");
			var svg : SVG = new SVG(Assets.getText("img/" + bmName), styles);
			//shape.graphics.lineStyle(1, ASColor.CLOUDS.getRGB());
			svg.render(shape.graphics, -20, 8, 48, 48);
		}

		//tfTitle = new JLabel(label);
		//tfTitle.y -= 40;
		//tfTitle.getTextField().autoSize =  TextFieldAutoSize.LEFT;
	}

	/**
	 * 
	 * @param	c
	 * @param	g
	 * @param	b
	 */
	public function updateDecorator(c:Component, g:Graphics2D, b:IntRectangle):Void
	{
		b.grow(40, 0);
		c.setClipMaskRect(b);
		c.setClipMasked(false);
		c.addChild(shape);
		//c.addChild(tfTitle);
	}
	
	/**
	 * 
	 * @param	c
	 * @return
	 */
	public function getDisplay(c:Component):DisplayObject
	{
		return shape;
	}

}