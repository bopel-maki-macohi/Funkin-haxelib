package funkin.play.notes;


/**
* A group of sprites which handles the receptor, the note splashes, and the notes (with sustains) for a given player.
*/
class Strumline extends FlxSpriteGroup
{
/**
* The directions of the notes on the strumline, in order.
*/
public static final DIRECTIONS:Array<NoteDirection> = [NoteDirection.LEFT, NoteDirection.DOWN, NoteDirection.UP, NoteDirection.RIGHT];

/**
* A magic number for the size of the strumline, in pixels.
*/
public static final STRUMLINE_SIZE:Int = 104;

/**
* The spacing between notes on the strumline, in pixels.
*/
public static final NOTE_SPACING:Int = STRUMLINE_SIZE + 8;


public static final KEY_COUNT:Int = 4;


/**
* The custom render distance for the strumline.
* This should be in miliseconds only! Not pixels.
*/

/**
* Whether to use the custom render distance.
* If false, the render distance will be calculated based on the screen height.
*/

function get_renderDistanceMs():Float
{
}

/**
* Whether to play note splashes or not
* TODO: Make this a setting!
* IE: Settings.noSplash
*/

/**
* Whether this strumline is controlled by the player's inputs.
* False means it's controlled by the opponent or Bot Play.
*/

/**
* Usually you want to keep this as is, but if you are using a Strumline and
* playing a sound that has it's own conductor, set this (LatencyState for example)
*/


/**
* Reset the scroll speed to the current chart's scroll speed.
*/
public function resetScrollSpeed(?newScrollSpeed:Float):Void
{
scrollSpeed = newScrollSpeed ?? PlayState.instance?.currentChart?.scrollSpeed ?? 1.0;
}


function get_conductorInUse():Conductor
{
}

function set_conductorInUse(value:Conductor):Conductor
{
}

/**
* Whether the game should auto position notes.
*/

/**
* The notes currently being rendered on the strumline.
* This group iterates over this every frame to update note positions.
* The PlayState also iterates over this to calculate user inputs.
*/

/**
* The hold notes currently being rendered on the strumline.
* This group iterates over this every frame to update hold note positions.
* The PlayState also iterates over this to calculate user inputs.
*/

/**
* A signal that is dispatched when a note is spawned and heading towards the strumline.
*/


/**
* The strumline notes (the receptors) themselves.
*/


/**
* Hold note covers.
*/




/**
* The scale of the strumline. Use this to resize it rather than setting the scale directly.
*/


/**
* Handles note vibrations for this strumline
*/

&& !ControlsHandler.hasExternalInputDevice) #else false #end;

/**
* Whether the strumline is downscroll.
*/
&& !ControlsHandler.hasExternalInputDevice)
|| #end Preferences.downscroll;

/**
* The note data for the song. Should NOT be altered after the song starts (but we alter it in OffsetState :DDD),
* so we can easily rewind.
*/

/**
* The index of the next note to be rendered.
* This is used to avoid splicing the noteData array, which is slow.
* It is incremented every time a note is rendered.
*/

/**
* Indicates which keys are pressed for which directions.
* The direction is pressed as long as at least one key is held,
* and released when no keys are held.
*/


