package funkin.play.notes.notestyle;


using funkin.data.animation.AnimationData.AnimationDataUtil;

/**
* Holds the data for what assets to use for a note style,
* and provides convenience methods for building sprites based on them.
*/
class NoteStyle implements IRegistryEntry<NoteStyleData>
{
/**
* Note style data as parsed from the JSON file.
*/
public final _data:NoteStyleData;

/**
* The note style to use if this one doesn't have a certain asset.
* This can be recursive, ehe.
*/

function get_fallback():Null<NoteStyle>
{
}

/**
* @param id The ID of the JSON file to parse.
*/
public function new(id:String, ?params:Dynamic)
{
this.id = id;
_data = _fetchData(id);
}

/**
* Get the readable name of the note style.
* @return String
*/
public function getName():String
{
}

/**
* Get the author of the note style.
* @return String
*/
public function getAuthor():String
{
}

/**
* Get the note style ID of the parent note style.
* @return The string ID, or `null` if there is no parent.
*/
public function getFallbackID():Null<String>
{
}

public function buildNoteSprite(target:NoteSprite):Void
{

{
throw 'Could not load spritesheet for note style: $id';
}

target.frames = atlas;

target.antialiasing = !(_data.assets?.note?.isPixel ?? false);

target.offset.set(noteOffsets[0], noteOffsets[1]);

buildNoteAnimations(target);

target.scale.set(scale, scale);
target.updateHitbox();
}

function getNoteAssetLibrary():Null<String>
{
}


function buildNoteFrames(force:Bool = false):Null<FlxAtlasFrames>
{
{
}

{
}

{
}


noteFrames = Paths.getSparrowAtlas(noteAssetPath, getAssetLibrary(getNoteAssetPath(true)));

{
throw 'Could not load note frames for note style: $id';
}

}

public function getNoteAssetPath(raw:Bool = false):Null<String>
{
{
}

}

function buildNoteAnimations(target:NoteSprite):Void
{
leftData.flipX, leftData.flipY);
downData.flipX, downData.flipY);
upData.flipY);
rightData.flipX, rightData.flipY);
}

public function isNoteAnimated():Bool
{
}

public function getNoteScale():Float
{
}

public function getNoteOffsets():Array<Float>
{
}

function fetchNoteAnimationData(dir:NoteDirection):Null<AnimationData>
{
{
case LEFT: _data.assets?.note?.data?.left?.toNamed();
case DOWN: _data.assets?.note?.data?.down?.toNamed();
case UP: _data.assets?.note?.data?.up?.toNamed();
case RIGHT: _data.assets?.note?.data?.right?.toNamed();
};

}

public function getHoldNoteAssetPath(raw:Bool = false):Null<String>
{
{
}

}

public function isHoldNotePixel():Bool
{
}

public function fetchHoldNoteScale():Float
{
}

public function getHoldNoteOffsets():Array<Float>
{
}

public function applyStrumlineFrames(target:StrumlineNote):Void
{


{
throw 'Could not load spritesheet for note style: $id';
}

target.frames = atlas;

target.scale.set(_data.assets.noteStrumline?.scale ?? 1.0);
target.antialiasing = !(_data.assets.noteStrumline?.isPixel ?? false);
}

public function getStrumlineAssetPath(raw:Bool = false):Null<String>
{
{
}

}

public function applyStrumlineAnimations(target:StrumlineNote, dir:NoteDirection):Void
{
FlxAnimationUtil.addAtlasAnimations(target, getStrumlineAnimationData(dir));
}

