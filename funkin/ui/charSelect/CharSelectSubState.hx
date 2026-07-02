package funkin.ui.charSelect;


class CharSelectSubState extends MusicBeatSubState
{
/**
* The default index for the cursor.
*/





false), new DropShadowFilter(5, 45, 0x000000, 1, 2, 2, 1, 1, false, false, false)];





public function new(?params:CharSelectSubStateParams)
{
super();
rememberedChar = params?.character ?? "";

cutoutSize = FullScreenScaleMode.gameCutoutSize.x / 2;

cursors = new CharSelectCursors();
grpHitboxes = new FlxTypedGroup<FlxObject>();

gfChill = new CharSelectGF(cutoutSize, 0);
playerChillOut = new CharSelectPlayer(cutoutSize, 0);
playerChill = new CharSelectPlayer(cutoutSize, 0);

dipshitBlur = new FunkinSprite(cutoutSize + 419, -65);
dipshitBacking = new FunkinSprite(cutoutSize + 423, -17);
chooseDipshit = new FunkinSprite(cutoutSize + 426, -13);

nametag = new Nametag(rememberedChar);

charHitbox = new FlxObject(FlxG.width * 0.65, FlxG.height * 0.2, 300, 500);

transitionGradient = new FunkinSprite(0, 0);
barthing = new FunkinSprite(0, 0);

selectSound = new FunkinSound();
unlockSound = new FunkinSound();
lockedSound = new FunkinSound();
staticSound = new FunkinSound();
}

function loadAvailableCharacters():Void
{

for (playerId in playerIds)
{

{
targetPosition += 1;
}

availableChars.set(targetPosition, playerId);

CharSelectAtlasHandler.loadAtlas('charSelect/${playerId}Chill');

{
CharSelectAtlasHandler.loadAtlas(gfPath);
}
}

CharSelectAtlasHandler.loadAtlas('charSelect/lockedChill', {filterQuality: LOW, cacheOnLoad: true});
}

override public function create():Void
{
super.create();

loadAvailableCharacters();

bopInfo = FramesJSFLParser.parse(Paths.file("images/charSelect/iconBopInfo/iconBopInfo.txt"));
{
}

bg.loadGraphic(Paths.image('charSelect/charSelectBG'));
bg.scrollFactor.set(0.1, 0.1);
add(bg);

applyStageMatrix: true
});
crowd.anim.play('');
crowd.anim.curAnim.looped = true;
crowd.scrollFactor.set(0.3, 0.3);
add(crowd);

applyStageMatrix: true
});
stageSpr.anim.play('');
stageSpr.anim.curAnim.looped = true;
add(stageSpr);

curtains.loadGraphic(Paths.image('charSelect/curtains'));
curtains.scrollFactor.set(1.4, 1.4);
add(curtains);

barthing.loadTextureAtlas("charSelect/barThing", {
applyStageMatrix: true
});
barthing.anim.play('');
barthing.anim.curAnim.looped = true;
barthing.blend = BlendMode.MULTIPLY;
barthing.scale.x = 2.5;
barthing.scrollFactor.set(0, 0);
add(barthing);

barthing.y += 80;
FlxTween.tween(barthing, {y: barthing.y - 80}, 1.3, {ease: FlxEase.expoOut});

charLight.loadGraphic(Paths.image('charSelect/charLight'));
add(charLight);

charLightGF.loadGraphic(Paths.image('charSelect/charLight'));
add(charLightGF);

function setupPlayerChill(character:String)
{
gfChill.switchGF(character);
add(gfChill);

playerChillOut.switchChar(character, false);
playerChillOut.visible = false;
add(playerChillOut);

playerChill.switchChar(character, false);
add(playerChill);
}

{
setupPlayerChill(rememberedChar);
for (pos => charId in availableChars)
{
{
setCursorPosition(pos, true);
break;
}
}
}
else
{
setupPlayerChill(Constants.DEFAULT_CHARACTER);
setCursorPosition(DEFAULT_CURSOR_INDEX, true);
}

applyStageMatrix: true
});
speakers.anim.play('');
speakers.anim.curAnim.looped = true;
speakers.scrollFactor.set(1.8, 1.8);
speakers.scale.set(1.05, 1.05);
add(speakers);

fgBlur.loadGraphic(Paths.image('charSelect/foregroundBlur'));
fgBlur.blend = BlendMode.MULTIPLY;
add(fgBlur);

