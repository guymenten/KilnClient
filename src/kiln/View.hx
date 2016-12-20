package kiln;

import comp.JButton;
import comp.JComboBox;
import flash.display.Bitmap;
import flash.events.Event;
import jsoni18n.I18n;
import kiln.tabs.TabSelector;
import kiln.tabs.TabsBase;
import kiln.tools.TTS;
import kiln.widgets.WIndicator;
import kiln.widgets.WPower;
import kiln.widgets.WTime;

using hx.binding.Tool;

/**
 * ...
 * @author ^GM
 */
class View  extends TabsBase
{
	private var butStart		:JButton;
	private var butStatusText	:WIndicator;
	private var tabSelector		:TabSelector;
	private var wTime			:WTime;

	var bmHot					:Bitmap;
	var wPower					:WPower;
	var cbUsers					:JComboBox;

	/**
	 * 
	 */
	public function new() 
	{
		super();

		bmHot = new Bitmap(openfl.Assets.getBitmapData("img/hot.png"));
		bmHot.scaleX = bmHot.scaleY = 0.25;
		bmHot.visible = false;
		addChild(bmHot);
		cbUsers = new JComboBox(I18n.tr("MainPane/User"), "account_circle.svg");
		addChild(cbUsers);
		cbUsers.setComBoundsXYWH(X6, Y1, 180, butH);
		cbUsers.setModel(Main.model.usersModel.users.vecNames);
		//cbUsers.setSelectedItem(Main.model.currentUser.name);
		
		setVisible(true);
	}

	/**
	 * 
	 */
	public function startView()
	{
		butStart 		= new JButton("", "curves.svg");
		butStart.setModel(Main.model.modelStartButton);
		Main.model.modelStartButton.label !.add(onStartButtonLabelWatcher);
		butStart.setAwmlID_XYWH("test", X7, Y11, butW, butH);
		addChild(butStart);

		butStatusText 	= new WIndicator( "test", "", 420, butH);
		butStatusText.setLocationXY(200, Y11);
		addChild(butStatusText);
		bmHot.y = Y11;
		bmHot.x = butStatusText.x + 384;

		tabSelector 	= new TabSelector();
		addChild(tabSelector);
		wTime = new WTime("test", 160, butH);
		wTime.x = 20;
		wTime.y = Y11;
		addChild(wTime);

		wPower = new WPower();
		wPower.setLocationXY(660, Y11 - 10);
		addChild(wPower);

		/*
		 * Add Watchers here
		 */
		Main.model.extendedStatusText	!.add(statusTextWatcher);
		Main.model.statusTextColor		!.add(statusTextColorWatcher);
		Main.model.statusBackColor		!.add(statusBackColorrWatcher);
		Main.model.bHot					!.add(bHotWatcher);
		Main.model.powerRate			!.add(tempRampWatcher);
		Main.model.selectionEnabled		!.add(selectionEnabled);
	}
	
	function onStartButtonLabelWatcher(text:String) 
	{
		//butStart.setText(I18n.tr(text));
	}

	/**
	 * 
	 * Watchers
	 */
	function statusTextWatcher(value) 		{ butStatusText.setText(value); trace(value);}
	function statusTextColorWatcher(value) 	{ butStatusText.setTextColor(value);}
	function statusBackColorrWatcher(value) { butStatusText.setBackgroundColor(value);}
	function bHotWatcher(value) 			{ bmHot.visible = value; }
	function tempRampWatcher(value)  
	{
		wPower.setPower(value); 
		TTS.playSound("Tick1");
	}

	/**
	 * 
	 * @param	e
	 */
	private function oncbUsers(e:Event):Void 
	{
		var sel = cbUsers.getSelectedItem();
		trace("Select: " + sel);
		selectUser(sel);
	}

	function selectUser(sel:Dynamic) 
	{
		Main.model.setUser(Main.model.usersModel.users.getUser(sel));
	}
	function selectionEnabled(value)
	{ 
		
	}

}	