public function new(noteStyle:NoteStyle, isPlayer:Bool, ?scrollSpeed:Float)
{
super();

this.isPlayer = isPlayer;
this.noteStyle = noteStyle;

this.strumlineNotes = new FlxTypedSpriteGroup<StrumlineNote>();
this.strumlineNotes.zIndex = 10;
this.add(this.strumlineNotes);

this.holdNotes = new FlxTypedSpriteGroup<SustainTrail>();
this.holdNotes.zIndex = 20;
this.add(this.holdNotes);

this.holdNotesVwoosh = new FlxTypedSpriteGroup<SustainTrail>();
this.holdNotesVwoosh.zIndex = 21;
this.add(this.holdNotesVwoosh);

this.notes = new FlxTypedSpriteGroup<NoteSprite>();
this.notes.zIndex = 30;
this.add(this.notes);

this.notesVwoosh = new FlxTypedSpriteGroup<NoteSprite>();
this.notesVwoosh.zIndex = 31;
this.add(this.notesVwoosh);

this.noteHoldCovers = new FlxTypedSpriteGroup<NoteHoldCover>(0, 0, 4);
this.noteHoldCovers.zIndex = 40;
this.add(this.noteHoldCovers);

this.noteSplashes = new FlxTypedSpriteGroup<NoteSplash>(0, 0, NOTE_SPLASH_CAP);
this.noteSplashes.zIndex = 50;
this.add(this.noteSplashes);

{
backgroundWidth = backgroundWidth * 1.84;
}
this.background = new FunkinSprite(0, 0).makeSolidColor(Std.int(backgroundWidth), FlxG.height, 0xFF000000);
this.background.alpha = Preferences.strumlineBackgroundOpacity / 100.0;
this.background.scrollFactor.set(0, 0);
this.background.x = -BACKGROUND_PAD;
this.add(this.background);

strumlineScale = new FlxCallbackPoint(strumlineScaleCallback);

this.refresh();

this.onNoteIncoming = new FlxTypedSignal<NoteSprite->Void>();
resetScrollSpeed(scrollSpeed);

for (i in 0...KEY_COUNT)
{
child.x = getXPos(DIRECTIONS[i]);
child.x += INITIAL_OFFSET;
child.y = 0;
noteStyle.applyStrumlineOffsets(child);
this.strumlineNotes.add(child);
}

this.heldKeys = [];
for (i in 0...KEY_COUNT)
{
this.heldKeys[i] = [];
}

strumlineScale.set(1, 1);

this.active = true;
}

override function set_y(value:Float):Float
{
super.set_y(value);


}

override function set_alpha(value:Float):Float
{
super.set_alpha(value);

this.background.alpha = Preferences.strumlineBackgroundOpacity / 100.0 * alpha;

}

/**
* Refresh the strumline, sorting its children by z-index.
*/
public function refresh():Void
{
sort(SortUtil.byZIndex, FlxSort.ASCENDING);
}

override function get_width():Float
{

}

public override function update(elapsed:Float):Void
{
super.update(elapsed);

updateNotes();

updateGhostTapTimer(elapsed);
}

/**
* @return `true` if no notes are in range of the strumline and the player can spam without penalty.
*/
public function mayGhostTap():Bool
{
{
}
{
}


}

/**
* Return notes that are within `Constants.HIT_WINDOW` ms of the strumline.
* @return An array of `NoteSprite` objects.
*/
public function getNotesMayHit():Array<NoteSprite>
{
{
});
}

/**
* Return hold notes that are within `Constants.HIT_WINDOW` ms of the strumline.
* @return An array of `SustainTrail` objects.
*/
public function getHoldNotesHitOrMissed():Array<SustainTrail>
{
{
});
}

/**
* Get a note sprite corresponding to the given note data.
* @param target The note data for the note sprite.
* @return The note sprite.
*/
public function getNoteSprite(target:SongNoteData):NoteSprite
{

for (note in notes.members)
{

}

}

/**
* Get a hold note sprite corresponding to the given note data.
* @param target The note data for the hold note.
* @return The hold note sprite.
*/
public function getHoldNoteSprite(target:SongNoteData):SustainTrail
{

for (holdNote in holdNotes.members)
{

}

}

/**
* Call this when resetting the playstate.
*/
public function vwooshNotes():Void
{

for (note in notes.members)
{

notes.remove(note);
notesVwoosh.add(note);

FlxTween.tween(note, {y: targetY}, vwooshTime, {
ease: FlxEase.expoIn,
onComplete: function(twn)
{
note.kill();
notesVwoosh.remove(note, true);
note.destroy();
}
});
}

for (holdNote in holdNotes.members)
{

holdNotes.remove(holdNote);
holdNotesVwoosh.add(holdNote);

FlxTween.tween(holdNote, {y: targetY}, vwooshTime, {
ease: FlxEase.expoIn,
onComplete: function(twn)
{
holdNote.kill();
holdNotesVwoosh.remove(holdNote, true);
holdNote.destroy();
}
});
}
}

