package kiln.persistent;
import openfl.utils.Object;

/**
 * ...
 * @author ^GM
 */
class User implements Dynamic
{
    public var ID		:Int;
 	public var name 	: String;
 	public var password : String;
 	public var security : Int;

	public function new(?nameIn:String, ?passwordIn:String, ?securityIn:Int)
	{
		name		= nameIn;
		password	= passwordIn;
		security	= securityIn;
	}
}

/**
 * 
 */
class Users extends PersistentData
{
	public var UsersMap: Map<String, User>;  // Table for Users

	public function new(fileName:String, defaultAssetName:String) 
	{
		UsersMap 		= new Map <String, User> ();		
		super(fileName, defaultAssetName);
	}
	
	/**
	 * 
	 * @param	obj
	 */
	override function addObject(obj:Object) 
	{
		super.addObject(obj);
		UsersMap.set(obj.name, new User(obj.name, obj.password, obj.security));		
	}

	/**
	 * 
	 * @param	key
	 * @return
	 */
	public function getUser(key:String):User
	{
		return UsersMap.get(key);
	}	
}