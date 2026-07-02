package funkin.ui.options;


/**
* Data structure for an arrow in the offset calibration/testing screen.
* Contains the sprite, beat, and direction of the arrow.
*/
typedef ArrowData =
{
};

class OffsetMenu extends Page<OptionsState.OptionsMenuPageName>
{











function get_msPerBeat():Float
{
}

/**
* Key press inputs which have been received but not yet processed.
* These are encoded with an OS timestamp, so we can account for input latency.
**/

/**
* Key release inputs which have been received but not yet processed.
* These are encoded with an OS timestamp, so we can account for input latency.
**/

/**
* Creates an arrow at the specified beat.
* @param beat The beat to create the arrow at.
*/
public function createArrow(beat:Float):Void
{
arrow.loadGraphic(Paths.image('latencyArrow'));
arrow.origin.set(0.5, 0.5);
arrow.setPosition(FlxG.width / 2, FlxG.height + arrow.height); // Below the screen
arrow.updateHitbox();
arrow.cameras = [menuCamera];
add(arrow);

arrows.push({
sprite: arrow,
beat: beat,
direction: 0
});
}

/**
* Gets the arrow at the specified beat.
* @param beat The beat to check.
* @return ArrowData of the arrow at the specified beat, or null if none exists.
*/
public function getArrowAtBeat(beat:Float):ArrowData
{
for (arrow in arrows)
{
}
}

/**
* Gets the closest arrow to the specified beat.
* @param beat The beat to check against.
* @return ArrowData of the closest arrow.
*/
public function getClosestArrowAtBeat(beat:Float):ArrowData
{

for (arrow in arrows)
{
{
closestDiff = diff;
closest = arrow;
}
}

}

public function new()
{
super();

localConductor = new Conductor();
localConductor.forceBPM(100);

menuCamera = new FunkinCamera('prefMenu');
menuCamera.bgColor = 0x0;

camera = menuCamera;

blackRect = new FlxSprite(0, 0);
blackRect.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
blackRect.alpha = 0;
blackRect.scrollFactor.set(0, 0);
add(blackRect);

receptor = new FunkinSprite(0, 0);
receptor.loadGraphic(Paths.image('latencyReceptor'));
receptor.origin.set(0.5, 0.5);
add(receptor);


testStrumline = new Strumline(noteStyle, true);
testStrumline.setPosition(FlxG.width / 2, FlxG.height / 2);
testStrumline.x -= testStrumline.width / 2;
testStrumline.scrollFactor.set(0, 0);
add(testStrumline);

testStrumline.cameras = [menuCamera];

testStrumline.conductorInUse = localConductor;
testStrumline.zIndex = 1001;
for (strum in testStrumline)
{
strum.alpha = 0;
}

receptor.alpha = 0;
receptor.centerOffsets();
receptor.scale.set(0, 0);
receptor.centerOrigin();
receptor.updateHitbox();

jumpInText = new FlxText(0, 0);
jumpInText.setFormat(Paths.font('vcr.ttf'), 32, FlxColor.WHITE, FlxTextAlign.CENTER);
jumpInText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 4);
add(jumpInText);

receptor.cameras = [menuCamera];
jumpInText.cameras = [menuCamera];


countText = new FlxText(0, 0);
countText.setFormat(Paths.font('vcr.ttf'), 32, FlxColor.WHITE, FlxTextAlign.CENTER);
countText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.BLACK, 4);
add(countText);

jumpInText.alpha = 0;
jumpInText.setPosition(FlxG.width / 2, 150);
jumpInText.scrollFactor.set(0, 0);

countText.text = '';
countText.alpha = 0;
countText.setPosition(FlxG.width / 2, 600);
countText.scrollFactor.set(0, 0);

countText.cameras = [menuCamera];

add(items = new TextMenuList());
add(preferenceItems = new FlxTypedSpriteGroup<FlxSprite>());

