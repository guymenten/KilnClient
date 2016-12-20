package kiln.tools;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.events.MouseEvent;
import kiln.calc.Enums.MinMax;


class SetPointSprite extends Sprite
{
	var d:Int = 10;

	public function new(x:Float, y:Float) 
	{
		super();
		
		//this.x = x;
		//this.y = y;
		graphics.beginFill(0x008080);
		graphics.drawRect (- d/2, - d/2, d, d);
		graphics.endFill();
	}
}	

/**
 * ...
 * @author GM
 */
class SetPointSprites extends Sprite
{
	public var sprites		:Array<SetPointSprite>;
	var tempPoint	:SetPointSprite;
	var savedX		:Float;
	var savedY		:Float;

	public function new() 
	{
		super();

		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		
	}
	
	private function onMouseUp(e:MouseEvent):Void 
	{
		tempPoint.stopDrag();
		removeListeners();
	}
	
	function removeListeners() 
	{
		removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		removeEventListener(MouseEvent.MOUSE_MOVE, onMouseUp);
	}

	private function onMouseOut(e:MouseEvent):Void 
	{
		tempPoint.stopDrag();
		tempPoint.x = savedX;
		tempPoint.y = savedY;
		removeListeners();
	}
	
	private function onMouseDown(e:MouseEvent):Void 
	{
		//tempPoint = cast e.target;

		if (tempPoint != null)
		{
			trace(tempPoint);
			tempPoint.startDrag();
			savedX = x;
			savedY = y;
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
	}

	/**
	 * 
	 * @param	e
	 */
	private function onMouseMove(e:MouseEvent):Void 
	{
		trace("xc: " + e.stageX + "  yc: " + e.stageY);
		trace(" x: " + x + "   y: " + y);
		trace("");
		//e.target.x = e.localX;
		//e.target.y = e.localY;
		//x = mmX.setInRange(e.localX);
		//y = mmX.setInRange(e.localY);
	}
	
	public function addSetpoint(x:Float, y:Float) 
	{
		if (sprites == null)
			sprites = new Array<SetPointSprite> ();
			
		var spr:SetPointSprite = new SetPointSprite(x, y);
		spr.x = x;
		spr.y = y;
		addChild(spr);
		sprites.push(spr);
	}
	
	public function clear() 
	{
		if (sprites != null)
		{
			for (spr in sprites)
			{
				removeChild(spr);
			}
			
			sprites = null;
		}
	}
	
}