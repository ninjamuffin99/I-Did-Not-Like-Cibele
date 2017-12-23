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
	
	override public function create():Void
	{
		
		_dialogue = new Dialogue(4, 20, "assets/data/GN-KillGothic-U-KanaO.ttf");
		_dialogue.y = 10;
		_dialogue.x -= FlxG.width * 0.35;
		add(_dialogue);
		
		dialogueStart(Story.story);
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	public function dialogueStart(words:Array<String>, autoStart:Bool = true):Void
	{
		_dialogue.setDialog(words, autoStart);
	}
}