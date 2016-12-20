package kiln.tabs;
import jsoni18n.I18n;
import org.aswing.JButton;

/**
 * ...
 * @author GM
 */
class TabDefaults extends TabsBase
{
	private var butFactory		:JButton;

	public function new() 
	{
		super();
				
		butFactory 		= new JButton(I18n.tr("TabDefaults/Factory"));
		butFactory.setAwmlID_XYWH("TabDefaults/Factory", X1, Y1, butW, butH);
		addChild(butFactory);
		butFactory.addActionListener(onButFactory);

		
	}

	/**
	 * 
	 */
	public function onButFactory(e:Dynamic) 
	{
		trace("onButFactory()");
		Main.controller.resetToFactorySettings();
	}
	
}