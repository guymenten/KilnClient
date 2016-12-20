package kiln.tools;

import flash.events.MouseEvent;
import flash.ui.Multitouch;
import flash.ui.MultitouchInputMode;
import org.aswing.Component;

/**
 * ...
 * @author GM
 */
class GestureSprite extends Component 
{
	public var moveEnabled	:Bool = false;
	public var bDown		:Bool;
	var mouseMoveFunc		:MouseEvent->Void;

	public function new(mouseMoveFunc:MouseEvent->Void) 
	{
		super();

		this.mouseMoveFunc 		= mouseMoveFunc;

		Multitouch.inputMode 	= MultitouchInputMode.GESTURE;

		addEventListener(MouseEvent.MOUSE_DOWN, onMouseMove);
		addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		addEventListener(MouseEvent.MOUSE_UP, onMouseMove);
		addEventListener(MouseEvent.MOUSE_OUT, onMouseMove);

		//addEventListener(TransformGestureEvent.GESTURE_SWIPE , onSwipe);
		//addEventListener(TransformGestureEvent.GESTURE_ZOOM , onZoom);
	}

	/**
	 * 
	 * @param	e
	 */
	private function onMouseMove(e:MouseEvent):Void 
	{
		if (cast mouseMoveFunc) mouseMoveFunc(e);
	}
}
