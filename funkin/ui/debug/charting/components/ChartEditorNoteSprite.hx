

/**
* A sprite that can be used to display a note in a chart.
* Designed to be used and reused efficiently. Has no gameplay functionality.
*/
class ChartEditorNoteSprite extends FlxSprite
{
/**
* The list of available note skin to validate against.
*/

/**
* The ChartEditorState this note belongs to.
*/

/**
* The note data that this sprite represents.
* You can set this to null to kill the sprite and flag it for recycling.
*/

/**
* The name of the note style currently in use.
*/


function set_overrideStepTime(value:Null<Float>):Null<Float>
{

}


function set_overrideData(value:Null<Int>):Null<Int>
{

}


/**
* An indicator if the note is a note kind different than Default ("").
*/

public function new(parent:ChartEditorState, isGhost:Bool = false)
{



{

for (entry in entries)
{
}
}



for (entry in entries)
{
}

}


function fetchNoteStyle(noteStyleId:String):NoteStyle
{
}

static function addNoteStyleFrames(noteStyle:NoteStyle):Void
{

{
}
for (frame in frameCollection.frames)
{
}
}

function addNoteStyleAnimations(noteStyle:NoteStyle):Void
{




}

static function buildEmptyFrameCollection():Void
{
}

function set_noteData(value:Null<SongNoteData>):Null<SongNoteData>
{

{
}



}

public function updateNotePosition(?origin:FlxObject):Void
{




{
}

{
}

}

public function updateTooltipText():Void
{
}

public function updateTooltipPosition():Void
{

{
ToolTipManager.instance.unregisterTooltipRegion(this.tooltip);
}
else
{

ToolTipManager.instance.registerTooltipRegion(this.tooltip);
}
}

override public function draw()
{


}

override public function kill()
{

ToolTipManager.instance.unregisterTooltipRegion(this.tooltip);
}

function get_noteStyle():Null<String>
{
{
}
}

function set_noteStyle(value:Null<String>):Null<String>
{
}

public function playNoteAnimation():Void
{





switch (baseAnimationName)
{
case 'tap':
}

}

/**
* Return whether this note (or its parent) is currently visible.
*/
public function isNoteVisible(viewAreaBottom:Float, viewAreaTop:Float):Bool
{


}

/**
* Return whether a note, if placed in the scene, would be visible.
* This function should be made HYPER EFFICIENT because it's called a lot.
*/
public static function wouldNoteBeVisible(viewAreaBottom:Float, viewAreaTop:Float, noteData:SongNoteData, ?origin:FlxObject):Bool
{



}
}