/**
* Enter mini mode, which displays only small strumline notes
* @param scale scale of strumline
*/
public function enterMiniMode(scale:Float = 1):Void
{
forEach(function(obj:flixel.FlxObject):Void
{
});

this.strumlineScale.set(scale, scale);
}

/**
* Called whenever the `strumlineScale` value is updated.
* @param Scale The new value.
*/
function strumlineScaleCallback(scale:FlxPoint):Void
{
strumlineNotes.forEach(function(note:StrumlineNote):Void
{
note.scale.set(styleScale * scale.x, styleScale * scale.y);
});
setNoteSpacing(noteSpacingScale);
}

/**
* Set note spacing scale
* @param multiplier multiply x position
*/
public function setNoteSpacing(multiplier:Float = 1):Void
{
noteSpacingScale = multiplier;

for (i in 0...KEY_COUNT)
{
note.x = getXPos(DIRECTIONS[i]) + this.strumlineNotes.x;
note.x += INITIAL_OFFSET;
note.y = this.strumlineNotes.y;
noteStyle.applyStrumlineOffsets(note);
}
}

/**
* For a note's strumTime, calculate its Y position relative to the strumline.
* NOTE: Assumes Conductor and PlayState are both initialized.
* @param strumTime
* @return Float
* Reverse of vwooshNotes, we bring the notes IN (by their offsets)
*/
public function vwooshInNotes():Void
{

for (note in notes.members)
{

note.yOffset = 200;
{
note.yOffset = -200;
}
FlxTween.tween(note, {yOffset: 0}, vwooshTime, {
ease: FlxEase.expoOut,
onComplete: function(twn)
{
note.yOffset = 0;
}
});
}

for (holdNote in holdNotes.members)
{

holdNote.yOffset = 200;
{
holdNote.yOffset = -200;
}
FlxTween.tween(holdNote, {yOffset: 0}, vwooshTime, {
ease: FlxEase.expoOut,
onComplete: function(twn)
{
holdNote.yOffset = 0;
}
});
}
}

/**
* Called every frame to update the position and hitbox of each child note.
*/
public function updateNotes():Void
{



for (noteIndex in nextNoteIndex...noteData.length)
{
{
nextNoteIndex = noteIndex + 1;
continue;
}



{
noteSprite.holdNoteSprite = buildHoldNoteSprite(note);
}

nextNoteIndex = noteIndex + 1; // Increment the nextNoteIndex rather than splicing the array, because splicing is slow.

onNoteIncoming.dispatch(noteSprite);
}

for (note in notes.members)
{
- INITIAL_OFFSET
+ GRhythmUtil.getNoteY(note.strumTime, scrollSpeed, isDownscroll, conductorInUse)
+ note.yOffset;

{
killNote(note);
}
}

for (holdNote in holdNotes.members)
{

{
{
playStatic(holdNote.noteDirection);
holdNote.missedNote = true;
holdNote.visible = true;
holdNote.alpha = 0.0; // Completely hide the dropped hold note.
}
}


{
holdNote.visible = false;
holdNote.kill(); // Do not destroy! Recycling is faster.
}
else if (holdNote.hitNote && holdNote.sustainLength <= 0)
{
{
noteVibrations.tryHoldNoteVibration(true);
}

{
playPress(holdNote.noteDirection);
}
else
{
playStatic(holdNote.noteDirection);
}

{
holdNote.cover.playEnd();
}
else if (holdNote.cover != null)
{
holdNote.cover.visible = false;
holdNote.cover.kill();
}

holdNote.visible = false;
holdNote.kill();
}
else if (holdNote.missedNote && (holdNote.fullSustainLength > holdNote.sustainLength))
{
holdNote.visible = true;


{
{
holdNote.y = this.y
- INITIAL_OFFSET
+ GRhythmUtil.getNoteY(holdNote.strumTime, scrollSpeed, isDownscroll, conductorInUse)
- holdNote.height
+ STRUMLINE_SIZE / 2
+ holdNote.yOffset;
}
else
{
holdNote.y = this.y
- INITIAL_OFFSET
+ GRhythmUtil.getNoteY(holdNote.strumTime, scrollSpeed, isDownscroll, conductorInUse)
+ yOffset
+ STRUMLINE_SIZE / 2
+ holdNote.yOffset;
}
}

{
holdNote.cover.visible = false;
holdNote.cover.kill();
}
}
else if (conductorInUse.songPosition > holdNote.strumTime && holdNote.hitNote)
{
holdConfirm(holdNote.noteDirection);
holdNote.visible = true;

holdNote.sustainLength = (holdNote.strumTime + holdNote.fullSustainLength) - conductorInUse.songPosition;

{
holdNote.visible = false;
}

{
{
holdNote.y = this.y - INITIAL_OFFSET - holdNote.height + STRUMLINE_SIZE / 2;
}
else
{
holdNote.y = this.y - INITIAL_OFFSET + STRUMLINE_SIZE / 2;
}
}
}
else
{
holdNote.visible = true;

{
{
holdNote.y = this.y
- INITIAL_OFFSET
+ GRhythmUtil.getNoteY(holdNote.strumTime, scrollSpeed, isDownscroll, conductorInUse)
- holdNote.height
+ STRUMLINE_SIZE / 2
+ holdNote.yOffset;
}
else
{
holdNote.y = this.y
- INITIAL_OFFSET
+ GRhythmUtil.getNoteY(holdNote.strumTime, scrollSpeed, isDownscroll, conductorInUse)
+ STRUMLINE_SIZE / 2
+ holdNote.yOffset;
}
}
}
} // Update rendering of pressed keys.

for (dir in DIRECTIONS)
{
{
playPress(dir);
}

}
}