offsetItem = createPrefItemNumber('Offset (Global)', 'Offset (Global)', function(value:Float)
{
Preferences.globalOffset = Std.int(value);
}, null, Preferences.globalOffset, -1500, 1500, 1.0, 2, 5);
createButtonItem('Reset Offset', function()
{
Preferences.globalOffset = 0;
offsetItem.currentValue = Preferences.globalOffset;
});
createButtonItem('Offset Calibration', function()
{

testStrumline.alpha = 0;

testStrumline.clean();
testStrumline.noteData = [];
testStrumline.nextNoteIndex = 0;

jumpInText.text = 'Press any key to the beat!';
jumpInText.text = 'Tap to the beat!';

jumpInText.y = 100;

countText.text = 'Current Offset: 0ms';

calibrating = true;
MenuTypedList.pauseInput = true;
OptionsState.instance.drumsBG.pause();
OptionsState.instance.drumsBG.time = FlxG.sound.music.time;
OptionsState.instance.drumsBG.resume();
OptionsState.instance.drumsBG.fadeIn(1, 0, 1);
canExit = false;
differences = [];
offsetLerp = 0;
savedOffset = Preferences.globalOffset;
Preferences.globalOffset = 0; // We save the offset and set it to 0 so the player can recalibrate.
shouldOffset = 1;
tempOffset = 0;
appliedOffsetLerp = 0;

arrowBeat = Math.floor(localConductor.currentBeatTime) + 4;
receptor.angle = 0;

_gotMad = false;
});
createButtonItem('Test', function()
{

shouldOffset = 1;
testStrumline.clean();
testStrumline.noteData = [];
testStrumline.nextNoteIndex = 0;

OptionsState.instance.drumsBG.pause();
OptionsState.instance.drumsBG.time = FlxG.sound.music.time;
OptionsState.instance.drumsBG.resume();
localConductor.update(FlxG.sound.music.time, true);

arrowBeat = floored - (floored % 4);
arrowBeat += 4;
_lastDirection = 0;





jumpInText.text = 'Hit the notes as they come in!';
{

testStrumline.strumlineScale.set(playerStrumlineScale, playerStrumlineScale);
testStrumline.setNoteSpacing(playerNoteSpacing);
testStrumline.width *= 2;


testStrumline.x = (FlxG.width - testStrumline.width) / 2 + Constants.STRUMLINE_X_OFFSET;
testStrumline.y = (FlxG.height - height) * 0.95 - Constants.STRUMLINE_Y_OFFSET;
testStrumline.y -= 10;
}
else
{
{
testStrumline.destroy();
remove(testStrumline);
}

testStrumline = new Strumline(noteStyle, true);
testStrumline.setPosition(FlxG.width / 2, FlxG.height / 2);
testStrumline.x -= testStrumline.width / 2;
testStrumline.scrollFactor.set(0, 0);
add(testStrumline);
}
MenuTypedList.pauseInput = true;
OptionsState.instance.drumsBG.fadeIn(1, 0, 1);
canExit = false;
differences = [];

jumpInText.y = 350;

{
testStrumline.y = Preferences.downscroll ? FlxG.height - (height + 45) - Constants.STRUMLINE_Y_OFFSET : (height / 2) - Constants.STRUMLINE_Y_OFFSET;
testStrumline.isDownscroll = Preferences.downscroll;
}
else
{
jumpInText.y = FlxG.height - 425;
}
});
PreciseInputManager.instance.onInputPressed.add(onKeyPress);
PreciseInputManager.instance.onInputReleased.add(onKeyRelease);

backButton = new FunkinBackButton(FlxG.width - 230, FlxG.height - 200, FlxColor.WHITE, handleMobileExit);
add(backButton);
}

/**
* Callback executed when one of the note keys is pressed.
*/
function onKeyPress(event:PreciseInputEvent):Void
{
inputPressQueue.push(event);
}

/**
* Callback executed when one of the note keys is released.
*/
function onKeyRelease(event:PreciseInputEvent):Void
{
inputReleaseQueue.push(event);
}

public function exitCalibration(cancel:Bool):Void
{
backButton.enabled = false;
shouldOffset = -1;
tempOffset = 0;
{
FunkinSound.playOnce(Paths.sound('cancelMenu'));
}
else
FunkinSound.playOnce(Paths.sound('confirmMenu'));
offsetItem.currentValue = Preferences.globalOffset;
OptionsState.instance.drumsBG.fadeOut(1, 0);
}

