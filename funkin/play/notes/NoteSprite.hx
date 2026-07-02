

class NoteSprite extends FunkinSprite
{

/**
* The hold note sprite for this note.
*/


/**
* The strum time at which the note should be hit, in milliseconds.
*/

function get_strumTime():Float
{
}

function set_strumTime(value:Float):Float
{
}

/**
* The length for which the note should be held, in milliseconds.
* Defaults to 0 for single notes.
*/

function get_length():Float
{
}

function set_length(value:Float):Float
{
}

/**
* An extra attribute for the note.
* For example, whether the note is an "alt" note, or whether it has custom behavior on hit.
*/

function get_kind():Null<String>
{
}

function set_kind(value:String):String
{
}

/**
* An array of custom parameters for this note
*/

function get_params():Array<NoteParamData>
{
}

function set_params(value:Array<NoteParamData>):Array<NoteParamData>
{
}

/**
* The data of the note (i.e. the direction.)
*/

function set_direction(value:Int):Int
{


}

/**
* The note data associated with this note sprite.
* This is used to store the strum time, length, and other properties.
*/

/**
* Set this to `false` to disable scoring for this note.
* The note will no longer count towards ratings, points, or accuracy.
* @default `true` to enable scoring.
*/

/**
* Whether this note is a hold note.
* This is true if the length is greater than 0.
*/

function get_isHoldNote():Bool
{
}

/**
* The Y Offset of the note.
*/

/**
* Set this flag to true when hitting the note to avoid scoring it multiple times.
*/

/**
* Register this note as hit only after any other notes
*/

/**
* This is true if the note is later than 10 frames within the strumline,
* and thus can't be hit by the player.
* It will be destroyed after it moves offscreen.
* Managed by PlayState.
*/

/**
* This is true if the note is earlier than 10 frames within the strumline.
* and thus can't be hit by the player.
* Managed by PlayState.
*/

/**
* This is true if the note is within 10 frames of the strumline,
* and thus may be hit by the player.
* Managed by PlayState.
*/

/**
* This is true if the PlayState has performed the logic for missing this note.
* Subtracting score, subtracting health, etc.
*/

public function new(noteStyle:NoteStyle, direction:Int = 0)
{



}

/**
* Creates frames and animations
* @param noteStyle The `NoteStyle` instance
*/
public function setupNoteGraphic(noteStyle:NoteStyle):Void
{

}

/**
* Retrieve the value of the param with the given name
* @param name Name of the param
* @return Null<Dynamic>
*/
public function getParam(name:String):Null<Dynamic>
{
for (param in params)
{
{
}
}
}

/**
* Call this to override how debug bounding boxes are drawn for this sprite.
*/
public override function drawDebugOnCamera(camera:flixel.FlxCamera):Void
{



gfx.lineStyle(2, 0xFFFF66FF, 0.5); // thickness, color, alpha

gfx.lineStyle(2, 0xFFFFFF66, 0.5); // thickness, color, alpha

}

function playNoteAnimation(value:Int):Void
{
}

public function desaturate():Void
{
}

public function setHue(hue:Float):Void
{
}

public override function revive():Void
{

}

public override function kill():Void
{
}

public override function destroy():Void
{
}
}
