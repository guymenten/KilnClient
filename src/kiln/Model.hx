package kiln;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.XMLSocket;
import hx.binding.IBindable;
import jsoni18n.I18n;
import SetPoints;
import kiln.Model.TempBoundedRangeModel;
import org.aswing.DefaultBoundedRangeModel;
import org.aswing.DefaultButtonModel;
import persistent.DefaultValues;
import persistent.FusingCurves;
import persistent.FusingCurves.FusingCurve;
import kiln.persistent.Users;
import kiln.tools.TTS;
import org.aswing.ASColor;

/**
 * ...
 * @author GM
 */
class Model extends ModelBase
{
	@:bindable public var clientModel		:ClientModel;
	@:bindable public var statusTextColor	:ASColor;
	@:bindable public var statusBackColor	:ASColor;
	@:bindable public var defaultValues		:DefaultValues;
	public var kilnTempRangeModel			:TempBoundedRangeModel;
	public var chkTTSModel					:ChkTTSModel;
	public var modelStartButton				:StartButtonModel;


	/**
	 * 
	 * @param	statusText
	 */
	public function new(?statusText:String)
	{
		super();
		clientModel			= new ClientModel();
		measuredTemps		= new SetPoints();
		measuringCurve 		= new FusingCurve(measuredTemps);
		chkTTSModel			= new ChkTTSModel();
		kilnTempRangeModel 	= new TempBoundedRangeModel(kilnTempRangeModelMin, kilnTempRangeModelExtent, kilnTempRangeModelMin, kilnTempRangeModelMax);
		modelStartButton 	= new StartButtonModel();

		this.statusText 	= statusText;

		/**
		 * Add Watchers
		 */
		measuredTemp !.add(measuredTemperatureWatcher);
		fusingCurveModel.fusingCurve !.add(fusingCurveModel.setFusingCurve);
	}

	function measuredTemperatureWatcher(value) 
	{
		setExtendedStatusText();
		bHot = (cast(measuredTemp, Int) > cast(hotTemp, Int));
		trace("Temp : " + measuredTemp);
	}

	/**
	 * 
	 */
	public function resetToFactorySettings() 
	{
		fusingCurveModel.fusingCurves.resetToFactorySettings();
	}

	public function getLanguageExtensionName() 
	{
		return "fra";
	}
	/**
	 * 
	 * @param	lang
	 */
	public function loadCurrentLanguage() 
	{
		try{
			I18n.loadFromFile("text/txt_" + currentLanguage + ".json");
		}
		catch (c:Dynamic)
		{
			trace(c.message);
		}
	}
	
	public function setExtendedStatusText() 
	{
		extendedStatusText	= (statusText + "  " + measuredTemp + " °/" + fusingCurveModel.setPointTemp + " °");
	}

	/**
	 * 
	 * @param	statusText
	 * @param	statusTextColor
	 * @param	statusBackColor
	 */
	public function setStateTextAndColors(statusText:String, statusTextColor:ASColor, statusBackColor:ASColor)
	{
		this.statusText			= statusText;
		this.statusTextColor 	= statusTextColor;
		this.statusBackColor 	= statusBackColor;
		setExtendedStatusText();
	}

	/**
	 * 
	 */
	public function setNextMeasuredTemperature() 
	{
		fusingCurveModel.setPointTemp = fusingCurveModel.fusingCurve.setPoints.getSetpointFromX(timeElapsed).Y;
		measuringCurve.setPoints.addSetPoint(timeElapsed, measuredTemp);
		setExtendedStatusText();
		timeElapsed ++;
	}

	/**
	 * 
	 */
	public function isMeasuredTemperatureHot():Bool
	{
		var temp:Int 	= this.measuredTemp;
		var tempHot:Int = this.hotTemp;

		return (temp > tempHot);
	}

	public function setUser(user:Dynamic) 
	{
		
	}
	
	public function startModel() 
	{
		kilnTempRangeModel.setValue(22);
		defaultValues		= new DefaultValues	("Defaults",		"text/defaults.json");
	}
}

/**
 * 
 */
class StartButtonModel extends DefaultButtonModel implements IBindable
{
	@:bindable public var label:String;

	public function new()
	{
		super();

		addActionListener(function onAction(action:Dynamic) 
		{
			trace("OnStartButton");
			Main.model.startButtonActions ++;
		});
	}
}
/**
 * 
 */
class TempBoundedRangeModel extends DefaultBoundedRangeModel implements IBindable
{
	public override function setValue(n:Int, programmatic:Bool=true):Void{
		super.setValue(n, programmatic);
		Main.model.kilnTempRangeModelValue = n;
	}
}

/**
 * 
 */
class ChkTTSModel extends ToggleButtonModel implements IBindable
{
	@:bindable public var label			:String;
	@:bindable public var voiceEnabled	:Bool = true;

	public function new()
	{
		super();

		Main.model.chkTTSModel.voiceEnabled !.add(onVoiceEnabled);

		addActionListener(function onAction(action:Dynamic) 
		{
			trace("OnChkTTS");
			voiceEnabled = this.isSelected();
		});
	}
	
	function onVoiceEnabled(selected:Bool) 
	{
		this.selected = selected;
	}
}

/**
 * 
 */
class ClientModel implements IBindable
{
	@:bindable public var userName:String = "";
	@:bindable public var textToDisplay:String;
	@:bindable public var textToSay:String;
	@:bindable public var textIdentify:String;
	@:bindable public var connected:Bool;
	@:bindable public var socket:XMLSocket;
	@:bindable public var textToDisplayNumber:Int;
	@:bindable public var textToSayNumber:Int;
	@:bindable public var ioErrorCount:Int;
	@:bindable public var securityErrorCount:Int;
	
	public function new()
	{
		socket !.add(onSocketWatcher);
		connected !.add(onConnectedWatcher);
	}
	
	function onConnectedWatcher(connected:Bool) 
	{
		if (connected == false)
		{
			userName = "";
		}
	}
	
	function onSocketWatcher(variable:XMLSocket)
	{
		socket.addEventListener(flash.events.Event.CONNECT, function onConnect(e:Dynamic) 
		{
			trace("Socket Connected");
			connected = true;
		});
		socket.addEventListener(IOErrorEvent.IO_ERROR, function onIOError(e:Dynamic) 
		{
			trace("ioErrorCount : " + ioErrorCount);
			ioErrorCount ++;
			connected = false;
		});
		socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, function onSecurityError(e:Dynamic) 
		{
			trace("Security Error");
			ioErrorCount ++;
			connected = false;
		});
		socket.addEventListener(flash.events.Event.CLOSE, function onDisConnect(e:Dynamic) 
		{
			trace("Socket Closed");
			connected = false;
			ioErrorCount ++;
		});
	}
}
