package funkin.play.character;


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

this.cameraFocusPoint.x += xDiff;
this.cameraFocusPoint.y += yDiff;

super.set_x(value.x);
super.set_y(value.y);

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

this.cameraFocusPoint.x += xDiff;

}

/**
* If the y position changes, other than via changing the animation offset,
*  then we need to update the camera focus point.
*/
override function set_y(value:Float):Float
{

this.cameraFocusPoint.y += yDiff;

}

public function new(id:String, renderType:CharacterRenderType)
{
super(CharacterDataParser.DEFAULT_DANCEEVERY);

this.characterId = id;

ignoreExclusionPref = ["sing"];

_data = CharacterDataParser.fetchCharacterData(this.characterId);
{
throw 'Could not find character data for characterId: $characterId';
}
else if (_data.renderType != renderType)
{
throw 'Render type mismatch for character ($characterId): expected ${renderType}, got ${_data.renderType}';
}
else
{
this.characterName = _data.name;
this.name = _data.name;
this.danceEvery = _data.danceEvery;
this.singTimeSteps = _data.singTime;
this.globalOffsets = _data.offsets;
this.flipX = _data.flipX;
}


shouldBop = false;
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
result.push(comboNum);
}
}
}

result.sort((a, b) -> a - b);
}

/**
* Reset the character so it can be used at the start of the level.
* Call this when restarting the level.
*/
public function resetCharacter(resetCamera:Bool = true):Void
{
this.resetPosition();

this.danceEvery = _data.danceEvery;

this.dance(true); // Force to avoid the old animation playing with the wrong offset at the start of the song.
this.updateHitbox();

}

/**
* Set the character's sprite scale to the appropriate value.
* @param scale The desired scale.
*/
public function setScale(scale:Null<Float>):Void
{

this.scale.x = scale;
this.scale.y = scale;
this.updateHitbox();
this.x = feetPos.x - characterOrigin.x + globalOffsets[0];
this.y = feetPos.y - characterOrigin.y + globalOffsets[1];
}

/**
* The per-character camera offset.
*/

function get_characterCameraOffsets():Array<Float>
{
}

override function onCreate(event:ScriptEvent):Void
{
super.onCreate(event);

this.dance(true);
this.updateHitbox();

this.resetCameraFocusPoint();

this.comboNoteCounts = findCountAnimations('combo'); // ex. combo50
this.dropNoteCounts = findCountAnimations('drop'); // ex. drop50

super.onCreate(event);
}

override function onAnimationFinished(animationName:String):Void
{
super.onAnimationFinished(animationName);

|| animationName.startsWith('combo')
|| animationName.startsWith('drop'))
{
this.dance(true);
}
}

public function resetCameraFocusPoint():Void
{
this.cameraFocusPoint = new FlxPoint(charCenterX + _data.cameraOffsets[0], charCenterY + _data.cameraOffsets[1]);
}

public function getHealthIconId():String
{
}

public function initHealthIcon(isOpponent:Bool):Void
{
{
{
log(' WARNING '.warning() + ' Player 1 ($characterId) health icon not found!');
}
PlayState.instance.iconP1.configure(_data?.healthIcon);
PlayState.instance.iconP1.flipX = !PlayState.instance.iconP1.flipX; // BF is looking the other way.
}
else
{
{
log(' WARNING '.warning() + ' Player 2 ($characterId) health icon not found!');
}
PlayState.instance.iconP2.configure(_data?.healthIcon);
}
}

public override function onUpdate(event:UpdateScriptEvent):Void
{
super.onUpdate(event);

{
holdTimer = 0;
}

{
}


&& !getCurrentAnimation().endsWith(Constants.ANIMATION_HOLD_SUFFIX)
&& hasAnimation(getCurrentAnimation() + Constants.ANIMATION_HOLD_SUFFIX))
{
playAnimation(getCurrentAnimation() + Constants.ANIMATION_HOLD_SUFFIX);
}
else
{
{
}
}

{

holdTimer += event.elapsed;



{
holdTimer = 0;

currentAnimation.length - Constants.ANIMATION_HOLD_SUFFIX.length);

{
playAnimation(endAnimation);
}
else
{
dance(true);
}
}
}
else
{
holdTimer = 0;
}
}

public function isSinging():Bool
{
}

override function dance(force:Bool = false):Void
{

{

}

super.dance();
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
|| PlayerSettings.player1.controls.NOTE_RIGHT_P;
case 2:
|| PlayerSettings.player2.controls.NOTE_DOWN_P
|| PlayerSettings.player2.controls.NOTE_UP_P
|| PlayerSettings.player2.controls.NOTE_RIGHT_P;
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
|| PlayerSettings.player1.controls.NOTE_RIGHT;
case 2:
|| PlayerSettings.player2.controls.NOTE_DOWN
|| PlayerSettings.player2.controls.NOTE_UP
|| PlayerSettings.player2.controls.NOTE_RIGHT;
}
}