/**
* Return notes that are within, or way after, `Constants.HIT_WINDOW` ms of the strumline.
* @return An array of `NoteSprite` objects.
*/
public function getNotesOnScreen():Array<NoteSprite>
{
{
});
}

function updateGhostTapTimer(elapsed:Float):Void
{

ghostTapTimer -= elapsed;

{
ghostTapTimer = 0;
}
}

/**
* Called when the PlayState skips a large amount of time forward or backward.
*/
public function handleSkippedNotes():Void
{
clean();
nextNoteIndex = 0;
}

/**
* Called on each beat of the song.
*/
public function onBeatHit():Void
{

}

/**
* Called when a key is pressed.
* @param dir The direction of the key that was pressed.
* @param keyCode The key input used to press the direction. Used to distinguish when two keys for the same direction are pressed.
*/
public function pressKey(dir:NoteDirection, keyCode:Int):Void
{
heldKeys[dir].push(keyCode);
}

/**
* Called when a key is released.
* @param dir The direction of the key that was released.
* @param keyCode The key input used to press the direction. Used to distinguish when two keys for the same direction are pressed.
*   If null, all keys for the direction are released.
*/
public function releaseKey(dir:NoteDirection, ?keyCode:Int):Void
{
{
heldKeys[dir].clear();
}
else
{
heldKeys[dir].remove(keyCode);
}
}

/**
* Check if a key is held down.
* @param dir The direction of the key to check.
* @return `true` if the key is held down, `false` otherwise.
*/
public function isKeyHeld(dir:NoteDirection):Bool
{
}

/**
* Called when the song is reset.
* Removes any special animations and the like.
* Doesn't reset the notes from the chart, that's handled by the PlayState.
*/
public function clean():Void
{
for (note in notes.members)
{
killNote(note);
}

for (holdNote in holdNotes.members)
{
holdNote.kill();
}

for (splash in noteSplashes)
{
splash.kill();
}

for (cover in noteHoldCovers)
{
cover.kill();
}

heldKeys = [[], [], [], []];

for (dir in DIRECTIONS)
{
playStatic(dir);
}
resetScrollSpeed();

ghostTapTimer = 0;
}

