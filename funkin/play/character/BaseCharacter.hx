

/**
* A Character is a stage prop which bops to the music as well as controlled by the strumlines.
*
* Remember: The character's origin is at its FEET. (horizontal center, vertical bottom)
*/
class BaseCharacter extends Bopper
{

/**
* Whether the player is an active character (Boyfriend) or not.
*/

function set_characterType(value:CharacterType):CharacterType
{
}

/**
* Tracks how long, in seconds, the character has been playing the current `sing` animation.
* This is used to ensure that characters play the `sing` animations for at least one beat,
*   preventing them from reverting to the `idle` animation between notes.
*/

/**
* Set to true when the character dead. Part of the handling for death animations.
*/

/**
* Set to true when the character being used in a special way.
* This includes the Chart Editor and the Animation Editor.
*
* Used by scripts to ensure that they don't try to run code to interact with the stage when the stage doesn't actually exist.
*/

/**
* If set, this stage will be used instead of the current stage in PlayState.
*/

/**
* The current note kind.
*/

/**
* This character plays a given animation when hitting these specific combo numbers.
*/

/**
* This character plays a given animation when dropping combos larger than these numbers.
*/


/**
* The offset between the corner of the sprite and the origin of the sprite (at the character's feet).
* cornerPosition = stageData - characterOrigin
*/

function get_characterOrigin():FlxPoint
{
}

/**
* The absolute position of the top-left of the character.
* @return
*/

function get_cornerPosition():FlxPoint
{
}

function set_cornerPosition(value:FlxPoint):FlxPoint
{



}

/**
* The absolute position of the character's feet, at the bottom-center of the sprite.
*/

function get_feetPosition():FlxPoint
{
}

/**
* Returns the point the camera should focus on.
* Should be approximately centered on the character, and should not move based on the current animation.
*
* Set the position of this rather than reassigning it, so that anything referencing it will not be affected.
*/

/**
* If the x position changes, other than via changing the animation offset,
*  then we need to update the camera focus point.
*/
override function set_x(value:Float):Float
{


}

/**
* If the y position changes, other than via changing the animation offset,
*  then we need to update the camera focus point.
*/
override function set_y(value:Float):Float
{


}

public function new(id:String, renderType:CharacterRenderType)
{



{
}
else if (_data.renderType != renderType)
{
}
else
{
}


}

public function getDeathCameraOffsets():Array<Float>
{
}

public function getBaseScale():Float
{
}

public function getDeathCameraZoom():Float
{
}

public function getDeathPreTransitionDelay():Float
{
}

/**
* Gets the value of flipX from the character data.
* `!getFlipX()` is the direction Boyfriend should face.
*/
public function getDataFlipX():Bool
{
}

function findCountAnimations(prefix:String):Array<Int>
{


for (anim in animNames)
{
{
{
}
}
}

}

/**
* Reset the character so it can be used at the start of the level.
* Call this when restarting the level.
*/
public function resetCharacter(resetCamera:Bool = true):Void
{


this.dance(true); // Force to avoid the old animation playing with the wrong offset at the start of the song.

}

/**
* Set the character's sprite scale to the appropriate value.
* @param scale The desired scale.
*/
public function setScale(scale:Null<Float>):Void
{

}

/**
* The per-character camera offset.
*/

function get_characterCameraOffsets():Array<Float>
{
}

override function onCreate(event:ScriptEvent):Void
{



this.comboNoteCounts = findCountAnimations('combo'); // ex. combo50
this.dropNoteCounts = findCountAnimations('drop'); // ex. drop50

}

override function onAnimationFinished(animationName:String):Void
{

|| animationName.startsWith('combo')
|| animationName.startsWith('drop'))
{
}
}

public function resetCameraFocusPoint():Void
{
}

public function getHealthIconId():String
{
}

public function initHealthIcon(isOpponent:Bool):Void
{
{
{
}
PlayState.instance.iconP1.configure(_data?.healthIcon);
PlayState.instance.iconP1.flipX = !PlayState.instance.iconP1.flipX; // BF is looking the other way.
}
else
{
{
}
PlayState.instance.iconP2.configure(_data?.healthIcon);
}
}

public override function onUpdate(event:UpdateScriptEvent):Void
{

{
}

{
}


&& !getCurrentAnimation().endsWith(Constants.ANIMATION_HOLD_SUFFIX)
&& hasAnimation(getCurrentAnimation() + Constants.ANIMATION_HOLD_SUFFIX))
{
}
else
{
{
}
}

{




{


{
}
else
{
}
}
}
else
{
}
}

public function isSinging():Bool
{
}

override function dance(force:Bool = false):Void
{

{

}

}