dipshitBlur.frames = Paths.getSparrowAtlas("charSelect/dipshitBlur");
dipshitBlur.animation.addByPrefix('idle', "CHOOSE vertical offset instance 1", 24, true);
dipshitBlur.blend = BlendMode.ADD;
dipshitBlur.animation.play("idle");
add(dipshitBlur);

dipshitBacking.frames = Paths.getSparrowAtlas("charSelect/dipshitBacking");
dipshitBacking.animation.addByPrefix('idle', "CHOOSE horizontal offset instance 1", 24, true);
dipshitBacking.blend = BlendMode.ADD;
dipshitBacking.animation.play("idle");
add(dipshitBacking);

dipshitBacking.y += 210;
FlxTween.tween(dipshitBacking, {y: dipshitBacking.y - 210}, 1.1, {ease: FlxEase.expoOut});

chooseDipshit.loadGraphic(Paths.image('charSelect/chooseDipshit'));
add(chooseDipshit);

chooseDipshit.y += 200;
FlxTween.tween(chooseDipshit, {y: chooseDipshit.y - 200}, 1, {ease: FlxEase.expoOut});

dipshitBlur.y += 220;
FlxTween.tween(dipshitBlur, {y: dipshitBlur.y - 220}, 1.2, {ease: FlxEase.expoOut});

chooseDipshit.scrollFactor.set();
dipshitBacking.scrollFactor.set();
dipshitBlur.scrollFactor.set();

nametag.midpointX += cutoutSize;
add(nametag);

{
nametag.midpointY += 200;
FlxTween.tween(nametag, {midpointY: nametag.midpointY - 200}, 1, {ease: FlxEase.expoOut});
}

nametag.scrollFactor.set();


add(cursors);

charHitbox.active = false;
charHitbox.scrollFactor.set();

selectSound.loadEmbedded(Paths.sound('CS_select'));
selectSound.volume = 0.7;


unlockSound.loadEmbedded(Paths.sound('CS_unlock'));
unlockSound.volume = 0;
unlockSound.play(true);


lockedSound.loadEmbedded(Paths.sound('CS_locked'));
lockedSound.volume = 1.;


staticSound.loadEmbedded(Paths.sound('static loop'));
staticSound.looped = true;
staticSound.volume = 0.6;


FunkinSound.playMusic('stayFunky', {
startingVolume: 0,
overrideExisting: true,
restartTrack: true,
});

initLocks();

for (index => member in grpIcons.members)
{
member.y += 300;
FlxTween.tween(member, {y: member.y - 300}, 1, {ease: FlxEase.expoOut});
}


add(camFollow);
camFollow.screenCenter();



Conductor.stepHit.add(spamOnStep);

addBackButton(FlxG.width, FlxG.height - 200, FlxColor.WHITE, goBack, 0.3, true);

{
backButton.enabled = false;
backButton.cameras = [FlxG.camera];
}

FlxTween.tween(backButton, {x: FlxG.width - 230}, 0.5, {
ease: FlxEase.expoOut,
onComplete: (_) ->
{
}
});

transitionGradient.loadGraphic(Paths.image('freeplay/transitionGradient'));
transitionGradient.scale.set(1280, 1);
transitionGradient.flipY = true;
transitionGradient.updateHitbox();
FlxTween.tween(transitionGradient, {y: -720}, 1, {ease: FlxEase.expoOut});
add(transitionGradient);

camFollow.screenCenter();
camFollow.y -= 150;
fadeShader.fade(0.0, 1.0, 0.8, {
ease: FlxEase.quadOut,
onComplete: (twn) ->
{
}
});
FlxTween.tween(camFollow, {y: camFollow.y + 150}, 1.5, {
ease: FlxEase.expoOut,
onComplete: function(_)
{
autoFollow = true;
}
});

blackScreen.x = -(FlxG.width * 0.5);
blackScreen.y = -(FlxG.height * 0.5);
add(blackScreen);

introSound = new FunkinSound();
introSound.loadEmbedded(Paths.sound('CS_Lights'));
introSound.volume = 0;


openSubState(new IntroSubState());

subStateClosed.addOnce((_) ->
{
remove(blackScreen);
{
camera.flash();

introSound.volume = 1;
introSound.play(true);
}
checkNewChar();

Save.instance.oldChar.value = true;
});
}

override public function destroy():Void
{
CharSelectAtlasHandler.clearAtlasCache();
super.destroy();
}