/**
* Apply note data from a chart to this strumline.
* Note data should be valid and apply only to this strumline.
* @param data The note data to apply.
*/
public function applyNoteData(data:Array<SongNoteData>):Void
{
this.notes.clear();

this.noteData = data.copy();
this.nextNoteIndex = 0;

this.noteData.insertionSort(compareNoteData.bind(FlxSort.ASCENDING));
}

/**
* Add a note data to the strumline.
* This will not remove existing notes, so you should call `applyNoteData` if you want to reset the strumline.
* @param note The note data to add.
* @param sort Whether to sort the note data after adding.
*/
public function addNoteData(note:SongNoteData, sort:Bool = true):Void
{

this.noteData.push(note);
}

/**
* Hit a note.
* @param note The note to hit.
* @param removeNote True to remove the note immediately, false to make it transparent and let it move offscreen.
*/
public function hitNote(note:NoteSprite, removeNote:Bool = true):Void
{
playConfirm(note.direction);
note.hasBeenHit = true;

{
killNote(note);
}
else
{
note.alpha = 0.5;
note.desaturate();
}

{
note.holdNoteSprite.hitNote = true;
note.holdNoteSprite.missedNote = false;

note.holdNoteSprite.sustainLength = Math.min(note.holdNoteSprite.fullSustainLength,
(note.holdNoteSprite.strumTime + note.holdNoteSprite.fullSustainLength) - conductorInUse.songPosition);
}

ghostTapTimer = Constants.GHOST_TAP_DELAY;
}

/**
* Kill a note heading towards the strumline.
* @param note The note to kill. Gets recycled and reused for performance.
*/
public function killNote(note:NoteSprite):Void
{
note.visible = false;
note.kill();

{
note.holdNoteSprite.missedNote = true;
note.holdNoteSprite.visible = false;
}
}

/**
* Get a strumline note sprite by its index.
* @param index The index of the note to get.
* @return The note.
*/
public function getByIndex(index:Int):StrumlineNote
{
}

/**
* Get a strumline note sprite by its direction.
* @param direction The direction of the note to get.
* @return The note.
*/
public function getByDirection(direction:NoteDirection):StrumlineNote
{
}

/**
* Play a static animation for a given direction.
* @param direction The direction of the note to play the static animation for.
*/
public function playStatic(direction:NoteDirection):Void
{
getByDirection(direction).playStatic();

}

/**
* Play a press animation for a given direction.
* @param direction The direction of the note to play the press animation for.
*/
public function playPress(direction:NoteDirection):Void
{
getByDirection(direction).playPress();

}

/**
* Play a confirm animation for a given direction.
* @param direction The direction of the note to play the confirm animation for.
*/
public function playConfirm(direction:NoteDirection):Void
{
getByDirection(direction).playConfirm();

}

/**
* Play a confirm animation for a hold note.
* @param direction The direction of the note to play the confirm animation for.
*/
public function holdConfirm(direction:NoteDirection):Void
{
getByDirection(direction).holdConfirm();

}

/**
* Check if a given direction is playing the confirm animation.
* @param direction The direction of the note to check.
* @return `true` if the note is playing the confirm animation, `false` otherwise.
*/
public function isConfirm(direction:NoteDirection):Bool
{
}

/**
* Play a note splash for a given direction.
* @param direction The direction of the note to play the splash animation for.
*/
public function playNoteSplash(direction:NoteDirection):Void
{


{
splash.play(direction);

splash.x = this.x;
splash.x += getXPos(direction);
splash.x += INITIAL_OFFSET;
splash.x += noteStyle.getSplashOffsets()[0] * splash.scale.x;

splash.y = this.y;
splash.y -= INITIAL_OFFSET;
splash.y += noteStyle.getSplashOffsets()[1] * splash.scale.y;

splash.graphic.destroyOnNoUse = false;
}
}

