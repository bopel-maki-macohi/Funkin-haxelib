package funkin.ui.title;


class TitleState extends MusicBeatState
{
/**
* Only play the credits once per session.
*/



override public function create():Void
{
super.create();
swagShader = new ColorSwap();

curWacky = FlxG.random.getObject(getIntroTextShit());
funkin.FunkinMemory.cacheSound(Paths.music('girlfriendsRingtone/girlfriendsRingtone'));


{
startIntro();
});
else
startIntro();
}



function startIntro():Void
{

persistentUpdate = true;

bg.screenCenter();
add(bg);

logoBl = new FunkinSprite(-150 + (FullScreenScaleMode.gameCutoutSize.x / 2.5), -100);
logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
logoBl.animation.play('bump');
logoBl.shader = swagShader.shader;
logoBl.updateHitbox();

gfDance = new FunkinSprite((FlxG.width * 0.4) + FullScreenScaleMode.gameCutoutSize.x / 2.5, FlxG.height * 0.07);
gfDance.frames = Paths.getSparrowAtlas('gfDanceTitle');
gfDance.animation.addByIndices('danceLeft', 'gfDance', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
gfDance.animation.addByIndices('danceRight', 'gfDance', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

gfDance.shader = swagShader.shader;

add(logoBl);
add(gfDance);


titleText = FunkinSprite.createTextureAtlas(#if mobile 50 #else 100 #end + (FullScreenScaleMode.gameCutoutSize.x / 2), FlxG.height * 0.8, titleTextPath, {
cacheOnLoad: true
});
titleText.anim.addByFrameLabel('idle', "Idle", 24);
titleText.anim.addByFrameLabel('press', "Confirm", 24);
titleText.animation.play('idle');
titleText.updateHitbox();
titleText.shader = swagShader.shader;

add(titleText);

{
credGroup = new FlxGroup();
add(credGroup);
}

textGroup = new FlxGroup();

blackScreen = bg.clone();

ngSpr = new FunkinSprite(0, FlxG.height * 0.52);

{
ngSpr.loadGraphic(Paths.image('newgrounds_logo_classic'));
}
else if (FlxG.random.bool(30))
{
ngSpr.loadGraphic(Paths.image('newgrounds_logo_animated'), true, 600);
ngSpr.animation.add('idle', [0, 1], 4);
ngSpr.animation.play('idle');
ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.55));
ngSpr.y += 25;
}
else
{
ngSpr.loadGraphic(Paths.image('newgrounds_logo'));
ngSpr.setGraphicSize(Std.int(ngSpr.width * 0.8));
}

ngSpr.visible = false;
{
credGroup.add(blackScreen);
credGroup.add(ngSpr);
credGroup.add(textGroup);
}

ngSpr.updateHitbox();
ngSpr.screenCenter(X);


else
initialized = true;

attractTimer = new FlxTimer().start(Constants.TITLE_ATTRACT_DELAY, (_:FlxTimer) -> moveToAttract());
}

/**
* After sitting on the title screen for a while, transition to the attract screen.
*/
function moveToAttract():Void
{
{
});
}

function playMenuMusic():Void
{
FunkinSound.playMusic('freakyMenu', {
startingVolume: 0.0,
overrideExisting: true,
restartTrack: false,
persist: true
});
}

function getIntroTextShit():Array<Array<String>>
{


for (i in firstArray)
{
swagGoodArray.push(i.split('--'));
}

}


override function update(elapsed:Float):Void
{

{
openfl.Lib.application.window.close();
}

Conductor.instance.update();

funkin.input.Cursor.hide();

{
FlxTween.cancelTweensOf(FlxG.stage.window, ['x', 'y']);
FlxTween.tween(FlxG.stage.window, {x: FlxG.stage.window.x + 300}, 1.4, {ease: FlxEase.quadInOut, type: PINGPONG, startDelay: 0.35});
FlxTween.tween(FlxG.stage.window, {y: FlxG.stage.window.y + 100}, 0.7, {ease: FlxEase.quadInOut, type: PINGPONG});
}




{
}

{
moveToMainMenu();
}

{
titleText.animation.play('press');
FunkinSound.playOnce(Paths.sound('confirmMenu'), 0.7);
transitioning = true;

HapticUtil.vibrate(0.1, 0.5, 0.5);

Medals.award(Medal.StartGame);
funkin.api.newgrounds.Events.logStartGame();

new FlxTimer().start(2, function(tmr:FlxTimer)
{
moveToMainMenu();
});
}

{
}

super.update(elapsed);
}

function moveToMainMenu():Void
{
{
attractTimer.cancel();
attractTimer = null;
}

funkin.FunkinMemory.purgeCache();
}

override function draw()
{
super.draw();
}


function cheatCodeShit():Void
{
}

function codePress(input:Int):Void
{
{
curCheatPos += 1;
}
else
curCheatPos = 0;
}

function startCheat():Void
{
cheatActive = true;

FunkinSound.playMusic('girlfriendsRingtone', {
startingVolume: 0.0,
overrideExisting: true,
restartTrack: true
});


FunkinSound.playOnce(Paths.sound('confirmMenu'), 0.7);

attractTimer.cancel();
}

function createCoolText(textArray:Array<String>):Void
{

for (i in 0...textArray.length)
{
money.screenCenter(X);
money.y += (i * 60) + 200;
textGroup.add(money);
}
}

function addMoreText(text:String):Void
{

HapticUtil.vibrate();

coolText.screenCenter(X);
coolText.y += (textGroup.length * 60) + 200;
textGroup.add(coolText);
}

function deleteCoolText():Void
{

{
textGroup.remove(textGroup.members[0], true);
}
}


override function beatHit():Bool
{

{
{
for (i in lastBeat...Conductor.instance.currentBeat)
{
switch (i + 1)
{
case 1:
createCoolText(['The', 'Funkin Crew Inc']);
case 3:
addMoreText('presents');
case 4:
deleteCoolText();
case 5:
createCoolText(['In association', 'with']);
case 7:
addMoreText('newgrounds');
case 8:
deleteCoolText();
case 9:
createCoolText([curWacky[0]]);
case 11:
addMoreText(curWacky[1]);
case 12:
deleteCoolText();
case 13:
addMoreText('Friday');
case 14:

else
addMoreText('Night');
case 15:
addMoreText('Funkin');
case 16:
skipIntro();
}
}
}
lastBeat = Conductor.instance.currentBeat;
}

{


danceLeft = !danceLeft;

{
else
gfDance.animation.play('danceLeft');
}
}

}

function skipIntro():Void
{
{
remove(ngSpr);


skippedIntro = true;
}
}
}
