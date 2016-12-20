package comp;

import flash.display.Bitmap;
import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.events.KeyboardEvent;
import jsoni18n.I18n;
import org.aswing.AbstractButton;
import org.aswing.JCheckBox;
import org.aswing.event.AWEvent;
import org.aswing.event.SelectionEvent;
import org.aswing.geom.IntRectangle;

/**
 * ...
 * @author ...
 */
class CompUtils extends Sprite
{

	/**
	 * 
	 * @param	label
	 * @param	xIn
	 * @param	yIn
	 * @param	func
	 * @return
	 */
	//public static function addTextTitleArea(comp:Sprite, label:String, xIn:Int, yIn:Int, func:Dynamic->Void) :JTextTitleArea
	//{
		//var txt:JTextTitleArea 	= new JTextTitleArea(DBTranslations.getText(label), func);
		//txt.setComBoundsXYWHTopAlign(xIn, yIn, 140, 24);
		//txt.textArea.setMaxChars(10);
		//comp.addChild(txt);
//
		//return txt;
	//}

	/**
	 * 
	 * @param	box
	 * @param	label
	 * @param	xIn
	 * @param	yIn
	 * @param	func
	 */
	public static function addCheckBox(comp:Sprite,label:String, xIn:Int, yIn:Int, ?wIn:Int, func:Dynamic->Void) :JCheckBox
	{
		var box:JCheckBox 	= new JCheckBox(I18n.tr(label));
		box.addEventListener(AWEvent.ACT, func);
		box.setComBounds(new IntRectangle(xIn, yIn, (cast wIn )? wIn : 240, 24));
		box.setHorizontalAlignment(AbstractButton.LEFT);
		comp.addChild(box);

		return box;
	}
//
	///**
	 //* 
	 //* @param	label
	 //* @param	img
	 //* @param	xIn
	 //* @param	yIn
	 //* @param	func
	 //* @return
	 //*/
	//public static function addComboBox(comp:Sprite, label:String, ?img:Bitmap, xIn:Int, yIn:Int, wIn:Int = 260, func:Dynamic->Void) :JComboBox1
	//{
		//var box:JComboBox1 	= new JComboBox1(DBTranslations.getText(label), img);
		//box.setComBoundsXYWHTopAlign(xIn, yIn, wIn, 24);
//
		//comp.addChild(box);
		//box.combobox.addEventListener(SelectionEvent.LIST_SELECTION_CHANGED, func);
//
		//return box;
	//}
//
	///**
	 //* 
	 //* @param	label
	 //* @param	xIn
	 //* @param	yIn
	 //* @param	min
	 //* @param	max
	 //* @param	func
	 //* @return
	 //*/
	//public static function addAdjuster(comp:Sprite, label:String, ?bm:Bitmap, ?align:StageAlign, xIn:Int, yIn:Int, ?min:Int, ?max:Int, ?param:String, ?translator:Int->String, func:Dynamic->Void, wIn:Int = 80) :JAdjuster1
	//{
		//var adj:JAdjuster1 = new JAdjuster1(label, bm);
//
		//if (cast bm)
			//align = StageAlign.TOP;
//
		//if (align == StageAlign.TOP)
			//adj.setComBoundsXYWHTopAlign(xIn, yIn, wIn);
		//else
			//adj.setComBoundsXYWH (xIn, yIn, wIn, 40);
//
		//if (cast param)
		//{
			//min = DBDefaults.getMinParam(param);
			//max = DBDefaults.getMaxParam(param);
			//adj.adjuster.setValue(DBDefaults.getIntParam(param));
		//}
		//else
			//adj.adjuster.setValue(min);
//
		//adj.adjuster.setMinimum(min);
		//adj.adjuster.setMaximum(max);
		//adj.adjuster.setName(label);
		//if(cast translator) adj.adjuster.setValueTranslator(translator);
		//comp.addChild(adj);
		//adj.adjuster.addEventListener(AWEvent.ACT, func);
//
		//return adj;
	//}
//
	///**
	 //* 
	 //* @param	label
	 //* @param	bm
	 //* @param	align
	 //* @param	xIn
	 //* @param	yIn
	 //* @param	min
	 //* @param	max
	 //* @param	param
	 //* @param	translator
	 //* @param	func
	 //* @param	wIn
	 //* @return
	 //*/
	//public static function addStepper(comp:Sprite, label:String, ?bm:Bitmap, ?align:StageAlign, xIn:Int, yIn:Int, ?min:Int, ?max:Int, ?param:String, ?translator:Int->String, func:Dynamic->Void, wIn:Int = 80) :JStepper1
	//{
		//var stepper:JStepper1 = new JStepper1(label, bm);
//
		//if (cast bm)
			//align = StageAlign.TOP;
//
		//if (align == StageAlign.TOP)
			//stepper.setComBoundsXYWHTopAlign(xIn, yIn, wIn);
		//else
			//stepper.setComBoundsXYWH (xIn, yIn, wIn, 40);
//
		//if (cast param)
		//{
			//min = DBDefaults.getMinParam(param);
			//max = DBDefaults.getMaxParam(param);
			//stepper.stepper.setValue(DBDefaults.getIntParam(param));
		//}
		//else
			//stepper.stepper.setValue(min);
//
		//stepper.stepper.setMinimum(min);
		//stepper.stepper.setMaximum(max);
		//stepper.stepper.setName(label);
		//if(cast translator) stepper.stepper.setValueTranslator(translator);
		//comp.addChild(stepper);
		//stepper.stepper.addEventListener(AWEvent.ACT, func);
//
		//return stepper;
	//}
	///**
	//* @description – returns a sprite with a dashed line
	//* @langversion 3.0
	//* @usage drawDashedLine( 30, 30, 100, 100, 5, 3 );
	//*
	//* @param graphicsObject The object where to draw the line
	//* @param startX Start X of dashed line
	//* @param startY Start Y of dashed line
	//* @param endX End X of dashed line
	//* @param endY End Y of dashed line
	//* @param strokeLength Stroke length of dash
	//* @param gap Length of gap between dashes
	//*
	//* @return sprite containing the dashed line
	//*/
	 //
	//public static function drawDashedLine(line:Sprite, startX:Float = 0, startY:Float = 0, endX:Float = 0, endY:Float = 0, strokeLength:Float = 0, gap:Float = 0, lineWidth:Float = 1):Sprite
	//{
		//var lineGraphics:Graphics = line.graphics;
		//lineGraphics.lineStyle( lineWidth, 0x000000, 1.0 );
		 //
		////lineGraphics.lineTo( startX, startY );
		 //
		//// calculate the length of the segment
		//var segmentLength:Float = strokeLength + gap;
		 //
		//// calculate the length of the dashed line
		//var deltaX:Float = endX - startX;
		//var deltaY:Float = endY - startY;
		 //
		////By Pythagorous theorem
		//var _delta:Float = Math.sqrt((deltaX * deltaX) + (deltaY * deltaY));
		 //
		//// calculate the number of segments needed
		//var segmentsCount:Float = Math.floor(Math.abs( _delta / segmentLength ));
		 //
		//// get the angle of the line in radians
		//var radians:Float = Math.atan2( deltaY, deltaX );
		 //
		//// start the line here
		//var aX:Float = startX;
		//var aY:Float = startY;
		 //
		//// add these to cx, cy to get next seg start
		//deltaX = Math.cos( radians ) * segmentLength;
		//deltaY = Math.sin( radians ) * segmentLength;
		 //
		//// loop through each segment
		//for (i in 0 ... cast segmentsCount) {
			//lineGraphics.moveTo( aX, aY );
			//lineGraphics.lineTo( aX + Math.cos( radians ) * strokeLength, aY + Math.sin( radians ) * strokeLength );
			//aX += deltaX; aY += deltaY;
		//}
		 //
		//// handling the last segment
		//lineGraphics.moveTo( aX, aY );
		//_delta = Math.sqrt( ( endX - aX ) * ( endX - aX ) + ( endY - aY ) * ( endY - aY ) );
		//if( _delta > segmentLength ){
		//// segment ends in the gap; drawing a full dash
			//lineGraphics.lineTo( aX + Math.cos( radians ) * strokeLength, aY + Math.sin( radians ) * strokeLength );
		//}
		//else if( _delta > 0 ) {
			//// segment shorter than dash; draw the remaining only
			//lineGraphics.lineTo( aX + Math.cos( radians ) * _delta, aY + Math.sin( radians ) * _delta );
		//}
		//// move to the end position
		//lineGraphics.lineTo( endX, endY );
	 //
		//return line;
	//}
//

}