/**
* Every time a note is hit, check if the note is from the same strumline.
* If it is, then play the sing animation.
*/
public override function onNoteHit(event:HitNoteScriptEvent)
{
super.onNoteHit(event);
curNoteKind = NoteKindManager.getNoteKind(event.note.noteData.kind);

{
{
{
this.playSingAnimation(event.note.noteData.getDirection(), false, curNoteKind?.suffix);
holdTimer = 0;
}
}
else
{
this.playSingAnimation(event.note.noteData.getDirection(), false);
holdTimer = 0;
}
}
else if (!event.note.noteData.getMustHitNote() && characterType == DAD)
{
{
{
this.playSingAnimation(event.note.noteData.getDirection(), false, curNoteKind?.suffix);
holdTimer = 0;
}
}
else
{
this.playSingAnimation(event.note.noteData.getDirection(), false);
holdTimer = 0;
}
}
else if (characterType == GF && event.note.noteData.getMustHitNote())
{
switch (event.judgement)
{
case 'sick' | 'good':
playComboAnimation(event.comboCount);
default:
playComboDropAnimation(event.comboCount);
}
}
}

/**
* Every time a note is missed, check if the note is from the same strumline.
* If it is, then play the sing animation.
*/
public override function onNoteMiss(event:NoteScriptEvent)
{
super.onNoteMiss(event);


{
this.playSingAnimation(event.note.noteData.getDirection(), true);
}
else if (!event.note.noteData.getMustHitNote() && characterType == DAD)
{
this.playSingAnimation(event.note.noteData.getDirection(), true);
}
else if (event.note.noteData.getMustHitNote() && characterType == GF)
{
playComboDropAnimation(event.comboCount);
}
}

public override function onNoteHoldDrop(event:HoldNoteScriptEvent)
{
super.onNoteHoldDrop(event);


{
this.playSingAnimation(event.holdNote.noteData.getDirection(), true);
}
else if (!event.holdNote.noteData.getMustHitNote() && characterType == DAD)
{
this.playSingAnimation(event.holdNote.noteData.getDirection(), true);
}
else if (event.holdNote.noteData.getMustHitNote() && event.isComboBreak && characterType == GF)
{
playComboDropAnimation(event.comboCount);
}
}

function playComboAnimation(comboCount:Int):Void
{
{
log('Playing combo animation "${comboAnim}"');
this.playAnimation(comboAnim, true, true);
}
}

function playComboDropAnimation(comboCount:Int):Void
{

for (count in dropNoteCounts)
{
{
dropAnim = 'drop${count}';
}
}

{
log('Playing combo drop animation "${dropAnim}"');
this.playAnimation(dropAnim, true, true);
}
}

/**
* Every time a wrong key is pressed, play the miss animation if we are Boyfriend.
*/
public override function onNoteGhostMiss(event:GhostMissNoteScriptEvent):Void
{
super.onNoteGhostMiss(event);

{
}

{
this.playSingAnimation(event.dir, true);
}
}

public override function onDestroy(event:ScriptEvent):Void
{
this.characterType = OTHER;
}

/**
* Play the appropriate singing animation, for the given note direction.
* @param dir The direction of the note.
* @param miss If true, play the miss animation instead of the sing animation.
* @param suffix A suffix to append to the animation name, like `alt`.
*/
public function playSingAnimation(dir:NoteDirection, miss:Bool = false, ?suffix:String = ''):Void
{


playAnimation(anim, true);
}

public override function playAnimation(name:String, restart:Bool = false, ignoreOther:Bool = false, reversed:Bool = false):Void
{
super.playAnimation(name, restart, ignoreOther, reversed);
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
BF;

/**
* The DAD character has the following behaviors.
* - At idle, dances with `danceLeft` and `danceRight` if available, or `idle` if not.
* - When the CPU hits a note, plays the appropriate `singDIR` animation until DAD is done singing.
* - If there is a `singDIR-end` animation, the `singDIR` animation will play once before looping the `singDIR-end` animation until DAD is done singing.
* - When the CPU misses a note (NOTE: This only happens via script, not by default),
*     plays the appropriate `singDIR-miss` animation until DAD is done singing.
*/
DAD;

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
GF;

/**
* The OTHER character will only perform the `danceLeft`/`danceRight` or `idle` animation by default, depending on what's available.
* Additional behaviors can be performed via scripts.
*/
OTHER;
}
