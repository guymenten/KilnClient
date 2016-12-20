import haxe.remoting.AsyncProxy;
import jsoni18n.I18n;
import kiln.Model.ClientModel;

class ServerApiImpl extends haxe.remoting.AsyncProxy<ServerApi> {
}

class Client implements ClientApi {

	var api 	: ServerApiImpl;
	var model	: ClientModel;

	/**
	 * 
	 */
	public function new(model:ClientModel)
	{
		this.model = model;
		
		/**
		 * Add watchers here
		 */
		model.textToSayNumber 	!.add(onTextToSayWatcher);
		model.textIdentify 		!.add(onTextIdentifyWatcher);
		model.ioErrorCount 		!.add(onIOErrorWatcher);
		//
		
		connect();
	}

	/**
	 * 
	 * @param	connected
	 */
	function onIOErrorWatcher(ioErrors:Int) 
	{
		model.socket.close();
		connect();
	}

	/**
	 * 
	 * @param	text
	 */
	function onTextIdentifyWatcher(text:String) 
	{
		api.identify(text);
	}

	/**
	 * 
	 * @param	value
	 */
	function onTextToSayWatcher(number:Int) 
	{
		api.say(model.textToSay);
	}

	/**
	 * 
	 */
	function connect()
	{
		model.socket = new flash.net.XMLSocket();
		model.socket.connect("localhost",1024);
		var context = new haxe.remoting.Context();
		context.addObject("client",this);
		var scnx = haxe.remoting.SocketConnection.create(model.socket, context);
		api = new ServerApiImpl(scnx.api);		
	}
	
	/**
	 * 
	 * @param	name
	 */
	public function refreshDigitalPin( pin:Int, value:Int ) : Void
	{
		trace("refreshDigitalPin");
		Main.model.arduinoModel.pin2 = value;
	}

	/**
	 * 
	 * @param	line
	 */
	function display( line : String ) {
		model.textToDisplay = line;
		model.textToDisplayNumber ++;
	}

	/**
	 * 
	 * @param	name
	 */
	public function userJoin( name ) {
		display(I18n.tr("TabChat/Join") + "  "+name+"</b>");
	}

	/**
	 * 
	 * @param	name
	 * @param	text
	 */
	public function userSay( name : String, text : String ) {
		display("<b>"+name+ " :</b> "+text.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;"));
	}

	/**
	 * 
	 * @param	name
	 */
	public function userLeave( name ) {
		display("User leave <b>"+name+"</b>");
	}
	
	/**
	 * 
	 * @param	pin
	 * @param	val
	 */
	public function writeDigitalPin(pin:Int, val:Int ) {
		api.writeDigitalPin(pin, val);
	}
}
