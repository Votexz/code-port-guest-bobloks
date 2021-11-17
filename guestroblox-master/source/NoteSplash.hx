package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class NoteSplash extends FlxSprite
{
	private var idleAnim:String;
	public function new(x:Float = 0, y:Float = 0, ?note:Int = 0) {
		super(x, y);

		frames = Paths.getSparrowAtlas('noteSplashes', 'preload');
		for (i in 1...3) {
			animation.addByPrefix("note1-" + i, "note impact blue", 24, false);
			animation.addByPrefix("note2-" + i, "note impact green", 24, false);
			animation.addByPrefix("note0-" + i, "note impact purple", 24, false);
			animation.addByPrefix("note3-" + i, "note impact red", 24, false);
		}
		setupNoteSplash(x, y, note);
	}

	public function setupNoteSplash(x:Float, y:Float, ?note:Int = 0)
	{
		setPosition(x - Note.swagWidth * 0.95, y - Note.swagWidth);
		alpha = 0.6;
		var animNum:Int = FlxG.random.int(1, 2);
		if(animNum == 2) {
			offset.set(20, 20);
		} else {
			offset.set(10, 10);
		}

		animation.play('note' + note + '-' + animNum, true);
		animation.curAnim.frameRate = 24 + FlxG.random.int(-2, 2);
		updateHitbox();
	}

	override function update(elapsed:Float) {
		if(animation.curAnim.finished) kill();

		super.update(elapsed);
	}
}