function checkNewChar():Void
{
{
unLock();
});
else
{

FunkinSound.playMusic('stayFunky', {
startingVolume: 1,
overrideExisting: true,
restartTrack: true,
onLoad: function()
{
allowInput = true;

gfChill.analyzer = new SpectralAnalyzer(FlxG.sound.music._channel.__audioSource, 7, 0.1);
gfChill.analyzer.fftN = 512;
}
});
}
}


function initLocks():Void
{
add(grpIcons);


for (i in 0...9)
{
{
temp.setCharacter(path);
temp.setGraphicSize(128, 128);
temp.updateHitbox();
temp.ID = 0;
grpIcons.add(temp);
}
else
{

swfMode: true,
uniqueInCache: true
});

temp.ID = 1;

grpIcons.add(temp);
}

hitTemp.active = false;
hitTemp.scrollFactor.set();
grpHitboxes.add(hitTemp);
}

updateIconPositions();

grpIcons.scrollFactor.set();
}

function unLock():Void
{

pressedSelect = true;



{
yThing++;
copy += 3;
}

cursorY = yThing;
cursorX = xThing;

selectSound.play(true);

nonLocks.shift();

selectTimer.start(0.5, function(_)
{

lock.anim.play("unlock");
lock.anim.onFrameChange.add(function(animName:String, frame:Int, index:Int)
{
{
playerChillOut.anim.play("death");
}
});

unlockSound.volume = 0.7;
unlockSound.play(true);

lock.anim.onFinish.addOnce(function(_)
{
camera.flash(0xFFFFFFFF, 0.1);
playerChill.anim.play("unlock");
playerChill.visible = true;


nametag.switchChar(char);
gfChill.switchGF(char);
gfChill.visible = true;

icon.setCharacter(char);
icon.setGraphicSize(128, 128);
icon.updateHitbox();
grpIcons.insert(id, icon);
grpIcons.remove(lock, true);
icon.ID = 0;

bopPlay = true;

updateIconPositions();
playerChillOut.anim.onFinish.addOnce((_) -> if (_ == "death")
{
playerChillOut.visible = false;
playerChillOut.switchChar(char);
});

Medals.award(CharSelect);

Save.instance.addCharacterSeen(char);
{
pressedSelect = false;

staticSound.stop();

FunkinSound.playMusic('stayFunky', {
startingVolume: 1,
overrideExisting: true,
restartTrack: true,
onLoad: function()
{
allowInput = true;

gfChill.analyzer = new SpectralAnalyzer(FlxG.sound.music._channel.__audioSource, 7, 0.1);
gfChill.analyzer.fftN = 512;
}
});
}
else
playerChill.anim.onFinish.addOnce((_) -> unLock());
});

playerChill.visible = false;
playerChill.switchChar(availableChars[index] ?? Constants.DEFAULT_CHARACTER);

playerChillOut.visible = true;
});
}

function updateIconPositions()
{
grpIcons.x = cutoutSize + 450;
grpIcons.y = 120;

for (index => member in grpIcons.members)
{

member.x = posX * grpXSpread;
member.y = posY * grpYSpread;

member.x += grpIcons.x;
member.y += grpIcons.y;
}

for (index => member in grpHitboxes.members)
{

member.x = posX * grpXSpread;
member.y = posY * grpYSpread;

member.x += grpIcons.x + 20;
member.y += grpIcons.y + 20;
}
}

function goToFreeplay():Void
{
allowInput = false;
autoFollow = false;

{
FlxTween.tween(backButton, {alpha: 0}, 0.2);
}

FlxTween.tween(cursors, {alpha: 0}, 0.8, {ease: FlxEase.expoOut});

FlxTween.tween(barthing, {y: barthing.y + 80}, 0.8, {ease: FlxEase.backIn});
FlxTween.tween(nametag, {y: nametag.y + 80}, 0.8, {ease: FlxEase.backIn});
FlxTween.tween(dipshitBacking, {y: dipshitBacking.y + 210}, 0.8, {ease: FlxEase.backIn});
FlxTween.tween(chooseDipshit, {y: chooseDipshit.y + 200}, 0.8, {ease: FlxEase.backIn});
FlxTween.tween(dipshitBlur, {y: dipshitBlur.y + 220}, 0.8, {ease: FlxEase.backIn});
for (index => member in grpIcons.members)
{
FlxTween.tween(member, {y: member.y + 300}, 0.8, {ease: FlxEase.backIn});
}
FlxTween.cancelTweensOf(transitionGradient);
FlxTween.cancelTweensOf(fadeShader);
FlxTween.cancelTweensOf(camFollow);

FlxTween.tween(transitionGradient, {y: -150}, 0.8, {ease: FlxEase.backIn});
fadeShader.fade(1.0, 0, 0.8, {ease: FlxEase.quadIn});
FlxTween.tween(camFollow, {y: camFollow.y - 150}, 0.8, {
ease: FlxEase.backIn,
onComplete: function(_)
{
{
character: wentBackToFreeplay ? rememberedChar : curChar,
fromCharSelect: true
}
}));
}
});
}