/**
* Play a note hold cover for a given hold note.
* @param holdNote The hold note to play the cover animation for.
*/
public function playNoteHoldCover(holdNote:SustainTrail):Void
{


{
cover.holdNote = holdNote;
holdNote.cover = cover;
cover.visible = true;

cover.playStart();

cover.x = this.x;
cover.x += getXPos(holdNote.noteDirection);
cover.x += STRUMLINE_SIZE / 2;
cover.x -= cover.width / 2;
cover.x += noteStyle.getHoldCoverOffsets()[0] * cover.scale.x;
cover.x += -12; // hardcoded adjustment, because we are evil.

cover.y = this.y;
cover.y += INITIAL_OFFSET;
cover.y += STRUMLINE_SIZE / 2;
cover.y += noteStyle.getHoldCoverOffsets()[1] * cover.scale.y;
cover.y += -96; // hardcoded adjustment, because we are evil.
}
}

/**
* Build a note sprite for a given note data.
* @param note The note data to build the note sprite for.
* @return The note sprite. Will recycle a note sprite from the pool if available for performance.
*/
public function buildNoteSprite(note:SongNoteData):NoteSprite
{

{

noteSprite.setupNoteGraphic(noteKindStyle);

{
trueScale.set(strumlineScale.x - ((FlxG.height / FlxG.width) * 0.2) * amplification,
strumlineScale.y - ((FlxG.height / FlxG.width) * 0.2) * amplification);
}

noteSprite.scale.scale(trueScale.x, trueScale.y);
noteSprite.updateHitbox();

noteSprite.direction = note.getDirection();
noteSprite.noteData = note;

noteSprite.x = this.x;
noteSprite.x += getXPos(DIRECTIONS[note.getDirection() % KEY_COUNT]);
noteSprite.x -= (noteSprite.width - Strumline.STRUMLINE_SIZE) / 2; // Center it
noteSprite.x -= NUDGE;
noteSprite.y = -9999;

noteSprite.graphic.destroyOnNoUse = false;

}

}

/**
* Build a hold note sprite for a given note data.
* @param note The note data to build the hold note sprite for.
* @return The hold note sprite. Will recycle a hold note sprite from the pool if available for performance.
*/
public function buildHoldNoteSprite(note:SongNoteData):SustainTrail
{

{

holdNoteSprite.setupHoldNoteGraphic(noteKindStyle);

holdNoteSprite.parentStrumline = this;
holdNoteSprite.noteData = note;
holdNoteSprite.strumTime = note.time;
holdNoteSprite.noteDirection = note.getDirection();
holdNoteSprite.fullSustainLength = note.length;
holdNoteSprite.sustainLength = note.length;
holdNoteSprite.missedNote = false;
holdNoteSprite.hitNote = false;
holdNoteSprite.visible = true;
holdNoteSprite.alpha = 1.0;

holdNoteSprite.x = this.x;
holdNoteSprite.x += getXPos(DIRECTIONS[note.getDirection() % KEY_COUNT]);
holdNoteSprite.x += STRUMLINE_SIZE / 2;
holdNoteSprite.x -= holdNoteSprite.width / 2;
holdNoteSprite.y = -9999;

holdNoteSprite.graphic.destroyOnNoUse = false;

}

}

/**
* Custom recycling behavior for note splashes.
*/
function constructNoteSplash():NoteSplash
{

{
result = new NoteSplash(noteStyle);
this.noteSplashes.add(result);
}
else
{
result = this.noteSplashes.getFirstAvailable();

{
result.revive();
}
else
{
result = FlxG.random.getObject(this.noteSplashes.members);
}
}

}

/**
* Custom recycling behavior for note hold covers.
*/
function constructNoteHoldCover():NoteHoldCover
{

{
result = new NoteHoldCover(noteStyle);
this.noteHoldCovers.add(result);
}
else
{
result = this.noteHoldCovers.getFirstAvailable();

{
result.revive();
}
else
{
result = FlxG.random.getObject(this.noteHoldCovers.members);
}
}

}

/**
* Custom recycling behavior for note sprites.
*/
function constructNoteSprite():NoteSprite
{

result = this.notes.getFirstAvailable();

{
result.revive();
}
else
{
result = new NoteSprite(noteStyle);
this.notes.add(result);
}

}

