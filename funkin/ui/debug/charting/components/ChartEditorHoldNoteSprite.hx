

/**
* A sprite that can be used to display the trail of a hold note in a chart.
* Designed to be used and reused efficiently. Has no gameplay functionality.
*/
class ChartEditorHoldNoteSprite extends SustainTrail
{
/**
* The ChartEditorState this note belongs to.
*/


function get_noteStyle():Null<String>
{
}

function set_noteStyle(value:Null<String>):Null<String>
{
}


function set_overrideStepTime(value:Null<Float>):Null<Float>
{

}


function set_overrideData(value:Null<Int>):Null<Int>
{

}

public function new(parent:ChartEditorState)
{


}

public function updateHoldNoteGraphic():Void
{
}

override function setupHoldNoteGraphic(noteStyle:NoteStyle):Void
{


{
}
else
{
}


graphicWidth = graphic.width / 8 * zoom; // amount of notes * 2
graphicHeight = sustainLength * 0.45; // sustainHeight





}

public override function updateHitbox():Void
{

}

/**
* Set the height directly, to a value in pixels.
* @param h The desired height in pixels.
*/
public function setHeightDirectly(h:Float, lerp:Bool = false)
{
{
}
else
{
}

}

/**
* Call this to override how debug bounding boxes are drawn for this sprite.
*/
public override function drawDebugOnCamera(camera:flixel.FlxCamera):Void
{


gfx.lineStyle(2, color, 0.5); // thickness, color, alpha
}

function setup():Void
{
graphicWidth = graphic.width / 8 * zoom; // amount of notes * 2

}

public override function revive():Void
{

}

public override function kill():Void
{

}

/**
* Return whether this note is currently visible.
*/
public function isHoldNoteVisible(viewAreaBottom:Float, viewAreaTop:Float):Bool
{


}

/**
* Return whether a hold note, if placed in the scene, would be visible.
*/
public static function wouldHoldNoteBeVisible(viewAreaBottom:Float, viewAreaTop:Float, noteData:SongNoteData, ?origin:FlxObject):Bool
{



}

public function updateHoldNotePosition(?origin:FlxObject):Void
{


{
}
else
{
{
}
else
{
}
}


{
}



{
}

}
}
