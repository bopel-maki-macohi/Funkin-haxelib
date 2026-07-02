package funkin.play;


class GitarooPause extends MusicBeatState
{



public function new(?previousParams:PlayStateParams):Void
{
super();

this.previousParams = previousParams;
}

override function create():Void
{
{
}

bg.setGraphicSize(Std.int(FlxG.width));
bg.updateHitbox();
bg.screenCenter();
add(bg);

bf.animation.addByPrefix('lol', "funnyThing", 13);
bf.animation.play('lol');
bf.screenCenter(X);
add(bf);

replayButton = FunkinSprite.createSparrow(FlxG.width * 0.25, FlxG.height * 0.7, 'pauseAlt/pauseUI');
replayButton.animation.addByPrefix('selected', 'bluereplay', 0, false);
replayButton.animation.appendByPrefix('selected', 'yellowreplay');
replayButton.animation.play('selected');
add(replayButton);

cancelButton = FunkinSprite.createSparrow(FlxG.width * 0.58, replayButton.y, 'pauseAlt/pauseUI');
cancelButton.animation.addByPrefix('selected', 'bluecancel', 0, false);
cancelButton.animation.appendByPrefix('selected', 'cancelyellow');
cancelButton.animation.play('selected');
add(cancelButton);

changeThing();

super.create();
}

function checkSelectionPress():Bool
{
}

override function update(elapsed:Float):Void
{

{
{
FlxTransitionableState.skipNextTransIn = false;
FlxTransitionableState.skipNextTransOut = false;
}
else
{
}
}

super.update(elapsed);
}

function changeThing():Void
{
replaySelect = !replaySelect;

{
cancelButton.animation.curAnim.curFrame = 0;
replayButton.animation.curAnim.curFrame = 1;
}
else
{
cancelButton.animation.curAnim.curFrame = 1;
replayButton.animation.curAnim.curFrame = 0;
}
}
}
