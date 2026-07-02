package funkin.ui.haxeui.components;


typedef AnimationInfo =
{
}

/**
* A variant of SparrowPlayer which loads a BaseCharacter instead.
* This allows it to play appropriate animations based on song events.
*/
class CharacterPlayer extends Box
{

public function new(defaultToBf:Bool = true)
{
super();

{
loadCharacter('bf');
}
}


function get_charId():String
{
}

function set_charId(value:String):String
{
loadCharacter(value);
}


function get_charName():String
{
}


/**
* Loads a character by ID.
* @param id The ID of the character to load.
*/
public function loadCharacter(id:String):Void
{

{
remove(character);
character.destroy();
character = null;
}

{
character = null;
}

character = newCharacter;


{
character.scale.x *= Constants.PIXEL_ART_SCALE;
character.scale.y *= Constants.PIXEL_ART_SCALE;
}

character.animation.onFrameChange.add(onFrame);
character.animation.onFinish.add(onFinish);
add(character);

invalidateComponentLayout();

{
dispatch(new AnimationEvent(AnimationEvent.LOADED));
}
else
{
_redispatchLoaded = true;
}
}

/**
* The character type (such as BF, Dad, GF, etc).
*/

function set_characterType(value:CharacterType):CharacterType
{
}


function set_flip(value:Bool):Bool
{

{
character.flipX = !character.flipX;
}

}


function set_targetScale(value:Float):Float
{

{
character.setScale(value);
}

}

function onFrame(name:String, frameNumber:Int, frameIndex:Int):Void
{
dispatch(new AnimationEvent(AnimationEvent.FRAME));
}

function onFinish(name:String):Void
{
dispatch(new AnimationEvent(AnimationEvent.END));
}

public function playAnimManually(name:String, restart:Bool = false, ignoreOther:Bool = false, reversed:Bool = false):Void
{
}

override function repositionChildren():Void
{
super.repositionChildren();

character.x = this.cachedScreenX + (-character.globalOffsets[0] * character.scale.x);
character.y = this.cachedScreenY + (-character.globalOffsets[1] * character.scale.y);
}

/**
* Called when an update event is hit in the song.
* Used to play character animations.
* @param event The event.
*/
public function onUpdate(event:UpdateScriptEvent):Void
{
}

/**
* Called when an beat is hit in the song
* Used to play character animations.
* @param event The event.
*/
public function onBeatHit(event:SongTimeScriptEvent):Void
{
}

/**
* Called when a step is hit in the song
* Used to play character animations.
* @param event The event.
*/
public function onStepHit(event:SongTimeScriptEvent):Void
{
}

public function onNoteIncoming(event:NoteScriptEvent):Void
{
}

/**
* Called when a note is hit in the song
* Used to play character animations.
* @param event The event.
*/
public function onNoteHit(event:HitNoteScriptEvent):Void
{
{
character.onNoteHit(event);

|| (!event.note.noteData.getMustHitNote() && characterType == DAD)) character.holdTimer = -event.note.noteData?.length / 1000;
}
}

/**
* Called when a note is missed in the song
* Used to play character animations.
* @param event The event.
*/
public function onNoteMiss(event:NoteScriptEvent):Void
{
}

/**
* Called when a hold note is dropped in the song
* Used to play character animations.
* @param event The event.
*/
public function onNoteHoldDrop(event:HoldNoteScriptEvent):Void
{
}

/**
* Called when a key is pressed but no note is hit in the song
* Used to play character animations.
* @param event The event.
*/
public function onNoteGhostMiss(event:GhostMissNoteScriptEvent):Void
{
}
}

private class Layout extends DefaultLayout
{
public override function resizeChildren():Void
{
super.resizeChildren();

{
}

character.cornerPosition.set(0, 0);
}

public override function calcAutoSize(exclusions:Array<Component> = null):Size
{
{
}

size.width = charSceenBounds.width + paddingLeft + paddingRight;
size.height = charSceenBounds.height + paddingTop + paddingBottom;

}
}
