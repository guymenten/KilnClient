package persistent;
import openfl.Lib;
import openfl.utils.Object;

/**
 * ...
 * @author ^GM
 */

class DefaultValues extends PersistentData
{

	public function new(fileName:String, defaultAssetName:String) 
	{
		super(fileName, defaultAssetName);
		
		Main.model.chkTTSModel.voiceEnabled !.add(onSave);
	}
	
	function onSave(variable:Dynamic) 
	{
		persistentObjects[0].cbCurveName 	= Main.model.fusingCurveModel.fusingCurve.name;
		persistentObjects[0].userName 		= Main.model.usersModel.currentUser.name;
		persistentObjects[0].voiceEnabled	= Std.string(Main.model.chkTTSModel.voiceEnabled);
		
		save();
	}

	/**
	 * 
	 */
	override function addObject(obj:Object) 
	{
		Main.model.fusingCurveModel.fusingCurve =  Main.model.fusingCurveModel.fusingCurves.getFusingCurve(obj.cbCurveName);
		Main.model.usersModel.users.getUser(obj.userName);
		Main.model.chkTTSModel.voiceEnabled 	= cast Std.parseInt(obj.voiceEnabled);
	}
}