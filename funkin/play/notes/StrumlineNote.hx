

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





}

function onAnimationFrame(name:String, frameNumber:Int, frameIndex:Int):Void
{
}

function onAnimationFinished(name:String):Void
{
{
}
}

override function update(elapsed:Float)
{


{

{
}
}
}

function setup(noteStyle:NoteStyle):Void
{
{
}



}

public function playAnimation(name:String = 'static', force:Bool = false, reversed:Bool = false, startFrame:Int = 0):Void
{

}

public function playStatic():Void
{
}

public function playPress():Void
{
}

public function playConfirm():Void
{

}

public function isConfirm():Bool
{
}

public function holdConfirm():Void
{

{
}
else if (getCurrentAnimation() == "confirm")
{
{
}
}
else
{
}
}


/**
* Adjusts the position of the sprite's graphic relative to the hitbox.
*/
function fixOffsets():Void
{

{
}
else
{
}
}
}
