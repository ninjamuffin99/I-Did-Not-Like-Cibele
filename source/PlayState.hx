package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _dialogue:Dialogue;
	
	private var _bg:FlxSprite;
	
	override public function create():Void
	{
		
		_bg = new FlxSprite(0, 0);
		_bg.loadGraphic(AssetPaths.cyberpunk_street__png, true, 304, 192);
		_bg.setGraphicSize(FlxG.width, FlxG.height);
		_bg.updateHitbox();
		add(_bg);
		
		_dialogue = new Dialogue(2, 16, "assets/data/GN-KillGothic-U-KanaO.ttf");
		_dialogue.y = 10;
		add(_dialogue);
		
		dialogueStart(Story.story);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		FlxG.watch.addQuick("Lines Feedin: ", _dialogue.queue);
		
		dialogCheck();
	}
	
	public function dialogueStart(words:Array<String>, autoStart:Bool = true):Void
	{
		_dialogue.setDialog(words, autoStart);
	}
	
	var dialogBools:Array<Bool> = [false, false];
	private function dialogCheck():Void
	{
		if (_dialogue.queue[0] == Story.story[3] && !dialogBools[0])
		{
			
		}
	}
}