/**
* Returns true if the player just pressed a note.
* Used when determing whether a the player character should revert to the `idle` animation.
* On non-player characters, this should be ignored.
*/
function justPressedNote(player:Int = 1):Bool
{
switch (player)
{
case 1:
|| PlayerSettings.player1.controls.NOTE_DOWN_P
|| PlayerSettings.player1.controls.NOTE_UP_P
case 2:
|| PlayerSettings.player2.controls.NOTE_DOWN_P
|| PlayerSettings.player2.controls.NOTE_UP_P
}
}

/**
* Returns true if the player is holding a note.
* Used when determing whether a the player character should revert to the `idle` animation.
* On non-player characters, this should be ignored.
*/
function isHoldingNote(player:Int = 1):Bool
{
switch (player)
{
case 1:
|| PlayerSettings.player1.controls.NOTE_DOWN
|| PlayerSettings.player1.controls.NOTE_UP
case 2:
|| PlayerSettings.player2.controls.NOTE_DOWN
|| PlayerSettings.player2.controls.NOTE_UP
}
}

/**
* Every time a note is hit, check if the note is from the same strumline.
* If it is, then play the sing animation.
*/
public override function onNoteHit(event:HitNoteScriptEvent)
{

{
{
{
}
}
else
{
}
}
else if (!event.note.noteData.getMustHitNote() && characterType == DAD)
{
{
{
}
}
else
{
}
}
else if (characterType == GF && event.note.noteData.getMustHitNote())
{
switch (event.judgement)
{
case 'sick' | 'good':
default:
}
}
}

/**
* Every time a note is missed, check if the note is from the same strumline.
* If it is, then play the sing animation.
*/
public override function onNoteMiss(event:NoteScriptEvent)
{


{
}
else if (!event.note.noteData.getMustHitNote() && characterType == DAD)
{
}
else if (event.note.noteData.getMustHitNote() && characterType == GF)
{
}
}

public override function onNoteHoldDrop(event:HoldNoteScriptEvent)
{


{
}
else if (!event.holdNote.noteData.getMustHitNote() && characterType == DAD)
{
}
else if (event.holdNote.noteData.getMustHitNote() && event.isComboBreak && characterType == GF)
{
}
}

function playComboAnimation(comboCount:Int):Void
{
{
}
}

function playComboDropAnimation(comboCount:Int):Void
{

for (count in dropNoteCounts)
{
{
}
}

{
}
}

/**
* Every time a wrong key is pressed, play the miss animation if we are Boyfriend.
*/
public override function onNoteGhostMiss(event:GhostMissNoteScriptEvent):Void
{

{
}

{
}
}

public override function onDestroy(event:ScriptEvent):Void
{
}

/**
* Play the appropriate singing animation, for the given note direction.
* @param dir The direction of the note.
* @param miss If true, play the miss animation instead of the sing animation.
* @param suffix A suffix to append to the animation name, like `alt`.
*/
public function playSingAnimation(dir:NoteDirection, miss:Bool = false, ?suffix:String = ''):Void
{


}

public override function playAnimation(name:String, restart:Bool = false, ignoreOther:Bool = false, reversed:Bool = false):Void
{
}

public function getDeathQuote():Null<String>
{
}

static function log(message:String):Void
{
}
}

/**
* The type of a given character sprite. Defines its default behaviors.
*/
enum CharacterType
{
/**
* The BF character has the following behaviors.
* - At idle, dances with `danceLeft` and `danceRight` if available, or `idle` if not.
* - When the player hits a note, plays the appropriate `singDIR` animation until BF is done singing.
* - If there is a `singDIR-end` animation, the `singDIR` animation will play once before looping the `singDIR-end` animation until BF is done singing.
* - If the player misses or hits a ghost note, plays the appropriate `singDIR-miss` animation until BF is done singing.
*/

/**
* The DAD character has the following behaviors.
* - At idle, dances with `danceLeft` and `danceRight` if available, or `idle` if not.
* - When the CPU hits a note, plays the appropriate `singDIR` animation until DAD is done singing.
* - If there is a `singDIR-end` animation, the `singDIR` animation will play once before looping the `singDIR-end` animation until DAD is done singing.
* - When the CPU misses a note (NOTE: This only happens via script, not by default),
*     plays the appropriate `singDIR-miss` animation until DAD is done singing.
*/

/**
* The GF character has the following behaviors.
* - At idle, dances with `danceLeft` and `danceRight` if available, or `idle` if not.
* - If available, `combo###` animations will play when certain combo counts are reached.
*   - For example, `combo50` will play when the player hits 50 notes in a row.
*   - Multiple combo animations can be provided for different thresholds.
* - If available, `drop###` animations will play when combos are dropped above certain thresholds.
*   - For example, `drop10` will play when the player drops a combo larger than 10.
*   - Multiple drop animations can be provided for different thresholds (i.e. dropping larger combos).
*   - No drop animation will play if one isn't applicable (i.e. if the combo count is too low).
*/

/**
* The OTHER character will only perform the `danceLeft`/`danceRight` or `idle` animation by default, depending on what's available.
* Additional behaviors can be performed via scripts.
*/
}