public function handleMobileExit():Void
{
else if (shouldOffset == 0) exit();
}

public function getAverage():Float
{

for (i in 0...differences.length)
{
avg += differences[i];
}
avg /= differences.length;

}

public function getConsistency():Float
{


for (i in 0...differences.length)
{
}

}


/**
* Adds a difference in milliseconds to the list of differences.
* Calculates a new temporary offset every 4 differences.
* @param ms The difference in milliseconds.
* @see Preferences.globalOffset
*/
public function addDifference(ms:Float):Void
{
differences.push(ms);

{
tempOffset = Std.int(avg);
_lastOffset = appliedOffsetLerp;
_offsetLerpTime = 0;
}
}


override function update(elapsed:Float):Void
{
super.update(elapsed);
localConductor.update(localConductor.songPosition + elapsed * 1000, false);


{
localConductor.update(FlxG.sound.music.time, !calibrating);
b = localConductor.currentBeatTime;

for (i in 0...arrows.length)
{

arrow.beat = b + beatDiff;
lastArrowBeat = arrow.beat;
}
{
arrowBeat = lastArrowBeat;
}
else
arrowBeat = 4;

testStrumline.clean();
testStrumline.noteData = [];
testStrumline.nextNoteIndex = 0;

_lastTime = FlxG.sound.music.time;
}

_lastBeat = b;

{

localConductor.update(FlxG.sound.music.time, true);
OptionsState.instance.drumsBG.pause();
OptionsState.instance.drumsBG.time = FlxG.sound.music.time;
OptionsState.instance.drumsBG.resume();
b = localConductor.currentBeatTime;
_lastBeat = b;
}

_lastTime = FlxG.sound.music.time;

{
exitCalibration(true);
}

{
else
_offsetLerpTime = 1;

appliedOffsetLerp = FlxMath.lerp(_lastOffset, tempOffset, _offsetLerpTime);

countText.text = 'Current Offset: ' + Std.int(appliedOffsetLerp) + 'ms';

for (i in 0...arrows.length)
{

arrow.sprite.y = receptor.y + offset - (arrow.sprite.height / 2);
arrow.sprite.x = receptor.x - (arrow.sprite.width / 2);

{
arrow.sprite.alpha -= elapsed * 5;
}

{
toRemove.push(arrow);
arrow.sprite.kill();
continue;
}
_lastArrowBeat = arrow.beat;
}

for (arrow in toRemove)
{
arrows.remove(arrow);
}

{
arrowBeat = (arrowBeat - (arrowBeat % 2)) + 2;
}

{


{

{
arrow.sprite.alpha = 0;
arrow.sprite.kill();
arrows.remove(arrow);
}
}


{
jumpInText.text = 'Try to be a little more consistent with your timing!';
differences = [];
tempOffset = 0;
appliedOffsetLerp = 0;
_gotMad = true;
}

addDifference(ms);


{
jumpInText.text = 'Calibration complete!';
Preferences.globalOffset = tempOffset;
exitCalibration(false);
}

{
else
jumpInText.text = 'Nice job';
else
jumpInText.text += "!";
}

jumpInText.text += '\n' + differences.length + '/30';

_gotMad = false;

scaleModifier = 0.75;
}
}
else if (shouldOffset == 1)
{

processInputQueue();
{
arrowBeat = arrowBeat + 1;
testStrumline.addNoteData(data, false);

{
testStrumline.addNoteData(data, false);
}

_lastDirection = (_lastDirection + 1) % 4; // Cycle through directions 0-3
}
}
else
{
for (i in 0...arrows.length)
{
arrow.sprite.alpha -= elapsed * 5;
{
arrow.sprite.kill();
toRemove.push(arrow);
}
}

for (arrow in toRemove)
{
arrows.remove(arrow);
}
}
else if (lerped > 1) lerped = 1;

{
offsetLerp += elapsed / 2;
}
else if (shouldOffset == -1)
{
offsetLerp -= elapsed / 3;
{
backButton.enabled = true;
canExit = true;
calibrating = false;
MenuTypedList.pauseInput = false;
offsetLerp = 0;
shouldOffset = 0;
}
}

blackRect.alpha = FlxMath.lerp(0, 0.5, FlxEase.cubeInOut(lerped));


jumpInText.x = FlxG.width / 2 - (jumpInText.width / 2);
countText.x = FlxG.width / 2 - (countText.width / 2);

receptor.x = FlxG.width / 2 - (recW / 2);
receptor.y = FlxG.height / 2 - (recH / 2);

jumpInText.alpha = FlxMath.lerp(0, 1, FlxEase.cubeInOut(offsetLerp));

{
receptor.alpha = FlxMath.lerp(0, 1, FlxEase.cubeInOut(offsetLerp));
countText.alpha = FlxMath.lerp(0, 1, FlxEase.cubeInOut(offsetLerp));
}
else
{
testStrumline.alpha = FlxMath.lerp(0, 1, FlxEase.cubeInOut(offsetLerp));
backButton.y = FlxMath.lerp(FlxG.height - 200, 50, FlxEase.cubeInOut(offsetLerp));
}

{
scaleModifier += elapsed / 2;
}

receptor.scale.x = FlxMath.lerp(0, 1, FlxEase.cubeInOut(offsetLerp)) * scaleModifier;
receptor.scale.y = FlxMath.lerp(0, 1, FlxEase.cubeInOut(offsetLerp)) * scaleModifier;

for (note in testStrumline.notes.members)
{

GRhythmUtil.processWindow(note, true, localConductor);
note.alpha = FlxMath.lerp(0, 1, FlxEase.cubeInOut(offsetLerp));
}

items.forEach(function(daItem:TextMenuItem)
{
switch (Type.typeof(daItem))
{
case TClass(NumberPreferenceItem):
thyTextWidth = numPref.lefthandText.getWidth();

numPref.lefthandText.x = xLerp + (FlxG.width / 2) - ((thyTextWidth + daItem.atlasText.getWidth() + 20) / 2);
numPref.lefthandText.y = yLerp + ((120 * ind) + 30);
daItem.x = numPref.lefthandText.x + thyTextWidth + 20;
default:
daItem.x = xLerp + (FlxG.width / 2) - daItem.atlasText.getWidth() / 2;
}

daItem.y = yLerp + ((120 * ind) + 30);
ind++;
});
}