/**
* Custom recycling behavior for hold note sprites.
*/
function constructHoldNoteSprite():SustainTrail
{

result = this.holdNotes.getFirstAvailable();

{
result.revive();
}
else
{
result = new SustainTrail(0, 0, noteStyle);
this.holdNotes.add(result);
}

}

function getXPos(direction:NoteDirection):Float
{
{
case NoteDirection.LEFT: -pos * 2;
case NoteDirection.DOWN:
-(pos * 2) + (1 * Strumline.NOTE_SPACING) * (noteSpacingScale * strumlineScale.x);
case NoteDirection.UP:
pos + (2 * Strumline.NOTE_SPACING) * (noteSpacingScale * strumlineScale.x);
case NoteDirection.RIGHT:
pos + (3 * Strumline.NOTE_SPACING) * (noteSpacingScale * strumlineScale.x);
default: -pos * 2;
}
}

/**
* Apply a small animation which moves the arrow down and fades it in.
* Only plays at the start of Free Play songs.
*
* Note that modifying the offset of the whole strumline won't have the
* @param arrow The arrow to animate.
* @param index The index of the arrow in the strumline.
*/
function fadeInArrow(index:Int, arrow:StrumlineNote):Void
{
arrow.y -= 10;
arrow.alpha = 0.0;
FlxTween.tween(arrow, {y: arrow.y + 10, alpha: 1}, 1, {ease: FlxEase.circOut, startDelay: 0.5 + (0.2 * index)});
}

/**
* Apply a small animation which moves the arrow up and fades it out.
* Used when the song ends in Freeplay mode.
*
* @param index The index of the arrow in the strumline.
* @param arrow The arrow to animate.
*/
public function fadeOutArrow(index:Int, arrow:StrumlineNote):Void
{
FlxTween.tween(arrow, {y: arrow.y - 10, alpha: 0}, 0.5, {ease: FlxEase.circIn});
}

/**
* Play a fade in animation on all arrows in the strumline.
* Used when starting a song in Freeplay mode.
*/
public function fadeInArrows():Void
{
for (index => arrow in this.strumlineNotes.members.keyValueIterator())
{
fadeInArrow(index, arrow);
}
}

/**
* Play a fade out animation on all arrows in the strumline.
* Used when ending a song in Freeplay mode.
*/
public function fadeOutArrows():Void
{
for (index => arrow in this.strumlineNotes.members.keyValueIterator())
{
fadeOutArrow(index, arrow);
}
}

/**
* Compare two note data objects by their strumtime.
* @param order The order to sort the notes in.
* @param a The first note data object.
* @param b The second note data object.
* @return The comparison result, based on the time of the notes.
*/
function compareNoteData(order:Int, a:SongNoteData, b:SongNoteData):Int
{
}

/**
* Compare two note sprites by their strumtime.
* @param order The order to sort the notes in.
* @param a The first note sprite.
* @param b The second note sprite.
* @return The comparison result, based on the time of the notes.
*/
function compareNoteSprites(order:Int, a:NoteSprite, b:NoteSprite):Int
{
}

/**
* Compare two hold note sprites by their strumtime.
* @param order The order to sort the notes in.
* @param a The first hold note sprite.
* @param b The second hold note sprite.
* @return The comparison result, based on the time of the notes.
*/
function compareHoldNoteSprites(order:Int, a:SustainTrail, b:SustainTrail):Int
{
}

/**
* Find the minimum Y position of the strumline.
* Ignores the background to ensure the strumline is positioned correctly.
* @return The minimum Y position of the strumline.
*/
override function findMinYHelper():Float
{
for (member in group.members)
{

{
minY = (cast member : FlxSpriteGroup).findMinY();
}
else
{
minY = member.y;
}

}
}

/**
* Find the maximum Y position of the strumline.
* Ignores the background to ensure the strumline is positioned correctly.
* @return The maximum Y position of the strumline.
*/
override function findMaxYHelper():Float
{
for (member in group.members)
{

{
maxY = (cast member : FlxSpriteGroup).findMaxY();
}
else
{
maxY = member.y + member.height;
}

}
}
}
