package kiln.tabs;

import comp.JComboBox;
import flash.events.Event;
import hx.binding.IBindable;
import jsoni18n.I18n;
import kiln.tabs.TabChat;
import kiln.tabs.TabDefaults;
import kiln.tabs.TabKilnSettings;
import kiln.tabs.TabSelector;
import kiln.tabs.TabSounds;
import kiln.tabs.TabsBase;
import org.aswing.Component;
import org.aswing.VectorListModel;
import org.aswing.event.InteractiveEvent;
import org.aswing.event.ListItemEvent;

/**
 * ...
 * @author GM
 */
class TabSelector extends TabsBase implements IBindable
{
	@:bindable var tabSelected	:TabsBase;
	var oldTabSelected			:TabsBase;
	var tabSetPoints			:TabSetPoints;
	var tabKilnSettings			:TabKilnSettings;
	var tabDefaults				:TabDefaults;
	var tabSounds				:TabSounds;
	var tabChat					:TabChat;
	var vecSel					:VectorListModel;
	var cbSelector				:JComboBox;

	public function new() 
	{
		super();

		vecSel 			= new VectorListModel([]);
		vecSel.append(I18n.tr("Tabs/Big"));
		vecSel.append(I18n.tr("Tabs/Setpoints"));
		vecSel.append(I18n.tr("Tabs/Config"));
		vecSel.append(I18n.tr("Tabs/Defaults"));
		vecSel.append(I18n.tr("Tabs/Sounds"));
		vecSel.append(I18n.tr("Tabs/Chat"));
	
		tabSetPoints 	= new TabSetPoints();
		addChild(tabSetPoints);
		tabKilnSettings = new TabKilnSettings();
		addChild(tabKilnSettings);
		tabDefaults 	= new TabDefaults();
		addChild(tabDefaults);
		tabSounds 		= new TabSounds();
		addChild(tabSounds);
		tabChat 		= new TabChat();
		addChild(tabChat);
	
		cbSelector = new JComboBox(I18n.tr("Tabs/Tabs"), "tabs.svg");
		addChild(cbSelector);
		cbSelector.setComBoundsXYWH(X1, Y1, cbW, butH);
		cbSelector.addEventListener(InteractiveEvent.SELECTION_CHANGED, oncbSelection);
		cbSelector.setModel(vecSel);
	
		tabSelected		!.add(tabSelectedChanged);
		cbSelector.setSelectedIndex(0, false);
		oncbSelection(null);

		setVisible(true);
	}

	/**
	 * 
	 */
	function tabSelectedChanged(tab:TabsBase) 
	{
		if (oldTabSelected != null)
			oldTabSelected.setVisible(false);
		
		tab.setVisible(true);
		oldTabSelected = tab;
	}
	
	private function oncbSelection(e:Event):Void 
	{
		var test = cbSelector.getSelectedIndex();
		trace(test);
		switch(cbSelector.getSelectedIndex())
		{
			case 0: tabSelected = tabSetPoints;
			case 1: tabSelected = tabSetPoints;
			case 2: tabSelected = tabKilnSettings;
			case 3: tabSelected = tabDefaults;
			case 4: tabSelected = tabSounds;
			case 5: tabSelected = tabChat;
		}
		
	}

}