/**
* Fetch the animation data for the strumline.
* NOTE: This function only queries the fallback note style if all the animations are missing for a given direction.
*
* @param dir The direction to fetch the animation data for.
* @return The animation data for the strumline in that direction.
*/
function getStrumlineAnimationData(dir:NoteDirection):Array<AnimationData>
{
{
case NoteDirection.LEFT:
[_data.assets.noteStrumline?.data?.leftStatic?.toNamed('static'), _data.assets.noteStrumline?.data?.leftPress?.toNamed('press'), _data.assets.noteStrumline?.data?.leftConfirm?.toNamed('confirm'), _data.assets.noteStrumline?.data?.leftConfirmHold?.toNamed('confirm-hold'),];
case NoteDirection.DOWN: [_data.assets.noteStrumline?.data?.downStatic?.toNamed('static'), _data.assets.noteStrumline?.data?.downPress?.toNamed('press'), _data.assets.noteStrumline?.data?.downConfirm?.toNamed('confirm'), _data.assets.noteStrumline?.data?.downConfirmHold?.toNamed('confirm-hold'),];
case NoteDirection.UP: [_data.assets.noteStrumline?.data?.upStatic?.toNamed('static'), _data.assets.noteStrumline?.data?.upPress?.toNamed('press'), _data.assets.noteStrumline?.data?.upConfirm?.toNamed('confirm'), _data.assets.noteStrumline?.data?.upConfirmHold?.toNamed('confirm-hold'),];
case NoteDirection.RIGHT: [_data.assets.noteStrumline?.data?.rightStatic?.toNamed('static'), _data.assets.noteStrumline?.data?.rightPress?.toNamed('press'), _data.assets.noteStrumline?.data?.rightConfirm?.toNamed('confirm'), _data.assets.noteStrumline?.data?.rightConfirmHold?.toNamed('confirm-hold'),];
default: [];
};



}

public function getStrumlineOffsets():Array<Float>
{
}

public function applyStrumlineOffsets(target:StrumlineNote):Void
{
target.x += offsets[0];
target.y += offsets[1];
}

public function getStrumlineScale():Float
{
}

public function isNoteSplashEnabled():Bool
{
}

public function isHoldNoteCoverEnabled():Bool
{
}

/**
* Build a sprite for the given step of the countdown.
* @param step
* @return A `FunkinSprite`, or `null` if no graphic is available for this step.
*/
public function buildCountdownSprite(step:Countdown.CountdownStep):Null<FunkinSprite>
{

switch (step)
{
case THREE:
result.loadTexture(assetPath);
result.scale.x = _data.assets.countdownThree?.scale ?? 1.0;
result.scale.y = _data.assets.countdownThree?.scale ?? 1.0;
case TWO:
result.loadTexture(assetPath);
result.scale.x = _data.assets.countdownTwo?.scale ?? 1.0;
result.scale.y = _data.assets.countdownTwo?.scale ?? 1.0;
case ONE:
result.loadTexture(assetPath);
result.scale.x = _data.assets.countdownOne?.scale ?? 1.0;
result.scale.y = _data.assets.countdownOne?.scale ?? 1.0;
case GO:
result.loadTexture(assetPath);
result.scale.x = _data.assets.countdownGo?.scale ?? 1.0;
result.scale.y = _data.assets.countdownGo?.scale ?? 1.0;
default:
}

result.scrollFactor.set(0, 0);
result.antialiasing = !isCountdownSpritePixel(step);
result.updateHitbox();

}

public function buildCountdownSpritePath(step:Countdown.CountdownStep):Null<String>
{
switch (step)
{
case THREE:
basePath = _data.assets.countdownThree?.assetPath;
case TWO:
basePath = _data.assets.countdownTwo?.assetPath;
case ONE:
basePath = _data.assets.countdownOne?.assetPath;
case GO:
basePath = _data.assets.countdownGo?.assetPath;
default:
basePath = null;
}



}

function buildCountdownSpriteLibrary(step:Countdown.CountdownStep):Null<String>
{
switch (step)
{
case THREE:
basePath = _data.assets.countdownThree?.assetPath;
case TWO:
basePath = _data.assets.countdownTwo?.assetPath;
case ONE:
basePath = _data.assets.countdownOne?.assetPath;
case GO:
basePath = _data.assets.countdownGo?.assetPath;
default:
basePath = null;
}



}

