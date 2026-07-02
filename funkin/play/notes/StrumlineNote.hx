package funkin.play.notes;


/**
* The actual receptor that you see on screen.
*/
class StrumlineNote extends FunkinSprite
{
/**
* Whether this strumline note is on the player's side or the opponent's side.
*/

/**
* The direction which this strumline note is facing.
*/

function set_direction(value:NoteDirection):NoteDirection
{
this.direction = value;
}

/**
* The Y Offset of the note.
*/

/**
* Set this flag to `true` to disable performance optimizations that cause
* the Strumline note sprite to ignore `velocity` and `acceleration`.
*/

/**
* How long to continue the hold note animation after a note is pressed.
*/

/**
* How long the hold note animation has been playing after a note is pressed.
*/

public function new(noteStyle:NoteStyle, isPlayer:Bool, direction:NoteDirection)
{
super(0, 0);

this.isPlayer = isPlayer;

this.direction = direction;

setup(noteStyle);

this.animation.onFrameChange.add(onAnimationFrame);
this.animation.onFinish.add(onAnimationFinished);

this.active = true;
}

function onAnimationFrame(name:String, frameNumber:Int, frameIndex:Int):Void
{
}

function onAnimationFinished(name:String):Void
{
{
confirmHoldTimer = 0;
}
}

override function update(elapsed:Float)
{
super.update(elapsed);

centerOrigin();

{
confirmHoldTimer += elapsed;

{
confirmHoldTimer = -1;
playStatic();
}
}
}

function setup(noteStyle:NoteStyle):Void
{
{
throw "FATAL ERROR: Attempted to initialize PlayState with an invalid NoteStyle.";
}

noteStyle.applyStrumlineFrames(this);
noteStyle.applyStrumlineAnimations(this, this.direction);

this.scale.set(scale, scale);
this.updateHitbox();
noteStyle.applyStrumlineOffsets(this);

this.playStatic();
}

public function playAnimation(name:String = 'static', force:Bool = false, reversed:Bool = false, startFrame:Int = 0):Void
{
this.animation.play(name, force, reversed, startFrame);

centerOffsets();
centerOrigin();
}

public function playStatic():Void
{
this.active = (forceActive || isAnimationDynamic('static'));
this.playAnimation('static', true);
}

public function playPress():Void
{
this.active = (forceActive || isAnimationDynamic('press'));
this.playAnimation('press', true);
}

public function playConfirm():Void
{
this.active = (forceActive || isAnimationDynamic('confirm'));
this.playAnimation('confirm', true);

confirmHoldTimer = isPlayer ? -1 : 0;
}

public function isConfirm():Bool
{
}

public function holdConfirm():Void
{
this.active = true;

{
}
else if (getCurrentAnimation() == "confirm")
{
{
this.confirmHoldTimer = -1;
this.playAnimation('confirm-hold', false, false);
}
}
else
{
this.playAnimation('confirm', false, false);
}
}


/**
* Adjusts the position of the sprite's graphic relative to the hitbox.
*/
function fixOffsets():Void
{
this.centerOffsets();

{
this.offset.x -= DEFAULT_OFFSET;
this.offset.y -= DEFAULT_OFFSET;
}
else
{
this.centerOrigin();
}
}
}