function hitNote(note:NoteSprite, input:PreciseInputEvent):Void
{


else
totalDiff = diff - inputLatencyMs;


addDifference(noteDiff);

{
jumpInText.text = 'Perfect!\n';
notesplash.play(note.direction, 0);
notesplash.setPosition(note.x, note.y);
add(notesplash);
}
else
{
jumpInText.text = noteDiff > 0 ? 'Early!\n' + noteDiff + 'ms' : 'Late!\n' + noteDiff + 'ms';
}

jumpInText.text += '\nAvg: ' + Std.int(getAverage()) + 'ms';

testStrumline.hitNote(note);
}

/**
* PreciseInputEvents are put into a queue between update() calls,
* and then processed here.
*/
function processInputQueue():Void
{



for (note in notesInRange)
notesByDirection[note.direction].push(note);

{

testStrumline.pressKey(input.noteDirection, input.keyCode);


{
testStrumline.playPress(input.noteDirection);
}
else
{

hitNote(targetNote, input);
notesInDirection.remove(targetNote);

testStrumline.playConfirm(input.noteDirection);
}
}

{

testStrumline.playStatic(input.noteDirection);

testStrumline.releaseKey(input.noteDirection, input.keyCode);
}

testStrumline.noteVibrations.tryNoteVibration();
}

function createButtonItem(name:String, callback:Void->Void):Void
{
items.addItem(name, item);
}

function createPrefItemNumber(prefName:String, prefDesc:String, onChange:Float->Void, ?valueFormatter:Float->String, defaultValue:Int, min:Int, max:Int,
step:Float = 0.1, precision:Int, dragStepMultiplier:Float = 1):NumberPreferenceItem
{
precision, onChange, valueFormatter, dragStepMultiplier);
items.addItem(prefName, item);
preferenceItems.add(item.lefthandText);
}

override public function destroy()
{
MenuTypedList.pauseInput = false;
exitCalibration(true);
super.destroy();
}
}