public function isCountdownSpritePixel(step:Countdown.CountdownStep):Bool
{
switch (step)
{
case THREE:
case TWO:
case ONE:
case GO:
default:
}
}

public function getCountdownSpriteOffsets(step:Countdown.CountdownStep):Array<Float>
{
switch (step)
{
case THREE:
case TWO:
case ONE:
case GO:
default:
}
}

public function getCountdownSoundPath(step:Countdown.CountdownStep, raw:Bool = false):Null<String>
{
{
{
case Countdown.CountdownStep.THREE:
_data.assets.countdownThree?.data?.audioPath;
case Countdown.CountdownStep.TWO:
_data.assets.countdownTwo?.data?.audioPath;
case Countdown.CountdownStep.ONE:
_data.assets.countdownOne?.data?.audioPath;
case Countdown.CountdownStep.GO:
_data.assets.countdownGo?.data?.audioPath;
default:
null;
}

}

}

public function buildJudgementSprite(rating:String):Null<FunkinSprite>
{

switch (rating)
{
case "sick":
result.loadTexture(assetPath);
result.scale.x = _data.assets.judgementSick?.scale ?? 1.0;
result.scale.y = _data.assets.judgementSick?.scale ?? 1.0;
case "good":
result.loadTexture(assetPath);
result.scale.x = _data.assets.judgementGood?.scale ?? 1.0;
result.scale.y = _data.assets.judgementGood?.scale ?? 1.0;
case "bad":
result.loadTexture(assetPath);
result.scale.x = _data.assets.judgementBad?.scale ?? 1.0;
result.scale.y = _data.assets.judgementBad?.scale ?? 1.0;
case "shit":
result.loadTexture(assetPath);
result.scale.x = _data.assets.judgementShit?.scale ?? 1.0;
result.scale.y = _data.assets.judgementShit?.scale ?? 1.0;
default:
}

result.scrollFactor.set(0.2, 0.2);
result.antialiasing = !isPixel;
result.pixelPerfectRender = isPixel;
result.pixelPerfectPosition = isPixel;
result.updateHitbox();

}

public function isJudgementSpritePixel(rating:String):Bool
{
switch (rating)
{
case "sick":
case "good":
case "bad":
case "shit":
default:
}
}

public function buildJudgementSpritePath(rating:String):Null<String>
{

switch (rating)
{
case "sick":
basePath = _data.assets.judgementSick?.assetPath;
case "good":
basePath = _data.assets.judgementGood?.assetPath;
case "bad":
basePath = _data.assets.judgementBad?.assetPath;
case "shit":
basePath = _data.assets.judgementShit?.assetPath;
default:
basePath = null;
}

}

public function getJudgementSpriteOffsets(rating:String):Array<Float>
{
switch (rating)
{
case "sick":
case "good":
case "bad":
case "shit":
default:
}
}

public function buildComboNumSprite(digit:Int):Null<FunkinSprite>
{

switch (digit)
{
case 0:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber0?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber0?.scale ?? 1.0;
case 1:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber1?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber1?.scale ?? 1.0;
case 2:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber2?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber2?.scale ?? 1.0;
case 3:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber3?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber3?.scale ?? 1.0;
case 4:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber4?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber4?.scale ?? 1.0;
case 5:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber5?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber5?.scale ?? 1.0;
case 6:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber6?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber6?.scale ?? 1.0;
case 7:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber7?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber7?.scale ?? 1.0;
case 8:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber8?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber8?.scale ?? 1.0;
case 9:
result.loadTexture(assetPath);
result.scale.x = _data.assets.comboNumber9?.scale ?? 1.0;
result.scale.y = _data.assets.comboNumber9?.scale ?? 1.0;
default:
}

result.antialiasing = !isPixel;
result.pixelPerfectRender = isPixel;
result.pixelPerfectPosition = isPixel;
result.updateHitbox();

}

