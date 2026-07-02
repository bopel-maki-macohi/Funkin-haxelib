


/**
* Holds the data for what assets to use for a note style,
* and provides convenience methods for building sprites based on them.
*/
class NoteStyle implements IRegistryEntry<NoteStyleData>
{
/**
* Note style data as parsed from the JSON file.
*/

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
}





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



{
}

}

public function getNoteAssetPath(raw:Bool = false):Null<String>
{
{
}

}

function buildNoteAnimations(target:NoteSprite):Void
{
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
}


}

public function getStrumlineAssetPath(raw:Bool = false):Null<String>
{
{
}

}

public function applyStrumlineAnimations(target:StrumlineNote, dir:NoteDirection):Void
{
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



}

public function getStrumlineOffsets():Array<Float>
{
}

public function applyStrumlineOffsets(target:StrumlineNote):Void
{
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
case TWO:
case ONE:
case GO:
default:
}


}

public function buildCountdownSpritePath(step:Countdown.CountdownStep):Null<String>
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

function buildCountdownSpriteLibrary(step:Countdown.CountdownStep):Null<String>
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
case Countdown.CountdownStep.TWO:
case Countdown.CountdownStep.ONE:
case Countdown.CountdownStep.GO:
default:
}

}

}

public function buildJudgementSprite(rating:String):Null<FunkinSprite>
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
case "good":
case "bad":
case "shit":
default:
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
}



}


function buildSplashFrames(force:Bool = false):Null<FlxAtlasFrames>
{
{
}

{
}

{
}


{
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
}

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
}


}


function buildHoldCoverFrames(force:Bool = false):Null<FlxFramesCollection>
{


for (direction in Strumline.DIRECTIONS)
{
}
}

function buildHoldCoverFrameForDirection(direction:NoteDirection):Null<FlxFramesCollection>
{
{


{
}

{
}



}

function buildHoldCoverAnimations(target:NoteHoldCover):Void
{
for (direction in Strumline.DIRECTIONS)
{
{
}
}
}

function fetchHoldCoverAnimationData(dir:NoteDirection):Null<Array<AnimationData>>
{
{



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
}
else
{
}
}
}
