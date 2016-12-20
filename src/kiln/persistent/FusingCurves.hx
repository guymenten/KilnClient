package persistent;

import hx.binding.IBindable;
import persistent.PersistentData;
import openfl.Assets;
import openfl.utils.Object;
import org.aswing.VectorListModel;
import haxe.Json;

/**
 * ...
 * @author GM
 */

class FusingCurve implements Dynamic implements IBindable
{
	public var name	:String;
	public var setPoints		:SetPoints;
	public var date				:String;
	public var version			:String;
	public var comment			:String;

	/**
	 * 
	 * @param	so
	 */
	public function new(?name:String, ?points :SetPoints, ?date:String, ?version:String, ?comment:String)
	{
		this.comment 	= comment;
		this.date		= date;
		this.setPoints	= points;
		this.name		= name;
		this.version	= version;
	}
}

/**
 * 
 */
class FusingCurves extends PersistentData
{
	public var fusingCurves	:Map<String, FusingCurve>;

	public function new(fileName:String, defaultAssetName:String) 
	{
		fusingCurves 			= new Map<String, FusingCurve> ();
		super(fileName, defaultAssetName);

		/////////////Test
		//#if test Main.runner.addCase(this); #end
	}

	/**
	 * 
	 */
	override function addObject(obj:Object) 
	{
		super.addObject(obj);
		var points:Array<Dynamic> 	= obj.setPoints.arValues;
		var setPoints:SetPoints 	= new  SetPoints();

		for (point in points)
			setPoints.addSetPoint(point.X, point.Y);

		fusingCurves.set(obj.name, new FusingCurve(obj.name, setPoints, obj.date, obj.version, obj.comment));		
	}

	/**
	 * 
	 * @param	sel
	 */
	public function getFusingCurve(name:String) :FusingCurve
	{
		return fusingCurves.get(name);
	}
}