public function isComboNumSpritePixel(digit:Int):Bool
{
switch (digit)
{
case 0:
case 1:
case 2:
case 3:
case 4:
case 5:
case 6:
case 7:
case 8:
case 9:
default:
}
}

public function buildComboNumSpritePath(digit:Int):Null<String>
{
switch (digit)
{
case 0:
basePath = _data.assets.comboNumber0?.assetPath;
case 1:
basePath = _data.assets.comboNumber1?.assetPath;
case 2:
basePath = _data.assets.comboNumber2?.assetPath;
case 3:
basePath = _data.assets.comboNumber3?.assetPath;
case 4:
basePath = _data.assets.comboNumber4?.assetPath;
case 5:
basePath = _data.assets.comboNumber5?.assetPath;
case 6:
basePath = _data.assets.comboNumber6?.assetPath;
case 7:
basePath = _data.assets.comboNumber7?.assetPath;
case 8:
basePath = _data.assets.comboNumber8?.assetPath;
case 9:
basePath = _data.assets.comboNumber9?.assetPath;
default:
basePath = null;
}



}

public function getComboNumSpriteOffsets(digit:Int):Array<Float>
{
switch (digit)
{
case 0:
case 1:
case 2:
case 3:
case 4:
case 5:
case 6:
case 7:
case 8:
case 9:
default:
}
}

public function buildSplashSprite(target:NoteSplash):Void
{

{
throw 'Could not load spritesheet for note style: $id';
}
target.frames = atlas;
target.antialiasing = !(_data.assets.noteSplash?.isPixel ?? false);

buildSplashAnimations(target);

target.splashFramerate = getSplashFramerate();
target.splashFramerateVariance = getSplashFramerateVariance();
target.alpha = _data.assets.noteSplash?.alpha ?? 1.0;
target.blend = _data.assets.noteSplash?.data?.blendMode ?? "normal";

target.scale.set(scale, scale);
target.updateHitbox();
}


function buildSplashFrames(force:Bool = false):Null<FlxAtlasFrames>
{
{
}

{
}

{
}


splashFrames = Paths.getSparrowAtlas(splashAssetPath, getAssetLibrary(getSplashAssetPath(true)));
splashFrames.parent.persist = true;
{
throw 'Could not load notesplash frames for note style: $id';
}
}

public function getSplashAssetPath(raw:Bool = false):Null<String>
{
{
}

}

function buildSplashAnimations(target:NoteSplash):Void
{
{
{
for (anim in animData)
FlxAnimationUtil.addAtlasAnimation(target, anim);
}
};

addSplashAnim(LEFT);
addSplashAnim(RIGHT);
addSplashAnim(UP);
addSplashAnim(DOWN);
}

public function isSplashAnimated():Bool
{
}

public function getSplashScale():Float
{
}

function fetchSplashAnimationData(dir:NoteDirection):Null<Array<AnimationData>>
{
{
case LEFT: _data.assets?.noteSplash?.data?.leftSplashes?.toNamedArray("splashLEFT");
case DOWN: _data.assets?.noteSplash?.data?.downSplashes?.toNamedArray("splashDOWN");
case UP: _data.assets?.noteSplash?.data?.upSplashes?.toNamedArray("splashUP");
case RIGHT: _data.assets?.noteSplash?.data?.rightSplashes?.toNamedArray("splashRIGHT");
};
}

public function getSplashOffsets():Array<Float>
{
}

public function getSplashFramerate():Int
{
}

public function getSplashFramerateVariance():Int
{
}

public function buildHoldCoverSprite(target:NoteHoldCover):Void
{
{
throw 'Could not load spritesheet for note style: $id';
}
target.glow.frames = glowAtlas;

target.antialiasing = !(_data.assets.holdNoteCover?.isPixel ?? false);
target.glow.antialiasing = !(_data.assets.holdNoteCover?.isPixel ?? false);
target.scale.set(_data.assets.holdNoteCover?.scale ?? 1.0, _data.assets.holdNoteCover?.scale ?? 1.0);
target.updateHitbox();
target.glow.updateHitbox();

buildHoldCoverAnimations(target);
}


