package persistent;

import flash.net.SharedObjectFlushStatus;
import haxe.Json;
import flash.net.SharedObject;
import openfl.Assets;
import openfl.utils.Object;
import org.aswing.VectorListModel;

/**
 * ...
 * @author GM
 */
class PersistentData
{
	var so:SharedObject;
	var persistentObjects				:Array<Object>;
	var defaultAssetName	:String;
	public var vecNames		:VectorListModel;

	/**
	 * 
	 * @param	fileName
	 * @param	defaultAssetName
	 */
	public function new(fileName:String, defaultAssetName:String) 
	{
		this.defaultAssetName = defaultAssetName;
		vecNames 			= new VectorListModel([]);
		so = SharedObject.getLocal(fileName);
		load();
	}

	/**
	 * 
	 * @param	fileName
	 */
	public function load(factory:Bool = false) 
	{
		if (factory || so.size == 0)
			createDefaultPersistentObjects();
		else
			persistentObjects = Json.parse(so.data.objects);

		for (object in persistentObjects)
		{
			addObject(object);
		}
	}

	/**
	 * 
	 */
	function addObject(obj:Object) 
	{
		vecNames.append(obj.name);
	}

	/**
	 * 
	 * @param
	 */
	public function save() 
	{
		so.clear();
		so.data.objects = Json.stringify(persistentObjects);
		var res:Dynamic = so.flush();
        //trace("flushResult: " + res);
	}

	/**
	 * 
	 */
	public function createDefaultPersistentObjects() 
	{
		persistentObjects = Json.parse(Assets.getText(defaultAssetName));	
		save();
	}

	/**
	 * 
	 */
	public function resetToFactorySettings() 
	{
		vecNames.removeRange(0, vecNames.getSize());
		load(true);
	}
}