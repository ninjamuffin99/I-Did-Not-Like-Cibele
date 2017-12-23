package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class SplashScreen extends FlxState 
{
	
	private var drugs:FlxSprite;
	
	
	private var _times:Array<Float>;
	private var _curPart:Int = 0;
	private var _functions:Array<Void->Void>;
	

	override public function create():Void 
	{
		FlxG.fixedTimestep = false;
		FlxG.camera.fade(FlxColor.BLACK, 0.84, true);
		
		FlxG.sound.playMusic("assets/music/cuddle_love_short1_ofv.mp3");
		
		drugs = new FlxSprite();
		drugs.loadGraphic(AssetPaths.splashScreen__png, false, 320, 224);
		drugs.setGraphicSize(FlxG.width, FlxG.height);
		drugs.updateHitbox();
		add(drugs);
		
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.switchState(new MenuState());
		}
		
	}
	
	
	
}