function buildHoldCoverFrames(force:Bool = false):Null<FlxFramesCollection>
{


for (direction in Strumline.DIRECTIONS)
{
else if (atlas != null) holdCoverFrames = FlxAnimationUtil.combineFramesCollections(holdCoverFrames, atlas);
}
}

function buildHoldCoverFrameForDirection(direction:NoteDirection):Null<FlxFramesCollection>
{
{
case LEFT: _data.assets?.holdNoteCover?.data?.left;
case DOWN: _data.assets?.holdNoteCover?.data?.down;
case UP: _data.assets?.holdNoteCover?.data?.up;
case RIGHT: _data.assets?.holdNoteCover?.data?.right;
};


{
}

{
}


atlas.parent.persist = true;

}

function buildHoldCoverAnimations(target:NoteHoldCover):Void
{
for (direction in Strumline.DIRECTIONS)
{
{
animData[1].looped = true;
FlxAnimationUtil.addAtlasAnimations(target.glow, animData);
}
}
}

function fetchHoldCoverAnimationData(dir:NoteDirection):Null<Array<AnimationData>>
{
{
case LEFT: [_data.assets?.holdNoteCover?.data?.left?.start?.toNamed('holdCoverStart$noteColor'), _data.assets?.holdNoteCover?.data?.left?.hold?.toNamed('holdCover$noteColor'), _data.assets?.holdNoteCover?.data?.left?.end?.toNamed('holdCoverEnd$noteColor'),];
case DOWN: [_data.assets?.holdNoteCover?.data?.down?.start?.toNamed('holdCoverStart$noteColor'), _data.assets?.holdNoteCover?.data?.down?.hold?.toNamed('holdCover$noteColor'), _data.assets?.holdNoteCover?.data?.down?.end?.toNamed('holdCoverEnd$noteColor'),];
case UP: [_data.assets?.holdNoteCover?.data?.up?.start?.toNamed('holdCoverStart$noteColor'), _data.assets?.holdNoteCover?.data?.up?.hold?.toNamed('holdCover$noteColor'), _data.assets?.holdNoteCover?.data?.up?.end?.toNamed('holdCoverEnd$noteColor'),];
case RIGHT: [_data.assets?.holdNoteCover?.data?.right?.start?.toNamed('holdCoverStart$noteColor'), _data.assets?.holdNoteCover?.data?.right?.hold?.toNamed('holdCover$noteColor'), _data.assets?.holdNoteCover?.data?.right?.end?.toNamed('holdCoverEnd$noteColor'),];
default: [];
};



}

function getHoldCoverRootAssetPath(direction:NoteDirection, raw:Bool = false):Null<String>
{
{
}

}

public function getHoldCoverDirectionAssetPath(direction:NoteDirection, raw:Bool = false):Null<String>
{
{
{
case LEFT: _data?.assets?.holdNoteCover?.data?.left?.assetPath;
case DOWN: _data?.assets?.holdNoteCover?.data?.down?.assetPath;
case UP: _data?.assets?.holdNoteCover?.data?.up?.assetPath;
case RIGHT: _data?.assets?.holdNoteCover?.data?.right?.assetPath;
};

}

}

public function getHoldCoverOffsets():Array<Float>
{
}

public function destroy():Void
{
}

/**
* Returns a string of the library name for the given asset id
* `default:assets/images/awesome.png` returns `default`
* If you pass a asset path with no library name (no `:` aka LIBRARY_SEPARATOR) it will return null
* @param id The asset id to get the library name from
* @return Null<String> The library name, or null if no library name is present
*/
function getAssetLibrary(?id:String):Null<String>
{

}

public function toString():String
{
}

static function _fetchData(id:String):NoteStyleData
{

{
throw 'Could not parse note style data for id: $id';
}
else
{
}
}
}