override public function update(elapsed:Float):Void
{
super.update(elapsed);

Conductor.instance.update();

mobileAccept = false;

{
{
for (i => hitbox in grpHitboxes.members)
{


{
cursorX = indexCX;
cursorY = indexCY;
cursors.resetDeny();
selectSound.play(true);
}
else if (TouchUtil.justPressed)
{
mobileAccept = true;
}

break;
}
}

{
mobileAccept = true;
}

{
cursorY -= 1;
cursors.resetDeny();

holdTmrUp = 0;

selectSound.play(true);
}
{
cursorY += 1;
cursors.resetDeny();
holdTmrDown = 0;
selectSound.play(true);
}
{
cursorX -= 1;
cursors.resetDeny();

holdTmrLeft = 0;
selectSound.play(true);
}
{
cursorX += 1;
cursors.resetDeny();
holdTmrRight = 0;
selectSound.play(true);
}

{
holdTmrUp = 0;
spamDirections = spamDirections.without(UP);
}

{
holdTmrDown = 0;
spamDirections = spamDirections.without(DOWN);
}

{
holdTmrLeft = 0;
spamDirections = spamDirections.without(LEFT);
}

{
holdTmrRight = 0;
spamDirections = spamDirections.without(RIGHT);
}


}

cursorX = FlxMath.wrap(cursorX, -1, 1);
cursorY = FlxMath.wrap(cursorY, -1, 1);

{

{
mobileDeny = false;
cursors.unconfirm();

dispatchEvent(new CharacterSelectScriptEvent(CHARACTER_DESELECTED, curChar));

{
backButton.enabled = true;
}

FlxTween.globalManager.cancelTweensOf(FlxG.sound.music);
FlxTween.tween(FlxG.sound.music, {pitch: 1.0, volume: 1.0}, 1, {ease: FlxEase.quartInOut});
playerChill.anim.play("deselect");
gfChill.anim.play("deselect");
pressedSelect = false;
FlxTween.tween(FlxG.sound.music, {pitch: 1.0}, 1, {
ease: FlxEase.quartInOut,
onComplete: (_) ->
{
{
playerChill.anim.play("idle", true);
playerChill.anim.curAnim.looped = true;
gfChill.anim.play("idle", true);
gfChill.anim.curAnim.looped = true;
}
}
});
selectTimer.cancel();
}

{
mobileDeny = false;
spamDirections = NONE;

cursors.confirm();

FunkinSound.playOnce(Paths.sound('CS_confirm'));

dispatchEvent(new CharacterSelectScriptEvent(CHARACTER_CONFIRMED, curChar));

{
backButton.enabled = false;
}

FlxTween.tween(FlxG.sound.music, {pitch: 0.1}, 1, {ease: FlxEase.quadInOut});
FlxTween.tween(FlxG.sound.music, {volume: 0.0}, 1.5, {ease: FlxEase.quadInOut});

playerChill.anim.play("select");
gfChill.anim.play("confirm", true);
gfChill.anim.curAnim.looped = true;

pressedSelect = true;
selectTimer.start(1.5, (_) ->
{
goToFreeplay();
});
}
else if (pressedSelect && TouchUtil.justReleased) mobileDeny = true;

mobileAccept = false;
}
else
{
curChar = "locked";

gfChill.visible = false;

{
playerChill.anim.play("cannot select Label", true);
lockedSound.play(true);
HapticUtil.vibrate(0, 0.2);

cursors.deny();
}
}

updateLockAnims();

{
camFollow.screenCenter();
camFollow.x += cursorX * 10;
camFollow.y += cursorY * 10;
}

cursorLocIntended.x = (cursorFactor * cursorX) + (FlxG.width / 2) - cursors.main.width / 2;
cursorLocIntended.y = (cursorFactor * cursorY) + (FlxG.height / 2) - cursors.main.height / 2;

cursorLocIntended.x += cursorOffsetX;
cursorLocIntended.y += cursorOffsetY;

cursors.lerpToLocation(cursorLocIntended);
}

function goBack():Void
{
{
backButton.enabled = false;
backButton.alpha = 1;
backButton.animation.play("confirm");
}

wentBackToFreeplay = true;
FunkinSound.playOnce(Paths.sound('cancelMenu'));
FlxTween.tween(FlxG.sound.music, {volume: 0.0}, 0.7, {ease: FlxEase.quadInOut});
goToFreeplay();
}


function doBop(icon:PixelatedIcon, elapsed:Float):Void
{
{
bopRefX = 0;
bopRefY = 0;
bopPlay = false;
bopFr = 0;
}
bopTimer += elapsed;

{
bopTimer -= bopTimer;



icon.scale.set(2.6, 2.6);
icon.scale.add(scaleXDiff, scaleYDiff);

bopFr++;
}
}

public override function dispatchEvent(event:ScriptEvent):Void
{
super.dispatchEvent(event);

ScriptEventDispatcher.callEvent(playerChill, event);
ScriptEventDispatcher.callEvent(gfChill, event);
}

function spamOnStep():Void
{
{
selectSound.play(true);

cursors.resetDeny();

{
cursorY -= 1;
holdTmrUp = 0;
}
{
cursorY += 1;
holdTmrDown = 0;
}
{
cursorX -= 1;
holdTmrLeft = 0;
}
{
cursorX += 1;
holdTmrRight = 0;
}
}
}

private function updateLockAnims():Void
{
for (index => member in grpIcons.group.members)
{
switch (member.ID)
{
case 1:
{
switch (lock.getCurrentAnimation())
{
case "idle":
lock.anim.play("selected");
case "selected" | "clicked":
}
}
else
{
lock.anim.play("idle");
}
case 0:

{
{
{
bopRefX = memb.x;
bopRefY = memb.y;
}
doBop(memb, FlxG.elapsed);
}
else
{
memb.filters = selectedBizz;
memb.scale.set(2.6, 2.6);
}
{
memb.animation.play("confirm", false, true);

onFinish = (_) ->
{
member.animation.play('idle');
member.animation.onFinish.remove(onFinish);
};

member.animation.onFinish.add(onFinish);
}
}
else
{
memb.filters = null;
memb.scale.set(2, 2);
}
}
}
}

function getCurrentSelected():Int
{
}

function setCursorPosition(index:Int, instant:Bool = false):Void
{

{
yThing++;
copy += 3;
}


cursorY = yThing;
cursorX = xThing;

{
cursorLocIntended.x = (cursorFactor * cursorX) + (FlxG.width / 2) - cursors.main.width / 2;
cursorLocIntended.y = (cursorFactor * cursorY) + (FlxG.height / 2) - cursors.main.height / 2;

cursorLocIntended.x += cursorOffsetX;
cursorLocIntended.y += cursorOffsetY;

cursors.snapToLocation(cursorLocIntended);
}
}

function set_curChar(value:String):String
{

curChar = value;

else
staticSound.stop();

dispatchEvent(new CharacterSelectScriptEvent(CHARACTER_SELECTED, value));

nametag.switchChar(value);
gfChill.visible = false;
playerChill.visible = false;
playerChillOut.visible = true;
playerChillOut.anim.play("slideout");

playerChillOut.anim.onFrameChange.removeAll();
playerChillOut.anim.onFrameChange.add(function(animName:String, frameNumber:Int, index:Int)
{
{
playerChill.visible = true;
playerChill.switchChar(value);
gfChill.switchGF(value);
gfChill.visible = true;
}
});

playerChillOut.anim.onFinish.addOnce(function(animName:String)
{
playerChillOut.switchChar(value);
playerChillOut.visible = false;
playerChillOut.anim.onFrameChange.removeAll();
});

}

function set_grpXSpread(value:Float):Float
{
grpXSpread = value;
updateIconPositions();
}

function set_grpYSpread(value:Float):Float
{
grpYSpread = value;
updateIconPositions();
}
}

/**
* Parameters used to initialize the CharSelectSubState.
*/
typedef CharSelectSubStateParams =
{
?character:String
};
